import 'package:dartz/dartz.dart';
import 'package:step_tracker/features/steps_count/domain/repository/step_counts_repo.dart';
import '../../../../core/error/failures.dart';

class CountStepsUseCase {
  final StepCountsRepository repository;

  CountStepsUseCase(this.repository);

  Future<Either<Failure, Stream<int>>> call(int steps) async {
    return await repository.countSteps(steps);
  }
}
