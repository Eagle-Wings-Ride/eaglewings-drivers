import 'package:eaglesrides_drivers/data/data_sources/auth_data_source.dart';
import 'package:eaglesrides_drivers/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource authDataSource;
  AuthRepositoryImpl({required this.authDataSource});

  @override
  Future<String> addProfileImg(String driverId) async {
    return await authDataSource.addProfileImg(driverId);
  }

  @override
  Future<bool> authCheckUserStatus(String userId) async {
    return await authDataSource.authCheckUserStatus(userId);
  }

  @override
  Future<String> authGetUserUid() async {
    return await authDataSource.authGetUserUid();
  }

  @override
  Future<bool> authIsSignIn() async {
    return await authDataSource.authIsSignIn();
  }

  @override
  Future<void> authOtpVerification(String otp) async {
    return await authDataSource.authOtpVerification(otp);
  }

  @override
  Future<void> authPhoneVerification(String phoneNumber) async {
    return await authDataSource.authPhoneVerification(phoneNumber);
  }

  @override
  Future<void> authSignOut() async {
    return await authDataSource.authSignOut();
  }

  @override
  Future<String> loginDriver(String email, String password) async {
    return await authDataSource.loginDriver(email, password);
  }
}
