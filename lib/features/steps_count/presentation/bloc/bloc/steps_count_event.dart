part of 'steps_count_bloc.dart';

abstract class StepsCountEvent extends Equatable {
  const StepsCountEvent();

  @override
  List<Object> get props => [];
}

class GetStepsCount extends StepsCountEvent {
  final int steps;

  const GetStepsCount({required this.steps});
}
