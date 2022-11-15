import 'dart:async';
import 'package:flutter/material.dart';
import 'main_page.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MainPage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/proudy_logo.png',
              width: 300,
            ),
            SizedBox(
              height: 40,
            ),
            _AnimatedLiquidLinearProgressIndicator(),
          ],
        ),
      )),
    );
  }
}

class _AnimatedLiquidLinearProgressIndicator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>
      _AnimatedLiquidLinearProgressIndicatorState();
}

class _AnimatedLiquidLinearProgressIndicatorState
    extends State<_AnimatedLiquidLinearProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );

    _animationController.addListener(() => setState(() {}));
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final percentage = _animationController.value * 100;
    return Center(
      child: Container(
        width: double.infinity,
        height: 30.0,
        padding: EdgeInsets.symmetric(horizontal: 120.0),
        child: LiquidLinearProgressIndicator(
          value: _animationController.value,
          backgroundColor: Colors.white,
          valueColor: AlwaysStoppedAnimation(Color(0xffEE6352)),
          borderRadius: 8.0,
          center: Text(
            "${percentage.toStringAsFixed(0)}%",
            style: TextStyle(
              color: Colors.orange,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
