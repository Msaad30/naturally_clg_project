import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naturally/common/styles/shadow.dart';
import 'package:naturally/common/widgets/products/product_cards/add_to_cart_button.dart';
import 'package:naturally/common/widgets/products/product_cards/favourite_icon.dart';
import 'package:naturally/common/widgets/texts/product_price_text.dart';
import 'package:naturally/common/widgets/texts/product_title_text.dart';
import 'package:naturally/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:naturally/features/shop/controllers/product/product_controller.dart';
import 'package:naturally/features/shop/models/product/product_model.dart';
import 'package:naturally/features/shop/screens/product_details/product_detail.dart';
import 'package:naturally/utils/constants/colors.dart';
import 'package:naturally/utils/constants/enums.dart';
import 'package:naturally/utils/constants/sizes.dart';
import 'package:naturally/utils/helpers/helpers_functions.dart';
import 'package:naturally/utils/validators/rounded_container.dart';
import 'package:naturally/utils/validators/t_rounded_image.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calulateSalePercentage(product.price, product.salePrice);
    final dark = THelperFunctions.isDarkMode(context);
    
    //container with side paddingns color edges radius and shadow
    return GestureDetector(
      onTap: () => Get.to(() =>  ProductDetailScreen(product: product)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
        boxShadow: [TShadowStyle.verticalProductShadow],
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: dark ? TColors.darkGrey : TColors.white,
        ),
        child: Column(
          children: [
            // Thumbnail ,wishlist button, Discount Tag
            TRoundedContainer(
              height: 180,
              width: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,   
              child: Stack(
                children: [
                  //Thumbnail Image
                  Center(child:TRoundedImage(imageUrl: product.thumbnail, applyImageRadius: true , isNetworkImage: true)), 
    
                  // Sale tag
                  if(salePercentage != null)
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
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
            const SizedBox(height: TSizes.spaceBtwItems / 2),

                  // --Details
                  Padding(
                    padding: const EdgeInsets.only(left: TSizes.sm),
                    // only reason to use sizedbox heere is to make column full width
                    child: SizedBox(
                      width: double.infinity,
                      child: 
                      Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TProductTitleText(title: product.title, smallSize: true),
                        const SizedBox(height: TSizes.spaceBtwItems / 2),
                        TBrandTitleWithVerifiedIcon(title: product.brand!.name),
                      ],
                     ), //column
                    ), //sizedbox
                  ), //padding
                        
                  //const TBrandTitleWithVerifiedIcon(title: 'Vegetable'),
                  const Spacer(),

                   //Price Row
                    Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                   //Price
                     Flexible(
                      child:  Column(
                       children:[
                        if (product.productType == ProductType.single.toString() && product.salePrice > 0)
                         Padding(
                         padding: const EdgeInsets.only(left: TSizes.sm),
                         child: Text(
                          product.price.toString(),
                          style: Theme.of(context).textTheme.labelMedium!.apply(decoration:TextDecoration.lineThrough),
                        ), // Text
                      ), //padding

                      // price show sale price as main price if sale exist
                        Padding(
                         padding: const EdgeInsets.only(left: TSizes.sm),
                          child: TProductPriceText(price: controller.getProductPrice(product)),
                        ), //padding
                       ],
                      ), //Column
                     ), // flexible

                                
                      // Add to Cart Button
                      ProductCardAddToCartButton(product: product),
                      ]
                    
                  )
          ]
        ),
      ),
    );
  }
}