import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:secure_notes_app/bloc/bloc.dart';
import 'package:secure_notes_app/data/data.dart';
import 'package:secure_notes_app/widgets/widgets.dart';
import 'bloc/simple_bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'generated/translations.g.dart';
import 'models/models.dart';
import 'navigation.dart';
import 'screens/screens.dart';
import 'package:hive_flutter/hive_flutter.dart';



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

