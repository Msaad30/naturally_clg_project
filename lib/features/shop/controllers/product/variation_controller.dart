import 'package:get/get.dart';
import 'package:naturally/features/shop/controllers/product/cart_controller.dart';
import 'package:naturally/features/shop/controllers/product/images_controller.dart';
import 'package:naturally/features/shop/models/product/product_model.dart';
import 'package:naturally/features/shop/models/product/product_variation_model.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  // variables
  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation = ProductVariationModel.empty().obs;

  // -- select Attribute, and variation
  void onAttributeSelected(ProductModel product, attributeName, attributeValue) {
    // when attribute is selected wo will first add that attribute to the selectedAttribute
    final selectedAttributes = Map<String, dynamic>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;

    final selectedVariation = product.productVariations!.firstWhere(
      (variation) => _isSameAttributeValues(variation.attributeValues, selectedAttributes),
      orElse: () => ProductVariationModel.empty(),
    );  

    // Show the Selected variation image as main image
    if (selectedVariation.image.isNotEmpty) {
      ImagesController.instance.selectedProductImage.value = selectedVariation.image;
    }

    if (selectedVariation.id.isNotEmpty) {
      final cartController = CartController.instance;
      cartController.productQuantityInCart.value = cartController.getvariationQuantityInCart(product.id, selectedVariation.id);
    }

    // Assign selected variation
    this.selectedVariation.value = selectedVariation;

    getProductVariationStockStatus();
  }

  // -- check if selected attributes matches any variationn attributes
   bool _isSameAttributeValues(Map<String, dynamic> variationAttributes, Map<String, dynamic> selectedAttributes){
    // if selecteaattributes contain 3 attributes and current variation contains 2 then return
    if(variationAttributes.length != selectedAttributes.length) return false;

    //if any of the attributes is different then return. 
    for (final key in variationAttributes.keys){
      // attributes[key] = value which could be green , small, etc.
      if (variationAttributes[key] != selectedAttributes[key]) return false;

      // if any of attribute is different then return
      for(final key in variationAttributes.keys);
      // attributes[key] = vallue which could be [green,small,etc]
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }

    return true;

   }


  //  check attribute availability / stock in variation
  Set<String?> getAttributesAvailabilityInVariation(List<ProductVariationModel> variations, String attributeName) {
    // Pass the  variation to check which attributes are available and stock is not 0
     final availableVariationAttributeValues = variations
     .where((variation) =>
     // Check Empty / Out of stock attributes
          variation.attributeValues[attributeName] != null && variation.attributeValues[attributeName]!.isNotEmpty && variation.stock > 0)
      // Fetch all non-empty attribute of varitions
      .map((variations) => variations.attributeValues[attributeName])
      .toSet();

      return availableVariationAttributeValues;
  }

  String getVariationPrice(){
    return(selectedVariation.value.salePrice > 0 ? selectedVariation.value.salePrice : selectedVariation.value.price).toString();
  }


  // -- check product variation stock status
  void getProductVariationStockStatus() {
    variationStockStatus.value = selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  } 

  // -- reset selected attributes when switching products
  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value ='';
    selectedVariation.value = ProductVariationModel.empty();
  }
}