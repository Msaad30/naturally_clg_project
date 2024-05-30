import 'package:flutter/material.dart';
import 'package:naturally/common/widgets/texts/product_title_text.dart';
import 'package:naturally/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:naturally/features/shop/models/product/cart_item_model.dart';
import 'package:naturally/utils/constants/colors.dart';
import 'package:naturally/utils/constants/sizes.dart';
import 'package:naturally/utils/helpers/helpers_functions.dart';
import 'package:naturally/utils/validators/t_rounded_image.dart';

class TcartItem extends StatelessWidget {
  const TcartItem({
    super.key,
    required this.cartItem,
  });

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
                  children: [
                    // Image
                    TRoundedImage(
                      imageUrl: cartItem.image ?? '', 
                      width: 60,
                      height: 60,
                      isNetworkImage: true,
                      padding: const EdgeInsets.all(TSizes.sm),
                      backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
                    ),
                    const SizedBox(width: TSizes.spaceBtwItems),

                    // Title, price & Size
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TBrandTitleWithVerifiedIcon(title: cartItem.brandName ?? ''),
                          Flexible(child: TProductTitleText(title: cartItem.title, maxLines: 1)),
                    
                          // Attributes
                          Text.rich(
                            TextSpan(
                              children: (cartItem.selectedVariation ?? {})
                                .entries
                                .map(
                                  (e) => TextSpan(
                                    children: [
                                      TextSpan(text: '${e.key}', style: Theme.of(context).textTheme.bodySmall),
                                      TextSpan(text: '${e.value}', style: Theme.of(context).textTheme.bodyLarge),
                                    ],
                                  ),
                                )
                                .toList(),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
  }
}