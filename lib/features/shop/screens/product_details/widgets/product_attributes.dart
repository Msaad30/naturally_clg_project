// import 'package:flutter/material.dart';
// import 'package:naturally/common/widgets/chips/choice_chip.dart';
// import 'package:naturally/common/widgets/texts/product_price_text.dart';
// import 'package:naturally/common/widgets/texts/product_title_text.dart';
// import 'package:naturally/common/widgets/texts/section_heading.dart';
// import 'package:naturally/utils/constants/colors.dart';
// import 'package:naturally/utils/constants/sizes.dart';
// import 'package:naturally/utils/helpers/helpers_functions.dart';
// import 'package:naturally/utils/validators/rounded_container.dart';

// class TProductAttributes extends StatelessWidget {
//   const TProductAttributes({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final dark = THelperFunctions.isDarkMode(context);
//     return Column(
//       children: [
//         // selected Attribute pricing & descripation
//         TRoundedContainer(
//           padding: const EdgeInsets.all(TSizes.md),
//           backgroundColor: dark ? TColors.darkGrey: TColors.grey,
//           child: Column(
//             children: [
//               // Title, price and stock status
//               Row(
//                 children: [
//                   const TSectionHeading(title: 'Variation', showActiononButton: false,),
//                   const SizedBox(width: TSizes.spaceBtwItems),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           const TProductTitleText(title: 'Price:', smallSize: true),
//                           // Actual Price
//                           Text(
//                             '\Rs.25',
//                             style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),
//                           ),
//                           const SizedBox(width: TSizes.spaceBtwItems),

//                           // Sale Price
//                           const TProductPriceText(price: '20'),
//                         ],
//                       ),

//                       // stock
//                       Row(
//                         children: [
//                           const TProductTitleText(title: 'stock ', smallSize: true),
//                           Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
//                         ],
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//               // Variation Description
//               const TProductTitleText(
//                 title: 'Fresh organic tomatoes.',
//                 smallSize: true,
//                 maxLines: 4,
//               )
//             ],
//           ),
//         ),
//         const SizedBox(width: TSizes.spaceBtwItems),

//         // Attributes
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const TSectionHeading(title: 'Colors', showActiononButton: false),
//             const SizedBox(width: TSizes.spaceBtwItems / 2),
//             Wrap(
//               spacing: 8,
//               children: [
//                 TChoiceChip(text: 'Green', selected: false, onSelected: (value) {}),
//                 TChoiceChip(text: 'Red', selected: true, onSelected: (value) {}),
//               ],
//             )
//           ],
//         ),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const TSectionHeading(title: 'Quantity'),
//             const SizedBox(width: TSizes.spaceBtwItems / 2),
//             Wrap(
//               spacing: 5,
//               children: [
//               TChoiceChip(text: '250 gm', selected: true, onSelected: (value) {}),
//               TChoiceChip(text: '500 gm', selected: false, onSelected: (value) {}),
//               TChoiceChip(text: '750 gm', selected: false, onSelected: (value) {}),
//               TChoiceChip(text: '1 Kg', selected: false, onSelected: (value) {}),
//               ],
//             )
//           ],
//         )
//       ],
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naturally/common/widgets/chips/choice_chip.dart';
import 'package:naturally/common/widgets/texts/product_price_text.dart';
import 'package:naturally/common/widgets/texts/product_title_text.dart';
import 'package:naturally/common/widgets/texts/section_heading.dart';
import 'package:naturally/features/shop/controllers/product/variation_controller.dart';
import 'package:naturally/features/shop/models/product/product_model.dart';
import 'package:naturally/utils/constants/colors.dart';
import 'package:naturally/utils/constants/sizes.dart';
import 'package:naturally/utils/helpers/helpers_functions.dart';
import 'package:naturally/utils/validators/rounded_container.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final dark = THelperFunctions.isDarkMode(context);


    return Obx(
      () => Column(
      children: [
        // selected Attribute pricing & descripation
        // Display variation price and stock when some variation is selected
        if(controller.selectedVariation.value.id.isNotEmpty)
        TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkGrey: TColors.grey,
          child: Column(
            children: [
              // Title, price and stock status
              Row(
                children: [
                  const TSectionHeading(title: 'Variation', showActiononButton: false,),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const TProductTitleText(title: 'Price:', smallSize: true),
                          // Actual Price
                          if (controller.selectedVariation.value.salePrice > 0)
                          Text(
                            '\Rs.${controller.selectedVariation.value.price}',
                            style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: TSizes.spaceBtwItems),

                          // Sale Price
                          TProductPriceText(price: controller.getVariationPrice()),
                        ],
                      ),

                      // stock
                      Row(
                        children: [
                          const TProductTitleText(title: 'stock ', smallSize: true),
                          Text(controller.variationStockStatus.value, style: Theme.of(context).textTheme.titleMedium),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              // Variation Description
              TProductTitleText(
                title: controller.selectedVariation.value.description ?? '',
                smallSize: true,
                maxLines: 4,
              )
            ],
          ),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),

        // Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: product.productAttributes!.map((attribute) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TSectionHeading(title: attribute.name ?? '' , showActiononButton: false),
            const SizedBox(width: TSizes.spaceBtwItems / 2),
           Obx(
            () =>  Wrap(
              spacing: 8,
              children: attribute.values!.map((attributeValue) {
                final isSelected = controller.selectedAttributes[attribute.name] == attributeValue;
                final available = controller
                  .getAttributesAvailabilityInVariation(product.productVariations!, attribute.name!)
                  .contains(attributeValue);
                  return TChoiceChip(
                    text: attributeValue,
                     selected: isSelected, 
                     onSelected: available
                      ? (selected){
                          if(selected && available) {
                            controller.onAttributeSelected(product, attribute.name ?? '', attributeValue);
                          }
                       }
                      : null);
              }).toList() ) //wrap
           )
          ],
        )).toList(),  //column
        ),   //column
       
        
      ],
    ),  //column
    );
  }
}

