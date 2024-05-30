import 'package:flutter/material.dart';
import 'package:naturally/common/shimmers/vertical_product_shimmer.dart';
import 'package:naturally/common/widgets/appBar/appBar.dart';
import 'package:naturally/common/widgets/brands/brand_card.dart';
import 'package:naturally/common/widgets/products/sortable/sortable_products.dart';
import 'package:naturally/features/shop/controllers/product/brand_controller.dart';
import 'package:naturally/features/shop/models/product/brand_model.dart';
import 'package:naturally/utils/constants/sizes.dart';
import 'package:naturally/utils/helpers/cloud_helper_functions.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: const TAppBar(title: Text('brand.name')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // brand Detail
              TBrandCard(showBorder: true, brand: brand),
              const SizedBox(height: TSizes.spaceBtwSections),
              
            FutureBuilder(
                future: controller.getBrandProducts(brandId: brand.id),
                builder: (context, snapshot) {
                  /// Handel loader, no record, error messsage
                  const loader  = TVerticalProductShimmer();
                  final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                  if (widget != null) return widget;
                  final brandProducts = snapshot.data!;
                  return TSortableProducts(products: brandProducts); 
                }
              ),
            ],
          )
        ),
      )
    );
  }
}