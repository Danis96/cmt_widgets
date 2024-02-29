import 'package:cmt/app/utils/navigation_animations.dart';
import 'package:cmt/app/view/details/widget_details.dart';
import 'package:flutter/material.dart';

import '../routing/routes.dart';

mixin RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Details:
        return SlideAnimationTween(widget: WidgetDetails());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<void>(builder: (_) {
      return Scaffold(appBar: AppBar(title: const Text('Error')), body: const Center(child: Text('Error Screen')));
    });
  }
}
