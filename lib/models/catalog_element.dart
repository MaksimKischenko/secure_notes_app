

import 'package:hive/hive.dart';

part 'catalog_element.g.dart';

@HiveType(typeId: 1)
class CatalogElement extends HiveObject {

  @HiveField(0)
  String? elemenTitle;

  @HiveField(1)
  bool? isElementTaskDone;
  
  CatalogElement({
    this.elemenTitle,
    this.isElementTaskDone,
  });
  
  @override
  String toString() => 'CatalogElement(elemenTitle: $elemenTitle, isElementTaskDone: $isElementTaskDone)';
}
