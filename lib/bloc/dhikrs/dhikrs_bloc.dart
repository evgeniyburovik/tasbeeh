import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:tasbeeh/data/repository/dhikr_repository.dart';

import '../../data/models/dhikr_model.dart';

part 'dhikrs_event.dart';
part 'dhikrs_state.dart';

class DhikrsBloc extends HydratedBloc<DhikrsEvent, DhikrsState> {
  final DhikrRepository dhikrRepository;

  DhikrsBloc(this.dhikrRepository)
      : super(DhikrsLoaded(dhikrRepository.dhikrs)) {
    on<AddDhikr>((event, emit) async {
      emit(DhikrsLoding());
      final updatedDhikrList =
          dhikrRepository.addDhikr(event.title, event.count);
      emit(DhikrsLoaded(updatedDhikrList));
    });
    on<UpdateDhikr>((event, emit) async {
      emit(DhikrsLoding());
      final updatedDhikrList =
          dhikrRepository.updateDhikrState(event.title, event.id);
      emit(DhikrsLoaded(updatedDhikrList));
    });
    on<DeleteDhikr>((event, emit) {
      emit(DhikrsLoding());
      final updatedDhikrList = dhikrRepository.removeDhikr(event.id);
      emit(DhikrsLoaded(updatedDhikrList));
    });
  }

  @override
  DhikrsState? fromJson(Map<String, dynamic> json) {
    try {
      final dhikrs = (json['dhikrs'] as List)
          .map((e) => Dhikr.fromJson(e as Map<String, dynamic>))
          .toList();

      dhikrRepository.dhikrs = dhikrs;
      return DhikrsLoaded(dhikrs);
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(DhikrsState state) {
    if (state is DhikrsLoaded) {
      return state.toJson();
    } else {
      return null;
    }
  }
}
