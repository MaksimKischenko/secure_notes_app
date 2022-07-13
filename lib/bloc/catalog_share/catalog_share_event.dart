part of 'catalog_share_bloc.dart';

abstract class CatalogShareEvent extends Equatable {
  const CatalogShareEvent();

  @override
  List<Object?> get props => [];
}

class CatalogShareInit extends CatalogShareEvent {}

class CatalogShareRun extends CatalogShareEvent {
  final Catalog? catalog;

  const CatalogShareRun({
    this.catalog,
  });

  @override
  List<Object?> get props => [catalog];
}
