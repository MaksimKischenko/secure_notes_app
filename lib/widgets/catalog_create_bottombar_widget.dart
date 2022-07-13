import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secure_notes_app/bloc/bloc.dart';
import 'package:secure_notes_app/data/data.dart';
import 'package:secure_notes_app/generated/translations.g.dart';
import 'package:secure_notes_app/models/catalog.dart';
import 'package:secure_notes_app/models/models.dart';
import 'package:secure_notes_app/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CatalogCreateBottomBarWidget extends StatefulWidget {

  const CatalogCreateBottomBarWidget({Key? key}) : super(key: key);

  @override
  State<CatalogCreateBottomBarWidget> createState() => _CatalogCreateBottomBarWidgetState();
}

class _CatalogCreateBottomBarWidgetState extends State<CatalogCreateBottomBarWidget> {


  String userName = '';
  final TextEditingController catalogNameController = TextEditingController();


  @override
  void initState() {
    super.initState();
    getUserName();
    
  }
  @override
  void dispose() {
    catalogNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        heightFactor: 0.25,
        widthFactor: 0.97,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(TranslationProvider.of(context).locale.translations.screens.catalog.createCatalogModalBottom.name, style: AppStyles.infoTextStyleHeader),
              Expanded(
                child: TextField(
                controller: catalogNameController,
              )),
              const SizedBox(height: 10),
              CupertinoButton(
                color: Colors.blue,
                child: Text(TranslationProvider.of(context).locale.translations.screens.catalog.createCatalogModalBottom.add, style: const TextStyle(color: Colors.white)), 
                onPressed: () {
                  Navigator.pop(context);
                  addCatalog(context);
                }
              )                                     
            ],
          ),
        ),
      ); 
  }

  Future<void> getUserName () async{
    final credentials  = await PreferencesHelper.getCredentials();
    userName = credentials.item1 ?? '';
  }

  void addCatalog(BuildContext context) {
    context.read<CatalogBloc>().add(
      CatalogAdd(
        catalog: Catalog(
        catalogName: catalogNameController.text,
        elements: [],
        ownerNameKey: {
          userName: ''
        }
      ))
    );
  }
}
