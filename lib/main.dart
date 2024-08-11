import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/first_screen.dart';
import 'screens/second_screen.dart';
import 'screens/third_screen.dart';
import 'package:flutter_suitmedia_test/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Palindrome App',
      theme: AppTheme.light,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const FirstScreen(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
            name: '/second',
            page: () => SecondScreen(),
            transition: Transition.rightToLeft,
        ),
        GetPage(
            name: '/third',
            page: () => const ThirdScreen(),
            transition: Transition.rightToLeft
        ),
            
      ],
    );
  }
}
