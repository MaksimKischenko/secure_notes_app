// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_element.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CatalogElementAdapter extends TypeAdapter<CatalogElement> {
  @override
  final int typeId = 1;

  @override
  CatalogElement read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatalogElement(
      elemenTitle: fields[0] as String?,
      isElementTaskDone: fields[1] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, CatalogElement obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.elemenTitle)
      ..writeByte(1)
      ..write(obj.isElementTaskDone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatalogElementAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
