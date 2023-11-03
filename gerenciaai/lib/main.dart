import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gerenciaai/src/app/routes/routes.dart';
import 'package:gerenciaai/src/home/home.dart';
import 'package:gerenciaai/src/login_page/create_account/create_account_view.dart';
import 'package:gerenciaai/src/login_page/login_page/login_view.dart';
import 'package:gerenciaai/src/splash_page/splash_view.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GerenciaAi',
      theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // useMaterial3: true,
          ),
      initialRoute: Routes.splashPage,
      routes: {
        Routes.splashPage: (context) => const SplashView(),
        Routes.loginPage: (context) => const LoginView(),
        Routes.createAccountPage: (context) => const CreateAccountView(),
        Routes.homePage: (context) => const Home(),
      },
      //home: const SplashView(),
    );
  }
}
