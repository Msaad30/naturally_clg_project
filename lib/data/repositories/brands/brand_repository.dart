import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:naturally/features/shop/models/product/brand_model.dart';
import 'package:naturally/features/shop/models/product/product_model.dart';
import 'package:naturally/utils/exceptions/firebase_exceptions.dart';
import 'package:naturally/utils/exceptions/format_exceptions.dart';
import 'package:naturally/utils/exceptions/platform_exceptions.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

/// Variables
final _db = FirebaseFirestore.instance;

/// Get all categories
Future<List<BrandModel>> getAllBrands() async{
  try {
      final snapshot = await _db.collection('Brands').get();
      final result = snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
      return result;

    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong while fetching Banners.';
    }
  }

Future<List<ProductModel>>getFeaturedProduct() async{
    try{
      final snapshot = await _db.collection('Product').where('IsFeatured', isEqualTo: true).limit(4).get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch(e) {
      throw 'Something went wrong Please try again';
    }
  }

/// Get all categories
Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {

  try{
  // Query to get all documents whare categoryId matches the provided categoryId
  QuerySnapshot brandCategoryQuery = await _db.collection('BrandCategory').where('categoryId', isEqualTo: categoryId).get(); 

  //Extract brands from the document
  List<String> brandIds = brandCategoryQuery.docs.map((doc) => doc['brandId'] as String).toList();
  
  // Query to get all documents whare the brandid is in the list of brands Fildpath. document to documents in colection
  final brandsQuery = await _db.collection('Brands').where(FieldPath.documentId, whereIn: brandIds).limit(2).get();

  List<BrandModel> brands = brandsQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();

  return brands;
    } on FirebaseException catch (e) {
    throw TFirebaseException(e.code).message;
    } on FormatException catch(_) {
    throw TFormatException();
    } on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
    } catch (e) {
    throw 'Something went wrong while fetching Banners.';
    }
  }
  
}