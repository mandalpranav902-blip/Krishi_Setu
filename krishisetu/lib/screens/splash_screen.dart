import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:krishisetu/screens/homeScreen.dart';
import 'package:krishisetu/screens/language_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const LanguageScreen()),
      );
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 51, 126, 70),
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(child: Image.asset('assets/splashImage.png')),
              Text(
                "KrishiSetu",
                style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              SizedBox(height: 35),
              Text(
                'Direct farm to you.',
                style: TextStyle(
                  color: const Color.fromARGB(255, 233, 232, 232),
                  fontSize: 25,
                ),
              ),
              Text(
                'Trusted. Transparent.',
                style: TextStyle(
                  color: const Color.fromARGB(255, 233, 232, 232),
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 40),
              SizedBox(
                width: 100,
                height: 3,
                child: LinearProgressIndicator(
                  color: const Color.fromARGB(255, 172, 172, 172),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Loading..',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
