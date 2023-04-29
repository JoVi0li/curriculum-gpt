abstract class SignInState {}

class InitialSignInState extends SignInState {}

class LoadingSignInState extends SignInState {}

class SuccessSignInState extends SignInState {}

class ErrorSignInState<T> extends SignInState {
  ErrorSignInState(this.error);
  final T error;
}
