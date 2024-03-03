import 'package:cmt/app/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/My_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  registerStores();
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp]).then((_) {
    runApp(const MyApp());
  });
}
