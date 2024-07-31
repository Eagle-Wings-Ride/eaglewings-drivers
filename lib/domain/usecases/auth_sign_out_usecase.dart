import '../repositories/auth_repository.dart';

class AuthSignOutUseCase {
  final AuthRepository authRepository;

  AuthSignOutUseCase({required this.authRepository});

  Future<void> call() async {
    return await authRepository.authSignOut();
  }
}
