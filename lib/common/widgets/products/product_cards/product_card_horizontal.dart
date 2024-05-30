// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:naturally/common/widgets/icons/t_circular_icon.dart';
// import 'package:naturally/common/widgets/images/t_rounded_image.dart';
// import 'package:naturally/common/widgets/texts/product_price_text.dart';
// import 'package:naturally/common/widgets/texts/product_title_text.dart';
// import 'package:naturally/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
// import 'package:naturally/utils/constants/colors.dart';
// import 'package:naturally/utils/constants/image_strings.dart';
// import 'package:naturally/utils/constants/sizes.dart';
// import 'package:naturally/utils/helpers/helpers_functions.dart';
// import 'package:naturally/utils/validators/rounded_container.dart';

// class TProductCardHorizontal extends StatelessWidget {
//   const TProductCardHorizontal({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final dark = THelperFunctions.isDarkMode(context);
//     return Container(
//         width: 310,
//         padding: const EdgeInsets.all(1),
//         decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(TSizes.productImageRadius),
//         color: dark ? TColors.darkGrey : TColors.softGrey,
//         ),
//         child: Row(
//           children: [
//             // Thumbnail
//             TRoundedContainer(
//               height: 120,
//               padding: const EdgeInsets.all(TSizes.sm),
//               backgroundColor: dark ? TColors.dark : TColors.light,
//               child: Stack(
//                 children: [
//                   // --Thumbnail Image
//                   const SizedBox(
//                     height: 120,
//                     width: 120,
//                     child: TRoundedImage(imageUrl: TImages.productImage1, applyImageRadius: true),
//                   ),

//                    // Sale tag
//                   Positioned(
//                     top: 12,
//                     child: TRoundedContainer(
//                       radius: TSizes.sm,
//                       backgroundColor: TColors.secondary.withOpacity(0.8),
//                       padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
//                       child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black)),
//                     ),
//                   ),
    
//                   // Favourite icon button
//                   const Positioned(
//                     top: 0,
//                     right: 0,
//                     child: TCircularIcon(icon: Iconsax.heart5, color: Colors.red)
//                   ),
//                 ],
//               ),
//             ),
//             // Details
//             SizedBox(
//               width: 172,
//               child: Padding(
//                 padding: const EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
//                 child: Column(
//                   children: [
//                     const Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         TProductTitleText(title: 'Cabbage', smallSize: true),
//                         SizedBox(height: TSizes.spaceBtwItems / 2),
//                         TBrandTitleWithVerifiedIcon(title: 'Nike'),
//                       ],
//                     ),
//                     const Spacer(),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         // Pricing
//                         const Flexible(child: TProductPriceText(price: '20')),

//                         // Add to cart
//                         Container(
//                               decoration: const BoxDecoration(
//                                 color: TColors.dark,
//                                 borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(TSizes.cardRadiusMd),
//                                   bottomRight: Radius.circular(TSizes.productImageRadius),
//                                 )
//                               ),
//                               child: const SizedBox(
//                                 width: TSizes.iconLg * 1.2,
//                                 height: TSizes.iconLg * 1.2,
//                                 child: Center(child: Icon(Iconsax.add, color: TColors.white)),
//                               ),  
//                             ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:naturally/common/widgets/images/t_rounded_image.dart';
// import 'package:naturally/common/widgets/texts/product_price_text.dart';
// import 'package:naturally/common/widgets/texts/product_title_text.dart';
// import 'package:naturally/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
// import 'package:naturally/utils/constants/colors.dart';
// import 'package:naturally/utils/constants/sizes.dart';
// import 'package:naturally/utils/helpers/helpers_functions.dart';
// import 'package:naturally/utils/validators/rounded_container.dart';

// class TProductCardHorizontal extends StatelessWidget {
//   const TProductCardHorizontal({super.key, required this.product });

//   final ProductModel product;

//   @override
//   Widget build(BuildContext context) {
//     final dark = THelperFunctions.isDarkMode(context);
//     final controller = productController.instance;
//     final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);

//     return Container(
//         width: 310,
//         padding: const EdgeInsets.all(1),
//         decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(TSizes.productImageRadius),
//         color: dark ? TColors.darkGrey : TColors.softGrey,
//         ),
//         child: Row(
//           children: [
//             // Thumbnail
//             TRoundedContainer(
//               height: 120,
//               padding: const EdgeInsets.all(TSizes.sm),
//               backgroundColor: dark ? TColors.dark : TColors.light,
//               child: Stack(
//                 children: [
//                   // --Thumbnail Image
//                   SizedBox(
//                     height: 120,
//                     width: 120,
//                     child: TRoundedImage(imageUrl: product.thumbnail, applyImageRadius: true, isNetworkImage: true),
//                   ),

//                    // Sale tag
//                   if (salePercentage != null)
//                   Positioned (
//                     top: 12,
//                       child:TRoundedContainer(
//                         radius: TSizes.sm,
//                         backgroundColor: TColors.secondary.withOpacity (0.8),
//                         padding: const EdgeInsets.symmetric (horizontal: TSizes.sm, vertical: TSizes.xs),
//                         child: Text('$salePercentage%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black)),
//                       ), 
//                     ),
    
