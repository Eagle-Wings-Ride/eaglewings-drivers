import 'package:eaglesrides_drivers/data/core/api_client.dart';
import 'package:eaglesrides_drivers/data/data_sources/auth_data_source.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AuthDataSourceImpl extends AuthDataSource {
  final ApiClient _client;

  AuthDataSourceImpl(this._client);

  @override
  Future<String> loginDriver(String email, String password) async {
    final uri = 'https://your-backend-url.com/api/login';
    final response = await _client.post(
      uri,
      params: {'email': email, 'password': password},
      // headers: {'Content-Type': 'application/json'},
    );
    if (response['token'] != null) {
      var box = await Hive.openBox('authBox');
      await box.put('auth_token', response['token']);
      return response['token'];
    } else {
      throw Exception('Failed to login');
    }
  }

  @override
  Future<String> addProfileImg(String driverId) async {
    return '';
  }

  @override
  Future<bool> authCheckUserStatus(String userId) async {
    final response =
        await _client.get('/checkuserStatus', params: {'userId': userId});
    return response['status'] == 'active';
  }

  @override
  Future<String> authGetUserUid() async {
    return '';
  }

  @override
  Future<bool> authIsSignIn() async {
    var box = await Hive.openBox('authBox');
    final token = box.get('auth_token');
    if (token != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<void> authOtpVerification(String otp) async {}

  @override
  Future<void> authPhoneVerification(String phoneNumber) async {}

  @override
  Future<void> authSignOut() async {}
}
