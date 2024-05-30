import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:naturally/features/authentication/screens/onboarding/onboarding.dart';
import 'package:naturally/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:naturally/features/authentication/screens/signup/widgets/signup.dart';
import 'package:naturally/features/authentication/screens/signup/widgets/verify_email.dart';
import 'package:naturally/features/personalization/screens/address/address.dart';
import 'package:naturally/features/personalization/screens/settings/settings.dart';
import 'package:naturally/features/shop/screens/cart/cart.dart';
import 'package:naturally/features/shop/screens/checkout/checkout.dart';
import 'package:naturally/features/shop/screens/home/home.dart';
import 'package:naturally/features/shop/screens/order/order.dart';
import 'package:naturally/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:naturally/features/shop/screens/store/store.dart';
import 'package:naturally/features/shop/screens/wishlist/wishlist.dart';
import 'package:naturally/utils/routes/routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: TRoutes.home, page: () => const HomeScreen()),
    GetPage(name: TRoutes.store, page: () => const StoreScreen()),
    GetPage(name: TRoutes.favourite, page: () => const FavoriteScreen()),
    GetPage(name: TRoutes.settings, page: () => const SettingsScreen()),
    GetPage(name: TRoutes.productReview, page: () => const ProductReviewsScreen()),
    GetPage(name: TRoutes.order, page: () => const OrderScreen()),
    GetPage(name: TRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: TRoutes.cart, page: () => const CartScreen()),
  //  GetPage(name: TRoutes.userProfile, page: () => UserProfileScreen()),
    GetPage(name: TRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: TRoutes.signup, page: () => const SignUpScreen()),
    GetPage(name: TRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: TRoutes.forgotPassword, page: () => const ForgetPassword()),
    GetPage(name: TRoutes.onBoarding, page: () => const OnBoardingScreen()),
    //Add more GetPage entries as needed
  ];
}