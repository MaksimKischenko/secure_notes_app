// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:secure_notes_app/models/models.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {

  CatalogBloc() : super(CatalogInitial()) {
    on<CatalogEvent>(_onEvent);
  }

  List<Catalog>? catalogs = [];
  Box<Catalog>? catalogBox;


  void _onEvent(
    CatalogEvent event,
    Emitter<CatalogState> emit,
  ) {

    if (event is CatalogInit) return _onCatalogInit(event, emit);
    if (event is CatalogAdd) return _onCatalogAdd(event, emit);
    if (event is CatalogDelete) return _onCatalogDelete(event, emit);
  }


  void _onCatalogInit (
    CatalogInit event,
    Emitter<CatalogState> emit
  ) async {

    catalogBox = await Hive.openBox<Catalog>('catalogBox');
    catalogs = catalogBox?.values.toList();
    //catalogBox?.clear();
    emit(CatalogLoaded(catalogs: catalogs ?? []));
  }


  void _onCatalogAdd (
    CatalogAdd event,
    Emitter<CatalogState> emit
  ) async {
    
    await catalogBox?.put('${event.catalog.catalogName}', event.catalog);
    catalogs = catalogBox?.values.toList();
    emit(CatalogLoaded(catalogs: catalogs ?? []));
  }

  void _onCatalogDelete (
    CatalogDelete event,
    Emitter<CatalogState> emit
  ) async {

    await catalogBox?.delete('${event.catalog.catalogName}');
    catalogs = catalogBox?.values.toList();
    emit(CatalogLoaded(catalogs: catalogs ?? []));
  } 
}
