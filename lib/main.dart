import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lorem_ipsum/Provider/allpostprovider.dart';
import 'package:lorem_ipsum/Provider/loginprovider.dart';
import 'package:provider/provider.dart';
import 'View/Splash_Screen/Splash_view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AllPostProvider()),
          ChangeNotifierProvider(create: (_) => LogInProvider()),

        ],
        child: Builder(builder: (BuildContext context) {
          return ScreenUtilInit(
            designSize: const Size(393, 852),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Tehseel Mobile App',
                home: child,
              );
              // child: const SplashScreen()
            },
            child: const Splash(),
          );
        }),
      );
    });
  }
}
