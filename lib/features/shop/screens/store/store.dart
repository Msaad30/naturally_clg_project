// import 'package:flutter/material.dart';
// import 'package:naturally/common/widgets/appBar/appBar.dart';
// import 'package:naturally/common/widgets/appBar/tabbar.dart';
// import 'package:naturally/common/widgets/brands/brand_card.dart';
// import 'package:naturally/common/widgets/custom_shapes/containers/search_container.dart';
// import 'package:naturally/common/widgets/layout/grid_layout.dart';
// import 'package:naturally/common/widgets/products/cart/cart_menu_icon.dart';
// import 'package:naturally/common/widgets/texts/section_heading.dart';
// import 'package:naturally/features/shop/screens/store/widgets/category_tab.dart';
// import 'package:naturally/utils/constants/colors.dart';
// import 'package:naturally/utils/constants/sizes.dart';
// import 'package:naturally/utils/helpers/helpers_functions.dart';

// class StoreScreen extends StatelessWidget {
//   const StoreScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 6,
//       child: Scaffold(
//         appBar: TAppBar(
//           title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
//           actions: [
//             TCartCounterIcon(onPressed: (){}),
//           ],
//         ),
//         body: NestedScrollView(headerSliverBuilder: (_, innerBoxIsScrolled) {
//           return [
//             SliverAppBar(
//               automaticallyImplyLeading: false,
//               pinned: true,
//               floating: true,
//               backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,
//               expandedHeight: 440,
    
//               flexibleSpace: Padding(
//                 padding: const EdgeInsets.all(TSizes.defaultSpace),
//                 child: ListView(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   children: [
//                     // --Search Bar
//                     const SizedBox(height: TSizes.spaceBtwItems),
//                     const TSearchContainer(text: 'Search in Store', showBorder: true, showBackground: false, padding: EdgeInsets.zero),
//                     const SizedBox(height: TSizes.spaceBtwSections),
    
//                     //-- Featured Brands
//                     TSectionHeading(title: 'Featured Brands', onPressed: () {}),
//                     const SizedBox(height: TSizes.spaceBtwSections / 1.5),
    
    
//                     TGridLayout(itemCount: 4, mainAxisExtent: 80, itemBuilder: (_, index) {
//                       return const TBrandCard(showBorder: false);
//                     }),
//                   ],
//                 ),
//               ),
//               // Tabs
//               bottom: const TTabBar(
//                 tabs:[
//                 Tab(child: Text('Vegetables')),
//                 Tab(child: Text('Fruits')),
//                 Tab(child: Text('Sereals')),
//                 Tab(child: Text('Pulses')),
//                 Tab(child: Text('Milk')),
//                 Tab(child: Text('Honey')),
//               ],
//               ),
//             ),
//           ];
//         }, 
//         body: const TabBarView(
//           children: [TCategoryTab(), TCategoryTab(), TCategoryTab(), TCategoryTab(), TCategoryTab(), TCategoryTab()],
//         )
//         ),
//       ),
//     );
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:naturally/common/widgets/appBar/appBar.dart';
// import 'package:naturally/common/widgets/appBar/tabbar.dart';
// import 'package:naturally/common/widgets/brands/brand_card.dart';
// import 'package:naturally/common/widgets/custom_shapes/containers/search_container.dart';
// import 'package:naturally/common/widgets/layout/grid_layout.dart';
// import 'package:naturally/common/widgets/products/cart/cart_menu_icon.dart';
// import 'package:naturally/common/widgets/texts/section_heading.dart';
// import 'package:naturally/features/shop/controllers/product/category_controller.dart';
// import 'package:naturally/features/shop/screens/store/widgets/category_tab.dart';
// import 'package:naturally/utils/constants/colors.dart';
// import 'package:naturally/utils/constants/sizes.dart';
// import 'package:naturally/utils/helpers/helpers_functions.dart';

// class StoreScreen extends StatelessWidget {
//   const StoreScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final categories = CategoryController.instance.featuredCategories;
//     return DefaultTabController(
//       length: categories.lengh,
//       child: Scaffold(
//         appBar: TAppBar(
//           title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
//           actions: [
//             TCartCounterIcon(onPressed: (){}),
//           ],
//         ),
//         body: NestedScrollView(headerSliverBuilder: (_, innerBoxIsScrolled) {
//           return [
//             SliverAppBar(
//               automaticallyImplyLeading: false,
//               pinned: true,
//               floating: true,
//               backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,
//               expandedHeight: 440,
    
