import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kicks/config/app_colors.dart';
import 'package:kicks/view/components/gap.dart';
import 'package:kicks/view_model/kicks_product_view_model.dart';

class ProductsScreen extends ConsumerStatefulWidget {
  ProductsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends ConsumerState<ProductsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    ref.watch(kicksProductViewModel).getKicksProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var kicksProductProvider = ref.watch(kicksProductViewModel);
    return Scaffold(
        backgroundColor: Colors.white,
        body: kicksProductProvider.gettingKicksProducts
            ? const Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    color: AppColors.kSoftGreenShade,
                  ),
                ),
              )
            : SafeArea(
                child: SingleChildScrollView(
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 15,
                    ),
                    itemBuilder: (context, index) => KicksProduct(),
                  ),
                ),
              ));
  }
}

class KicksProduct extends StatelessWidget {
  const KicksProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.kLightGray,
      height: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          const Gap(10),
          const Text(
            "name",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Gap(5),
          const Text(
            "₦price",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
