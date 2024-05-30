// import 'package:flutter/material.dart';
// import 'package:naturally/common/widgets/images/t_circular_image.dart';
// import 'package:naturally/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
// import 'package:naturally/utils/constants/colors.dart';
// import 'package:naturally/utils/constants/enums.dart';
// import 'package:naturally/utils/constants/image_strings.dart';
// import 'package:naturally/utils/constants/sizes.dart';
// import 'package:naturally/utils/helpers/helpers_functions.dart';
// import 'package:naturally/utils/validators/rounded_container.dart';

// class TBrandCard extends StatelessWidget {
//   const TBrandCard({
//     super.key,
//     this.onTap,
//     required this.showBorder,
//   });

//   final bool showBorder;
//   final void Function()? onTap;

//   @override
//   Widget build(BuildContext context) {
//     final isDark = THelperFunctions.isDarkMode(context);
//     return GestureDetector(
//                       onTap: onTap,
//                       // Container Design
//                       child: TRoundedContainer(
//                         padding: const EdgeInsets.all(TSizes.sm),
//                         showBorder: showBorder,
//                         backgroundColor: Colors.transparent,
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             // Icon
//                             Flexible(
//                               child: TCircularImage(
//                                 isNetworkImage: false,
//                                 image: TImages.vegetableIcon,
//                                 backgroundColor: Colors.transparent,
//                                 overlayColor: isDark ? TColors.white : TColors.black,
//                               ),
//                             ),
//                             const SizedBox(width: TSizes.spaceBtwItems / 2),
                    
//                             // --Text
//                             Expanded(
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const TBrandTitleWithVerifiedIcon(title: 'Tomatoes', brandTextSize: TextSizes.large),
//                                   Text(
//                                     '256 products',
//                                     overflow: TextOverflow.ellipsis,
//                                     style: Theme.of(context).textTheme.labelMedium,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:naturally/common/widgets/images/t_circular_image.dart';
import 'package:naturally/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:naturally/features/shop/models/product/brand_model.dart';
import 'package:naturally/utils/constants/colors.dart';
import 'package:naturally/utils/constants/enums.dart';
import 'package:naturally/utils/constants/sizes.dart';
import 'package:naturally/utils/helpers/helpers_functions.dart';
import 'package:naturally/utils/validators/rounded_container.dart';

class TBrandCard extends StatelessWidget {
  TBrandCard({
    super.key,
    this.onTap,
    required this.showBorder,
    required this.brand,
  });

  final BrandModel brand;
  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
                      onTap: onTap,
                      // Container Design
                      child: TRoundedContainer(
                        padding: const EdgeInsets.all(TSizes.sm),
                        showBorder: showBorder,
                        backgroundColor: Colors.transparent,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Icon
                            Flexible(
                              child: TCircularImage(
                                isNetworkImage: true,
                                image: brand.image,
                                backgroundColor: Colors.transparent,
                                overlayColor: isDark ? TColors.white : TColors.black,
                              ),
                            ),
                            const SizedBox(width: TSizes.spaceBtwItems / 2),
                    
                            // --Text
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TBrandTitleWithVerifiedIcon(title: brand.name, brandTextSize: TextSizes.large),
                                  Text(
                                    '${brand.productsCount ?? 0} products', 
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.labelMedium,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
  }
}