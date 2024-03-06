import 'package:cmt/generated/assets.dart';
import 'package:flutter/material.dart';
import '../../../theme/color_helper.dart';
import '../../widgets/widgets.dart';
import 'bottom_navigation_list.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    ];
