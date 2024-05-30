import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naturally/common/widgets/success_screen/success_screen.dart';
import 'package:naturally/data/repositories/authentication/authentication_repository.dart';
import 'package:naturally/features/personalization/controllers/address_controller.dart';
import 'package:naturally/features/shop/controllers/product/cart_controller.dart';
import 'package:naturally/features/shop/controllers/product/checkout_controller.dart';
import 'package:naturally/features/shop/models/product/order_model.dart';
import 'package:naturally/features/shop/payments/order_repository.dart';
import 'package:naturally/utils/constants/enums.dart';
import 'package:naturally/utils/constants/image_strings.dart';
import 'package:naturally/utils/navigation_menu.dart';
import 'package:naturally/utils/popups/full_screen_loader.dart';
import 'package:naturally/utils/popups/loaders.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  /// Variables
  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  /// Fetch user's order history
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      TLoaders.warningSnackBar(title: 'oh snap!' , message: e.toString());
      return [];
    }
  }
  
 /// Add methods for order processing
  void processOrder(double totalAmount) async {
    try{
      // Start Loader
      TFullScreenLoader.openLoadingDialog('Processing your order', TImages.emptyAnimation);

      // Get user authentication Id
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) return;

      // Add Details
      final order = OrderModel(
        // Generate a unique ID for the order
        id: UniqueKey().toString(),
        userId: userId,
        status: OrderStatus.pending,
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,
        // set Date as needed
        deliveryDate: DateTime.now(),
        items: cartController.cartItems.toList(),

      );// OrderModel
      // Save the order to Firestore
      await orderRepository.saveOrder(order, userId);

      //Update the cart status
      cartController.clearCart();  

      //Show Success screen 
      Get.off(() => SuccessScreen(
        image: TImages.successfullyRegistrationAnimation,
        title: 'Payment Success!',
        subTitle: 'Your item will be Shipped soon!',
        onPressed: () => Get.offAll(() => const NavigationMenu()),
      ));
    } catch (e) {
      TLoaders.errorSnackBar(title: 'oh snap', message: e.toString());
    }
  } 
}