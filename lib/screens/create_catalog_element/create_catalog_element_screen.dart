
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:secure_notes_app/bloc/bloc.dart';
import 'package:secure_notes_app/generated/translations.g.dart';
import 'package:secure_notes_app/models/models.dart';
import 'package:secure_notes_app/navigation.dart';
import 'package:secure_notes_app/widgets/widgets.dart';



class CreateCatalogElementScreen extends StatefulWidget {
  static const pageRoute = '/createCatalogElement';

  const CreateCatalogElementScreen({Key? key}) : super(key: key);

  @override
  State<CreateCatalogElementScreen> createState() => _CreateCatalogElementScreennState();
}

class _CreateCatalogElementScreennState extends State<CreateCatalogElementScreen> {

  String catalogName = '';
  List<CatalogElement> catalogElements = [];
  FocusNode focusNode = FocusNode();
  bool hasFocus = false;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {
        hasFocus = focusNode.hasFocus;
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                automaticallyImplyLeading: false,
                leading: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Material(
                      color: Colors.transparent,
                      child: IconButton(
                        onPressed: () {
                          Navigation.toCatalog();
                        }, 
                        icon: const Icon(Icons.chevron_left)
                      ),
                    )   
                ),
              middle: BlocBuilder<CatalogElementBloc, CatalogElementState>(
                builder: (context, state) {
                  Widget body = Container();
                  if(state is CatalogElementLoaded) {
                    catalogName = state.catalogName ?? '';
                    body = Text(catalogName);
                  }
                  return body;
                }
              ),
              trailing: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Material(
                      color: Colors.transparent,
                      child: hasFocus? Container() : IconButton(
                        onPressed: () {
                          setState(() {
                            catalogElements.add(
                              CatalogElement(
                                elemenTitle: '',
                                isElementTaskDone: false
                              )
                            ); 
                          });
                        }, 
                        icon: const Icon(Icons.add)
                      ),
                    )   
                  )
              ),             
              child: BlocConsumer<CatalogElementBloc, CatalogElementState>(
                listener: (context, state) {

                },
                builder: (context, state) {
                  Widget body = Container();
                  if(state is CatalogElementLoaded) {

                    catalogElements = state.catalogElements;

                    body =  Padding(
                      padding: const EdgeInsets.all(40),
                      child: ListView.builder(
                        itemCount: catalogElements.length,
                        itemBuilder: (context, index) {
                          
                           var catalogElement = catalogElements[index];

                           return Slidable(
                              key: ValueKey(index),
                              endActionPane: ActionPane(
                                motion: const ScrollMotion(), 
                                children: [
                                  SlidableAction(
                                    flex: 2,
                                    onPressed: (context) {    
                                      context.read<CatalogElementBloc>().add(CatalogElementDelete(catalogElement: catalogElement));
                                    },
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: TranslationProvider.of(context).locale.translations.screens.catalog.catalogAction.delete,
                                  ),                    
                                ]
                              ),
                              child: CatalogElementCreateWidget(
                                //focusNode: focusNode,
                                catalogElement: catalogElement,
                                onTap: () {
                                  context.read<CatalogElementBloc>().add(CatalogElementAdd(catalogElement: catalogElement));
                                },
                              ),
                            );
                        }
                      )
                    );
                  }
                  return body;
                }
              )
            ),
    );
  }
}
