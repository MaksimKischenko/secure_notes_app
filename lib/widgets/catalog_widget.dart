
import 'package:flutter/material.dart';

import 'package:secure_notes_app/models/models.dart';
import 'package:secure_notes_app/styles.dart';
import 'package:secure_notes_app/widgets/widgets.dart';

class CatalogWidget extends StatefulWidget {

  final Catalog? catalog;

  const CatalogWidget({
    Key? key,
    this.catalog,
  }) : super(key: key);

  @override
  State<CatalogWidget> createState() => _CatalogWidgetState();
}

class _CatalogWidgetState extends State<CatalogWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${widget.catalog?.catalogName}', style: AppStyles.headerTextStyleLess),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: SizedBox(
            height: dynamicHeight(widget.catalog?.elements?.length ?? 0),
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: widget.catalog?.elements?.length,
              itemBuilder: (context, index) {
                final catalogElement = widget.catalog?.elements?[index];
                return SizedBox(
                  height: 14,
                  child: CatalogElementWidget(
                    catalogElement: catalogElement,
                  ),
                );
              }
            ),
          ),
        )
      ],
    );
  }

  double dynamicHeight (int elements) {
    double initialHeight = 30;
    if(elements > 0) {
      initialHeight = initialHeight * elements;
    }
    return initialHeight;
  }
}