//               flexibleSpace: Padding(
//                 padding: const EdgeInsets.all(TSizes.defaultSpace),
//                 child: ListView(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   children: [
//                     // --Search Bar
//                     const SizedBox(height: TSizes.spaceBtwItems),
//                     const TSearchContainer(text: 'Search in Store', showBorder: true, showBackground: false, padding: EdgeInsets.zero),
//                     const SizedBox(height: TSizes.spaceBtwSections),
    
//                     //-- Featured Brands
//                     TSectionHeading(title: 'Featured Brands', onPressed: () {}),
//                     const SizedBox(height: TSizes.spaceBtwSections / 1.5),
    
    
//                     TGridLayout(itemCount: 4, mainAxisExtent: 80, itemBuilder: (_, index) {
//                       return const TBrandCard(showBorder: false);
//                     }),
//                   ],
//                 ),
//               ),
//               // Tabs
//               bottom: const TTabBar(
//                // tabs: categories.map((category) => Tab(child: Text(category.name))).toList());
//                 tabs: [
//                 Tab(child: Text('Vegetables')),
//                 Tab(child: Text('Fruits')),
//                 Tab(child: Text('Sereals')),
//                 Tab(child: Text('Pulses')),
//                 Tab(child: Text('Milk')),
//                 Tab(child: Text('Honey')),
//               ],
//               ),
//             ),
//           ];
//         }, 
//         body: const TabBarView(
//           //children: categories.map((category) => TCategoryTab(Category:Category)).toList()
//           children: [TCategoryTab(), TCategoryTab(), TCategoryTab(), TCategoryTab(), TCategoryTab(), TCategoryTab()],
//         )
//         ),
//       ),
//     );
//   }
// }


// ronya
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naturally/common/shimmers/brands_shimmer.dart';
import 'package:naturally/common/widgets/appBar/appBar.dart';
import 'package:naturally/common/widgets/appBar/tabbar.dart';
import 'package:naturally/common/widgets/brands/brand_card.dart';
import 'package:naturally/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:naturally/common/widgets/layout/grid_layout.dart';
import 'package:naturally/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:naturally/common/widgets/texts/section_heading.dart';
import 'package:naturally/features/shop/controllers/product/brand_controller.dart';
import 'package:naturally/features/shop/controllers/product/category_controller.dart';
import 'package:naturally/features/shop/screens/brand/all_brands.dart';
import 'package:naturally/features/shop/screens/brand/brand_products.dart';
import 'package:naturally/features/shop/screens/store/widgets/category_tab.dart';
import 'package:naturally/utils/constants/colors.dart';
import 'package:naturally/utils/constants/sizes.dart';
import 'package:naturally/utils/helpers/helpers_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;
    final brandController = Get.put(BrandController());
    
    //final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.lenght,
      child: Scaffold(
        appBar: TAppBar(
          title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: const [
            TCartCounterIcon(),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,
              expandedHeight: 440,
    
              flexibleSpace: Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    // --Search Bar
                    const SizedBox(height: TSizes.spaceBtwItems),
                    const TSearchContainer(text: 'Search in Store', showBorder: true, showBackground: false, padding: EdgeInsets.zero),
                    const SizedBox(height: TSizes.spaceBtwSections),
    
                    //-- Featured Brands
                    TSectionHeading(title: 'Featured Brands', onPressed: () => Get.to(() => const AllBrandScreen())),
                    const SizedBox(height: TSizes.spaceBtwSections / 1.5),   
    
                    Obx(
                      (){
                        if(brandController.isLoading.value) return const TBrandsShimmer();
                        if (brandController.featuredBrands.isEmpty){
                          return Center(
                            child: Text('No Data Found!',style: Theme.of (context).textTheme.bodyMedium!.apply(color: Colors.white))
                          ); //center
                        }
                        return TGridLayout(
                          itemCount: brandController.featuredBrands.length,
                          mainAxisExtent: 80,
                           itemBuilder: (_, index) {
                            final brand = brandController.featuredBrands[index];
                        return TBrandCard(showBorder: true, brand: brand, onTap: () => Get.to(() => BrandProducts(brand: brand)));
                      }
                    );
                  },
                ),
              ],
            ),
          ),
              // Tabs
              bottom: TTabBar(
                tabs: categories.map((category) => Tab(child: Text(category.name))).toList()),
            ),
          ];
        },
               
        body: TabBarView(
          children: categories.map((category) => TCategoryTab(category: category)).toList()),
          ),
        ),
      );
  }
}
