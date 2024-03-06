import 'package:flutter/material.dart';

import '../../../generated/assets.dart';
import '../../widgets/widgets.dart';

final List<AW_BottomNavigationItem> bottomNavigationItemsTest = <AW_BottomNavigationItem>[
  AW_BottomNavigationItem(title: 'First', icon: Assets.assetsIcTimeIcon, page: const SizedBox()),
  AW_BottomNavigationItem(title: 'Second', icon: Assets.assetsIcTeam, page: const SizedBox()),
  AW_BottomNavigationItem(title: 'Third', icon: Assets.assetsIcSpeed, page: const SizedBox()),
];
