// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:naturally/common/widgets/texts/section_heading.dart';
// import 'package:naturally/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
// import 'package:naturally/features/shop/screens/product_details/widgets/product_attributes.dart';
// import 'package:naturally/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
// import 'package:naturally/features/shop/screens/product_details/widgets/product_meta_data.dart';
// import 'package:naturally/features/shop/screens/product_details/widgets/rating_share_widget.dart';
// import 'package:naturally/features/shop/screens/product_reviews/product_reviews.dart';
// import 'package:naturally/utils/constants/sizes.dart';
// import 'package:readmore/readmore.dart';

// class ProductDetailScreen extends StatelessWidget {
//   const ProductDetailScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: const TBottomAddToCart(),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // product Image slider
//             const TProductImageSlider(),

//             // product details
//             Padding(
//               padding: const EdgeInsets.only(right: TSizes.defaultSpace, left: TSizes.defaultSpace, bottom: TSizes.defaultSpace),
//               child: Column(
//                 children: [
//                   // Rating and sharing
//                   const TRatingAndShare(),

//                   // price, title, stock & Brand
//                   const TProductMetaData(),

//                   // Attributes
//                   const TProductAttributes(),
//                   const SizedBox(width: TSizes.space),

//                   // Checkout button
//                   SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: const Text('Checkout'))),
//                   const SizedBox(width: TSizes.space),

//                   // Description
//                   const TSectionHeading(title: 'Description', showActiononButton: false),
//                   const SizedBox(width: TSizes.space),
//                   const ReadMoreText(
//                     'Sells organic tomato hybrids that are harvested that are ripe or raw.',
//                     trimLines: 2,
//                     trimMode: TrimMode.Line,
//                     trimCollapsedText: 'Show more',
//                     trimExpandedText: 'Show Less',
//                     moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
//                     lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
//                   ),

//                   // Reviews 
//                   const Divider(),
//                   const SizedBox(width: TSizes.spaceBtwItems),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       const TSectionHeading(title: 'Reviews(199)', showActiononButton: false),
//                       IconButton(icon: const Icon(Iconsax.arrow_right_3, size: 18,), onPressed: () => Get.to(() => const ProductReviewsScreen()))
//                     ],
//                   ),
//                   const SizedBox(width: TSizes.spaceBtwSections),
                  
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:naturally/common/widgets/texts/section_heading.dart';
import 'package:naturally/features/shop/models/product/product_model.dart';
import 'package:naturally/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:naturally/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:naturally/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:naturally/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:naturally/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:naturally/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:naturally/utils/constants/enums.dart';
import 'package:naturally/utils/constants/sizes.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TBottomAddToCart(product: product),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // product Image slider
             TProductImageSlider(product: product),

            // 2 - product details
            Padding(
              padding: const EdgeInsets.only(right: TSizes.defaultSpace, left: TSizes.defaultSpace, bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  // Rating and sharing
                  const TRatingAndShare(),

                  // price, title, stock & Brand
                   TProductMetaData(product:product),

                  // Attributes
                  if(product.productType == ProductType.variable.toString()) TProductAttributes(product: product),
                  if(product.productType == ProductType.variable.toString()) const SizedBox(height: TSizes.spaceBtwSections),

                  // Checkout button
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: const Text('Checkout'))),
                  const SizedBox(width: TSizes.space),

                  // Description
                  const TSectionHeading(title: 'Description', showActiononButton: false),
                  const SizedBox(width: TSizes.space),
                   ReadMoreText(
                    product.description ?? '',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show Less',
                    moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ), //readmore text

                  // Reviews 
                  const Divider(),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const TSectionHeading(title: 'Reviews(199)', showActiononButton: false),
                      IconButton(icon: const Icon(Iconsax.arrow_right_3, size: 18,), onPressed: () => Get.to(() => const ProductReviewsScreen()))
                    ],
                  ),
                  const SizedBox(width: TSizes.spaceBtwSections),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


