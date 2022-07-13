
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:secure_notes_app/bloc/bloc.dart';
import 'package:secure_notes_app/data/data.dart';
import 'package:secure_notes_app/generated/translations.g.dart';
import 'package:secure_notes_app/models/models.dart';
import 'package:secure_notes_app/navigation.dart';
import 'package:secure_notes_app/utils/multiplatform.dart';

import 'package:secure_notes_app/widgets/widgets.dart';


class CatalogScreen extends StatefulWidget {
  static const pageRoute = '/catalog';

  const CatalogScreen({Key? key}) : super(key: key);

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> with TickerProviderStateMixin {

  String userName = '';
  List<Catalog> catalogs = [];
  late AnimationController animationController;


  @override
  void initState() {
    super.initState();
    getUserName();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      animationBehavior: AnimationBehavior.preserve
    );

    context.read<CatalogShareBloc>().stream.listen((state) {
      if(state is CatalogShareSucces) {
         showCatalogKeyBottomBar(state.sharedKey ?? '');
      }
     });
  }

  @override
  Widget build(BuildContext context) {
    AppLocale curentLocal = TranslationProvider.of(context).locale;
    return Material(
      child: Scaffold(
        body: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            automaticallyImplyLeading: false,
            middle: Text(TranslationProvider.of(context).locale.translations.screens.catalog.header.title),
            trailing: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Material(
                  color: Colors.transparent,
                  child: IconButton(
                    onPressed: () {
                      showSettingsBottomBar(curentLocal);
                    }, 
                    icon: const Icon(Icons.person_outline_rounded)
                  ),
                )   
              )
          ),
            child: BlocConsumer<CatalogBloc, CatalogState>(
              listener: (context, state) {
                
              },
              builder: (context, state) {
                Widget body = Container();
                if(state is CatalogLoaded) {

                  catalogs = state.catalogs;

                  body = Padding(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: catalogs.length,
                            itemBuilder: ((context, index) {

                              var catalog = catalogs[index];

                              return Slidable(
                                key: ValueKey(index),
                                startActionPane: ActionPane(
                                  motion: const ScrollMotion(), 
                                  children: [
                                    SlidableAction(
                                      flex: 2,
                                      onPressed: (context) {
                                      if(catalog.ownerNameKey?.keys.first == userName) {
                                        _onDeleteCatalog(catalog);
                                      } else if (catalog.ownerNameKey?.keys.first != userName) {
                                        Multiplatform.showMessage(
                                          context: context, 
                                          title: TranslationProvider.of(context).locale.translations.screens.multiplatform.erorMenu.dialogTitle,
                                          message: TranslationProvider.of(context).locale.translations.screens.multiplatform.erorMenu.dialogDescriptionTitle.delete,
                                          type: DialogType.error
                                        );
                                       } 
                                      },
                                      backgroundColor: Colors.red,
                                      foregroundColor: Colors.white,
                                      icon: Icons.delete,
                                      label: TranslationProvider.of(context).locale.translations.screens.catalog.catalogAction.delete,
                                    ),                    
                                  ]
                                ),
                                endActionPane: ActionPane(
                                  motion: const ScrollMotion(), 
                                  children: [
                                    SlidableAction(
                                      flex: 2,
                                      onPressed: (context) {
                                       if(catalog.ownerNameKey?.keys.first == userName) {
                                        _onCatalogShare(catalog);   
                                      } else if (catalog.ownerNameKey?.keys.first != userName) {
                                        Multiplatform.showMessage(
                                          context: context, 
                                          title: TranslationProvider.of(context).locale.translations.screens.multiplatform.erorMenu.dialogTitle, 
                                          message: TranslationProvider.of(context).locale.translations.screens.multiplatform.erorMenu.dialogDescriptionTitle.generateKey,
                                          type: DialogType.error
                                        );
                                       }                                        
                                      },
                                      backgroundColor: Colors.blue,
                                      foregroundColor: Colors.white,
                                      icon: Icons.share,
                                      label: TranslationProvider.of(context).locale.translations.screens.catalog.catalogAction.action,
                                    ),                    
                                  ]
                                ),
                                child: Ink(
                                  child: InkWell(
                                    child: CatalogWidget(
                                      catalog: catalog,
                                    ),
                                      onTap: () {
                                      if(catalog.ownerNameKey?.keys.first == userName) {
                                        _onOpenCatalogElementScreen(catalog);
                                      } else if (catalog.ownerNameKey?.keys.first != userName) {
                                        Multiplatform.showMessage(
                                          context: context, 
                                          title: TranslationProvider.of(context).locale.translations.screens.multiplatform.erorMenu.dialogTitle, 
                                          message: TranslationProvider.of(context).locale.translations.screens.multiplatform.erorMenu.dialogDescriptionTitle.edit,
                                          type: DialogType.error
                                        );
                                        showCatalogActionBottomBar(catalog: catalog);
                                      } 
                                    },
                                  ),
                                ),
                              );
                            })
                          )
                        ),
                      ],
                    ),
                  );
                }
                return body;
              }
            ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: showCatalogActionBottomBar,
          child: const Icon(Icons.add, color: Colors.white)
        ),
      ),
    );
  }


  Future<void> showSettingsBottomBar(AppLocale curentLocal) async {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return Material(
          elevation: 20,
          shape: const RoundedRectangleBorder(
           borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10))
          ),          
          child: SettingsBottomBarWidget(
            context: context,
            curentLocal: curentLocal,
            userName: userName,
          ),
        );
      },
    );     
  }

  Future<void> showCatalogActionBottomBar({Catalog? catalog}) async { 
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return CatalogActionBottomBarWidget(
          catalog: catalog,
        );
      },
    );     
  }

  void showCatalogKeyBottomBar(String key)  { 
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return Material(
          shape: const RoundedRectangleBorder(
             borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10))
          ),          
          child: CatalogShowKey(
            generatedKey: key,
          ),
        );
      },
    );     
  }


  Future<void> getUserName () async{
    final credentials  = await PreferencesHelper.getCredentials();
    userName = credentials.item1 ?? '';
  }

  void _onOpenCatalogElementScreen(Catalog catalog) {
    Navigation.toAddCatalogElement();
    context.read<CatalogElementBloc>().add(CatalogElementInit(catalog: catalog));
  }

  void _onDeleteCatalog(Catalog catalog) {
    context.read<CatalogBloc>().add(CatalogDelete(catalog: catalog));
  }

  void _onCatalogShare(Catalog catalog) {
    context.read<CatalogShareBloc>().add(CatalogShareRun(catalog: catalog));
  }
}