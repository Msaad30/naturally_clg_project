import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naturally/common/widgets/appBar/appBar.dart';
import 'package:naturally/common/widgets/products/cart/cart_items_file.dart';
import 'package:naturally/common/widgets/products/cart/coupon_widget.dart';
import 'package:naturally/features/shop/controllers/product/cart_controller.dart';
import 'package:naturally/features/shop/controllers/product/order_controller.dart';
import 'package:naturally/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:naturally/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:naturally/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:naturally/utils/constants/colors.dart';
import 'package:naturally/utils/constants/sizes.dart';
import 'package:naturally/utils/helpers/helpers_functions.dart';
import 'package:naturally/utils/helpers/pricing_calculator.dart';
import 'package:naturally/utils/popups/loaders.dart';
import 'package:naturally/utils/validators/rounded_container.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    final dark = THelperFunctions.isDarkMode(context);
    final orderController = Get.put(OrderController());
    final totalAmount = TPricingCalculator.calculateTotalPrice(subTotal, 'India');
    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text('Order Review', style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // --Items in cart
              const TCartItems(showAddRemoveButtons: false),
              const SizedBox(height: TSizes.spaceBtwSections),

              // --Coupon TextField
              const TCouponCode(),
              const SizedBox(height: TSizes.spaceBtwSections),

              // --Billing Section
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: const Column(
                  children: [
                    // --Pricing
                    TBillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    // --Divider
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems),
                    
                    // --Payment Methods
                    TBillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    // -- Address
                    TBillingAddressSection()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),  
      // Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
        onPressed: subTotal > 0 
          ? () => orderController.processOrder(totalAmount)
          : () => TLoaders.warningSnackBar(title: 'Empty cart', message: 'Add items in the cart in order to proceed'),
          // onPressed: () => Get.to(
          //   () => SuccessScreen(
          //     image: TImages.successfulPaymentIcon,
          //     title: 'Payment Success!',
          //     subTitle: 'Your item will be shipped soon!',
          //     onPressed: () => Get.offAll(() => const NavigationMenu()),
          //   )
          // ), 
        child: Text('Checkout Rs.$totalAmount')),
      ),  
    );
  }
}


