import 'package:cmt/app/utils/helpers/drawer_list.dart';
import 'package:cmt/app/utils/helpers/settings_items_list.dart';
import 'package:cmt/app/utils/helpers/shield_lIst.dart';
import 'package:cmt/generated/assets.dart';
import 'package:flutter/material.dart';
import '../../../theme/color_helper.dart';
import '../../models/helpers/shield_model.dart';
import '../../widgets/widgets.dart';
import 'bottom_navigation_list.dart';
import 'package:flutter_svg/flutter_svg.dart';

void showInSnackBar(String value, GlobalKey<ScaffoldState> scaffoldKey, BuildContext context) {
  ScaffoldMessenger.of(context).clearSnackBars();
  final snackBar = SnackBar(content: Text(value));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

final List<String> labels = <String>['18', '19', '20', '21', '22', '23'];
final List<double> values = <double>[73, 65, 89, 48, 59, 98];
final List<String> _namesTest = <String>['Team A', 'Team B'];
final List<double> _valuesTest = <double>[0.4, 0.6];
final List<Color> _colorTest = <Color>[Colors.blueAccent, Colors.lightBlueAccent];
const String element0 = 'Some title';
bool isItemPressed = false;

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
            textStyle: const TextStyle(color: Colors.white),
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
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            height: MediaQuery.of(context).size.height / 2.5,
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
      ),

      /// BOTTOM NAVIGATION BAR
      Hero(
        tag: 'AW_BottomNavigationPage',
        key: const Key('AW_BottomNavigationPage'),
        child: SizedBox(
          width: 400,
          height: 200,
          child: Material(
            child: AW_BottomNavigationPage(
              widgetKey: const Key('AW_BottomNavigationPage'),
              unSelectedItemColor: Colors.black,
              selectedItemColor: Colors.white,
              items: bottomNavigationItemsTest,
              backgroundColor: Colors.blueAccent,
              initialSelection: 2,
              showTitle: true,
            ),
          ),
        ),
      ),

      /// BUTTON
      Hero(
        tag: 'AW_Button',
        key: const Key('AW_Button'),
        child: AW_Button(
          key: const Key('AW_Button'),
          buttonTitle: 'Title',
          disabled: false,
          width: 200,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
          onPressed: () => showInSnackBar('On press function', scaffoldKey, context),
        ),
      ),

      /// AW_ButtonWithImageBg
      Hero(
        tag: 'AW_ButtonWithImageBg',
        key: const Key('AW_ButtonWithImageBg'),
        child: AW_ButtonWithImageBg(
          key: const Key('AW_ButtonWithImageBg'),
          buttonTitle: '',
          disabled: false,
          boxDecorationImage:
              const DecorationImage(image: AssetImage(Assets.assetsPrizesPlaceholder), fit: BoxFit.cover),
          onPressed: () => showInSnackBar('On press function', scaffoldKey, context),
        ),
      ),

      /// AW_CustomCardItem
      Hero(
        tag: 'AW_CustomCardItem',
        key: const Key('AW_CustomCardItem'),
        child: SizedBox(
          height: 400,
          child: AW_CustomCardItem(
            widgetKey: const Key('AW_CustomCardItem'),
            maxLines: 2,
            width: 100,
            imageHeight: 200,
            bottomRadius: BorderRadius.circular(20),
            imageBorderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            title: 'Title',
            image:
                'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/82114837-0066-42c3-990d-755b33d0743a/dgxbv5n-f02fbdd0-1546-4b1c-b6aa-475b0f3b203a.png/v1/fill/w_1192,h_670,q_70,strp/candypunk__the_dredges_by_travis_anderson_dgxbv5n-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9OTAwIiwicGF0aCI6IlwvZlwvODIxMTQ4MzctMDA2Ni00MmMzLTk5MGQtNzU1YjMzZDA3NDNhXC9kZ3hidjVuLWYwMmZiZGQwLTE1NDYtNGIxYy1iNmFhLTQ3NWIwZjNiMjAzYS5wbmciLCJ3aWR0aCI6Ijw9MTYwMCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.RUqQwkrF9yuXYFSrZTQ-WQOxS74FhATE0lmbHr27z4A',
          ),
        ),
      ),

      ///AW_ChallengeItemCardDemo
      const Hero(
        tag: 'AW_ChallengeItemCardDemo',
        key: Key('AW_ChallengeItemCardDemo'),
        child: Material(
          child: AW_ChallengeItemCardDemo(
            key: Key('AW_ChallengeItemCardDemo'),
            image:
                'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/82114837-0066-42c3-990d-755b33d0743a/dgw053q-46b09f3e-36a2-4975-a767-df22c40451ca.jpg/v1/fill/w_1192,h_670,q_70,strp/swamp_dragon_by_travis_anderson_dgw053q-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9OTAwIiwicGF0aCI6IlwvZlwvODIxMTQ4MzctMDA2Ni00MmMzLTk5MGQtNzU1YjMzZDA3NDNhXC9kZ3cwNTNxLTQ2YjA5ZjNlLTM2YTItNDk3NS1hNzY3LWRmMjJjNDA0NTFjYS5qcGciLCJ3aWR0aCI6Ijw9MTYwMCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19._SNnsEcUHyx863Ph0fXfTXB5CO_SjLlLcwM3nZbPak8',
            challengeTitle: '',
            isJoinable: true,
            joinChallengeText: 'You can join',
            newChallengeText: 'Some text',
            isExpired: false,
            withoutTeamBannerText: '',
            hasTeam: true,
            team: 'name',
            challengeExpired: 'challenge expired',
            teamNames: ['Team 1', 'Team 2'],
            teamValues: [0, 1],
            assetPath: Assets.assetsBatteryIcon,
            teamLabel: 'Team',
            isNewChallenge: true,
          ),
        ),
      ),

      /// TeamsParticipantsDays
      const Hero(
        tag: 'TeamsParticipantsDays',
        key: Key('TeamsParticipantsDays'),
        child: Material(
          child: TeamsParticipantsDays(
            key: Key('TeamsParticipantsDays'),
            title1: 'Teams',
            subtitle1: '2',
            title2: 'Participants',
            subtitle2: '20',
            title3: 'Days left',
            subtitle3: 'Expired',
            image1: Assets.assetsIcTeam,
            image2: Assets.assetsIcAccount,
            image3: Assets.assetsIcTimeIcon,
            color1: Colors.blueAccent,
            color2: Colors.blueAccent,
            color3: Colors.blueAccent,
          ),
        ),
      ),

      /// AW_CustomProgressIndicator
      Hero(
        tag: 'AW_CustomProgressIndicator',
        key: const Key('AW_CustomProgressIndicator'),
        child: Material(
          child: AW_CustomProgressIndicator(
            widgetKey: const Key('AW_CustomProgressIndicator'),
            value: 80,
            startAngle: 165,
            endAngle: 15,
            minValue: 0,
            maxValue: 100,
            lineWidth: 0.1,
            contentPadding: 50,
            content: const Text('10%'),
            lineColor: Colors.blueAccent,
            bgColor: Colors.grey.withOpacity(0.5),
            height: 200,
          ),
        ),
      ),

      ///AW_CustomIntervalProgressIndicator
      Hero(
        tag: 'AW_CustomIntervalProgressIndicator',
        key: const Key('AW_CustomIntervalProgressIndicator'),
        child: Material(
          child: AW_CustomIntervalProgressIndicator(
            widgetKey: const Key('AW_CustomIntervalProgressIndicator'),
            majorThickness: 2,
            bgColor: Colors.blueAccent,
            betweenColor: Colors.white,
            lineColor: Colors.white.withOpacity(0.5),
            separationLines: true,
            isInversed: true,
            value: 2,
            content: const Text('Some data'),
          ),
        ),
      ),

      /// AW_ConsentsListItem
      Hero(
        tag: 'AW_ConsentsListItem',
        key: const Key('AW_ConsentsListItem'),
        child: Material(
          child: AW_ConsentsListItem(
            (int? index) {},
            onTitleTap: () {},
            consentTitle: 'Title',
            declinedBgColor: Colors.blueAccent,
            activeBgColor: Colors.blueAccent,
            isToggleSwitched: false,
            widgetKey: const Key('test_consents_list_item_key'),
          ),
        ),
      ),

      ///AW_DiscountSquareWidget
      const Hero(
        tag: 'AW_DiscountSquareWidget',
        key: Key('AW_DiscountSquareWidget'),
        child: Material(
          child: AW_DiscountSquareWidget(
            title: 'Title',
            topLeftNumber: 40,
            topRightNumber: 56,
            widgetKey: Key('AW_DiscountSquareWidget'),
          ),
        ),
      ),

      /// AW_DotContainerWithStates
      const Hero(
          tag: 'AW_DotContainerWithStates',
          key: Key('AW_DotContainerWithStates'),
          child: AW_DotContainerWithStates(widgetKey: Key('dot_test_key'), type: DotType.dotWithRing)),

      /// AW_ChallengeCardJapan
      Hero(
        tag: 'AW_ChallengeCardJapan',
        key: const Key('AW_ChallengeCardJapan'),
        child: Material(
          child: AW_ChallengeCardJapan(
            title: 'Title',
            userTeamName: 'User team name',
            downLeftWidget: const SizedBox(),
            cardTap: () => showInSnackBar('On press function', scaffoldKey, context),
            actionValue: 14,
            actionTitle: 'Team 2',
            leadingTitle: 'Team 1',
            centerTitle: 'Team 1',
            leadingValue: 0,
            centerValue: 34,
            infoText: 'Info text',
            isJapan: true,
            btnDisabled: false,
          ),
        ),
      ),

      /// AW_ChallengeItemImage
      Hero(
        tag: 'AW_ChallengeItemImage',
        key: const Key('AW_ChallengeItemImage'),
        child: Material(
          child: AW_ChallengeItemImage(
            title: 'Title',
            widgetKey: const Key('AW_ChallengeItemImage'),
            subtitle: 'Subtitle',
            buttonTitle: 'X',
            showJoinButton: true,
            onButtonPressed: () => showInSnackBar('On press function', scaffoldKey, context),
            image:
                'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/b9b4a63a-77eb-41cd-96c7-e7a7e1e3de5d/dgwlw8y-75840cf6-fbcf-4a85-bd05-f3b7113cce6a.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2I5YjRhNjNhLTc3ZWItNDFjZC05NmM3LWU3YTdlMWUzZGU1ZFwvZGd3bHc4eS03NTg0MGNmNi1mYmNmLTRhODUtYmQwNS1mM2I3MTEzY2NlNmEuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.Yifzls5KbYNoqbeZQXJuvpxMz4RZxinLlpLqSVMul6U',
          ),
        ),
      ),

      /// AW_CheckboxText
      Hero(
        tag: 'AW_CheckboxText',
        key: const Key('AW_CheckboxText'),
        child: AW_CheckboxText(
          text: 'Text',
          disabled: false,
          otherText: 'Check text',
          shouldUseRichTest: true,
          richText: '1: ',
          checkBoxIconColor: Colors.blueAccent,
          key: const Key('AW_CheckboxText'),
          newValue: true,
          onChange: (bool v) => showInSnackBar('On press function', scaffoldKey, context),
        ),
      ),

      /// AW_Co2RankingWidget
      const Hero(
        tag: 'AW_Co2RankingWidget',
        key: Key('AW_Co2RankingWidget'),
        child: Material(
          child: AW_Co2RankingWidget(
            separatorColor: Colors.grey,
            textColor: Colors.blueAccent,
            title: 'Ranking',
            valueDesc: 'g/km',
            imgSeparator: Assets.assetsDostSeparator,
            initialsMiddle: 'IM',
            initialsBottom: ['IB4', 'IB5'],
            initialsTop: ['IT1', 'IT2'],
            nameMiddle: 'Name middle',
            namesBottom: ['Name4', 'Name5'],
            namesTop: ['Name1', 'Name2'],
            rankMiddle: 17,
            rankBottomPlace: [34, 135],
            rankTopPlace: [1, 2],
            emissionMiddle: 8,
            emissionBottom: [12, 14],
            emissionTop: [0, 0.1],
          ),
        ),
      ),

      ///AW_Stepper
      Hero(
        tag: 'AW_Stepper',
        key: const Key('AW_Stepper'),
        child: Material(
          child: SizedBox(
            height: 200,
            width: 200,
            child: AW_Stepper(
              key: const Key('AW_Stepper'),
              steps: const <AW_Step>[
                AW_Step(content: Center(child: SizedBox(height: 200, child: Text('Step1')))),
                AW_Step(content: Center(child: SizedBox(height: 200, child: Text('Step2')))),
              ],
              completeColor: Colors.greenAccent,
              activeColor: Colors.blueAccent,
              inActiveColor: Colors.blueAccent,
              elevation: 2,
              currentStep: 1,
              index: 1,
              type: AW_StepperType.horizontal,
              onStepCancel: () => showInSnackBar('On press function', scaffoldKey, context),
              onStepContinue: () => showInSnackBar('On press function', scaffoldKey, context),
              onStepTapped: (int i) => showInSnackBar('On press function', scaffoldKey, context),
              physics: const NeverScrollableScrollPhysics(),
            ),
          ),
        ),
      ),

      /// AW_FullPageDialog
      Hero(
        tag: 'AW_FullPageDialog',
        key: const Key('AW_FullPageDialog'),
        child: ElevatedButton(
          onPressed: () {
            AW_FullPageDialog(context,
                title: 'Title',
                buttonText: 'Button',
                buttonColor: Colors.blueAccent,
                content:
                    'Content text, content.Content text, content.Content text, content.Content text, content.Content text, content.Content text, content.Content text, content.Content text, content.');
          },
          child: const Text('Open AW_FullPageDialog'),
        ),
      ),

      /// AW_InfoPopup
      Hero(
        tag: 'AW_InfoPopup',
        key: const Key('AW_InfoPopup'),
        child: ElevatedButton(
          onPressed: () {
            AW_InfoPopup(context,
                title: 'Title',
                buttonText: 'Button',
                buttonColor: Colors.blueAccent,
                content: 'Content text, content.Content text, content.Content text');
          },
          child: const Text('Open AW_InfoPopup'),
        ),
      ),

      /// AW_SimpleDialog
      Hero(
        tag: 'AW_SimpleDialog',
        key: const Key('AW_SimpleDialog'),
        child: ElevatedButton(
          onPressed: () {
            AW_SimpleDialog(context,
                title: 'Title',
                buttonText: 'Button',
                buttonColor: Colors.blueAccent,
                content: 'Content text, content.Content text, content.Content text');
          },
          child: const Text('Open AW_SimpleDialog'),
        ),
      ),

      /// AW_TwoButtonDialog
      Hero(
        tag: 'AW_TwoButtonDialog',
        key: const Key('AW_TwoButtonDialog'),
        child: ElevatedButton(
          onPressed: () {
            AW_TwoButtonDialog(context,
                title: 'Title',
                leftButtonText: 'Left button',
                rightButtonText: 'Right button',
                onRightButtonPressed: () => showInSnackBar('On press function', scaffoldKey, context),
                buttonColor: Colors.blueAccent,
                content: 'Content text, content.Content text, content.Content text');
          },
          child: const Text('Open AW_TwoButtonDialog'),
        ),
      ),

      /// AW_TypedDialog
      Hero(
        tag: 'AW_TypedDialog',
        key: const Key('AW_TypedDialog'),
        child: ElevatedButton(
          onPressed: () {
            AW_TypedDialog(
              context,
              DialogType.INFO,
              title: 'Title',
              content: 'Content text, content.Content text, content.Content text',
              buttonTitle: 'Button',
              bottomWidget: const SizedBox(),
              contentWidget: const SizedBox(),
              titleWidget: const SizedBox(),
              contentColor: Colors.blueAccent,
              canPop: true,
              key: 'AW_TypedDialog',
              onTap: () => showInSnackBar('On press function', scaffoldKey, context),
              barrierDismissible: true,
              imgForSpecificProfile: Assets.assetsBatteryIcon,
              specificUserProfileDialogInfo: false,
            );
          },
          child: const Text('Open AW_TypedDialog'),
        ),
      ),

      /// AW_CustomDrawer
      Hero(
        tag: 'AW_CustomDrawer',
        key: const Key('AW_CustomDrawer'),
        child: Material(
          child: ElevatedButton(
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
            child: const Icon(Icons.menu),
          ),
        ),
      ),

      /// AW_DrawerListItem
      Hero(
        tag: 'AW_DrawerListItem',
        key: const Key('AW_DrawerListItem'),
        child: Material(
          child: AW_DrawerListItem(
            imageColor: Colors.blueAccent,
            titleColor: Colors.blueAccent,
            title: 'Item 1',
            image: Assets.assetsIcSpeed,
            onTap: () => showInSnackBar('On press function', scaffoldKey, context),
            routeName: '',
            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.redAccent),
          ),
        ),
      ),

      /// AW_FAQListItem
      Hero(
        tag: 'AW_FAQListItem',
        key: const Key('AW_FAQListItem'),
        child: Material(
          child: AW_FAQListItem(
            key: const Key('AW_FAQListItem'),
            arrowsAssetClosed: SvgPicture.asset(Assets.assetsIcStatItemArrowsClosed),
            arrowsAssetOpened: SvgPicture.asset(Assets.assetsIcStatItemArrowsOpened),
            description: 'FAQ item description',
            title: 'FAQ item title',
          ),
        ),
      ),

      /// AW_FilterAigComponent
      Hero(
        tag: 'AW_FilterAigComponent',
        key: const Key('AW_FilterAigComponent'),
        child: Material(
          child: AW_FilterAigComponent(
            widgetKey: const Key('AW_FilterAigComponent'),
            listItem: ShieldListHelper().shields,
            selectedShieldId: 0,
            selectedFilterColor: Colors.blueAccent,
            onItemClick: (String s, int i) => showInSnackBar('On press function', scaffoldKey, context),
          ),
        ),
      ),

      /// AW_GeofenceItem
      const Hero(
        tag: 'AW_GeofenceItem',
        key: Key('AW_GeofenceItem'),
        child: Material(
          child: AW_GeofenceItem(
            key: Key('AW_GeofenceItem'),
            checkBoxColor: Colors.red,
            checkBoxPath: Assets.assetsIcSwoosh,
            checkBoxTapped: true,
            text: 'Text',
          ),
        ),
      ),

      /// AW_TappableGooglePlace
      Hero(
        tag: 'AW_TappableGooglePlace',
        key: const Key('AW_TappableGooglePlace'),
        child: Material(
          child: AW_TappableGooglePlace(
            key: const Key('AW_GeofenceItem'),
            place: 'Manchester',
            isSelected: true,
            onTap: () => showInSnackBar('On press function', scaffoldKey, context),
          ),
        ),
      ),

      /// AW_InboxListItem
      Hero(
        tag: 'AW_InboxListItem',
        key: const Key('AW_InboxListItem'),
        child: Material(
          child: AW_InboxListItem(
            key: const Key('AW_InboxListItem'),
            onTap: () => showInSnackBar('On press function', scaffoldKey, context),
            title: 'Title',
            dateReadColor: Colors.black,
            dateTime: '06.03.',
            textContent: 'Text content content content content content content',
            imageUrl:
                'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/82114837-0066-42c3-990d-755b33d0743a/dgw053q-46b09f3e-36a2-4975-a767-df22c40451ca.jpg/v1/fill/w_1192,h_670,q_70,strp/swamp_dragon_by_travis_anderson_dgw053q-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9OTAwIiwicGF0aCI6IlwvZlwvODIxMTQ4MzctMDA2Ni00MmMzLTk5MGQtNzU1YjMzZDA3NDNhXC9kZ3cwNTNxLTQ2YjA5ZjNlLTM2YTItNDk3NS1hNzY3LWRmMjJjNDA0NTFjYS5qcGciLCJ3aWR0aCI6Ijw9MTYwMCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19._SNnsEcUHyx863Ph0fXfTXB5CO_SjLlLcwM3nZbPak8',
          ),
        ),
      ),

      /// AW_InboxReplyItem
      const Hero(
        tag: 'AW_InboxReplyItem',
        key: Key('AW_InboxReplyItem'),
        child: Material(
          child: AW_InboxReplyItem(
            key: Key('AW_InboxReplyItem'),
            dateTime: '06.03.',
            textContent: 'Text content content content content content content',
            imageUrl:
                'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/82114837-0066-42c3-990d-755b33d0743a/dgw053q-46b09f3e-36a2-4975-a767-df22c40451ca.jpg/v1/fill/w_1192,h_670,q_70,strp/swamp_dragon_by_travis_anderson_dgw053q-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9OTAwIiwicGF0aCI6IlwvZlwvODIxMTQ4MzctMDA2Ni00MmMzLTk5MGQtNzU1YjMzZDA3NDNhXC9kZ3cwNTNxLTQ2YjA5ZjNlLTM2YTItNDk3NS1hNzY3LWRmMjJjNDA0NTFjYS5qcGciLCJ3aWR0aCI6Ijw9MTYwMCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19._SNnsEcUHyx863Ph0fXfTXB5CO_SjLlLcwM3nZbPak8',
          ),
        ),
      ),

      /// AW_InboxReplyItemNew
      const Hero(
        tag: 'AW_InboxReplyItemNew',
        key: Key('AW_InboxReplyItemNew'),
        child: Material(
          child: AW_InboxReplyItemNew(
            key: Key('AW_InboxReplyItemNew'),
            dateTime: '06.03.',
            actionButtonLabel: 'Action',
            textContent: 'Text content content content content content content',
          ),
        ),
      ),

      /// AW_ProgressBarWithPoints
      const Hero(
        tag: 'AW_ProgressBarWithPoints',
        key: Key('AW_ProgressBarWithPoints'),
        child: Material(
          child: AW_ProgressBarWithPoints(
            widgetKey: Key('AW_ProgressBarWithPoints'),
            progress: 0.6,
            backgroundStrokeCap: StrokeCap.round,
            progressStrokeWidth: 6,
            points: <double>[0.5, 0.75],
            pointColor: Colors.white,
            progressColor: Colors.red,
            backgroundColor: Colors.grey,
            backgroundStrokeWidth: 6,
            progressStrokeCap: StrokeCap.round,
          ),
        ),
      ),

      /// AW_LinearPercentageWithLabelsAndImage
      const Hero(
        tag: 'AW_LinearPercentageWithLabelsAndImage',
        key: Key('AW_LinearPercentageWithLabelsAndImage'),
        child: Material(
            child: AW_LinearPercentageWithLabelsAndImage(
          widgetKey: Key('driving_score_discount_progress_test_key'),
          title: 'Driving score: ',
          points: <double>[0.5, 0.75],
          progressColor: Colors.red,
          discountCondition: '82',
          progress: 82,
          progressStrokeCap: StrokeCap.round,
        )),
      ),

      /// AW_DemoNewsItem
      Hero(
        tag: 'AW_DemoNewsItem',
        key: const Key('AW_DemoNewsItem'),
        child: Material(
            child: AW_DemoNewsItem(
          key: const Key('AW_DemoNewsItem'),
          date: 'Sep 28, 2022',
          title: 'Title',
          imageFit: BoxFit.fill,
          description:
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
          icon: Icons.add,
          image:
              'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/b07363b1-b254-4d60-8ff1-8db38b9139cf/dgvx3fy-78f7d6df-ae6f-488a-b7d0-774114432ca5.jpg/v1/fill/w_894,h_894,q_70,strp/car_orange__by_bulmiro_dgvx3fy-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTAyNCIsInBhdGgiOiJcL2ZcL2IwNzM2M2IxLWIyNTQtNGQ2MC04ZmYxLThkYjM4YjkxMzljZlwvZGd2eDNmeS03OGY3ZDZkZi1hZTZmLTQ4OGEtYjdkMC03NzQxMTQ0MzJjYTUuanBnIiwid2lkdGgiOiI8PTEwMjQifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.oH1jE2OgiQK-6Z1deMiFebry7LynaKD7YAddmmd-lXM',
          onTap: () => showInSnackBar('On press function', scaffoldKey, context),
        )),
      ),

      /// AW_NewsVerticalListItem
      Hero(
        tag: 'AW_NewsVerticalListItem',
        key: const Key('AW_NewsVerticalListItem'),
        child: Material(
            child: AW_NewsVerticalListItem(
          onTap: () => showInSnackBar('On press function', scaffoldKey, context),
          title: 'Title',
          leadText: 'Lead text',
          readMoreText: 'Read more',
          imageUrl:
              'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/15601231-7c5b-425c-a12a-fc48868e6c49/dcs4s8c-f685f348-42ec-4e65-8fad-148541d62e62.jpg/v1/fill/w_893,h_895,q_70,strp/cube_secret_by_djape028_dcs4s8c-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTAyNiIsInBhdGgiOiJcL2ZcLzE1NjAxMjMxLTdjNWItNDI1Yy1hMTJhLWZjNDg4NjhlNmM0OVwvZGNzNHM4Yy1mNjg1ZjM0OC00MmVjLTRlNjUtOGZhZC0xNDg1NDFkNjJlNjIuanBnIiwid2lkdGgiOiI8PTEwMjQifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.oR3ijihHANl6F4A2p4uj4PRTuScvcJUnS8NCSNrDK2c',
          leadTextStyle: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 14.0),
          readMoreTextStyle: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 14.0, color: Colors.black38),
        )),
      ),

      ///AW_CustomModalSheet
      Hero(
        tag: 'AW_CustomModalSheet',
        key: const Key('AW_CustomModalSheet'),
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet<dynamic>(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return AW_CustomModalSheet(
                    shouldUseHeight: true,
                    onClosePressed: () => Navigator.of(context).pop(),
                    height: MediaQuery.of(context).size.height / 1.1,
                    bodyWidget: ListView(
                      padding: const EdgeInsets.all(10),
                      children: <Widget>[
                        Image.network(
                            'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/582d158f-8f07-4157-97b9-d90fbabe6ea1/dcqwwm2-e90b469f-8933-4e95-9741-269808a860e6.jpg/v1/fill/w_894,h_894,q_70,strp/the_dispersed_expectance_ii_by_moodyblue_dcqwwm2-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9OTYwIiwicGF0aCI6IlwvZlwvNTgyZDE1OGYtOGYwNy00MTU3LTk3YjktZDkwZmJhYmU2ZWExXC9kY3F3d20yLWU5MGI0NjlmLTg5MzMtNGU5NS05NzQxLTI2OTgwOGE4NjBlNi5qcGciLCJ3aWR0aCI6Ijw9OTYwIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.jy-8Y4LZv65EFJjefAA5suzCFbEckx7IB5thTE9K_QI'),
                        const SizedBox(height: 20.4),
                        Text('Title', style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 24.0)),
                        const SizedBox(height: 8),
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
                          style: Theme.of(context).textTheme.titleMedium,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    bottomWidget: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 50,
                      child: AW_Button(
                        buttonTitle: 'Allow',
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  );
                });
          },
          child: const Text('Open AW_CustomModalSheet'),
        ),
      ),

      ///AW_NextPreviousWidget
      Hero(
        tag: 'AW_NextPreviousWidget',
        key: const Key('AW_NextPreviousWidget'),
        child: Material(
          child: AW_NextPreviousWidget(
            backgroundColor: Colors.blueAccent,
            textColor: Colors.white,
            arrowColor: Colors.black38,
            middleText: 'Text',
            onNextPressed: () => showInSnackBar('On press function', scaffoldKey, context),
            onPreviousPressed: () => showInSnackBar('On press function', scaffoldKey, context),
          ),
        ),
      ),

      ///AW_NoDataIndicator
      const Hero(
        tag: 'AW_NoDataIndicator',
        key: Key('AW_NoDataIndicator'),
        child: Material(
          child: AW_NoDataIndicator(
            text: 'No data text',
            imagePath: Assets.assetsAppBarLogo,
          ),
        ),
      ),

      ///AW_OdometerItem
      Hero(
        tag: 'AW_OdometerItem',
        key: const Key('AW_OdometerItem'),
        child: Material(
          child: AW_OdometerItem(
            onIconPressed: () => showInSnackBar('On press function', scaffoldKey, context),
            onImagePressed: () => showInSnackBar('On press function', scaffoldKey, context),
            title: 'Title',
            date: '07.03.',
            imageUrl:
                'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/d66aa141-f1b0-4af7-8ca7-5df86d21fe5e/dgk3xtb-b3eb485c-5f26-4320-9e10-1a17e79a0bc7.jpg/v1/fit/w_600,h_750,q_70,strp/concrete_whimsy_by_thelovetrain_dgk3xtb-375w-2x.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NzUwIiwicGF0aCI6IlwvZlwvZDY2YWExNDEtZjFiMC00YWY3LThjYTctNWRmODZkMjFmZTVlXC9kZ2szeHRiLWIzZWI0ODVjLTVmMjYtNDMyMC05ZTEwLTFhMTdlNzlhMGJjNy5qcGciLCJ3aWR0aCI6Ijw9NjAwIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.NBHoKcIT0X8r5tNq99uAEq6bUT464qtpypmRXUrz0pI',
          ),
        ),
      ),

      ///AW_OpenContainer
      Hero(
        tag: 'AW_OpenContainer',
        key: const Key('AW_OpenContainer'),
        child: Material(
          child: AW_OpenContainer(
            title: 'Title',
            closedText: 'Closed text',
            isOpened: false,
            openText:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
          ),
        ),
      ),

      ///AW_PageViewIndicatorDots
      const Hero(
        tag: 'AW_PageViewIndicatorDots',
        key: Key('AW_PageViewIndicatorDots'),
        child: Material(
          child: AW_PageViewIndicatorDots(
            widgetKey: Key('AW_PageViewIndicatorDots'),
            currentIndex: 0,
            numberOfDots: 4,
            selectedColor: Colors.blue,
            unselectedColor: Colors.red,
          ),
        ),
      ),

      ///AW_SupervisionInfoItem
      Hero(
        tag: 'AW_SupervisionInfoItem',
        key: const Key('AW_SupervisionInfoItem'),
        child: Material(
          child: AW_SupervisionInfoItem(
            title: 'Title',
            hasInfoButton: true,
            onPressed: () => showInSnackBar('On press function', scaffoldKey, context),
            key: const Key('AW_SupervisionInfoItem'),
          ),
        ),
      ),

      ///AW_ParentalControlItem
      const Hero(
        tag: 'AW_ParentalControlItem',
        key: Key('AW_ParentalControlItem'),
        child: Material(
          child: AW_ParentalControlItem(
            dialogContent:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
            title: 'Title',
            buttonTitle: 'Button',
            dialogTitle: 'Dialog',
            titleColor: Colors.blueAccent,
            descriptionColor: Colors.blueAccent,
          ),
        ),
      ),

      ///AW_PermissionsPageViewItem
      Hero(
        tag: 'AW_PermissionsPageViewItem',
        key: const Key('AW_PermissionsPageViewItem'),
        child: Material(
          child: SizedBox(
            height: 200,
            child: AW_PermissionsPageViewItem(
              onEnabledTap: () => showInSnackBar('On press function', scaffoldKey, context),
              onSkipTap: () => showInSnackBar('On press function', scaffoldKey, context),
              widgetKey: const Key('AW_ParentalControlItem'),
              imageAssetPath: Assets.assetsIcDialogAutoSuccess,
              title: 'Title',
              contentText:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ind',
              skipButtonText: 'Skip',
              enableButtonText: 'Enable',
            ),
          ),
        ),
      ),

      ///AW_PolicyActionsItem
      Hero(
        tag: 'AW_PolicyActionsItem',
        key: const Key('AW_PolicyActionsItem'),
        child: Material(
          child: AW_PolicyActionsItem(
            key: const Key('AW_PolicyActionsItem'),
            icon: SvgPicture.asset(Assets.assetsIcSpeed),
            onTap: () => showInSnackBar('On press function', scaffoldKey, context),
            title: 'Change Policy Details',
          ),
        ),
      ),

      ///AW_PolicyCompletion
      const Hero(
        tag: 'AW_PolicyCompletion',
        key: Key('AW_PolicyCompletion'),
        child: Material(
          child: AW_PolicyCompletion(
            key: Key('AW_PolicyCompletion'),
            maxAvailable: 150,
            completed: 10,
            backgroundColor: Colors.blueAccent,
            label: 'Min distance',
          ),
        ),
      ),

      ///AW_PolicyData
      Hero(
        tag: 'AW_PolicyData',
        key: const Key('AW_PolicyData'),
        child: Material(
          child: AW_PolicyData(
            key: const Key('AW_PolicyData'),
            scoreLabel: 'Score',
            totalScore: 88,
            items: <AW_PolicyScoreItem>[
              for (int i = 0; i < labels.length; i++)
                AW_PolicyScoreItem(backgroundColor: Colors.red, label: Text(labels[i]), score: values[i])
            ],
          ),
        ),
      ),

      ///AW_PolicyDetailItem
      Hero(
        tag: 'AW_PolicyDetailItem',
        key: const Key('AW_PolicyDetailItem'),
        child: Material(
          child: AW_PolicyDetailItem(
            key: const Key('AW_PolicyDetailItem'),
            icon: SvgPicture.asset(Assets.assetsIcSpeed),
            topText: 'Richard Jameson',
            bottomText: 'Seat Ateca 1.6 TDI ZG3145FH',
          ),
        ),
      ),

      ///AW_PolicyPopupItem
      Hero(
        tag: 'AW_PolicyPopupItem',
        key: const Key('AW_PolicyPopupItem'),
        child: Material(
          child: AW_PolicyPopupItem(
            key: const Key('AW_PolicyPopupItem'),
            label: 'Label',
            iconData: Icons.car_rental,
            textColor: Colors.blueAccent,
            onInfoTap: () => showInSnackBar('On press function', scaffoldKey, context),
            value: 'Motor Telematic insurance',
          ),
        ),
      ),

      ///AW_PolicyScoreItem
      const Hero(
        tag: 'AW_PolicyScoreItem',
        key: Key('AW_PolicyScoreItem'),
        child: Material(
          child: AW_PolicyScoreItem(
            backgroundColor: Colors.red,
            label: Text('12'),
            width: 20,
            labelColor: Colors.black,
            score: 88,
            maxHeight: 150,
          ),
        ),
      ),

      ///AW_AmodoBanner
      const Hero(
        tag: 'AW_AmodoBanner',
        key: Key('AW_AmodoBanner'),
        child: Material(
          child: AW_AmodoBanner(
            backgroundColor: Colors.white,
          ),
        ),
      ),

      ///AW_BasicPolicyCard
      const Hero(
        tag: 'AW_BasicPolicyCard',
        key: Key('AW_BasicPolicyCard'),
        child: Material(
          child: AW_BasicPolicyCard(
            key: Key('AW_BasicPolicyCard'),
            policyName: 'Motor Telematics insurance',
            backgroundColor: Colors.blueAccent,
            extraInfo:
                'Excellent basic coverage with extra coverage options\nCover anytime, anywhere\nBoost your policy to earn up to 15% discount',
          ),
        ),
      ),

      ///AW_DynamicPolicyCard
      Hero(
        tag: 'AW_DynamicPolicyCard',
        key: const Key('AW_DynamicPolicyCard'),
        child: Material(
          child: SizedBox(
            height: 210,
            child: AW_DynamicPolicyCard(
              key: const Key('AW_DynamicPolicyCard'),
              carInfo: 'Seat Ateca 1.6 TDI ZG3145FH',
              extraInfo: 'Dynamic monthy premium',
              policyName: 'Motor telematics insurance',
              userName: 'Richard Jameson',
              price: '25€/month',
              policyType: 'Dynamic monthy premium',
              icon: SvgPicture.asset(Assets.assetsBatteryIcon),
              maxPrice: '480',
              priceRange: 'Max per year',
              backgroundColor: Colors.blueAccent,
            ),
          ),
        ),
      ),

      ///AW_Pentagon
      const Hero(
        tag: 'AW_Pentagon',
        key: Key('AW_Pentagon'),
        child: Material(
          child: SizedBox(
            height: 400,
            child: AW_Pentagon(
              key: Key('AW_Pentagon'),
              valueA: 5,
              valueB: 5,
              valueC: 5,
              valueD: 3.2,
              valueE: 5,
              radius: 120,
              axisColor: Colors.blueAccent,
              connectorColor: Colors.blueAccent,
              labelA: 'Aggressive driving',
              labelB: '',
              labelC: 'CO2',
              labelD: 'Lifestyle',
              labelE: '',
              labelsColor: Colors.red,
            ),
          ),
        ),
      ),

      ///AW_PentagonOutline
      const Hero(
        tag: 'AW_PentagonOutline',
        key: Key('AW_PentagonOutline'),
        child: Material(
          child: SizedBox(
            height: 400,
            child: AW_PentagonOutline(
              key: Key('AW_PentagonOutline'),
              valueA: 5,
              valueB: 5,
              valueC: 5,
              valueD: 3.2,
              valueE: 5,
              radius: 80,
              labelA: 'Aggressive driving',
              labelB: '',
              labelC: 'CO2',
              labelD: 'Lifestyle',
              labelE: '',
              circleColor: Colors.redAccent,
              lineColor: Colors.blueAccent,
              lineWidth: 1,
              filled: false,
              outlineFillColor: Colors.blueAccent,
              valueLineColor: Colors.blueAccent,
              valueLineWidth: 1,
              valueFilledColor: Colors.blueAccent,
              shouldDrawLines: true,
            ),
          ),
        ),
      ),

      /// AW_PrivilegesItem
      Hero(
        tag: 'AW_PrivilegesItem',
        key: const Key('AW_PrivilegesItem'),
        child: Material(
          child: AW_PrivilegesItem(
            onTap: () => showInSnackBar('On press function', scaffoldKey, context),
            title: 'Title',
            leadText: 'Lead text',
            headerImage:
                'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/5181c7f5-4300-4d23-a0d1-d0cc2a40214b/dg6jf9o-ed35e76e-8c26-449f-8194-9ee70c5e1bac.jpg/v1/fit/w_828,h_1160,q_70,strp/trident_by_tobiasroetsch_dg6jf9o-414w-2x.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTY4MCIsInBhdGgiOiJcL2ZcLzUxODFjN2Y1LTQzMDAtNGQyMy1hMGQxLWQwY2MyYTQwMjE0YlwvZGc2amY5by1lZDM1ZTc2ZS04YzI2LTQ0OWYtODE5NC05ZWU3MGM1ZTFiYWMuanBnIiwid2lkdGgiOiI8PTEyMDAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.60dBJiRlo2nWRQulUiB-PcJyX7eJ9QV9uz3HGhxduu8',
          ),
        ),
      ),

      /// AW_PrizeItem
      Hero(
        tag: 'AW_PrizeItem',
        key: const Key('AW_PrizeItem'),
        child: Material(
          child: AW_PrizeItem(
            showClaimButton: true,
            widgetKey: const Key('AW_PrizeItem'),
            image:
                'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/ec7d26b1-d557-47c1-a877-6050004d2fc2/dbb7hcs-1f9e8f0a-c4c7-4fc9-baf6-9e075ce86e30.jpg/v1/fill/w_1210,h_661,q_70,strp/cyberpunk_city_by_artursadlos_dbb7hcs-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTA0OSIsInBhdGgiOiJcL2ZcL2VjN2QyNmIxLWQ1NTctNDdjMS1hODc3LTYwNTAwMDRkMmZjMlwvZGJiN2hjcy0xZjllOGYwYS1jNGM3LTRmYzktYmFmNi05ZTA3NWNlODZlMzAuanBnIiwid2lkdGgiOiI8PTE5MjAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.GD3LU0BXLk6l52PMsWZ_qnZ_iGnMQ5RXm92XjTWjoDA',
            prizeBody:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In egestas purus at elit tempor sollicitudin.',
            prizesRemaining: 19,
            prizeTitle: 'Prize title',
            buttonTitle: 'Collect',
            onButtonPressed: () => showInSnackBar('On press function', scaffoldKey, context),
          ),
        ),
      ),

      /// AW_PrizeItemDemo
      Hero(
        tag: 'AW_PrizeItemDemo',
        key: const Key('AW_PrizeItemDemo'),
        child: Material(
          child: AW_PrizeItemDemo(
            key: const Key('AW_PrizeItemDemo'),
            image:
                'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/ec7d26b1-d557-47c1-a877-6050004d2fc2/dbzo626-803278c8-2f8a-469a-a012-f027cbbdd17f.jpg/v1/fill/w_1327,h_602,q_70,strp/deep_desert__mooeti__by_artursadlos_dbzo626-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NzI2IiwicGF0aCI6IlwvZlwvZWM3ZDI2YjEtZDU1Ny00N2MxLWE4NzctNjA1MDAwNGQyZmMyXC9kYnpvNjI2LTgwMzI3OGM4LTJmOGEtNDY5YS1hMDEyLWYwMjdjYmJkZDE3Zi5qcGciLCJ3aWR0aCI6Ijw9MTYwMCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.aMvW3S-k-aUgfkVJGb6wuobNl_FhBS0P0UOd3iSVINM',
            prizeBody:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In egestas purus at elit tempor sollicitudin.',
            prizesRemaining: 19,
            prizeTitle: 'Prize title',
            alreadyParticipate: false,
            prizeRemainingText: '',
            isNewPrize: false,
            buttonTitle: 'Collect',
            newPrizeText: '',
            isActive: true,
            canParticipate: false,
            prizeClaimedIcon: SvgPicture.asset(Assets.assetsBatteryIcon),
            prizedExpiredIcon: SvgPicture.asset(Assets.assetsBatteryIcon),
            notActionableMessage: 'Not actionable',
            prizeExpired: 'Prize expired',
            onTap: () => showInSnackBar('On press function', scaffoldKey, context),
          ),
        ),
      ),

      /// AW_PrizeItemImage
      Hero(
        tag: 'AW_PrizeItemImage',
        key: const Key('AW_PrizeItemImage'),
        child: Material(
          child: AW_PrizeItemImage(
            widgetKey: const Key('AW_PrizeItemImage'),
            image:
                'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/ec7d26b1-d557-47c1-a877-6050004d2fc2/dbd5p1w-cbd85295-ec36-4341-bc67-5f3750401eca.jpg/v1/fill/w_1232,h_649,q_70,strp/war_relic_by_artursadlos_dbd5p1w-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9Njc0IiwicGF0aCI6IlwvZlwvZWM3ZDI2YjEtZDU1Ny00N2MxLWE4NzctNjA1MDAwNGQyZmMyXC9kYmQ1cDF3LWNiZDg1Mjk1LWVjMzYtNDM0MS1iYzY3LTVmMzc1MDQwMWVjYS5qcGciLCJ3aWR0aCI6Ijw9MTI4MCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.zM_yNUn3ShvdeWbOB5ZVoDjm1fNPh9VR9f7k8SK66zs',
            alreadyParticipate: false,
            buttonTitle: 'Collect',
            onButtonPressed: () => showInSnackBar('On press function', scaffoldKey, context),
            showClaimButton: true,
            title: 'Title',
          ),
        ),
      ),

      /// AW_PercentageProgressBar
      Hero(
        tag: 'AW_PercentageProgressBar',
        key: const Key('AW_PercentageProgressBar'),
        child: Material(
          child: AW_PercentageProgressBar(
            title: 'Title',
            names: _namesTest,
            values: _valuesTest,
            colors: _colorTest,
            onInfoPressed: () => showInSnackBar('On press function', scaffoldKey, context),
            widgetKey: const Key('AW_PercentageProgressBar'),
            isExpired: false,
          ),
        ),
      ),

      /// AW_PercentageProgressBarEngagement
      Hero(
        tag: 'AW_PercentageProgressBarEngagement',
        key: const Key('AW_PercentageProgressBarEngagement'),
        child: Material(
          child: AW_PercentageProgressBarEngagement(
            values: _valuesTest,
            widgetKey: const Key('AW_PercentageProgressBarEngagement'),
            userValue: 12,
            userValueTitle: 'Value title',
            myScore: 'My score',
            colors: const <String>['0xFF1400FF', '0xFF021764'],
          ),
        ),
      ),

      /// AW_QuoteNavbar
      Hero(
        tag: 'AW_QuoteNavbar',
        key: const Key('AW_QuoteNavbar'),
        child: Material(
          child: AW_QuoteNavbar(
            key: const Key('AW_QuoteNavbar'),
            actionText: 'Connect',
            buttonText: 'X',
            backgroundColor: Colors.blueAccent,
            onButtonTap: () => showInSnackBar('On press function', scaffoldKey, context),
            questionText: 'Already a customer?',
            onAction: () => showInSnackBar('On press function', scaffoldKey, context),
            buttonDisabled: false,
          ),
        ),
      ),

      /// AW_RewardContestCard
      Hero(
        tag: 'AW_RewardContestCard',
        key: const Key('AW_RewardContestCard'),
        child: Material(
          child: AW_RewardContestCard(
            infoText: 'Info',
            isJapan: true,
            rightCornerBtnText: 'X',
            cardTap: () => showInSnackBar('On press function', scaffoldKey, context),
          ),
        ),
      ),

      /// AW_RiskCardItem
      Hero(
        tag: 'AW_RiskCardItem',
        key: const Key('AW_RiskCardItem'),
        child: Material(
          child: SizedBox(
            height: 200,
            child: AW_RiskCardItem(
              description:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make",
              title: 'Title',
              discount: '23',
              textColor: Colors.white,
              backgroundColor: Colors.blueAccent,
              onTap: () => showInSnackBar('On press function', scaffoldKey, context),
              // imageAsset: Assets.assetsIcDialogAutoSuccess,
            ),
          ),
        ),
      ),

      /// AW_SeeAllWidget
      Hero(
        tag: 'AW_SeeAllWidget',
        key: const Key('AW_SeeAllWidget'),
        child: Material(
          child: AW_SeeAllWidget(
            leftText: 'Challenges',
            rightText: 'See all',
            onRightTextClick: () => showInSnackBar('On press function', scaffoldKey, context),
            rightTextColor: Colors.blueAccent,
            leftTextStyle: Theme.of(context).textTheme.headlineSmall,
            rightTextStyle:
                Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
            padding: const EdgeInsets.symmetric(horizontal: 20),
          ),
        ),
      ),

      /// AW_SelectableList
      Hero(
        tag: 'AW_SelectableList',
        key: const Key('AW_SelectableList'),
        child: Material(
          child: AW_SelectableList(
            key: const Key('AW_SelectableList'),
            selectedIndex: 0,
            // ignore: prefer_const_literals_to_create_immutables
            onItemSelected: (int index) {
              isItemPressed = true;
            },
            items: const <String>[element0, 'e1'],
          ),
        ),
      ),

      /// AW_SettingsGroupItem
      Hero(
        tag: 'AW_SettingsGroupItem',
        key: const Key('AW_SettingsGroupItem'),
        child: Material(
          child: AW_SettingsGroupItem(
            title: 'Title',
            description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
            titleStyle: TextStyle(color: ColorHelper.aigCyan.color, fontSize: 14, fontWeight: FontWeight.w600),
            onTap: () => showInSnackBar('On press function', scaffoldKey, context),
            leadingIcon: Assets.assetsAppBarLogo,
            trailingIconColor: ColorHelper.aigCyan.color,
            leadingIconColor: ColorHelper.aigCyan.color,
          ),
        ),
      ),

      /// AW_SettingsSection
      Hero(
        tag: 'AW_SettingsSection',
        key: const Key('AW_SettingsSection'),
        child: Material(
          child: AW_SettingsSection(
            key: const Key('AW_SettingsSection'),
            sectionName: 'Section title',
            items: SettingsItems().sectionItems(scaffoldKey, context),
          ),
        ),
      ),

      /// SettingsSectionItemModel
      Hero(
        tag: 'SettingsSectionItemModel',
        key: const Key('SettingsSectionItemModel'),
        child: Material(
          child: AW_SettingsSectionItem(
            key: const Key('SettingsSectionItemModel'),
            itemModel: SettingsSectionItemModel(
              onTap: () => showInSnackBar('On press function', scaffoldKey, context),
              title: 'Item 1',
              badgeNumber: 1,
            ),
          ),
        ),
      ),

      /// AW_ProfileDataTappableItem
      Hero(
        tag: 'AW_ProfileDataTappableItem',
        key: const Key('AW_ProfileDataTappableItem'),
        child: Material(
          child: AW_ProfileDataTappableItem(
            key: const Key('AW_ProfileDataTappableItem'),
            onTap: () => showInSnackBar('On press function', scaffoldKey, context),
            firstName: 'First',
            lastName: 'Last',
            email: 'email.test@gmail.com',
          ),
        ),
      ),

      /// AW_ShieldCard
      const Hero(
        tag: 'AW_ShieldCard',
        key: Key('AW_ShieldCard'),
        child: Material(
          child: AW_ShieldCard(
            widgetKey: Key('AW_ShieldCard'),
            title: 'Shield title',
            image:
                'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/b3be1dae-3caa-4d45-be6c-3de586ba95e2/defsaga-0b005d64-4668-48a4-b5ab-c5df9b8fa0e2.jpg/v1/fill/w_1192,h_670,q_70,strp/mountain_range_by_bisbiswas_defsaga-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTA4MCIsInBhdGgiOiJcL2ZcL2IzYmUxZGFlLTNjYWEtNGQ0NS1iZTZjLTNkZTU4NmJhOTVlMlwvZGVmc2FnYS0wYjAwNWQ2NC00NjY4LTQ4YTQtYjVhYi1jNWRmOWI4ZmEwZTIuanBnIiwid2lkdGgiOiI8PTE5MjAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.uaOvEEI7abVQTP6eI2aV6l_VzYe0FOk8MfYUGZ7D9mA',
            iconDuration: Assets.assetsBatteryIcon,
            iconPrice: Assets.assetsIcSpeed,
            durationValue: '1-60 days',
            isInverted: false,
            priceValue: '5 / day',
          ),
        ),
      ),

      /// AW_ShieldHomepageCard
      Hero(
        tag: 'AW_ShieldHomepageCard',
        key: const Key('AW_ShieldHomepageCard'),
        child: Material(
          child: AW_ShieldHomepageCard(
            widgetKey: const Key('AW_ShieldHomepageCard'),
            title: 'Shield title',
            btnTitle: 'Button',
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
            image:
                'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/287eab66-0f73-4b97-8e74-849c5f06d542/dckxntm-a149c5f0-34a1-472d-9e30-e3919dccd386.jpg/v1/fill/w_1095,h_730,q_70,strp/japan_by_anthonypresley_dckxntm-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTAwMCIsInBhdGgiOiJcL2ZcLzI4N2VhYjY2LTBmNzMtNGI5Ny04ZTc0LTg0OWM1ZjA2ZDU0MlwvZGNreG50bS1hMTQ5YzVmMC0zNGExLTQ3MmQtOWUzMC1lMzkxOWRjY2QzODYuanBnIiwid2lkdGgiOiI8PTE1MDAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.oAaiFCNcEY9AX-ClSlJ2qcBnbm-Iv-hkr39k0KtcMY0',
            onButtonPressed: () => showInSnackBar('On press function', scaffoldKey, context),
          ),
        ),
      ),

      /// AW_ShieldPorscheCard
      const Hero(
        tag: 'AW_ShieldPorscheCard',
        key: Key('AW_ShieldPorscheCard'),
        child: Material(
          child: AW_ShieldPorscheCard(
            widgetKey: Key('AW_ShieldPorscheCard'),
            title: 'Shield title',
            image:
                'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/3f80e9ee-fa2f-44ad-8093-96c7f882e5e2/dgrhast-173eae42-c790-4ff5-84ef-05e6f8553fa9.jpg/v1/fill/w_894,h_894,q_70,strp/pop_art_sunflowers_by_mizbrown_dgrhast-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTAyNCIsInBhdGgiOiJcL2ZcLzNmODBlOWVlLWZhMmYtNDRhZC04MDkzLTk2YzdmODgyZTVlMlwvZGdyaGFzdC0xNzNlYWU0Mi1jNzkwLTRmZjUtODRlZi0wNWU2Zjg1NTNmYTkuanBnIiwid2lkdGgiOiI8PTEwMjQifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.VKeJW6yBw_0TJUjWihTxksvKY2AJdpi64uO7BumZLvY',
            price: '99',
            bottomRightText: 'Sample text',
            per: 'Shield',
            coverageStart: '01.01.',
            priceTitle: 'Euro',
          ),
        ),
      ),

      /// AW_StatisticHomeItem
      const Hero(
        tag: 'AW_StatisticHomeItem',
        key: Key('AW_StatisticHomeItem'),
        child: Material(
          child: AW_StatisticHomeItem(
            widgetKey: Key('AW_StatisticHomeItem'),
            title: 'Statistic',
            value: '',
            widgetHeight: 200,
            actionItemIcon: Assets.assetsIcTimeIcon,
            centerItemIcon: Assets.assetsIcTeam,
            leadingItemIcon: Assets.assetsIcTrips,
            actionItemTitle: 'Time',
            actionItemValue: '12h',
            centerItemTitle: 'Team',
            centerItemValue: 'Team A',
            leadingItemTitle: 'Trips',
            leadingItemValue: '15',
          ),
        ),
      ),

      /// AW_DemoStatisticItem
      const Hero(
        tag: 'AW_DemoStatisticItem',
        key: Key('AW_DemoStatisticItem'),
        child: Material(
          child: AW_DemoStatisticItem(
            key: Key('AW_DemoStatisticItem'),
            title: 'Statistic',
            value: '',
            actionItemIcon: Assets.assetsIcTimeIcon,
            centerItemIcon: Assets.assetsIcTeam,
            leadingItemIcon: Assets.assetsIcTrips,
            actionItemTitle: 'Time',
            actionItemValue: '12h',
            centerItemTitle: 'Team',
            centerItemValue: 'Team A',
            leadingItemTitle: 'Trips',
            leadingItemValue: '15',
            valuesVerticalSpacing: 2,
            totalValueStyle: TextStyle(color: Colors.blueAccent),
            valuesTextStyle: TextStyle(color: Colors.black),
            showSpacers: true,
          ),
        ),
      ),
    ];
