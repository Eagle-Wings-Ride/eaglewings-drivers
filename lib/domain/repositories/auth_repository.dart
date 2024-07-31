abstract class AuthRepository {
  Future<bool> authIsSignIn();

  Future<void> authPhoneVerification(String phoneNumber);

  Future<void> authOtpVerification(String otp);

  Future<String> authGetUserUid();

  Future<bool> authCheckUserStatus(String userId);

  Future<void> authSignOut();

  Future<String> addProfileImg(String driverId);

  Future<String> loginDriver(String email, String password);
}
