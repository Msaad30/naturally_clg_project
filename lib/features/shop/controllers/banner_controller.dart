import 'package:get/get.dart';
import 'package:naturally/data/repositories/banners/banner_repository.dart';
import 'package:naturally/features/shop/models/product/banner_model.dart';
import 'package:naturally/utils/popups/loaders.dart';

class BannerController extends GetxController{

  ///variables
final isLoading = false.obs;
final carouselCurrentIndex = 0.obs;
final RxList<BannerModel> banners = <BannerModel>[].obs;
 

 @override
 void onInit() {
  fetchBanners();
  super.onInit();
 }

  ///Update Page navigation dots
 void updatePageIndicator(index) {
  carouselCurrentIndex.value = index;
 }
 
 /// fetch Banners
 Future<void> fetchBanners() async{
    try{
      // show loader while loading categories
      isLoading.value = true;

      // Fetch Banner
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      // Assign Banners
      this.banners.assignAll(banners);
      
    } catch (e){
      TLoaders.errorSnackBar(title: 'On Snap!', message: e.toString());
    } finally{
      // Remove Loader
      isLoading.value = false;
    }
  }

}