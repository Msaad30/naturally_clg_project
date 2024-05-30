import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naturally/common/shimmer_effect/shimmer.dart';
import 'package:naturally/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:naturally/features/shop/controllers/banner_controller.dart';
import 'package:naturally/utils/constants/colors.dart';
import 'package:naturally/utils/constants/sizes.dart';
import 'package:naturally/utils/validators/t_rounded_image.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(
      () {
        if(controller.isLoading.value) return const TShimmerEffect(width: double.infinity, height: 190);

        if(controller.banners.isEmpty) {
          return const Center(child: Text('No data found'));
        } else {
                  return Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(viewportFraction: 1,onPageChanged: (index, _) => controller.updatePageIndicator(index)),
                      items: controller.banners.map((banner) => TRoundedImage(
                        imageUrl: banner.imageUrl, 
                        isNetworkImage: true, 
                        onPressed: () => Get.toNamed(banner.targetScreen))).toList(),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    Center(
                      child: Obx(
                        () => Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            for(int i = 0; i < controller.banners.length; i++)
                            TCircularContainer(
                              width: 20,
                              height: 4,
                              margin: const EdgeInsets.only(right: 10),
                              backgroundColor: controller.carouselCurrentIndex.value == i ? TColors.primary : TColors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
        }


      }
    );  
  }
}