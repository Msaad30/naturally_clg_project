import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:naturally/common/widgets/loaders/animation_loader.dart';
import 'package:naturally/features/shop/controllers/product/order_controller.dart';
import 'package:naturally/utils/constants/colors.dart';
import 'package:naturally/utils/constants/image_strings.dart';
import 'package:naturally/utils/constants/sizes.dart';
import 'package:naturally/utils/helpers/cloud_helper_functions.dart';
import 'package:naturally/utils/helpers/helpers_functions.dart';
import 'package:naturally/utils/navigation_menu.dart';
import 'package:naturally/utils/validators/rounded_container.dart';

class TOrderListItems extends StatelessWidget{
  const TOrderListItems({super.key});

@override
Widget build(BuildContext context){
  final controller = Get.put(OrderController());
  final dark = THelperFunctions.isDarkMode(context);
  return FutureBuilder(
    future: controller.fetchUserOrders(),
    builder: (_, snapshot) {
      final emptyWidget = TAnimationLoaderWidget(
        text: "Whoops! No orders Yet!", 
        animation: TImages.successfullyRegistrationAnimation,
        showAction: true,
        actionText: 'Lets fill it',
        onActionPressed: () => Get.off(() => const NavigationMenu()), 
      );

      final response = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, nothingFound: emptyWidget);
      if(response != null) return response;

      final orders = snapshot.data!;

      return ListView.separated(
        shrinkWrap: true,
        itemCount: orders.length,
        separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwItems),
        itemBuilder: (_, index) {
          final order = orders[index];
          return TRoundedContainer(
          showBorder: true,
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.dark : TColors.light,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // --Row 1
              Row(
                children: [
                  // Icon
                  const Icon(Iconsax.ship),
                  const SizedBox(width: TSizes.spaceBtwItems / 2),
      
                  // Status & Date
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.orderStatusText,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.primary, fontWeightDelta: 1),
                        ),
                        Text(order.formattedOrderDate, style: Theme.of(context).textTheme.headlineSmall),
                      ],
                    ),
                  ),
      
                  // --Icon
                  IconButton(onPressed: () {}, icon: const Icon(Iconsax.arrow_right_34, size: TSizes.iconSm)),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
      
              // Row 2
              Row(
                children: [ 
                  Expanded(
                    child: Row(
                      children: [
                  
                        // Icon
                        const Icon(Iconsax.tag),
                        const SizedBox(width: TSizes.spaceBtwItems / 2),
                  
                        // Status & Date
                        Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Order', 
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.labelMedium
                              ), 
                              Text(
                                order.id, 
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.titleMedium
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                  
                        // Icon
                        const Icon(Iconsax.calendar),
                        const SizedBox(width: TSizes.spaceBtwItems / 2),
                  
                        // Status & Date
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Shipping Date', 
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.labelMedium
                              ), 
                              Text(
                                order.formattedDeliveryDate, 
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.titleMedium
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
        }
      );
    }
  );
}
}