import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/layout/shop_app_layout.dart';
import 'package:shop_app/moduels/shop_login_screen/shop_login_screen.dart';
import 'package:shop_app/shared/network/local/shared_prefercne.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';
import 'package:shop_app/shared/style/theme.dart';

import 'bloc_observer.dart';
import 'moduels/onboard/on_board.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  WidgetsFlutterBinding.ensureInitialized();
  await CasheHelper.init();
  Widget widget = OnBoardingScreen();
  String onBoarding = CasheHelper.getData(key: 'onBoarding').toString();
  print(onBoarding);

  String token = CasheHelper.getData(key: 'token').toString();

  if (onBoarding != "null") {
    if (token != "null") {
      widget = ShopAppLayoutScreen();
    } else {
      widget = ShopLoginScreen();
    }
  } else {
    widget = OnBoardingScreen();
  }
  print(onBoarding);
  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  MyApp({
    required this.startWidget,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      home: startWidget,
      debugShowCheckedModeBanner: false,
    );
  }
}
