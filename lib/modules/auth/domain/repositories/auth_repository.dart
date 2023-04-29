import 'package:curriculumgpt/modules/auth/domain/errors/google_sign_in_errors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class AuthRepository {
  Future<Result<UserCredential, GoogleSignInError>> googleSignIn();
}
