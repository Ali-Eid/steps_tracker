import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:step_tracker/features/steps_count/data/datasource/firebase_remote_datasource.dart';

import 'features/auth/data/datasource/local_remote_data_source.dart';
import 'features/auth/data/datasource/remote_data_source.dart';
import 'features/auth/data/repository/auth_repository_impl.dart';
import 'features/auth/domain/repository/auth_repository.dart';
import 'features/auth/domain/usecases/signin_anonymous_usecase.dart';
import 'features/auth/presentation/bloc/Auth/auth_bloc.dart';
import 'features/steps_count/data/repository/step_counts_repository_Impl.dart';
import 'features/steps_count/domain/repository/step_counts_repo.dart';
import 'features/steps_count/domain/usecases/save_steps_count.dart';
import 'features/steps_count/domain/usecases/step_count_usecase.dart';
import 'features/steps_count/presentation/bloc/bloc/steps_count_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
// Bloc

  sl.registerFactory(() => AuthBloc(signInAnonymously: sl()));
  sl.registerFactory(() => StepsCountBloc(countSteps: sl()));

//usecases

  sl.registerLazySingleton(() => SignInAnonymouslyUseCase(sl()));
  sl.registerLazySingleton(() => SaveStepsCount(sl()));
  sl.registerLazySingleton(() => CountStepsUseCase(sl()));

//repository

  sl.registerLazySingleton<AuthReposiotry>(
      () => AuthRepositoryImplements(sl(), sl()));
  sl.registerLazySingleton<StepCountsRepository>(
      () => StepCountsRepositoryImpl(sl()));
//remote Data source

  sl.registerLazySingleton<FireBaseAuthRemoteDataSource>(
      () => FireBaseAuthRemoteDataSourceImpl(sl(), sl()));
  sl.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(sl()));
  sl.registerLazySingleton<FireBaseStepsRemoteDataSource>(
      () => FireBaseStepsRemoteDataSourceImpl(sl()));
//External

  final firestore = FirebaseFirestore.instance;
  final fireAuth = FirebaseAuth.instance;
  final sharedprefernce = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => firestore);
  sl.registerLazySingleton(() => fireAuth);
  sl.registerLazySingleton(() => sharedprefernce);
}
