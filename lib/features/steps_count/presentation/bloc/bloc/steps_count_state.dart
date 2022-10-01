part of 'steps_count_bloc.dart';

abstract class StepsCountState extends Equatable {
  const StepsCountState();

  @override
  List<Object> get props => [];
}

class StepsCountInitial extends StepsCountState {}

class LoadingCountState extends StepsCountState {}

class SuccessCountState extends StepsCountState {
  final Stream<int> steps;

  const SuccessCountState({required this.steps});
}

class ErrorCountState extends StepsCountState {
  final String message;

  const ErrorCountState({required this.message});
}
