abstract class CounterEvent {}
class CounterTambahan extends CounterEvent {
  final int Jumblah;
  CounterTambahan ({this.Jumblah = 1});
}
class CounterKurangan extends CounterEvent {
  final int Jumblah;
  CounterKurangan ({this.Jumblah = 1});
}
class CounterRiset extends CounterEvent {}