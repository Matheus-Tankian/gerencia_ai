import 'package:flutter/material.dart';
import 'package:gerenciaai/src/app/routes/routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed(Routes.loginPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: RichText(
            text: const TextSpan(
              text: 'Gerencia ',
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
                color: Color(0XFFFF941A),
              ),
              children: [
                TextSpan(
                  text: 'AÍ',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Color(0XFF706E7A),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
