import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:naturally/common/widgets/layout/grid_layout.dart';
import 'package:naturally/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:naturally/features/shop/models/product/product_model.dart';
import 'package:naturally/features/shop/controllers/product/all_products_controller.dart';
import 'package:naturally/utils/constants/sizes.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key, required this.products
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    // Initialize Controller
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(
      children: [
        // Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          value: controller.selectedSortoption.value,
          onChanged: (value) {
            controller.sortProducts(value!);
          },         
          items: ['Name', 'Higher Price', 'Lower Price', 'Sale', 'Newest', 'Popularity']
            .map((option) => DropdownMenuItem(value: option, child: Text(option))).toList(), 
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
        // Products
        Obx(()=> TGridLayout(itemCount: controller.products.length, 
        itemBuilder: (_, index) => TProductCardVertical(product: controller.products[index]))), 
      ],
    );
  }
}