import 'package:get/get.dart';

class GetXUtil {
  GetXUtil._();

  static to(Function() screen) => Get.to(
        screen,
        transition: Transition.rightToLeft,
      );

  static toEnd(Function() screen) => Get.toEnd(screen);
}
