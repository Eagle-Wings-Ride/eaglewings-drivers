import '../repositories/auth_repository.dart';

class AuthGetUserUidUseCase {
  final AuthRepository authRepository;

  AuthGetUserUidUseCase({required this.authRepository});

  Future<String> call() async {
    return await authRepository.authGetUserUid();
  }
}
