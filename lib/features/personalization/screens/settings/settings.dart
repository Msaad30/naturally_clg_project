import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:naturally/common/widgets/appBar/appBar.dart';
import 'package:naturally/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:naturally/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:naturally/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:naturally/common/widgets/texts/section_heading.dart';
import 'package:naturally/features/personalization/screens/address/address.dart';
import 'package:naturally/features/personalization/screens/profile/profile.dart';
import 'package:naturally/features/shop/screens/order/order.dart';
import 'package:naturally/utils/constants/colors.dart';
import 'package:naturally/utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  // Appbar
                  TAppBar(title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color:TColors.white))),

                  // User Profile Card 
                  TUserProfileTitle(onPressed: () => Get.to(() => const ProfileScreen())),
                 const SizedBox(height: TSizes.spaceBtwSections),
                ],
              )
            ),

            // --Body
            Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  // --Account Settings
                  TSectionHeading(title: 'Account Settings', showActiononButton: false),
                  SizedBox(height: TSizes.spaceBtwItems),

                  TSettingsMenuTile(icon: Iconsax.safe_home, title: 'My Addresses', subTitle: 'Set shopping delivery address', onTap: () => Get.to(() => const UserAddressScreen()),),
                  TSettingsMenuTile(icon: Iconsax.shopping_cart, title: 'My Cart', subTitle: 'Add, remove products and move to checkout'),
                  TSettingsMenuTile(icon: Iconsax.bag_tick, title: 'My Orders', subTitle: 'In-progress and Completed Orders', onTap: () => Get.to(() => const OrderScreen()),),
                  const TSettingsMenuTile(icon: Iconsax.bank, title: 'My Account', subTitle: 'Withdraw balance to registrered bank account'),
                  TSettingsMenuTile(icon: Iconsax.discount_shape, title: 'My Coupons', subTitle: 'List of all the discounted coupons'),
                  TSettingsMenuTile(icon: Iconsax.notification, title: 'Notification', subTitle: 'Set any kind of notification message'),
                  TSettingsMenuTile(icon: Iconsax.security_card, title: 'Account Privacy', subTitle: 'Manage data usage and connected accounts'),

                  // --App Settings
                  SizedBox(height: TSizes.spaceBtwSections),
                  TSectionHeading(title: 'App Settings', showActiononButton: false),
                  SizedBox(height: TSizes.spaceBtwItems),

                  TSettingsMenuTile(icon: Iconsax.document_upload, title: 'Load Data', subTitle: 'Upload Data to your Cloud Firebase'),
                  TSettingsMenuTile(
                    icon: Iconsax.location, 
                    title: 'Geolocation', 
                    subTitle: 'Set recommendation based on location',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                    TSettingsMenuTile(
                    icon: Iconsax.location, 
                    title: 'Safe Mode', 
                    subTitle: 'Search result is safe for all ages',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                    TSettingsMenuTile(
                    icon: Iconsax.location, 
                    title: 'HD Image Quality', 
                    subTitle: 'Set image quality to be seen',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),

                  // --Logout Button
                  const SizedBox(height: TSizes.spaceBtwItems),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(onPressed: (){}, child: const Text('Logout')),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems * 2.5),
                ],                                            
              ),
            ),
          ],
        ),
      ),
    );
  }
}