import 'package:cmt/app/view/home_page/home_page.dart';
import 'package:flutter/material.dart';

import '../routing/route_generator.dart';
import '../theme/custom_light_theme.dart';
import '../theme/theme_config.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CMT Widget Catalog',
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.darkTheme,
      themeMode: currentTheme.currentTheme,
      onGenerateRoute: RouteGenerator.generateRoute,
      home: GestureDetector(onTap: () => keyboardCloseOnTap(context), child: const HomePage()),
    );
  }

  void keyboardCloseOnTap(BuildContext context) {
    final FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }
}
