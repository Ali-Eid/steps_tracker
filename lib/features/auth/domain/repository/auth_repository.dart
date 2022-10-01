import 'package:dartz/dartz.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/error/failures.dart';

abstract class AuthReposiotry {
  Future<Either<Failure, bool>> signInAnonymously(String name);
  Future<Either<Failure, AuthStatus>> hasAnAccount();
}
