import 'package:step_tracker/core/constants/constatns.dart';
import 'package:step_tracker/core/error/failures.dart';

import 'package:step_tracker/core/constants/enums.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repository/auth_repository.dart';
import '../datasource/local_remote_data_source.dart';
import '../datasource/remote_data_source.dart';

class AuthRepositoryImplements implements AuthReposiotry {
  final FireBaseAuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  AuthRepositoryImplements(this.authRemoteDataSource, this.authLocalDataSource);
  @override
  Future<Either<Failure, AuthStatus>> hasAnAccount() {
    // TODO: implement hasAnAccount
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> signInAnonymously(String name) async {
    try {
      final remote = await authRemoteDataSource.signInAnonymously(name);
      await authLocalDataSource.cachedToken(remote.user!.uid);
      token = await authLocalDataSource.getToken();
      return right(true);
    } catch (e) {
      return left(ServerFailure());
    }
  }
}
