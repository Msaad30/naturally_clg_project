import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naturally/common/widgets/texts/section_heading.dart';
import 'package:naturally/features/shop/models/product/payment_method_model.dart';
import 'package:naturally/features/shop/payments/payment_tile.dart';
import 'package:naturally/utils/constants/image_strings.dart';
import 'package:naturally/utils/constants/sizes.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod = PaymentMethodModel.empty().obs;


    @override
    void onInit() {
      selectedPaymentMethod.value = PaymentMethodModel(name: 'Paypal', image: TImages.paypal);
      super.onInit();
    }

    Future<dynamic> selectPaymentMethod(BuildContext context) {

      return showModalBottomSheet(
        context: context,
        builder: (_) => SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(TSizes.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TSectionHeading(title: 'Select Payment Method', showActiononButton: false),
                const SizedBox(height: TSizes.spaceBtwSections),
                TPaymentTile(paymentMethod: PaymentMethodModel(name:'Paypal',image: TImages.paypal)),
                const SizedBox(height: TSizes.spaceBtwItems/2),
                TPaymentTile(paymentMethod: PaymentMethodModel(name:'Google Pay', image: TImages.googlePay)),
                const SizedBox(height: TSizes.spaceBtwItems/2),
                TPaymentTile(paymentMethod: PaymentMethodModel(name:'Apple Pay', image: TImages.applePay)),
                const SizedBox(height: TSizes.spaceBtwItems/2),
                TPaymentTile(paymentMethod: PaymentMethodModel(name:'VISA', image: TImages.visa)),
                const SizedBox(height: TSizes.spaceBtwItems/2),
                TPaymentTile(paymentMethod: PaymentMethodModel(name:'Master Card', image: TImages.masterCard)),
                const SizedBox(height: TSizes.spaceBtwItems/2),
                TPaymentTile(paymentMethod: PaymentMethodModel(name:'Paytm', image: TImages.paytm)),
                const SizedBox(height: TSizes.spaceBtwItems/2),
                TPaymentTile(paymentMethod: PaymentMethodModel(name:'Paystack', image: TImages.paystack)),
                const SizedBox(height: TSizes.spaceBtwItems/2),
                TPaymentTile(paymentMethod: PaymentMethodModel(name:'Credit Card', image: TImages.creditCard)),
                const SizedBox(height: TSizes.spaceBtwItems/2),
                const SizedBox(height: TSizes.spaceBtwSections),

              ]
            )

          ), // container
        ), // SingleChildScrollView
      );
    }
}