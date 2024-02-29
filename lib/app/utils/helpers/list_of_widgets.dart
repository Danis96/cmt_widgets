import 'package:cmt/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../widgets/widgets.dart';

void showInSnackBar(String value, GlobalKey<ScaffoldState> scaffoldKey, BuildContext context) {
  ScaffoldMessenger.of(context).clearSnackBars();
  final snackBar = SnackBar(content: Text(value));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

List<Widget> listOfWidgets(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) => <Widget>[
      /// APP BARS
      Hero(
        tag: 'AW_AppBarIconTitleIcon',
        key: const Key('AW_AppBarIconTitleIcon'),
        child: AW_AppBarIconTitleIcon(
          context,
          onLeadingPressed: () => showInSnackBar('On press function', scaffoldKey, context),
          onActionPressed: () => showInSnackBar('On press function', scaffoldKey, context),
          leadingIcon: Icons.arrow_back_ios,
          leadingIconColor: Colors.black,
          centerTitle: true,
          titleColor: Colors.white,
          title: 'Title',
          actionWidget: const Text('Action text'),
          backgroundColor: Colors.blueAccent,
        ),
      ),
      Hero(
        tag: 'AW_AppBarIconLogoImage',
        key: const Key('AW_AppBarIconLogoImage'),
        child: AW_AppBarIconLogoImage(
          context,
          logo: Assets.assetsAppBarLogo,
          onLeadingPressed: () => showInSnackBar('On press function', scaffoldKey, context),
          onActionTap: () => showInSnackBar('On press function', scaffoldKey, context),
          onProfileImgTap: () => showInSnackBar('On press function', scaffoldKey, context),
          leadingIcon: Icons.arrow_back_ios,
          profileImage: 'https://upload.wikimedia.org/wikipedia/en/7/77/EricCartman.png',
          backgroundColor: Colors.blueAccent,
        ),
      ),
      Hero(
        tag: 'AW_IconImageTextIconAlignLeftAppBar',
        key: const Key('AW_IconImageTextIconAlignLeftAppBar'),
        child: AW_IconImageTextIconAlignLeftAppBar(
          context,
          leadingIcon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onBack: () => showInSnackBar('On press function', scaffoldKey, context),
          onDelete: () => showInSnackBar('On press function', scaffoldKey, context),
          backgroundColor: Colors.blueAccent,
          title: 'Eric Cartman',
          imageUrl: 'https://upload.wikimedia.org/wikipedia/en/7/77/EricCartman.png',
        ),
      ),
      Hero(
        tag: 'AW_VerticalWidgetsAppBar',
        key: const Key('AW_VerticalWidgetsAppBar'),
        child: AW_VerticalWidgetsAppBar(
          context,
          onLeadingPressed: () => showInSnackBar('On press function', scaffoldKey, context),
          leadingIcon: Icons.arrow_back_ios,
          backgroundColor: Colors.blueAccent,
          title: 'Title',
          titleColor: Colors.white,
        ),
      ),

      /// ALERT CARD
      Hero(
        tag: 'AW_AlertCard',
        key: Key('AW_AlertCard'),
        child: AW_AlertCard(
          status: 'Status',
          title: 'Title',
          statusColor: Colors.white,
          statusColorContainer: Colors.blueAccent,
          shouldSHowTitleText: true,
          icon: Assets.assetsAppBarLogo,
        ),
      ),
    ];
