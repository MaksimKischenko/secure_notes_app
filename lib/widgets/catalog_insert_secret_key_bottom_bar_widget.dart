import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure_notes_app/bloc/bloc.dart';
import 'package:secure_notes_app/generated/translations.g.dart';

import 'package:secure_notes_app/models/models.dart';
import 'package:secure_notes_app/navigation.dart';
import 'package:secure_notes_app/styles.dart';

class CatalogInsertSecretKeyBottomBarWidget extends StatefulWidget {

  final Catalog? catalog;

  const CatalogInsertSecretKeyBottomBarWidget({
    Key? key,
    this.catalog,
  }) : super(key: key);


  @override
  State<CatalogInsertSecretKeyBottomBarWidget> createState() => _CatalogInsertSecretKeyBottomBarWidgettState();
}

class _CatalogInsertSecretKeyBottomBarWidgettState extends State<CatalogInsertSecretKeyBottomBarWidget> {

  final TextEditingController catalogkeyController = TextEditingController();


  @override
  void dispose() {
    catalogkeyController.dispose();
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
              Text(TranslationProvider.of(context).locale.translations.screens.catalog.enterKeyModalBottom.name, style: AppStyles.infoTextStyleHeader),
              Expanded(
                child: TextField(
                controller: catalogkeyController,
              )),
              const SizedBox(height: 10),
              CupertinoButton(
                color: Colors.blue,
                child: Text(TranslationProvider.of(context).locale.translations.screens.catalog.enterKeyModalBottom.add, style: const TextStyle(color: Colors.white)), 
                onPressed: () {
                  Navigator.pop(context);
                  if(widget.catalog?.secretKey == catalogkeyController.text) {
                    _onOpenCatalogElementScreen(widget.catalog!);
                  }
                }
              )                                     
            ],
          ),
        ),
      ); 
  }

  void _onOpenCatalogElementScreen(Catalog catalog) {
    Navigation.toAddCatalogElement();
    context.read<CatalogElementBloc>().add(CatalogElementInit(catalog: catalog));
  }
}
