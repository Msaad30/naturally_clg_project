import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naturally/common/shimmers/brands_shimmer.dart';
import 'package:naturally/common/widgets/appBar/appBar.dart';
import 'package:naturally/common/widgets/brands/brand_card.dart';
import 'package:naturally/common/widgets/layout/grid_layout.dart';
import 'package:naturally/common/widgets/texts/section_heading.dart';
import 'package:naturally/features/shop/screens/brand/brand_products.dart';
import 'package:naturally/utils/constants/sizes.dart';
import 'package:naturally/features/shop/controllers/product/brand_controller.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar: const TAppBar(title: Text('Brand'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Heading
              const TSectionHeading(title: 'Brands', showActiononButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Brands
               Obx(
                      (){
                        if(brandController.isLoading.value) return const TBrandsShimmer();
                        if (brandController.allBrands.isEmpty){
                          return Center(
                            child: Text('No Data Found!',style: Theme.of (context).textTheme.bodyMedium!.apply(color: Colors.white))
                          );//center  
                        }
                        return TGridLayout(
                          itemCount: brandController.allBrands.length,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index){
                          final brand = brandController.allBrands[index];
                          return TBrandCard(
                            showBorder: true, 
                            brand: brand,
                            onTap: () => Get.to(() => BrandProducts(brand: brand)),
                            );
                          }
                        );
                      },
                    ),
                  ],
                ),
          ),
        ),
      );
  }
}