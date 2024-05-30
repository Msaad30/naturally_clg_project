// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:naturally/data/repositories/product/product_repository.dart';
// import 'package:naturally/features/shop/models/product/product_model.dart';
// import 'package:naturally/utils/popups/loaders.dart';

// class ProductController extends GetxController {
//   static ProductController get instance => Get.find();

//   final isLoading = false.obs;
//   final productRepository = Get.put(ProductRepository());
//   RxList<ProductModel> featureProduct = <ProductModel>[];


//   @override
//   void onInit() {
//     fetchFeaturedProduct();
//     super.onInit();
//   }

//   void fetchFeaturedProduct() async {
//     try{
//       // Show loader while loading Products
//       isLoading.value = true;

//       // Fetched Products
//       final products = await productRepository.getFeaturedProducts();

//       // Assign Products
//       featureProduct.assignAll(products);

//     }catch(e){
//       TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
//     }finally{
//       isLoading.value = false;
//     }
//   }

//   // get product price  or price range for vatiations
//    String getProductPrice(ProductModel product){

//     double smallestPrice = double.infinity;
//     double largestPrice = 0.0;

//     // If no  variations exist,return the simple price or sale price
//     if(product.productType==ProductType.single.toString()){
//       return(product.salePrice > 0 ? product.salePrice : product.price).toString();
//     } else {
//       // calculate the smallest and largest prices among  variations
//       for(var variation in product.productVariations!){
//         // determine the peice to consider saleprice if available otherwise regular price
//         double priceToConsider = variation.salePrice > 0.0 ? variation.salePrice : variation.price;

//         //update smallest amd largest prices
//           if(priceToConsider < smallestPrice){
//             smallestPrice = priceToConsider;
//           }

//            if(priceToConsider < largestPrice){
//             largestPrice = priceToConsider;
//           }
//       }

//       // If smallest and largest prices ate the same return a single price
//       if(smallestPrice.isEqual(largestPrice)) {
//         return largestPrice.toString();
//       }else {
//         // otherwise return a price range
//         return '$smallestPrice - \Rs$largestPrice';
//       }
//     }
//    }

//   // -- Calculate discount percentage
//   String calulateSalePercentage(double originalPrice, double? salePrice) {
//     if(salePrice ==null || salePrice <= 0.0) return null;
//     if(originalPrice <= 0) return null;

//     double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
//     return percentage.toStringAsFixed(0);
//   }

//   // check product stock status
//   String getProductStockStatus(int stock) {
//     return stock > 0 ? 'In Stock' : 'Out of Stock';
    
//   }

// }



import 'package:get/get.dart';
import 'package:naturally/data/repositories/product/product_repository.dart';
import 'package:naturally/features/shop/models/product/product_model.dart';
import 'package:naturally/utils/constants/enums.dart';
import 'package:naturally/utils/popups/loaders.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featureProduct = <ProductModel>[].obs;


  @override
  void onInit() {
    fetchFeaturedProduct();
    super.onInit();
  }

  void fetchFeaturedProduct() async {
    try{
      // Show loader while loading Products
      isLoading.value = true;

      // Fetched Products
      final products = await productRepository.getFeaturedProduct();

      // Assign Products
      featureProduct.assignAll(products);

    }catch(e){
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }finally{
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      final products = await productRepository.getFeaturedProduct();
      return products;
      }catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
      }
    }

  // get product price  or price range for vatiations
   String getProductPrice(ProductModel product){

    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    // If no  variations exist,return the simple price or sale price
    if(product.productType == ProductType.single.toString()){
      return(product.salePrice > 0 ? product.salePrice : product.price).toString();
    } else {
      // calculate the smallest and largest prices among  variations
      for(var variation in product.productVariations!){
        // determine the peice to consider saleprice if available otherwise regular price
        double priceToConsider = variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        //update smallest amd largest prices
          if(priceToConsider < smallestPrice){
            smallestPrice = priceToConsider;
          }

           if(priceToConsider < largestPrice){
            largestPrice = priceToConsider;
          }
      }

      // If smallest and largest prices ate the same return a single price
      if(smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      }else {
        // otherwise return a price range
        return '$smallestPrice - \Rs$largestPrice';
      }
    }
   }

  // -- Calculate discount percentage
  String? calulateSalePercentage(double originalPrice, double? salePrice) {
    if(salePrice == null || salePrice <= 0.0) return null;
    if(originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  // check product stock status
  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
    
  }

}