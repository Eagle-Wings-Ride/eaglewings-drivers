import '../repositories/auth_repository.dart';

class AuthIsSignInUseCase {
  final AuthRepository authRepository;

  AuthIsSignInUseCase({required this.authRepository});

  Future<bool> call() async {
    return await authRepository.authIsSignIn();
  }
}
