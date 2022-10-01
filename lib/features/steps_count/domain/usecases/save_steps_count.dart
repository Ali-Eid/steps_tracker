import 'package:dartz/dartz.dart';
import 'package:step_tracker/features/steps_count/domain/repository/step_counts_repo.dart';
import '../../../../core/error/failures.dart';

class SaveStepsCount {
  final StepCountsRepository repository;
  SaveStepsCount(this.repository);
  Future<Either<Failure, void>> call(int countSteps) async {
    return await repository.savecountSteps(countSteps);
  }
}
