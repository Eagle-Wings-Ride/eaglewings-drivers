import 'package:eaglesrides_drivers/domain/usecases/auth_check_user_use_case.dart';
import 'package:eaglesrides_drivers/domain/usecases/auth_is_signed_in_usecase.dart';
import 'package:eaglesrides_drivers/domain/usecases/login_driver.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AuthController extends GetxController {
  final AuthIsSignInUseCase authIsSignInUseCase;
  final LoginDriverUseCase loginDriverUseCase;
  final AuthCheckUserUseCase authCheckUserUseCase;

  var isSignIn = false.obs;

  AuthController({
    required this.authCheckUserUseCase,
    required this.authIsSignInUseCase,
    required this.loginDriverUseCase,
  });

  checkIsSignIn() async {
    bool authIsSignIn = await authIsSignInUseCase.call();
    isSignIn.value = authIsSignIn;
  }

  Future<bool> checkUserStatus() async {
    var box = await Hive.openBox('authBox');
    final userId = box.get('user_id');
    if (userId != null) {
      return await authCheckUserUseCase(userId);
    }
    return false;
  }

  loginDriver(String email, String password) async {
    try {
      final token = await loginDriverUseCase.call(email, password);
      Get.snackbar('Login Successful', 'Token: $token');
    } catch (e) {
      Get.snackbar("Login Failed", e.toString());
      print(e);
    }
  }
}
