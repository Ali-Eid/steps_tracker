import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repository/auth_repository.dart';

class SignInAnonymouslyUseCase {
  final AuthReposiotry reposiotry;

  SignInAnonymouslyUseCase(this.reposiotry);
  Future<Either<Failure, bool>> call(String name) async {
    return await reposiotry.signInAnonymously(name);
  }
}
