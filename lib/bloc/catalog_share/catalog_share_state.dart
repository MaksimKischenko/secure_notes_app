part of 'catalog_share_bloc.dart';

abstract class CatalogShareState extends Equatable {
  const CatalogShareState();
  
  @override
  List<Object?> get props => [];
}

class CatalogShareInitial extends CatalogShareState {}

class CatalogShareSucces extends CatalogShareState {
  final String? sharedKey;

  const CatalogShareSucces({
    this.sharedKey,
  });

  @override
  List<Object?> get props => [sharedKey];
}
