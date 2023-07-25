import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends HydratedBloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrementPressed>(_onCounterIncrementPressed);
    on<CounterDecrementPressed>(_onCounterDecrementPressed);
    on<CounterResetPressed>(_onCounterResetPressed);
  }

  void _onCounterIncrementPressed(
      CounterIncrementPressed event, Emitter<int> emit) {
    emit(state + 1);
  }

  void _onCounterDecrementPressed(
      CounterDecrementPressed event, Emitter<int> emit) {
    if (state > 0) {
      emit(state - 1);
    }
  }

  void _onCounterResetPressed(CounterResetPressed event, Emitter<int> emit) {
    emit(0);
  }

  @override
  int fromJson(Map<String, dynamic> json) {
    return json['value'] as int;
  }

  @override
  Map<String, dynamic>? toJson(int state) {
    return {'value': state};
  }
}
