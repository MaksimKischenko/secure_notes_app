import 'package:hive/hive.dart';

import 'models.dart';

part 'catalog.g.dart';

@HiveType(typeId: 0)
class Catalog extends HiveObject {

  @HiveField(0)
  String? catalogName;

  @HiveField(1)
  String? secretKey;

  @HiveField(2)
  List<CatalogElement>? elements;

  @HiveField(4)
  Map<String, String>? ownerNameKey;

  Catalog({
    this.catalogName,
    this.secretKey,
    this.elements,
    this.ownerNameKey
  });

  @override
  String toString() {
    return 'Catalog(catalogName: $catalogName, secretKey: $secretKey, elements: $elements, ownerName: $ownerNameKey)';
  }
}
