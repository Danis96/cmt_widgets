import 'package:cmt/app/locator.dart';
import 'package:cmt/app/stores/widget_store.dart';
import 'package:cmt/app/view/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../routing/route_generator.dart';
import '../theme/custom_light_theme.dart';
import '../theme/theme_config.dart';

class MyAppWeb extends StatelessWidget {
  MyAppWeb({super.key});

  final WidgetStore widgetStore = getIt<WidgetStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        return MaterialApp(
          title: 'CMT Widget Catalog',
          debugShowCheckedModeBanner: false,
          theme: widgetStore.isMaterial3 ? CustomTheme.material3 : CustomTheme.material2,
          themeMode: currentTheme.currentTheme,
          onGenerateRoute: RouteGenerator.generateRoute,
          home: HomePage(),
        );
      },
    );
  }
}
