import 'package:fitness/ui/view/auth/forget_screen.dart';
import 'package:fitness/ui/view/auth/login_screen.dart';
import 'package:fitness/ui/view/auth/on_boarding_screen.dart';
import 'package:fitness/ui/view/auth/registration_screen.dart';
import 'package:fitness/ui/view/botton_nav_controller/details/music_details.page.dart';
import 'package:fitness/ui/view/botton_nav_controller/nav_controller.dart';
import 'package:fitness/ui/view/botton_nav_controller/quiz_now_page/main_menu.dart';
import 'package:fitness/ui/view/botton_nav_controller/splash_screen.dart';
import 'package:fitness/ui/view/botton_nav_controller/details/favourite_details.dart';
import 'package:fitness/ui/view/widgets/favourite.dart';

import 'package:get/get.dart';

import '../view/botton_nav_controller/details/blog_details_page.dart';
import '../view/botton_nav_controller/details/video_details_page.dart';
import '../view/botton_nav_controller/pages/see_all_product.dart';
import '../view/botton_nav_controller/pages/view_items.dart';

const String splash = '/splash_screen';
const String login = '/login_screen';
const String onboarding = '/onboarding';
const String registration = '/registration_screen';
const String forgot = '/forgot_screen';
const String bottonNavController = '/bottonNavController';
const String videosDetailsPage = '/video_details_screen';
const String musicDetailsPage = '/music_details_page';
const String blogDetailsPage = '/blog_details_screen';
const String favouriteDetails = '/favouriteDetails';
const String viewItemsPage = '/viewItemsPage';
const String seeAllProduct = '/seeAllProduct';
const String favourte = '/favourte';
const String favourteDetails = '/favourteDetails';
const String videoPlayer = '/videoPlayer';
const String mainMenu = '/mainMenu';

//contrat our page routes

List<GetPage> getPages = [
  GetPage(name: splash, page: () => SplashScreen()),
  GetPage(name: login, page: () => LoginScreen()),
  GetPage(name: onboarding, page: () => OnbordingScreen()),

  GetPage(name: registration, page: () => RegistrationScreen()),
  GetPage(name: forgot, page: () => ForgotScreen()),
  GetPage(name: bottonNavController, page: () => BottonNavController()),
  GetPage(name: favourte, page: () => FavouritePage()),
  GetPage(name: mainMenu, page: () => MainMenu()),
  GetPage(
    name: seeAllProduct,
    page: () {
      SeeAllProduct _seeAll = Get.arguments;
      return _seeAll;
    },
  ),
  GetPage(
    name: seeAllProduct,
    page: () {
      SeeAllProduct _seeAll = Get.arguments;
      return _seeAll;
    },
  ),

  GetPage(
    name: videosDetailsPage,
    page: () {
      VideoDetailsPage _detailsSCreen = Get.arguments;
      return _detailsSCreen;
    },
  ),
  GetPage(
    name: musicDetailsPage,
    page: () {
      MusicDetailsPage _musicDetailsSCreen = Get.arguments;
      return _musicDetailsSCreen;
    },
  ),
  GetPage(
    name: blogDetailsPage,
    page: () {
      BlogDetailPage _blogDetailsSCreen = Get.arguments;
      return _blogDetailsSCreen;
    },
  ),

  GetPage(
    name: viewItemsPage,
    page: () {
      ItemsView _itemsView = Get.arguments;
      return _itemsView;
    },
  ),
  GetPage(
    name: favouriteDetails,
    page: () {
      FavouriteDetails _favouriteDetails = Get.arguments;
      return _favouriteDetails;
    },
  ),
];
