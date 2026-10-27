import 'package:flutter_bloc/flutter_bloc.dart';
import 'Counter_event.dart';
import 'Counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, Counterstate> {
CounterBloc() : super(const Counterstate(0)) {
  on<CounterTambahan>((event, emit) {
    emit(Counterstate(state.angka + event.Jumblah));
  });

  on<CounterKurangan>((event, emit) {
    emit(Counterstate(state.angka - event.Jumblah));
  });

  on<CounterRiset>((event, emit) {
    emit(const Counterstate(0));
  });
}
}

