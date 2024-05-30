import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:naturally/features/shop/models/product/product_model.dart';
import 'package:naturally/utils/exceptions/firebase_exceptions.dart';
import 'package:naturally/utils/exceptions/platform_exceptions.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  //Firestore instsance for database interaction
  final _db = FirebaseFirestore.instance;


  // Get limited featured product
  Future<List<ProductModel>>getFeaturedProduct() async{
    try{
      final snapshot = await _db.collection('Product').where('IsFeatured', isEqualTo: true).limit(4).get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();

    }on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    }on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }catch(e) {
      throw 'Something went wrong Please try again';
    }
  }

  Future<List<ProductModel>>fetchProductsByQuery(Query query) async{
    try{
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs.map((doc) => ProductModel.fromQuerySnapshot(doc)).toList();
      return productList;
    }on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    }on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }catch(e) {
      throw 'Something went wrong Please try again';
    }
  }
  
  // Get limited featured product
  Future<List<ProductModel>>getAllFeaturedProduct({required String brandId, int limit = -1}) async{
    try{
      final snapshot = await _db.collection('Product').where('IsFeatured', isEqualTo: true).limit(4).get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    }on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    }on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }catch(e) {
      throw 'Something went wrong Please try again';
    }
  }

  Future<List<ProductModel>>getFavouriteProducts(List<String> productIds) async{
    try{
      final snapshot = await _db.collection('Products').where(FieldPath.documentId, whereIn: productIds).get();
      return snapshot.docs.map((querySnapshot) => ProductModel.fromSnapshot(querySnapshot)).toList();
    }on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    }on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }catch(e) {
      throw 'Something went wrong Please try again';
    }
  }

   Future<List<ProductModel>>getProductsForBrand({required String brandId, int limit = -1}) async{
    try{
      final QuerySnapshot = limit == -1 
      ? await _db.collection('Products').where('Brand.Id', isEqualTo: brandId).get()
      : await _db.collection('Products').where('Brand.Id', isEqualTo: brandId).limit(limit).get();

      final products = QuerySnapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
      return products;
    }on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    }on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }catch(e) {
      throw 'Something went wrong Please try again';
    }
  }

  Future<List<ProductModel>> getProductsForCategory({required String categoryId, int limit = -1}) async{
    try{
      QuerySnapshot productCategoryQuery = limit == -1 
      ? await _db.collection('ProductCategory').where('categoryId', isEqualTo: categoryId).get()
      : await _db.collection('ProductCategory').where('categoryId', isEqualTo: categoryId).limit(limit).get();

      List<String> productIds = productCategoryQuery.docs.map((doc) => doc['productId'] as String).toList();
      final productsQuery = await _db.collection('Products').where(FieldPath.documentId, whereIn: productIds).get();
      List<ProductModel> products = productsQuery.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
      return products;
    }on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    }on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }catch(e) {
      throw 'Something went wrong Please try again';
    }
  }
 
  // // Get limited featured product
  // Future<List<ProductModel>>getAllFeaturedForBrand({required String brandId, int limit =-1}) async{
  //   try{
  //     final querySnapshot =limit == -1 ? await _db.collection('products').where('Brand.Id', isEqualTo:brand) :
  //     final snapshot = await _db.collection('Product').where('IsFeatured', isEqualTo: true).limit(4).get();
  //     return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
  //   }on FirebaseException catch (e) {
  //     throw TFirebaseException(e.code).message;
  //   }on PlatformException catch (e) {
  //     throw TPlatformException(e.code).message;
  //   }catch(e) {
  //     throw 'Something went wrong Please try again';
  //   }
  // }

  // Upload dummy dataa to cloud firebase
  // Future<void> uploadDummyData(List<ProductModel> products) async{
  //   try {
  //     // Upload all the product along with their images
  //     final storage = Get.put(TFirebaseStorageService());

  //     // Loop through each product 
  //      for (var product in products) {
  //       final thumbnail = await storage.getImageDataFromAssets(product.thumbnail);

  //       // upload image and get its url
  //        final url = await storage.uploadImageData('products/Images', thumbnail, product.thumbnail.toString());

  //        //Assign URL to product.thumbnail attribute
  //        product.thumbnail = url;

  //        // product list of images
  //        if(product.images != null && product.images!.isNotEmpty) {
  //         List<String> imagesUrl = [];
  //         for(var image in product.images!) {
  //           //Get image data link from lical assets
  //           final assetImage = await storage.getImageDataFromAssets(image);

  //           //upload image and get its URL
  //           final url = await storage.uploadImageData('Product/Images', assetImage, image);

  //           // Assign URL to product.thumbnail attribute
  //           imagesUrl.add(url);
  //         }
  //         product.images!.clear();  
  //         product.images!.addAll(imagesUrl);
  //        }

  //        //Upload variation Images
  //        if (product.productType == ProductType.variable.toString()) {
  //         for (var variation in product.productVariations!) {
  //           //Get image data link from local assets
  //           final assetImage = await storage.getImageDataFromAssets(variation.image);

  //           //upload image and gets its URL
  //           final url = await storage.uploadImageData('Products/Images', assetImage, variation.image);

  //           // Assign URL to vatiation .image attribute 
  //           variation.image = url;
  //         }
  //        }

  //        // store product in Firestore
  //        await _db.collection("Products").doc(product.id).set(product.toJson());
  //      }
  //     } on FirebaseException catch (e) {
  //       throw e.message!;
  //     } on SocketException catch (e) {
  //       throw e.message;
  //     } on PlatformException catch (e) {
  //       throw e.message!;
  //     } catch (e) {
  //       throw e.toString();
  //     }
  //   }

}
