import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:snapbuy/data/datasource/remote/dio/dio_client.dart';
import 'package:snapbuy/data/repository/auth_repo.dart';
import 'package:snapbuy/data/repository/banner_repo.dart';
import 'package:snapbuy/data/repository/brand_repo.dart';
import 'package:snapbuy/data/repository/cart_repo.dart';
import 'package:snapbuy/data/repository/category_repo.dart';
import 'package:snapbuy/data/repository/chat_repo.dart';
import 'package:snapbuy/data/repository/coupon_repo.dart';
import 'package:snapbuy/data/repository/featured_deal_repo.dart';
import 'package:snapbuy/data/repository/flash_deal_repo.dart';
import 'package:snapbuy/data/repository/location_repo.dart';
import 'package:snapbuy/data/repository/notification_repo.dart';
import 'package:snapbuy/data/repository/onboarding_repo.dart';
import 'package:snapbuy/data/repository/product_details_repo.dart';
import 'package:snapbuy/data/repository/order_repo.dart';
import 'package:snapbuy/data/repository/product_repo.dart';
import 'package:snapbuy/data/repository/profile_repo.dart';
import 'package:snapbuy/data/repository/search_repo.dart';
import 'package:snapbuy/data/repository/seller_repo.dart';
import 'package:snapbuy/data/repository/splash_repo.dart';
import 'package:snapbuy/data/repository/support_ticket_repo.dart';
import 'package:snapbuy/data/repository/top_seller_repo.dart';
import 'package:snapbuy/data/repository/wishlist_repo.dart';
import 'package:snapbuy/helper/network_info.dart';
import 'package:snapbuy/provider/auth_provider.dart';
import 'package:snapbuy/provider/banner_provider.dart';
import 'package:snapbuy/provider/brand_provider.dart';
import 'package:snapbuy/provider/cart_provider.dart';
import 'package:snapbuy/provider/category_provider.dart';
import 'package:snapbuy/provider/chat_provider.dart';
import 'package:snapbuy/provider/coupon_provider.dart';
import 'package:snapbuy/provider/facebook_login_provider.dart';
import 'package:snapbuy/provider/featured_deal_provider.dart';
import 'package:snapbuy/provider/flash_deal_provider.dart';
import 'package:snapbuy/provider/google_sign_in_provider.dart';
import 'package:snapbuy/provider/home_category_product_provider.dart';
import 'package:snapbuy/provider/localization_provider.dart';
import 'package:snapbuy/provider/location_provider.dart';
import 'package:snapbuy/provider/notification_provider.dart';
import 'package:snapbuy/provider/onboarding_provider.dart';
import 'package:snapbuy/provider/product_details_provider.dart';
import 'package:snapbuy/provider/order_provider.dart';
import 'package:snapbuy/provider/product_provider.dart';
import 'package:snapbuy/provider/profile_provider.dart';
import 'package:snapbuy/provider/search_provider.dart';
import 'package:snapbuy/provider/seller_provider.dart';
import 'package:snapbuy/provider/splash_provider.dart';
import 'package:snapbuy/provider/support_ticket_provider.dart';
import 'package:snapbuy/provider/theme_provider.dart';
import 'package:snapbuy/provider/top_seller_provider.dart';
import 'package:snapbuy/provider/wishlist_provider.dart';
import 'package:snapbuy/utill/app_constants.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/datasource/remote/dio/logging_interceptor.dart';
import 'data/repository/home_category_product_repo.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton(() => NetworkInfo(sl()));
  sl.registerLazySingleton(() => DioClient(AppConstants.BASE_URL, sl(), loggingInterceptor: sl(), sharedPreferences: sl()));

  // Repository
  sl.registerLazySingleton(() => CategoryRepo(dioClient: sl()));
  sl.registerLazySingleton(() => HomeCategoryProductRepo(dioClient: sl()));
  sl.registerLazySingleton(() => TopSellerRepo(dioClient: sl()));
  sl.registerLazySingleton(() => FlashDealRepo(dioClient: sl()));
  sl.registerLazySingleton(() => FeaturedDealRepo(dioClient: sl()));
  sl.registerLazySingleton(() => BrandRepo(dioClient: sl()));
  sl.registerLazySingleton(() => ProductRepo(dioClient: sl()));
  sl.registerLazySingleton(() => BannerRepo(dioClient: sl()));
  sl.registerLazySingleton(() => OnBoardingRepo(dioClient: sl()));
  sl.registerLazySingleton(() => AuthRepo(dioClient: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton(() => ProductDetailsRepo(dioClient: sl()));
  sl.registerLazySingleton(() => SearchRepo(dioClient: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton(() => OrderRepo(dioClient: sl()));
  sl.registerLazySingleton(() => SellerRepo(dioClient: sl()));
  sl.registerLazySingleton(() => CouponRepo(dioClient: sl()));
  sl.registerLazySingleton(() => ChatRepo(dioClient: sl()));
  sl.registerLazySingleton(() => NotificationRepo(dioClient: sl()));
  sl.registerLazySingleton(() => ProfileRepo(dioClient: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton(() => WishListRepo(dioClient: sl()));
  sl.registerLazySingleton(() => CartRepo(dioClient: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton(() => SplashRepo(sharedPreferences: sl(), dioClient: sl()));
  sl.registerLazySingleton(() => SupportTicketRepo(dioClient: sl()));
  sl.registerLazySingleton(() => LocationRepo(dioClient: sl()));

  // Provider
  sl.registerFactory(() => CategoryProvider(categoryRepo: sl()));
  sl.registerFactory(() => HomeCategoryProductProvider(homeCategoryProductRepo: sl()));
  sl.registerFactory(() => TopSellerProvider(topSellerRepo: sl()));
  sl.registerFactory(() => FlashDealProvider(megaDealRepo: sl()));
  sl.registerFactory(() => FeaturedDealProvider(featuredDealRepo: sl()));
  sl.registerFactory(() => BrandProvider(brandRepo: sl()));
  sl.registerFactory(() => ProductProvider(productRepo: sl()));
  sl.registerFactory(() => BannerProvider(bannerRepo: sl()));
  sl.registerFactory(() => OnBoardingProvider(onboardingRepo: sl()));
  sl.registerFactory(() => AuthProvider(authRepo: sl()));
  sl.registerFactory(() => ProductDetailsProvider(productDetailsRepo: sl()));
  sl.registerFactory(() => SearchProvider(searchRepo: sl()));
  sl.registerFactory(() => OrderProvider(orderRepo: sl()));
  sl.registerFactory(() => SellerProvider(sellerRepo: sl()));
  sl.registerFactory(() => CouponProvider(couponRepo: sl()));
  sl.registerFactory(() => ChatProvider(chatRepo: sl()));
  sl.registerFactory(() => NotificationProvider(notificationRepo: sl()));
  sl.registerFactory(() => ProfileProvider(profileRepo: sl()));
  sl.registerFactory(() => WishListProvider(wishListRepo: sl(), productDetailsRepo: sl()));
  sl.registerFactory(() => SplashProvider(splashRepo: sl()));
  sl.registerFactory(() => CartProvider(cartRepo: sl()));
  sl.registerFactory(() => SupportTicketProvider(supportTicketRepo: sl()));
  sl.registerFactory(() => LocalizationProvider(sharedPreferences: sl(), dioClient: sl()));
  sl.registerFactory(() => ThemeProvider(sharedPreferences: sl()));
  sl.registerFactory(() => GoogleSignInProvider());
  sl.registerFactory(() => FacebookLoginProvider());
  sl.registerFactory(() => LocationProvider(sharedPreferences: sl(), locationRepo: sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
  sl.registerLazySingleton(() => Connectivity());
}
