abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {
  int number;
  IncrementEvent(this.number);
}
