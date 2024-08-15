import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1),
        reverseDuration: const Duration(seconds: 1))
      ..repeat();
  }

  double size = 90;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xff5B69E9),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: RotationTransition(
                    turns: _controller,
                    child: SizedBox(
                        width: size,
                        height: size,
                        child: Image.asset('assets/mailLogo.png'))),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {});
                      },
                      child: const Text('Hi')))
            ],
          ),
        ),
      ),
    );
  }
}