//                   // Favourite icon button
//                   Positioned(
//                     top: 0,
//                     right: 0,
//                     child: TFavouriteIcon(productId: product.id),
//                   ),
//                 ],
//               ),
//             ),
//             // Details
//             SizedBox(
//               width: 172,
//               child: Padding(
//                 padding: const EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         TProductTitleText(title: product.title, smallSize: true),
//                         SizedBox(height: TSizes.spaceBtwItems / 2),
//                         TBrandTitleWithVerifiedIcon(title: product.brand!.name),
//                       ],
//                     ),
//                     const Spacer(),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         //Price
//                         Flexible(
//                           child: Column (
//                             children: [
//                               if (product.productType == ProductType.single.toString() && product.salePrice > 0)
//                               Padding(
//                                 padding: const EdgeInsets.only(left: TSizes.sm),
//                                 child: Text(
//                                   product.price.toString(),
//                                   style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),
//                                 ),
//                               ), 

//                               /// Price, Show sale price os main price if sale exist.
//                               Padding (
//                                 padding: const EdgeInsets.only(left: TSizes.sm),
//                                 child: TProductPriceText(price: controller.getProductPrice (product)),
//                               ), 
//                             ],
//                           ),
//                         ),

//                         // Add to cart
//                         Container(
//                           decoration: const BoxDecoration(
//                             color: TColors.dark,
//                             borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(TSizes.cardRadiusMd),
//                               bottomRight: Radius.circular(TSizes.productImageRadius),
//                             )
//                           ),
//                           child: const SizedBox(
//                             width: TSizes.iconLg * 1.2,
//                             height: TSizes.iconLg * 1.2,
//                             child: Center(child: Icon(Iconsax.add, color: TColors.white)),
//                           ),  
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:naturally/common/widgets/images/t_rounded_image.dart';
import 'package:naturally/common/widgets/products/product_cards/favourite_icon.dart';
import 'package:naturally/common/widgets/texts/product_price_text.dart';
import 'package:naturally/common/widgets/texts/product_title_text.dart';
import 'package:naturally/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:naturally/features/shop/controllers/product/product_controller.dart';
import 'package:naturally/features/shop/models/product/product_model.dart';
import 'package:naturally/utils/constants/colors.dart';
import 'package:naturally/utils/constants/enums.dart';
import 'package:naturally/utils/constants/sizes.dart';
import 'package:naturally/utils/helpers/helpers_functions.dart';
import 'package:naturally/utils/validators/rounded_container.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key, required this.product });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercentage = controller.calulateSalePercentage(product.price, product.salePrice);

    return Container(
        width: 310,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: dark ? TColors.darkGrey : TColors.softGrey,
        ),
        child: Row(
          children: [
            // Thumbnail
            TRoundedContainer(
              height: 120,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  // --Thumbnail Image
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: TRoundedImage(imageUrl: product.thumbnail, applyImageRadius: true, isNetworkImage: true),
                  ),

                   // Sale tag
                  if (salePercentage != null)
                  Positioned (
                    top: 12,
                      child:TRoundedContainer(
                        radius: TSizes.sm,
                        backgroundColor: TColors.secondary.withOpacity (0.8),
                        padding: const EdgeInsets.symmetric (horizontal: TSizes.sm, vertical: TSizes.xs),
                        child: Text('$salePercentage%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black)),
                      ), 
                    ),
    
                  // Favourite icon button
                  Positioned(
                    top: 0,
                    right: 0,
                    child: TFavouriteIcon(productId: product.id),
                  ),
                ],
              ),
            ),
            // Details
            SizedBox(
              width: 172,
              child: Padding(
                padding: const EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TProductTitleText(title: product.title, smallSize: true),
                        const SizedBox(height: TSizes.spaceBtwItems / 2),
                        TBrandTitleWithVerifiedIcon(title: product.brand!.name),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Price
                        Flexible(
                          child: Column (
                            children: [
                              if (product.productType == ProductType.single.toString() && product.salePrice > 0)
                              Padding(
                                padding: const EdgeInsets.only(left: TSizes.sm),
                                child: Text(
                                  product.price.toString(),
                                  style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),
                                ),
                              ), 

                              /// Price, Show sale price os main price if sale exist.
                              Padding (
                                padding: const EdgeInsets.only(left: TSizes.sm),
                                child: TProductPriceText(price: controller.getProductPrice (product)),
                              ), 
                            ],
                          ),
                        ),

                        // Add to cart
                        Container(
                          decoration: const BoxDecoration(
                            color: TColors.dark,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(TSizes.cardRadiusMd),
                              bottomRight: Radius.circular(TSizes.productImageRadius),
                            )
                          ),
                          child: const SizedBox(
                            width: TSizes.iconLg * 1.2,
                            height: TSizes.iconLg * 1.2,
                            child: Center(child: Icon(Iconsax.add, color: TColors.white)),
                          ),  
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
    );
  }
}