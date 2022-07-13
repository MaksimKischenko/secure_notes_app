part of 'catalog_element_bloc.dart';

abstract class CatalogElementEvent extends Equatable {
  const CatalogElementEvent();

  @override
  List<Object> get props => [];
}

class CatalogElementInit extends CatalogElementEvent {
  final Catalog catalog;

  const CatalogElementInit({
    required this.catalog,
  });

  @override
  List<Object> get props => [catalog];
}

class CatalogElementAdd extends CatalogElementEvent {
  final CatalogElement catalogElement;

  const CatalogElementAdd({
    required this.catalogElement,
  });

  @override
  List<Object> get props => [catalogElement];
}

class CatalogElementDelete extends CatalogElementEvent {
  final CatalogElement catalogElement;

  const CatalogElementDelete({
    required this.catalogElement,
  });

  @override
  List<Object> get props => [catalogElement];
}
