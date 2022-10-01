import 'package:dartz/dartz.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/error/failures.dart';
import '../repository/auth_repository.dart';

class AuthStatusUseCase {
  final AuthReposiotry reposiotry;

  AuthStatusUseCase(this.reposiotry);

  Future<Either<Failure, AuthStatus>> call() async {
    return await reposiotry.hasAnAccount();
  }
}
