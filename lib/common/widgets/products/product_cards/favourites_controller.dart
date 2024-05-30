import "dart:convert";
import "package:get/get.dart";
import "package:naturally/data/repositories/product/product_repository.dart";
import "package:naturally/features/shop/models/product/product_model.dart";
import "package:naturally/utils/local_storage/storage_utility.dart";
import "package:naturally/utils/popups/loaders.dart";

class FavouritesController extends GetxController{
  static FavouritesController get instance => Get.find();

  ///variables
  final favourites = <String, bool>{}.obs;

  @override
  void onInit(){
    super.onInit();
    initFavourites();

  }

  //method to initialize favorites by reading from storage
  Future<void> initFavourites() async{
    final json = TLocalStorage.instance().readData('favorites');
    if (json !=null){
      final storedFavorites = jsonDecode(json) as Map<String, dynamic>;
      favourites.assignAll(storedFavorites.map((key, value) => MapEntry(key, value as bool)));
    }

  }
  bool Isfavourite(String productId){
    return favourites[productId] ?? false;
  }
  void toggleFavoriteProduct(String productId){
    if(!favourites.containsKey(productId)){
      favourites[productId] = true;
      saveFavoritesToStorage();
      TLoaders.customToast(message: 'Product has been added to the Wishlist. ');
    }else{
  //    TLocalStorage.instance().removeData(productId);
      favourites.remove(productId);
      saveFavoritesToStorage();
      favourites.refresh();
      TLoaders.customToast(message: 'Product has been removed from the Wishlist. ');
    }
  }
  void saveFavoritesToStorage(){
    final EncodedFavourites = json.encode(favourites);
    TLocalStorage.instance().saveData('favourites',EncodedFavourites);
  }

  Future<List<ProductModel>> favouriteProducts() async {
    return await ProductRepository.instance.getFavouriteProducts(favourites.keys.toList());
  }
}