import 'package:flutter/material.dart';
import 'package:naturally/common/shimmers/boxes_shimmer.dart';
import 'package:naturally/common/shimmers/list_tile_shimmer.dart';
import 'package:naturally/common/widgets/brands/brand_show_case.dart';
import 'package:naturally/features/shop/controllers/product/brand_controller.dart';
import 'package:naturally/features/shop/models/product/category_model.dart';
import 'package:naturally/utils/constants/sizes.dart';
import 'package:naturally/utils/helpers/cloud_helper_functions.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({
    super.key,
    required this.category,
});

final CategoryModel category;

@override
Widget build(BuildContext context){
  final controller = BrandController.instance;
  return FutureBuilder(
    future: controller.getBrandsForCategory(category.id),
    builder:(context, snapshot) {
      const loader = Column(
        children: [
          TListTileShimmer(),
          SizedBox(height: TSizes.spaceBtwItems),
          TBoxesShimmer(),
          SizedBox(height: TSizes.spaceBtwItems),
        ]
      );


    final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
    if (widget != null) return widget;
    // Record found!
    final brands = snapshot.data!;

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: brands.length,
      itemBuilder:(_, index) {
        final brand = brands[index];
        return FutureBuilder(
          future: controller.getBrandProducts(brandId: brand.id, limit: 3),
          builder: (context, snapshot) {
            final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader); 
            if (widget != null) return widget;
            /// Record found!
            final products = snapshot.data!;
            return TBrandShowCase(brand: brand, images: products.map((e) => e.thumbnail).toList());
          }
        );
      },
    );
  }
);
        }
      }
  


