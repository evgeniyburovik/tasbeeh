import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterInitial> {
  CounterBloc() : super(CounterInitial(count: 0)) {
    on<CounterIncrementPressed>(onCounterIncrementPressed);
    //on<CounterDecrementPressed>(_onCounterDecrementPressed);
  }

  void onCounterIncrementPressed(
      CounterIncrementPressed event, Emitter<CounterInitial> emit) {
    emit(CounterInitial(count: state.count + 1));
  }
}
