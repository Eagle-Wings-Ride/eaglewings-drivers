import '../repositories/auth_repository.dart';

class AddProfileImageUseCase {
  final AuthRepository authRepository;

  AddProfileImageUseCase({required this.authRepository});

  Future<String> call(String riderId) async {
    return await authRepository.addProfileImg(riderId);
  }
}
