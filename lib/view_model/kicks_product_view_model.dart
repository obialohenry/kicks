import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kicks/model/response/kicks_product_response.dart';

final kicksProductViewModel = ChangeNotifierProvider((ref) => KicksProductsViewModel());

class KicksProductsViewModel extends ChangeNotifier {
  bool _gettingKicksProducts = false;
  bool get gettingKicksProducts => _gettingKicksProducts;
  List<KicksProductResponse> _kicksProducts = [];
  List<KicksProductResponse> get kicksProducts => _kicksProducts;
  Future<void> getKicksProducts() async {}
}
