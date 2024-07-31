import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:eaglesrides_drivers/data/core/api_client.dart';
import 'package:eaglesrides_drivers/data/repositories/auth_repository_impl.dart';
import 'package:eaglesrides_drivers/domain/repositories/auth_repository.dart';
import 'package:eaglesrides_drivers/domain/usecases/auth_check_user_use_case.dart';
import 'package:eaglesrides_drivers/domain/usecases/auth_get_user_id_usecase.dart';
import 'package:eaglesrides_drivers/domain/usecases/auth_is_signed_in_usecase.dart';
import 'package:eaglesrides_drivers/domain/usecases/auth_otp_verification.dart';
import 'package:eaglesrides_drivers/domain/usecases/auth_phone_verification_usecase.dart';
import 'package:eaglesrides_drivers/domain/usecases/auth_sign_out_usecase.dart';
import 'package:eaglesrides_drivers/domain/usecases/login_driver.dart';
import 'package:eaglesrides_drivers/presentation/controller/auth/auth_controller.dart';
import 'package:get_it/get_it.dart';

import 'data/data_sources/auth_data_source.dart';
import 'data/data_sources/auth_data_source_impl.dart';
import 'data/internet/internet_cubit.dart';
import 'package:http/http.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<Client>(() => Client());

  sl.registerLazySingleton<ApiClient>(() => ApiClient(sl()));
  //////////////////////////////////////////////////////////////////
  ////////////////////// Cubits ///////////////////////////////////
  //////////////////////////////////////////////////////////////////

  sl.registerFactory(
    () => InternetCubit(connectivity: sl.call()),
  );

  //////////////////////////////////////////////////////////////////
  ////////////////////// GetX Controllers //////////////////////////
  //////////////////////////////////////////////////////////////////

  sl.registerFactory<AuthController>(
    () => AuthController(
      authCheckUserUseCase: sl.call(),
      authIsSignInUseCase: sl.call(),
      loginDriverUseCase: sl.call(),
    ),
  );

  //////////////////////////////////////////////////////////////////
  ////////////////////// Use Cases /////////////////////////////////
  //////////////////////////////////////////////////////////////////

  // authentication
  sl.registerLazySingleton<LoginDriverUseCase>(
    () => LoginDriverUseCase(
      authRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton<AuthIsSignInUseCase>(
    () => AuthIsSignInUseCase(
      authRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton<AuthPhoneVerificationUseCase>(
    () => AuthPhoneVerificationUseCase(
      authRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton<AuthOtpVerificationUseCase>(
    () => AuthOtpVerificationUseCase(
      authRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton<AuthGetUserUidUseCase>(
    () => AuthGetUserUidUseCase(
      authRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton<AuthCheckUserUseCase>(
    () => AuthCheckUserUseCase(
      authRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton<AuthSignOutUseCase>(
    () => AuthSignOutUseCase(
      authRepository: sl.call(),
    ),
  );

  //////////////////////////////////////////////////////////////////
  ////////////////////// Repositories //////////////////////////////
  //////////////////////////////////////////////////////////////////

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authDataSource: sl.call(),
    ),
  );

  //////////////////////////////////////////////////////////////////
  ////////////////////// Data Sources //////////////////////////////
  //////////////////////////////////////////////////////////////////
  sl.registerLazySingleton<Connectivity>(
    () => Connectivity(),
  );

  sl.registerLazySingleton<AuthDataSource>(
    () => AuthDataSourceImpl(
      sl.call(),
    ),
  );
}
