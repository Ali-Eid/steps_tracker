import 'dart:async';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class StepCountsRepository {
  Future<Either<Failure, Stream<int>>> countSteps(int steps);
  Future<Either<Failure, void>> savecountSteps(int countSteps);
}
