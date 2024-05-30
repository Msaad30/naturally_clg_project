import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naturally/common/shimmers/vertical_product_shimmer.dart';
import 'package:naturally/common/widgets/appBar/appBar.dart';
import 'package:naturally/common/widgets/products/sortable/sortable_products.dart';
import 'package:naturally/utils/constants/sizes.dart';
import 'package:naturally/utils/helpers/cloud_helper_functions.dart';
import 'package:naturally/features/shop/controllers/product/all_products_controller.dart';

import '../../models/product/product_model.dart';

class AllProducts extends StatelessWidget {
  
  const AllProducts({super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod; 

  @override
  Widget build(BuildContext context) {
    //Intialize controller for managging product fetching
    final controller = Get.put(AllProductsController());
    return Scaffold(
      // Appbar
      appBar: TAppBar(title: Text(title), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder(
          future: futureMethod ?? controller.fetchProductsByQuery(query),
            builder: (context, snapshot) {              
                  // Check the state of the feature builder sanpshot
                  const loader = TVerticalProductShimmer();  
                  final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                  // Return appropriate widget based on snapshot state
                  if (widget != null) return widget;
                   // Products found
                   final products = snapshot.data!;
                  return TSortableProducts(products: products);
                }                   
          ),
        ),
      )
    );
  }
}


