import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final kicksProductViewModel = ChangeNotifierProvider((ref) => KicksProductsViewModel());

class KicksProductsViewModel extends ChangeNotifier {
  bool _gettingKicksProducts = false;
  bool get gettingKicksProducts => _gettingKicksProducts;
  List _kicksProducts = [];
  List get kicksProducts => _kicksProducts;
  Future<void> getKicksProducts() async {}
}
