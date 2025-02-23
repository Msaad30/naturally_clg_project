import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naturally/common/shimmer_effect/shimmer.dart';
import 'package:naturally/common/widgets/brands/brand_card.dart';
import 'package:naturally/features/shop/models/product/brand_model.dart';
import 'package:naturally/features/shop/screens/brand/brand_products.dart';
import 'package:naturally/utils/constants/colors.dart';
import 'package:naturally/utils/constants/sizes.dart';
import 'package:naturally/utils/helpers/helpers_functions.dart';
import 'package:naturally/utils/validators/rounded_container.dart';

class TBrandShowCase extends StatelessWidget {
  const TBrandShowCase({
    super.key,
    required this.images,
    required this.brand,
  });

  final BrandModel brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProducts(brand: brand)),
      child: TRoundedContainer(
                      showBorder: true,
                      borderColor: TColors.darkGrey,
                      backgroundColor: Colors.transparent,
                      padding: const EdgeInsets.all(TSizes.md),
                      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
                      child: Column(
                        children: [
                          // Brand with Products Count
                          TBrandCard(showBorder: false, brand: brand),
                          const SizedBox(height: TSizes.spaceBtwItems),
                          // Brand Top 3 Product Images
                          Row(
                            children: images.map((image) => brandTopProductImageWidget(image, context)).toList(),
                          )
                        ],
                      ),
                    ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
                              child: TRoundedContainer(
                                height: 100,
                                backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
                                margin: const EdgeInsets.only(right: TSizes.sm),
                                padding: const EdgeInsets.all(TSizes.md),
                                child: CachedNetworkImage(
                                  fit: BoxFit.contain,
                                  imageUrl: image,
                                  progressIndicatorBuilder: (context, url, downloadProgress) => const TShimmerEffect(width: 100, height: 100),
                                  errorWidget: (context, url, error) => const Icon(Icons.error),
                                ),
                              ),
                            );
  }
}