import 'package:cmt/generated/assets.dart';
import 'package:flutter/material.dart';
import '../../../theme/color_helper.dart';
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
      const Hero(
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

      /// BADGES
      const Hero(
        tag: 'AW_CustomBadge',
        key: Key('AW_CustomBadge'),
        child: SizedBox(
          height: 170,
          width: 100,
          child: AW_CustomBadge(
            widgetKey: Key('AW_CustomBadge'),
            lineWidth: 3,
            fontSize: 13,
            animation: true,
            backgroundWidth: 1,
            circularRadius: 63,
            footerText: 'Footer text go to next line',
            hasTitle: true,
            imageUrl: 'https://upload.wikimedia.org/wikipedia/en/7/77/EricCartman.png',
            percent: 30 / 100,
            progressColor: Colors.blueAccent,
            radiusImage: 43,
            lockedImage: 'https://upload.wikimedia.org/wikipedia/en/7/77/EricCartman.png',
          ),
        ),
      ),
      Hero(
        tag: 'AW_BadgeBackground',
        key: const Key('AW_BadgeBackground'),
        child: SizedBox(
          height: 170,
          width: 100,
          child: AW_BadgeBackground(
            key: const Key('AW_BadgeBackground'),
            lineWidth: 3,
            fontSize: 13,
            animation: true,
            footerText: 'Footer text',
            hasTitle: true,
            imageUrl: 'https://upload.wikimedia.org/wikipedia/en/7/77/EricCartman.png',
            percent: 30 / 100,
            progressColor: Colors.blueAccent,
            radiusImage: 60,
            lockedImage: 'https://upload.wikimedia.org/wikipedia/en/7/77/EricCartman.png',
            innerPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            isUnlocked: false,
            spaceAround: true,
            footerStyle:
                TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: ColorHelper.monochromaticGray200.color),
            width: null,
            maxLines: 2,
            unlockedBackgroundColor: Colors.blueAccent.withOpacity(0.5),
            lockedBackgroundColor: Colors.blueAccent.withOpacity(0.5),
          ),
        ),
      ),

      /// BANNERS
      Hero(
        tag: 'AW_IconTextBanner',
        key: const Key('AW_IconTextBanner'),
        child: Material(
          child: AW_IconTextBanner(
            title: 'Title',
            backgroundColor: Colors.blueAccent,
            icon: Icons.access_alarm,
            iconColor: Colors.white,
            textColor: Colors.white,
            widgetKey: const Key('AW_IconTextBanner'),
            onTap: () => showInSnackBar('On press function', scaffoldKey, context),
          ),
        ),
      ),

      /// BT STATE
      Hero(
        tag: 'AW_BluetoothState',
        key: const Key('AW_BluetoothState'),
        child: Material(
          child: AW_BluetoothState(
            onTap: () => showInSnackBar('On press function', scaffoldKey, context),
            widgetKey: const Key('AW_BluetoothState'),
            bluetoothImage: Assets.assetsIcTagBluetooth,
            bluetoothState: BluetoothState.notPaired,
          ),
        ),
      ),

      /// BOOST
      Hero(
        tag: 'AW_BoostWidget',
        key: const Key('AW_BoostWidget'),
        child: Material(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AW_BoostWidget(
              key: const Key('AW_BoostWidget'),
              title: 'Boost your discount!',
              description:
                  'Inventive program that scans your behaviour in just 15 days to offer you extra discount on your insurance.',
              isActive: true,
              dayLabel: 'Day 6/14',
              icon: Assets.assetsAppBarLogo,
              activeColor: Colors.blueAccent,
              detailsIcon: Assets.assetsFirstLoginModal,
              moreIcon: Icons.arrow_drop_down,
              label: 'Track progress and milestones, your current status is:',
              onTap: () => showInSnackBar('On press function', scaffoldKey, context),
            ),
          ),
        ),
      )
    ];
