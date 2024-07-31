import '../repositories/auth_repository.dart';

class LoginDriverUseCase {
  final AuthRepository authRepository;

  LoginDriverUseCase({required this.authRepository});

  Future<String> call(String email, String password) async {
    return await authRepository.loginDriver(email, password);
  }
}
