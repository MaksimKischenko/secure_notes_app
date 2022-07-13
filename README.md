## Guidelines
Run the example of connecting to OpenFin and creating applications

1. Clone this repository

2. If pubspec.yaml file drops error with pockets compatibility try write a command: dart pub upgrade --null-safety 

3. Go to release directory and start void main (run)

4. Once the flutter app starts in emulator you will see screens of app

5. In App you can work with notes as in a way of:
    #### create
    #### edit 
    #### delete 
    #### share to another user with secret key
    #### change localisation (RU/EN)  
    #### see info about 
    #### search for note  


## Source Code Review

Source code for the example is located in /lib/. 
Start point of app is main.dart

We use Bloc core as main statemanagment instrument in all app

1. To begin with, we will initialize our localization and Hive. Let's mark our main method as asynchronous and make special binding for async: WidgetsFlutterBinding.ensureInitialized();

```dart
void main() async{

  WidgetsFlutterBinding.ensureInitialized();

   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.grey.withOpacity(0.05),
 ));

  LocaleSettings.useDeviceLocale();

  final language = await PreferencesHelper.read(PrefsKeys.language);

  LocaleSettings.setLocaleRaw(language!);

  await Hive.initFlutter(); 
  Hive.registerAdapter(CatalogAdapter());
  Hive.registerAdapter(CatalogElementAdapter()); 

  BlocOverrides.runZoned(
    () => runApp(TranslationProvider(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc()
          ),
          BlocProvider<CatalogBloc>(
            create: (context) => CatalogBloc()..add(CatalogInit()),
            child: const CatalogCreateBottomBarWidget(),      
          ),
          BlocProvider<CatalogElementBloc>(
            create: (context) => CatalogElementBloc(),
            child: const CreateCatalogElementScreen(),      
          ),
        ],
        child: const MyAppCupertino(),
      ),
    )),
    blocObserver: SimpleBlocObserver(),
    eventTransformer: sequential<dynamic>()
  );
  
}
```

2. Then setUp navigation and BlocProviders to each Screen  

```dart
class MyAppCupertino extends StatelessWidget {

  const MyAppCupertino({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      localizationsDelegates: const [
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],      
      useInheritedMediaQuery: true,
      initialRoute: '/auth',
      navigatorKey: Navigation.navigatorKey,
      onGenerateRoute: (settings) {

        final path = settings.name;
        Widget Function(BuildContext)? builder;

        if(path == AuthScreen.pageRoute) {
          builder = (context) => const AuthScreen();
        } else if(path == CatalogScreen.pageRoute) {

          builder = (context) => BlocProvider<CatalogShareBloc>(
            create: (context) => CatalogShareBloc(),
            child: const CatalogScreen());

        } else if(path == CreateCatalogElementScreen.pageRoute) {
          builder = (context) => const CreateCatalogElementScreen();
        }

       builder ??= (context) => const AuthScreen();

        return MaterialPageRoute(builder: builder);
      },
      theme: CupertinoThemeData(  
        barBackgroundColor: Colors.grey.withOpacity(0.05),
        scaffoldBackgroundColor: Colors.grey.withOpacity(0.05)
      ),
    );
  }
}

mixin Navigation {

  static GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static void toAuth() => navigatorKey.currentState?.pushNamed(
    AuthScreen.pageRoute,
  );

  static void toCatalog() => navigatorKey.currentState?.pushNamed(
    CatalogScreen.pageRoute,
  );

  static void toAddCatalogElement() => navigatorKey.currentState?.pushNamed(
    CreateCatalogElementScreen.pageRoute,
  );
}
```

3. We will setUp also PreferencesHelper class for Aurh and localization aims 

