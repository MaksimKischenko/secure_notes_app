import 'package:flutter/material.dart';
import 'package:secure_notes_app/styles.dart';

class CatalogShowKey extends StatelessWidget {

  final String? generatedKey;

   const CatalogShowKey({
    Key? key,
    required this.generatedKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        heightFactor: 0.25,
        widthFactor: 0.97,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children:  [
              const Text('Секретный ключ:', style: AppStyles.infoTextStyleHeader), 
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    width: 300,
                    child: SelectableText(generatedKey ?? '', style: AppStyles.keyTextStyle, maxLines: 3)
                  ),
                  Material(
                    color: Colors.transparent,
                    child: IconButton(
                      onPressed: () {}, 
                      icon: const Icon(Icons.copy)
                    ),
                  )
                ],
              ), 
            ],
          ),
        ),
      );
  }
}
