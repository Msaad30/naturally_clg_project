import 'package:get/get.dart';
import 'package:naturally/data/categories/category_repository.dart';
import 'package:naturally/data/repositories/product/product_repository.dart';
import 'package:naturally/features/shop/models/product/category_model.dart';
import 'package:naturally/features/shop/models/product/product_model.dart';
import 'package:naturally/utils/popups/loaders.dart';


class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> feturedCategories = <CategoryModel>[].obs;

  get featuredCategories => null;

  @override
  void onInit() {
  fetchCategories();
  super.onInit();
  }
/// Load category data
  Future<void> fetchCategories() async {
    try {

    // Shoe Loader while leading categories
    isLoading.value = true;

    // Fetch categories from data source (Firestore, API, etc.)
    final categories = await _categoryRepository.getAllCategories();

    // Update the categories list
    allCategories.assignAll(categories);

    // Filter featured categories
    featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());

    } catch (e) {
      TLoaders.errorSnackBar(title:'oh snap', message: e.toString());
    } finally {
      //Remove Loader
      isLoading.value = false;
    }
  }
/// Load selected category data
  Future<List<CategoryModel>> getSubCategories({required String categoryId, int limit = 4}) async {
    try {
      final subCategories = await _categoryRepository.getSubCategories(categoryId);
      return subCategories;
    } catch (e) {
      TLoaders.errorSnackBar(title:'oh snap', message: e.toString());
      return[];
    }
  }

//// Get Caregory or Sub-category products.
  Future<List<ProductModel>> getCategoryProducts({required String categoryId, int limit = 4}) async {
    try {
      // Fetch limited (4) products against each subCategory;
      final products = await ProductRepository.instance.getProductsForCategory(categoryId: categoryId, limit: limit);
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title:'oh snap', message: e.toString());
      return[];
    }
  
  }
}