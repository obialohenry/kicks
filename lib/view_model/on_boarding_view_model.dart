import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kicks/view/screens/products_screen.dart';

final onboardingViewModel = ChangeNotifierProvider((ref) => OnboardingViewModel());

class OnboardingViewModel extends ChangeNotifier {
  init(context) {
    initData().then((onValue) async {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ProductsScreen()));
    });
  }

  Future<void> initData() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
  }
}
