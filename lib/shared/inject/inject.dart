import 'package:curriculumgpt/modules/auth/domain/repositories/auth_repository.dart';
import 'package:curriculumgpt/modules/auth/domain/usecases/google_sign_in_usecase.dart';
import 'package:curriculumgpt/modules/auth/infra/repositories/auth_repository_imp.dart';
import 'package:curriculumgpt/modules/auth/presenter/blocs/sign_in_bloc.dart';
import 'package:get_it/get_it.dart';

class Inject {
  Inject._();

  static void call() {
    GetIt getIt = GetIt.I;

    getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImp(),
    );

    getIt.registerLazySingleton<GoogleSignInUsecase>(
      () => GoogleSignInUsecaseImp(getIt()),
    );

    getIt.registerLazySingleton<SignInBloc>(
      () => SignInBloc(getIt()),
    );
  }
}
