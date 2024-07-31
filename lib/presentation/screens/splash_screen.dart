import 'dart:async';

import 'package:eaglesrides_drivers/presentation/controller/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../data/internet/internet_cubit.dart';
import '/injection_container.dart' as di;
import 'auth/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthController authController = Get.put(di.sl<AuthController>());
  void initState() {
    authController.checkIsSignIn();
    Timer(
      const Duration(seconds: 3),
      () async {
        if (authController.isSignIn.value) {
          // Get.off(HomePage());
          // if (await authController.checkUserStatus()) {
          //   // Navigator.pushReplacement(
          //   //   context,
          //   //   MaterialPageRoute(
          //   //     builder: (context) => BlocProvider<DriverLocationCubit>(
          //   //       create: (BuildContext context) => di.sl<DriverLocationCubit>(),
          //   //       child: BlocProvider<UserReqCubit>(
          //   //         create: (BuildContext context) => di.sl<UserReqCubit>(),
          //   //         child: BlocProvider<UberMapCubit>(
          //   //           create: (BuildContext context) => di.sl<UberMapCubit>(),
          //   //           child: BlocProvider<InternetCubit>(
          //   //             create: (BuildContext context) => di.sl<InternetCubit>(),
          //   //             child: const HomePage(),
          //   //           ),
          //   //         ),
          //   //       ),
          //   //     ),
          //   //   ),
          //   // );
          // } else {
          //   Navigator.pushReplacement(
          //       context,
          //       MaterialPageRoute(
          //         builder: (_) => const UberAuthRegistrationPage(),
          //       ));
          // }
        } else {
          Get.off(Login());
          // Navigator.pushReplacement(
          //     context,
          //     MaterialPageRoute(
          //       builder: (_) => const UberAuthWelcomeScreen(),
          //     ));
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Material(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: media.height * 1,
              width: media.width * 1,
              decoration: BoxDecoration(
                color: page,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(media.width * 0.01),
                    width: media.width * 0.429,
                    height: media.width * 0.429,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/logo.png'),
                          fit: BoxFit.contain),
                    ),
                  ),
                ],
              ),
            ),

            //no internet
            // (internet == false)
            //     ? Positioned(
            //         top: 0,
            //         child: NoInternet(
            //           onTap: () {
            //             setState(() {
            //               internetTrue();
            //               // getLanguageDone();
            //             });
            //           },
            //         ))
            //     : Container(),
          ],
        ),
      ),
    );
  }
}
