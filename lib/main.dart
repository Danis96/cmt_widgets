import 'package:cmt/app/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/My_app.dart';
import 'app/widgets/widgets.dart';
import 'generated/assets.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  registerStores();
  _typedDialogConfig();
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp]).then((_) {
    runApp(const MyApp());
  });
}

void _typedDialogConfig() {
  TypedDialogConfig(
      values: const TypedDialogValues(
          infoDialogConfiguration: TypedDialogTypeValues(
              backgroundImagePath: Assets.assetsDialogInfoBackground,
              buttonColor: Color.fromRGBO(255, 191, 63, 1),
              iconImagePath: Assets.assetsIcDialogAutoInfo,
              contentStyle: TextStyle(fontSize: 14, color: Color.fromRGBO(57, 70, 82, 1)),
              titleStyle: TextStyle(color: Color.fromRGBO(33, 33, 33, 1), fontSize: 24, fontWeight: FontWeight.w600)),
          errorDialogConfiguration: TypedDialogTypeValues(
              backgroundImagePath: Assets.assetsDialogErrorBackground,
              buttonColor: Color.fromRGBO(232, 25, 68, 1),
              iconImagePath: Assets.assetsIcDialogAutoError,
              contentStyle: TextStyle(fontSize: 14, color: Color.fromRGBO(57, 70, 82, 1)),
              titleStyle: TextStyle(color: Color.fromRGBO(33, 33, 33, 1), fontSize: 24, fontWeight: FontWeight.w600)),
          successDialogConfiguration: TypedDialogTypeValues(
              backgroundImagePath: Assets.assetsDialogSuccessBackground,
              buttonColor: Color.fromRGBO(15, 153, 221, 1),
              iconImagePath: Assets.assetsIcDialogAutoSuccess,
              contentStyle: TextStyle(fontSize: 14, color: Color.fromRGBO(57, 70, 82, 1)),
              titleStyle: TextStyle(color: Color.fromRGBO(33, 33, 33, 1), fontSize: 24, fontWeight: FontWeight.w600))));
}
