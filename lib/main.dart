// import 'package:firebase_core/firebase_core.dart';
import 'package:eaglesrides_drivers/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'constants/component_constants.dart';
import 'data/internet/internet_cubit.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await Hive.initFlutter();
  await Hive.openBox('authBox');
  await di.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setUpScreenUtils(context);
    setStatusBar();
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: MediaQuery(
        data: MediaQuery.of(context)
            .copyWith(textScaler: const TextScaler.linear(1)),
        child: GetMaterialApp(
          title: 'EaglesRides Driver',
          theme: ThemeData(),
          debugShowCheckedModeBanner: false,
          home: BlocProvider<InternetCubit>(
            create: (BuildContext context) => di.sl<InternetCubit>(),
            child: const SplashScreen(),
          ),
        ),
      ),
    );
  }
}
