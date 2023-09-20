import 'package:get/get.dart';

class DimenConfig {
  const DimenConfig._();

  static const double standardSize = 12;

  static double height([int percent = 100]) => Get.mediaQuery.size.height * percent / 100;
  static double width([int percent = 100]) => Get.mediaQuery.size.width * percent / 100;
}
