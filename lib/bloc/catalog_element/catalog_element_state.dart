part of 'catalog_element_bloc.dart';

abstract class CatalogElementState extends Equatable {
  const CatalogElementState();
  
  @override
  List<Object?> get props => [];
}

class CatalogElementInitial extends CatalogElementState {}

class CatalogElementLoaded extends CatalogElementState {

  final String? catalogName;
  final List<CatalogElement> catalogElements;

  const CatalogElementLoaded({
    required this.catalogElements,
    this.catalogName,
  });

  @override
  List<Object?> get props => [catalogElements, catalogName];
}
