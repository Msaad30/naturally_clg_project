import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naturally/common/shimmers/vertical_product_shimmer.dart';
import 'package:naturally/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:naturally/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:naturally/common/widgets/layout/grid_layout.dart';
import 'package:naturally/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:naturally/common/widgets/texts/section_heading.dart';
import 'package:naturally/features/shop/controllers/product/product_controller.dart';
import 'package:naturally/features/shop/screens/all_products/all_products.dart';
import 'package:naturally/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:naturally/features/shop/screens/home/widgets/home_categories.dart';
import 'package:naturally/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:naturally/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(  
          children: [
            // Header 
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  // Appbar
                THomeAppBar(),
                SizedBox(height: TSizes.spaceBtwSections),

                  //search bar
                 TSearchContainer(text: 'Search in Store'),
                 SizedBox(height: TSizes.spaceBtwSections),

                    //categories
                    Padding(
                      padding: EdgeInsets.only(left: TSizes.defaultSpace), 
                      child: Column(
                        children: [

                          // --Heading
                          TSectionHeading(title: 'Popular Categories', showActiononButton: false, textColor: Colors.white),
                          SizedBox(height: TSizes.spaceBtwItems),

                          //Categories
                          THomeCategories()
                        ],
                      ),
                    ),
                  SizedBox(height: TSizes.spaceBtwItems),
                ],
              ),
            ),
            // Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  // --Promo Slider
                  const TPromoSlider(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  //Heading
                  TSectionHeading(title: 'Popular Products', 
                  onPressed: () => Get.to(() => AllProducts(
                    title: 'Popular Products',
                    futureMethod: controller.fetchAllFeaturedProducts(),
                  ))),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  // Popular Products
                  Obx(() {
                    if(controller.isLoading.value) return const TVerticalProductShimmer();

                    if(controller.featureProduct.isEmpty){
                      return Center(child:Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium));
                    }
                    return TGridLayout(
                      itemCount: controller.featureProduct.length, 
                      itemBuilder: (_, index) =>  TProductCardVertical(product: controller.featureProduct[index]),
                    );
                  }) //Obx
                ],
              ), //column
            ), //padding
          ],
        ), //column
      ), //SingleChildView
    ); //Scaffold
  }
}
