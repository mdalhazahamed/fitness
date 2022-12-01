import 'package:fitness/ui/view/auth/forget_screen.dart';
import 'package:fitness/ui/view/auth/login_screen.dart';
import 'package:fitness/ui/view/auth/registration_screen.dart';
import 'package:fitness/ui/view/botton_nav_controller/nav_controller.dart';
import 'package:fitness/ui/view/botton_nav_controller/splash_screen.dart';
import 'package:fitness/ui/view/widgets/details/favourite_details.dart';

import 'package:get/get.dart';

import '../view/widgets/details/details_page.dart';
import '../view/botton_nav_controller/pages/home/see_all_product.dart';

const String splash = '/splash_screen';
const String login = '/login_screen';
const String registration = '/registration_screen';
const String forgot = '/forgot_screen';
const String bottonNavController = '/bottonNavController';
const String videosDetails = '/videosDetails';
const String favouriteDetails = '/favouriteDetails';
const String seeAllProduct = '/seeAllProduct';

//contrat our page routes

List<GetPage> getPages = [
  GetPage(name: splash, page: () => SplashScreen()),
  GetPage(name: login, page: () => LoginScreen()),
  
  GetPage(name: registration, page: () => RegistrationScreen()),
  GetPage(name: forgot, page: () => ForgotScreen()),
  GetPage(name: bottonNavController, page: () => BottonNavController()),
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
    name: seeAllProduct,
    page: () {
      SeeAllProduct _seeAll = Get.arguments;
      return _seeAll;
    },
  ),
];
