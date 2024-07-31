import 'package:eaglesrides_drivers/domain/repositories/auth_repository.dart';

class AuthCheckUserUseCase {
  final AuthRepository authRepository;

  AuthCheckUserUseCase({required this.authRepository});

  Future<bool> call(String userId) async {
    return await authRepository.authCheckUserStatus(userId);
  }
}
