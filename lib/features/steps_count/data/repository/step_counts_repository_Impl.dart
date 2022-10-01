import 'package:step_tracker/core/error/failures.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repository/step_counts_repo.dart';
import '../datasource/firebase_remote_datasource.dart';

class StepCountsRepositoryImpl implements StepCountsRepository {
  final FireBaseStepsRemoteDataSource fireBaseStepsRemoteDataSource;

  StepCountsRepositoryImpl(this.fireBaseStepsRemoteDataSource);
  @override
  Future<Either<Failure, Stream<int>>> countSteps(int steps) async {
    try {
      final remote = await fireBaseStepsRemoteDataSource.countSteps(steps);
      return right(remote);
    } catch (e) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> savecountSteps(int countSteps) async {
    try {
      final remote = await fireBaseStepsRemoteDataSource.saveSteps(countSteps);
      return Future.value();
    } catch (e) {
      return left(ServerFailure());
    }
  }
}
