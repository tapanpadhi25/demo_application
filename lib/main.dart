import 'package:demo_application/controller/theme_controller.dart';
import 'package:demo_application/global_utils/theme.dart';
import 'package:demo_application/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

Box? themeBox;
ThemeController themeController = Get.put(ThemeController());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  themeBox = await Hive.openBox("isLightMode");
  if (themeBox!.get("isLightMode") != null) {
    themeController.isLightMode.value = themeBox!.get("isLightMode");
  } else {
    await themeBox!.put("isLightMode", themeController.isLightMode.value);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.getTheme(themeController.isLightMode.value),
        darkTheme: CustomTheme.getTheme(themeController.isLightMode.value),
        home: const LoginScreen(),
      ),
    );
  }
}

