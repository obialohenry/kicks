import 'package:kicks/repository/service/api/api_service.dart';

class KicksProductsBackEnd extends ApiService {
  Future<dynamic> fetchKicksProducts() async {
    return getMth(
      fetchProductsUri,
      headers: apiHeader,
    );
  }
}
