

import 'package:flutter/material.dart';

import 'package:secure_notes_app/models/models.dart';
import 'package:secure_notes_app/widgets/widgets.dart';

class CatalogElementCreateWidget extends StatelessWidget {

  final CatalogElement catalogElement;
  final Function () onTap;
  final FocusNode? focusNode;

  const CatalogElementCreateWidget({
    Key? key,
    this.focusNode,
    required this.catalogElement,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final TextEditingController textEditingController = TextEditingController();
    textEditingController.text = catalogElement.elemenTitle ?? '';

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RoundCheckBox(
            size: 24,
            value: catalogElement.isElementTaskDone ?? false,
            onChanged: (value) {
              catalogElement.isElementTaskDone = value;
            },
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              focusNode: focusNode,
              controller: textEditingController,
              onChanged: (value) {

              },
            )),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () {
              catalogElement.elemenTitle = textEditingController.text;
              onTap();
            }, 
            icon: const Icon(Icons.save, color: Colors.green)
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () {
              textEditingController.text = '';
            }, 
            icon: const Icon(Icons.close_rounded, color: Colors.red)
          ),
        ],
      ),
    );
  }
}
