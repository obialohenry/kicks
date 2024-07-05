import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kicks/config/app_colors.dart';
import 'package:kicks/view/components/gap.dart';
import 'package:kicks/view/screens/products_screen.dart';
import 'package:kicks/view_model/on_boarding_view_model.dart';

class SplashScreen extends ConsumerStatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    ref.watch(onboardingViewModel).init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kLightGray,
      body: Center(
        child: Column(
          children: [
            Image.asset(
              "assets/images/kicks_logo.png",
              height: 50,
              width: 50,
            ),
            const Gap(10),
            const Text(
              "Kicks",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
