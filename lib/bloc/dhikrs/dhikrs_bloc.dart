import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/dhikr_model.dart';

part 'dhikrs_event.dart';
part 'dhikrs_state.dart';

enum SortOrder { ascending, descending }

class DhikrsBloc extends Bloc<DhikrsEvent, DhikrsState> {
  SortOrder sortOrder = SortOrder.ascending;

  DhikrsBloc() : super(DhikrsLoding()) {
    on<LoadDhikrs>(_onLoadDhikrs);
    on<AddDhikr>(_onAddDhikr);
    on<UpdateDhikr>(_onUpdateDhikr);
    on<DeleteDhikr>(_onDeleteDhikr);
  }

  void _onLoadDhikrs(LoadDhikrs event, Emitter<DhikrsState> emit) {
    emit(
      DhikrsLoaded(dhikrs: event.dhikrs),
    );
  }

  void _onAddDhikr(AddDhikr event, Emitter<DhikrsState> emit) {
    final state = this.state;

    if (state is DhikrsLoaded) {
      emit(
        DhikrsLoaded(
          dhikrs: List.from(state.dhikrs)..add(event.dhikr),
        ),
      );
    }
  }

  void _onUpdateDhikr(UpdateDhikr event, Emitter<DhikrsState> emit) {
    final state = this.state;

    if (state is DhikrsLoaded) {
      List<Dhikr> dhikrs = (state.dhikrs.map((dhikr) {
        return dhikr.id == event.dhikr.id ? event.dhikr : dhikr;
      })).toList();
      emit(
        DhikrsLoaded(dhikrs: dhikrs),
      );
    }
  }

  void _onDeleteDhikr(DeleteDhikr event, Emitter<DhikrsState> emit) {
    final state = this.state;

    if (state is DhikrsLoaded) {
      List<Dhikr> dhikrs = state.dhikrs.where((dhikr) {
        return dhikr.id != event.dhikr.id;
      }).toList();
      emit(
        DhikrsLoaded(dhikrs: dhikrs),
      );
    }
  }
}
