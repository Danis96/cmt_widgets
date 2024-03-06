part of widgets;

class AW_ChallengeCardJapan extends StatelessWidget {
  const AW_ChallengeCardJapan({
    this.infoIconColor = const Color.fromRGBO(15, 153, 221, 1),
    this.infoTextStyle = const TextStyle(fontSize: 12),
    this.showRightCornerBtn = true,
    this.rightCornerBtnStyle,
    this.btnDisabled = false,
    this.isParticipating = false,
    this.rightCornerBtnFunction,
    this.rightCornerBtnText = 'Join',
    this.infoText = 'Sample text',
    this.leftBottomWidget,
    this.cardTap,
    this.actionIcon = '',
    this.actionTitle = 'title',
    this.actionValue = 0,
    this.centerIcon = '',
    this.centerTitle = 'title',
    this.centerValue = 0,
    this.leadingIcon = '',
    this.leadingTitle = 'title',
    this.leadingValue = 0,
    this.titleStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: Color.fromRGBO(15, 153, 221, 1),
    ),
    this.titleBottomStyle = const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: Color.fromRGBO(0, 0, 0, 1),
    ),
    this.title = 'Sample title',
    this.iconColor = const Color.fromRGBO(15, 153, 221, 1),
    this.bottomRightTitle = 'Sample title',
    this.bottomRightTitleStyle = const TextStyle(fontSize: 11),
    this.bottomRightValue = 0,
    this.userTeamName = '',
    this.challengeTeamNumber = 1,
    required this.downLeftWidget,
    this.isJapan = false,
  });

  final Color infoIconColor;
  final TextStyle infoTextStyle;
  final bool showRightCornerBtn;
  final bool isParticipating;
  final ButtonStyle? rightCornerBtnStyle;
  final bool btnDisabled;
  final Function? rightCornerBtnFunction;
  final Function? cardTap;
  final String rightCornerBtnText;
  final String infoText;
  final Widget? leftBottomWidget;
  final TextStyle titleStyle;
  final String title;
  final Widget downLeftWidget;
  final int challengeTeamNumber;

  // these params we use if user is not participating for bottom widget
  // [leadingValue should always be number of teams info]
  final String leadingIcon;
  final int leadingValue;
  final String leadingTitle;
  final String centerIcon;
  final int centerValue;
  final String centerTitle;
  final String actionIcon;
  final int actionValue;
  final String actionTitle;
  final Color iconColor;
  final TextStyle titleBottomStyle;

  // these params we use if user is participating for bottom widget

  final String bottomRightTitle;
  final TextStyle bottomRightTitleStyle;
  final String userTeamName;
  final double bottomRightValue;
  final bool isJapan;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (cardTap != null) {
          cardTap!();
        } else {
          debugPrint('Card is tapped');
        }
      },
      child: !isJapan ? _buildContent(context) : _buildContentJapan(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      height: 150,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _topItemsChallengeCard(
                context,
                infoIconColor,
                infoTextStyle,
                showRightCornerBtn,
                rightCornerBtnStyle,
                btnDisabled,
                rightCornerBtnFunction,
                rightCornerBtnText,
                infoText,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: _challengeTitleWidget(),
              ),
              if (isParticipating)
                _participatingProgressTeams()
              else
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: _notParticipatingBottomWidget(),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContentJapan(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Color.fromRGBO(35, 31, 32, 0.15),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ]
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _topItemsChallengeCard(
              context,
              infoIconColor,
              infoTextStyle,
              showRightCornerBtn,
              rightCornerBtnStyle,
              btnDisabled,
              rightCornerBtnFunction,
              rightCornerBtnText,
              infoText,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: _challengeTitleWidget(),
            ),
            if (isParticipating)
              _participatingProgressTeams()
            else
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: _notParticipatingBottomWidget(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _participatingProgressTeams() {
    return Column(
      children: <Widget>[
        downLeftWidget
      ]
    );
  }

  Widget _notParticipatingBottomWidget() {
    return Row(
      mainAxisAlignment: leadingValue < 2
          ? MainAxisAlignment.start
          : MainAxisAlignment.spaceBetween,
      children: <Widget>[
        if (leadingValue < 2)
          const SizedBox()
        else
        _participatingItem(leadingIcon, leadingTitle, leadingValue, 1.7),
        _participatingItem(centerIcon, centerTitle, centerValue, 1.8),
        if (leadingValue < 2) const SizedBox(width: 15) else const SizedBox(),
        _participatingItem(actionIcon, actionTitle, actionValue, 2.1),
      ],
    );
  }

  Widget _participatingItem(String icon, String title, int value, double scale) {
    return Container(
      width: 100,
      child: Row(
        children: <Widget>[
          if (icon.isNotEmpty)
            Container(
              child: Image.asset(icon, color: iconColor, scale: scale))
          else
          const SizedBox(),
          const SizedBox(width: 5),
          Expanded(
              child: FittedBox(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.scaleDown,
                  child: Text('$value $title', style: titleBottomStyle))),
        ],
      ),
    );
  }

  Widget _challengeTitleWidget() {
    return Text(title, style: titleStyle);
  }

  Widget _topItemsChallengeCard(
    BuildContext context,
    Color infoIconColor,
    TextStyle infoTextStyle,
    bool showRightCornerBtn,
    ButtonStyle? rightCornerBtnStyle,
    bool disabled,
    Function? rightCornerBtnFunction,
    String rightCornerBtnText,
    String infoText,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Row(children: <Widget>[
            Icon(Icons.info, color: infoIconColor),
            const SizedBox(width: 5),
            Text(infoText, style: infoTextStyle)
          ]),
        ),
        if (showRightCornerBtn)
          Container(
            height: 30,
            width: 100,
            child: ElevatedButton(
              style: rightCornerBtnStyle ??
                  ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(15, 153, 221, 0.3))),
              onPressed: () {
                if (disabled) {
                  debugPrint('Btn is disabled');
                } else {
                  if (rightCornerBtnFunction != null) {
                    rightCornerBtnFunction();
                  }
                }
              },
              child: Text(
                  isParticipating
                      ? leadingValue < 2
                          ? 'Joined'
                          : userTeamName
                      : rightCornerBtnText,
                  style: TextStyle(
                      fontSize: 13,
                      color: Color.fromRGBO(15, 153, 221, disabled ? 0.2 : 1))),
            ),
          ),
      ],
    );
  }
}
