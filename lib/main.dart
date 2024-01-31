import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:trade/config/app_constants.dart';
import 'package:trade/config/theme.dart';
import 'package:trade/routes.dart';
import 'package:trade/utils/global_functions.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(AppConstants.userBox);

  runApp(const ProviderScope(child: MyApp())
      // DevicePreview(
      //   enabled: !kReleaseMode,
      //   builder: (context) => const ProviderScope(
      //     child: MyApp(),
      //   ),
      // ),
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844), // XD Design Sizes
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: false,
      builder: (context, child) {
        GlobalFunction.changeStatusBarTheme(isDark: false);

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Trade',
          navigatorKey: GlobalFunction.navigatorKey,
          theme: getAppTheme(context: context, isDarkTheme: false),
          onGenerateRoute: generatedRoutes,
          initialRoute: Routes.splash,
        );
      },
    );
  }
}
