part of 'catalog_bloc.dart';

abstract class CatalogEvent extends Equatable {
  const CatalogEvent();

  @override
  List<Object> get props => [];
}


class CatalogInit extends CatalogEvent {}

class CatalogAdd extends CatalogEvent {
  final Catalog catalog;

  const CatalogAdd({
    required this.catalog,
  });

  @override
  List<Object> get props => [catalog];
}

class CatalogDelete extends CatalogEvent {
  final Catalog catalog;

  const CatalogDelete({
    required this.catalog,
  });

  @override
  List<Object> get props => [catalog];
}


class CatalogAcessShared extends CatalogEvent {
  final String secretKey;

  const CatalogAcessShared({
    required this.secretKey,
  });

  @override
  List<Object> get props => [secretKey];
}