```dart
class PreferencesHelper {

  static Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  static Future<T?> read<T>(TypeStoreKey<T> typedStoreKey) async => ((await prefs).get(typedStoreKey.key) as T?)
      ?? typedStoreKey.defaultValue;

  static Future<void> write<T>(TypeStoreKey<T> typedStoreKey, T? value) async {
    if (value == null) {
      await (await prefs).remove(typedStoreKey.key);

      return;
    }
    switch (T) {
      case int:
        await (await prefs).setInt(typedStoreKey.key, value as int);
        break;
      case String:
        await (await prefs).setString(typedStoreKey.key, value as String);
        break;
      case double:
        await (await prefs).setDouble(typedStoreKey.key, value as double);
        break;
      case bool:
        await (await prefs).setBool(typedStoreKey.key, value as bool);
        break;
      case List:
        await (await prefs).setStringList(typedStoreKey.key, value as List<String>);
        break;
    }
  }

  static Future<Tuple2<String?, String?>> getCredentials() async =>
      Tuple2(await _getString(_login), await _getString(_password));

  static Future<bool> setCredentials(String login, String password) async {
    await _setString(_login, login);
    return _setString(_password, password);
  }

  static Future<bool> clearCredentials() async {
    await _clear(_login);
    return _clear(_password);
  }

  static Future<String?> _getString(String key) async => (await prefs).getString(key);

  static Future<bool> _setString(String key, String value) async => (await prefs).setString(key, value);

  static Future<bool> _clear(String key) async => (await prefs).remove(key);

  static const _login = 'login';
  static const _password = 'password';

}

class PrefsKeys {
  static final authWithBiometric = TypeStoreKey<bool>('authwithbiometrics', defaultValue: false);
  static final language = TypeStoreKey<String>('language', defaultValue: AppConfig.defaultLanguageName);
}

class TypeStoreKey<T> {
  final type = T;

  final String key;
  final T? defaultValue;
  TypeStoreKey(
    this.key,{
    this.defaultValue
  });

  @override
  String toString() => 'TypeStoreKey(key: $key, defaultValue: $defaultValue)';
}
```

4. Catalog and CatalofElement models we create with Hive anotations

```dart
@HiveType(typeId: 0)
class Catalog extends HiveObject {

  @HiveField(0)
  String? catalogName;

  @HiveField(1)
  String? secretKey;

  @HiveField(2)
  List<CatalogElement>? elements;

  @HiveField(4)
  Map<String, String>? ownerNameKey;

  Catalog({
    this.catalogName,
    this.secretKey,
    this.elements,
    this.ownerNameKey
  });

  @override
  String toString() {
    return 'Catalog(catalogName: $catalogName, secretKey: $secretKey, elements: $elements, ownerName: $ownerNameKey)';
  }
}

```


5. In out bloc we use Hive logic to put / delete / update objects 

```dart
class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {

  CatalogBloc() : super(CatalogInitial()) {
    on<CatalogEvent>(_onEvent);
  }

  List<Catalog>? catalogs = [];
  Box<Catalog>? catalogBox;


  void _onEvent(
    CatalogEvent event,
    Emitter<CatalogState> emit,
  ) {

    if (event is CatalogInit) return _onCatalogInit(event, emit);
    if (event is CatalogAdd) return _onCatalogAdd(event, emit);
    if (event is CatalogDelete) return _onCatalogDelete(event, emit);
  }


  void _onCatalogInit (
    CatalogInit event,
    Emitter<CatalogState> emit
  ) async {

    catalogBox = await Hive.openBox<Catalog>('catalogBox');
    catalogs = catalogBox?.values.toList();
    //catalogBox?.clear();
    emit(CatalogLoaded(catalogs: catalogs ?? []));
  }


  void _onCatalogAdd (
    CatalogAdd event,
    Emitter<CatalogState> emit
  ) async {
    
    await catalogBox?.put('${event.catalog.catalogName}', event.catalog);
    catalogs = catalogBox?.values.toList();
    emit(CatalogLoaded(catalogs: catalogs ?? []));
  }

  void _onCatalogDelete (
    CatalogDelete event,
    Emitter<CatalogState> emit
  ) async {

    await catalogBox?.delete('${event.catalog.catalogName}');
    catalogs = catalogBox?.values.toList();
    emit(CatalogLoaded(catalogs: catalogs ?? []));
  } 
}

```
## More Info
More information and documentation can be found at:

#### https://pub.dev/packages/flutter_bloc
#### https://pub.dev/packages/fast_i18n
#### https://pub.dev/packages/shared_preferences
#### https://habr.com/ru/post/498070/








