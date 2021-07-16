import 'package:flutter/material.dart';
import 'package:lucky_triangle/app/models/app_config.dart';
import 'package:lucky_triangle/app/root_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/home/home_page.dart';

class Root extends StatelessWidget {
  RootController? controller;

  @override
  Widget build(BuildContext context) {
    controller = RootController();

    //Difference ValueListenableBuilder, StreamBuilder, HeritedWidget
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: controller?.themeController.themeMode, //Change the notifier
      builder: (context, value, child) {
        if (value == null) return Container();

        ThemeMode themeMode = AppConfig.singleton.themeMode.value;
        if (value == ThemeMode.light)
          themeMode = ThemeMode.light;
        else if (value == ThemeMode.dark) themeMode = ThemeMode.dark;
        print('config: ${AppConfig.singleton.themeMode.value}');
        print('value: $value');
        print('theme: $themeMode');

        return MaterialApp(
          title: 'Flutter Demo',
          themeMode: themeMode,
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.grey,
            scaffoldBackgroundColor: Colors.grey[100],
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Colors.black,
          ),
          home: HomePage(title: 'ACERTO DE VENDAS'),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
