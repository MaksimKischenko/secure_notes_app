import 'dart:math';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:secure_notes_app/models/models.dart';
import 'package:secure_notes_app/utils/utils.dart';

part 'catalog_share_event.dart';
part 'catalog_share_state.dart';

class CatalogShareBloc extends Bloc<CatalogShareEvent, CatalogShareState> {
  CatalogShareBloc() : super(CatalogShareInitial()) {
    on<CatalogShareEvent>(_onEvent);
  }

  void _onEvent(
    CatalogShareEvent event,
    Emitter<CatalogShareState> emit,
  ) {
    if (event is CatalogShareRun) return _onCatalogShareRun(event, emit);
  }



  void _onCatalogShareRun (
    CatalogShareRun event,
    Emitter<CatalogShareState> emit
  ) async {

  
    Random random = Random();

    int number = random.nextInt(10000000);

    var key = number.toString().toSha256();

    event.catalog?.secretKey = key;

    var catalogBox = await Hive.openBox<Catalog>('catalogBox');
    
    await catalogBox.put('${event.catalog?.catalogName}', event.catalog!);

    emit(CatalogShareSucces(
      sharedKey: key
    ));
  }
}
