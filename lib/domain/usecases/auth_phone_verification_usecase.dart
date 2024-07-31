import '../repositories/auth_repository.dart';

class AuthPhoneVerificationUseCase {
  final AuthRepository authRepository;

  AuthPhoneVerificationUseCase({required this.authRepository});

  Future<void> call(String phoneNumber) async {
    return await authRepository.authPhoneVerification(phoneNumber);
  }
}
