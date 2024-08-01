import 'package:flutter/material.dart';

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  // cloudes
  late AnimationController _containerController;

  late Animation<AlignmentGeometry> _cloudeWithFireAnimation;
  late Animation<AlignmentGeometry> _cloudeWithMoonAnimation;

  // containrs
  late AnimationController _cloudesController;
  late Animation<AlignmentGeometry> _continderAnimation;
  // plane
  late AnimationController _planeController;
  late Animation<AlignmentGeometry> _planeAnimation;

  @override
  void initState() {
    super.initState();
    _planeMethod();
    _containerMethod();
    _cloudeInti();
  }

  void _planeMethod() {
    _planeController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4600));

    _planeAnimation = Tween<AlignmentGeometry>(
            begin: const Alignment(0, 2.3), end: const Alignment(0, -5))
        .animate(_planeController);
    _planeController.forward();
    bool isLessTheemMiddle = true;
    _planeController.addListener(() {
      print('x');
      if (_planeController.value >= 0.43 && isLessTheemMiddle) {
        _planeController.stop();
        Future.delayed(
          const Duration(milliseconds: 400),
          () {
            isLessTheemMiddle = false;
            _planeController.duration =
                const Duration(seconds: 2); // Faster second phase

            _planeController.forward();
          },
        );
      }
    });
  }

  void _containerMethod() {
    _containerController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    _continderAnimation = Tween<AlignmentGeometry>(
            begin: const Alignment(0, 4), end: const Alignment(0, 1))
        .animate(_containerController);

    _containerController.forward();
  }

  void _cloudeInti() {
    _cloudesController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 2500),
        reverseDuration: const Duration(seconds: 2));
    _cloudeWithFireAnimation = Tween<AlignmentGeometry>(
            begin: const Alignment(-1.9, -0.6),
            end: const Alignment(-0.8, -0.6))
        .animate(_cloudesController);

    // blue
    _cloudeWithMoonAnimation = Tween<AlignmentGeometry>(
            begin: const Alignment(1.9, -0.99),
            end: const Alignment(0.8, -0.99))
        .animate(_cloudesController);
    _cloudesMethode();
  }

  void _cloudesMethode() {
    _cloudesController.forward();

    bool xisLessThen80Present = true;
    _cloudesController.addListener(() {
      if (_cloudesController.value >= 0.8 && xisLessThen80Present) {
        _cloudesController.stop();

        Future.delayed(
          const Duration(milliseconds: 400),
          () {
            xisLessThen80Present = false;
            _cloudesController.duration = const Duration(seconds: 5);

            _cloudesController.forward();
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xffFF7171),
        body: Stack(
          children: [
            AlignTransition(
                alignment: _planeAnimation,
                child: Image.asset('assets/plane.png')),
            AlignTransition(
              alignment: _continderAnimation,
              child: Container(
                width: double.infinity,
                height: 400,
                decoration: const BoxDecoration(
         
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      'Launch and Grow your startup',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const SizedBox(
                      width: 350,
                      child: Text(
                        'The average company forecasts a growth   178% in revenues for their first year, 100% for second, and 71% for third.',
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ),
                       const SizedBox(
                      height: 60,
                    ),
                    Container(
                      width: 250,
                      height: 45, 
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF7070), 
                        borderRadius:
                            BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFFF7070).withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            AlignTransition(
              alignment: _cloudeWithFireAnimation,
              child: Image.asset('assets/cloudeWithFire.png'),
            ),
            AlignTransition(
              alignment: _cloudeWithMoonAnimation,
              child: Image.asset('assets/cloudMoon.png'),
            ),
          ],
        ),
      ),
    );
  }
}
