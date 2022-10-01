import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/usecases/step_count_usecase.dart';

part 'steps_count_event.dart';
part 'steps_count_state.dart';

class StepsCountBloc extends Bloc<StepsCountEvent, StepsCountState> {
  final CountStepsUseCase countSteps;
  StepsCountBloc({required this.countSteps}) : super(StepsCountInitial()) {
    on<StepsCountEvent>((event, emit) async {
      if (event is GetStepsCount) {
        emit(LoadingCountState());
        final failureOrSteps = await countSteps(event.steps);
        failureOrSteps.fold((l) {
          emit(ErrorCountState(message: l.toString()));
        }, (steps) {
          emit(SuccessCountState(steps: steps));
        });
      }
    });
  }
}
