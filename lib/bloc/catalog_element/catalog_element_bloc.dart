// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:secure_notes_app/models/models.dart';

part 'catalog_element_event.dart';
part 'catalog_element_state.dart';

class CatalogElementBloc extends Bloc<CatalogElementEvent, CatalogElementState> {
  CatalogElementBloc() : super(CatalogElementInitial()) {
    on<CatalogElementEvent>(_onEvent);
  }

  Catalog? catalog;

  List<CatalogElement> catalogElements = [];

  Box<Catalog>? catalogBox;

  void _onEvent(
    CatalogElementEvent event,
    Emitter<CatalogElementState> emit,
  ) {

    if (event is CatalogElementInit) return _onCatalogElementInit(event, emit);
    if (event is CatalogElementAdd) return _onCatalogElementAdd(event, emit);
    if (event is CatalogElementDelete) return _onCatalogElementDelete(event, emit);
  }

  void _onCatalogElementInit (
    CatalogElementInit event,
    Emitter<CatalogElementState> emit
  ) async {

    catalog = event.catalog;

    catalogElements = catalog?.elements ?? [];

    emit(CatalogElementLoaded(
      catalogName: catalog?.catalogName,
      catalogElements: catalogElements
    ));
  }


  void _onCatalogElementAdd (
    CatalogElementAdd event,
    Emitter<CatalogElementState> emit
  ) async {

    catalogBox = await Hive.openBox<Catalog>('catalogBox');
    
    await catalogBox?.put('${catalog?.catalogName}', catalog!);

    emit(CatalogElementLoaded(catalogElements: catalogElements));
  }

  void _onCatalogElementDelete (
    CatalogElementDelete event,
    Emitter<CatalogElementState> emit
  ) async {

    catalogBox = await Hive.openBox<Catalog>('catalogBox');

    catalogElements.remove(event.catalogElement);
    
    catalog?.elements = catalogElements;

    await catalogBox?.put('${catalog?.catalogName}', catalog!);

    emit(CatalogElementLoaded(catalogElements: catalogElements));
  } 

}
