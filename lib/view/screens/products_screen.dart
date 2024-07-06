import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kicks/config/app_colors.dart';
import 'package:kicks/view/components/gap.dart';
import 'package:kicks/view_model/kicks_product_view_model.dart';

class ProductsScreen extends ConsumerWidget {
  ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var kicksProductProvider = ref.watch(kicksProductViewModel);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Kicks Products",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: kicksProductProvider.kicksProducts.isEmpty
          ? const Center(
              child: Text(
              "No Products Available",
              style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
            ))
          : SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                      itemCount: kicksProductProvider.kicksProducts.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 15,
                      ),
                      itemBuilder: (context, index) {
                        List<dynamic> kicksProductsList = kicksProductProvider.kicksProducts;
                        const img = "http://api.timbu.cloud/images/";
                        String imageUrl = "$img${kicksProductsList[index]?["photos"]?[0]?["url"]}";
                        String productDescription =
                            kicksProductsList[index]?["description"] ?? "A good product";
                        String productName = kicksProductsList[index]?["name"] ?? "NO PRODUCT NAME";
                        String productPrice = kicksProductsList[index]?["current_price"]?[0]?["NGN"]
                                    ?[0]
                                ?.toString() ??
                            "10000.0";
                        debugPrint(imageUrl);
                        return KicksProduct(
                          imageUrl: imageUrl,
                          productName: productName,
                          productPrice: productPrice,
                          productDescription: productDescription,
                        );
                      }),
                ),
              ),
            ),
    );
  }
}

class KicksProduct extends StatelessWidget {
  const KicksProduct({
    super.key,
    this.imageUrl,
    this.productName,
    this.productPrice,
    this.productDescription,
  });
  final String? imageUrl;
  final String? productName;
  final String? productPrice;
  final String? productDescription;
  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: AppColors.kSoftGreenShade,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              image: DecorationImage(
                image: NetworkImage(imageUrl ?? ""),
                fit: BoxFit.cover,
              ),
            ),
          ),
         
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName ?? "Kicks Product",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "₦$productPrice",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  productDescription ?? "A good product",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
         
        ],
      ),
    );
  }
}
