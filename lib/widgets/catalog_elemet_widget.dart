

import 'package:flutter/material.dart';

import 'package:secure_notes_app/models/catalog_element.dart';
import 'package:secure_notes_app/styles.dart';
import 'package:secure_notes_app/widgets/round_checkbox.dart';

class CatalogElementWidget extends StatefulWidget {

  final CatalogElement? catalogElement;
  
  const CatalogElementWidget({
    Key? key,
    this.catalogElement,
  }) : super(key: key);

  @override
  State<CatalogElementWidget> createState() => _CatalogElementWidgetState();
}

class _CatalogElementWidgetState extends State<CatalogElementWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RoundCheckBox(
          value: widget.catalogElement?.isElementTaskDone ?? false,
          onChanged: (value) {
            widget.catalogElement?.isElementTaskDone = value;
          },
        ),
        const SizedBox(width: 4),
        Text(widget.catalogElement?.elemenTitle?? '', style: AppStyles.infoTextStyle)
      ],
    );
  }
}