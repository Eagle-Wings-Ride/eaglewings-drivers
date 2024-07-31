import '../repositories/auth_repository.dart';

class AuthOtpVerificationUseCase {
  final AuthRepository authRepository;

  AuthOtpVerificationUseCase({required this.authRepository});

  Future<void> call(String otp) async {
    return await authRepository.authOtpVerification(otp);
  }
}
