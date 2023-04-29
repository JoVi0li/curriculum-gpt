import 'package:bloc/bloc.dart';
import 'package:curriculumgpt/modules/auth/domain/errors/google_sign_in_errors.dart';
import 'package:curriculumgpt/modules/auth/domain/usecases/google_sign_in_usecase.dart';
import 'package:curriculumgpt/modules/auth/presenter/events/sign_in_events.dart';
import 'package:curriculumgpt/modules/auth/presenter/states/sign_in_states.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc(this.googleSignInUsecase) : super(InitialSignInState()) {
    on<GoogleSignInEvent>(handleGoogleSignInEvent);
  }

  final GoogleSignInUsecase googleSignInUsecase;

  Future<void> handleGoogleSignInEvent(
    GoogleSignInEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(LoadingSignInState());

    final result = await googleSignInUsecase();

    result.when(
      (success) => emit(SuccessSignInState()),
      (error) => emit(ErrorSignInState<GoogleSignInError>(error)),
    );
  }
}
