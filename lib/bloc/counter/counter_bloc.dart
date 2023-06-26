import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterInitial> {
  CounterBloc() : super(CounterInitial(count: 0)) {
    on<CounterIncrementPressed>(_onCounterIncrementPressed);
    on<CounterDecrementPressed>(_onCounterDecrementPressed);
    on<CounterResetPressed>(_onCounterResetPressed);
  }

  void _onCounterIncrementPressed(
      CounterIncrementPressed event, Emitter<CounterInitial> emit) {
    emit(CounterInitial(count: state.count + 1));
  }

  void _onCounterDecrementPressed(
      CounterDecrementPressed event, Emitter<CounterInitial> emit) {
    if (state.count > 0) {
      emit(CounterInitial(count: state.count - 1));
    }
  }

  void _onCounterResetPressed(
      CounterResetPressed event, Emitter<CounterInitial> emit) {
    emit(CounterInitial(count: 0));
  }
}
