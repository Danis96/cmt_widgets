import 'package:cmt/generated/assets.dart';
import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class DrawerHelper {
  List<AW_DrawerListItem> drawerListItems(BuildContext context) {
    return  <AW_DrawerListItem>[
      AW_DrawerListItem(
        title: 'Item 1',
        image: Assets.assetsIcTimeIcon,
        routeName: '',
        onTap: () {
          print('');
        },
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.redAccent,
        ),
      ),
      AW_DrawerListItem(
        title: 'Item 2',
        image: Assets.assetsIcAccount,
        routeName: '',
        onTap: () {
          print('');
        },
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.redAccent,
        ),
      ),
      AW_DrawerListItem(
        title: 'Item 3',
        image: Assets.assetsIcSpeed,
        onTap: () {
          print('');
        },
        routeName: '',
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.redAccent,
        ),
      ),
    ];
  }
}
