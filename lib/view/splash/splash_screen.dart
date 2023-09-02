import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import '../../routes/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigation();
  }

  void navigation() {
    Duration duration = const Duration(seconds: 3);
    Future.delayed(
      duration,
      () {
        context.go(RoutesName.dashboardScreen);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "TODO List",
                style: TextStyle(fontSize: 25),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Center(
                  child: SpinKitFoldingCube(
                    color: Colors.black,
                    size: 45,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
