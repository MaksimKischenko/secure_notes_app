// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CatalogAdapter extends TypeAdapter<Catalog> {
  @override
  final int typeId = 0;

  @override
  Catalog read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Catalog(
      catalogName: fields[0] as String?,
      secretKey: fields[1] as String?,
      elements: (fields[2] as List?)?.cast<CatalogElement>(),
      ownerNameKey: (fields[4] as Map?)?.cast<String, String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Catalog obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.catalogName)
      ..writeByte(1)
      ..write(obj.secretKey)
      ..writeByte(2)
      ..write(obj.elements)
      ..writeByte(4)
      ..write(obj.ownerNameKey);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatalogAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
