import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naturally/common/shimmers/category_shimmer.dart';
import 'package:naturally/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:naturally/features/shop/controllers/product/category_controller.dart';
import 'package:naturally/features/shop/screens/sub_category/sub_categories.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    
    return Obx(() {
      if(categoryController.isLoading.value) return TCategoryShimmer();

      if(categoryController.featuredCategories.isEmpty){
        return Center(
          child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
      }
    
      return SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryController.featuredCategories.Length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = categoryController.featuredCategories[index];
            return TVerticalImageText(
              image: category.image,
              title: category.name,
              onTap: () => Get.to(() => SubCategoriesScreen(category: category)),
            );
          },
        ),
      );
    });
  }
}