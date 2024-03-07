
import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';
import 'list_of_widgets.dart';

class SettingsItems {
  List<SettingsSectionItemModel> sectionItems(GlobalKey<ScaffoldState> scaffoldKey, BuildContext context) => [
    SettingsSectionItemModel(
      onTap: () => showInSnackBar('On press function', scaffoldKey, context),
      title: 'Item 1',
      badgeNumber: 1,
    ),
    SettingsSectionItemModel(
      onTap: () => showInSnackBar('On press function', scaffoldKey, context),
      title: 'Item 2',
      badgeNumber: 2,
    ),
    SettingsSectionItemModel(
      onTap: () => showInSnackBar('On press function', scaffoldKey, context),
      title: 'Item 3',
    ),
  ];
}