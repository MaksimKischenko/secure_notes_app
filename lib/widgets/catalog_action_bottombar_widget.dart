
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:secure_notes_app/generated/translations.g.dart';
import 'package:secure_notes_app/models/models.dart';
import 'package:secure_notes_app/styles.dart';
import 'package:secure_notes_app/widgets/widgets.dart';

class CatalogActionBottomBarWidget extends StatelessWidget {

  final Catalog? catalog;

  const CatalogActionBottomBarWidget({
    Key? key,
    this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: Text(TranslationProvider.of(context).locale.translations.screens.catalog.addCatalogModalBottom.title, style: AppStyles.infoTextStyleHeader),
      actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              showCreateCatalogBottomBar(context);
            },
            child: Text(TranslationProvider.of(context).locale.translations.screens.catalog.addCatalogModalBottom.create, style: AppStyles.infoTextStyleHeaderBlue)
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              showInsertSecretKey(context);
            },
            child: Text(TranslationProvider.of(context).locale.translations.screens.catalog.addCatalogModalBottom.secretKey, style: AppStyles.infoTextStyleHeaderBlue),
          ),             
      ],
      cancelButton: CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(TranslationProvider.of(context).locale.translations.screens.catalog.addCatalogModalBottom.cansel, style: AppStyles.infoTextStyleHeaderRed),
      ), 
    ); 
  }

  Future<void> showCreateCatalogBottomBar(BuildContext context) async { 
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: const Material(
            shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10))
            ),
            child: CatalogCreateBottomBarWidget()
          ),
        );
      },
    );     
  }

  Future<void> showInsertSecretKey(BuildContext context) async { 
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Material(
            shape: const RoundedRectangleBorder(
             borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10))
            ),
            child: CatalogInsertSecretKeyBottomBarWidget(
              catalog: catalog,
            )
          ),
        );
      },
    );     
  }
}
