part of 'catalog_bloc.dart';

abstract class CatalogState extends Equatable {
  const CatalogState();
  
  @override
  List<Object> get props => [];
}

class CatalogInitial extends CatalogState {}

class CatalogLoaded extends CatalogState {

  final List<Catalog> catalogs;

  const CatalogLoaded({
    required this.catalogs,
  });

  @override
  List<Object> get props => [catalogs];
}

