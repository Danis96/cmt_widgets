part of widgets;

class AW_RewardContestCard extends StatelessWidget {
  const AW_RewardContestCard({
    this.infoIconColor = const Color.fromRGBO(15, 153, 221, 1),
    this.infoTextStyle = const TextStyle(fontSize: 12),
    this.showRightCornerBtn = true,
    this.rightCornerBtnStyle,
    this.btnDisabled = false,
    this.rightCornerBtnFunction,
    this.rightCornerBtnText = 'Sample text',
    this.infoText = 'Sample text',
    this.leftBottomWidget,
    this.rightBottomText = 'SampleText',
    this.rightBottomValue = '',
    this.cardTap,
    this.canParticipate = false,
    this.alreadyParticipate = false,
    this.isJapan = false,
  });

  final Color infoIconColor;
  final TextStyle infoTextStyle;
  final bool showRightCornerBtn;
  final ButtonStyle? rightCornerBtnStyle;
  final bool btnDisabled;
  final Function? rightCornerBtnFunction;
  final Function? cardTap;
  final String rightCornerBtnText;
  final String infoText;
  final Widget? leftBottomWidget;
  final String rightBottomText;
  final String rightBottomValue;
  final bool canParticipate;
  final bool alreadyParticipate;
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
      height: 138,
      width: 350,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _topItems(
                context,
                infoIconColor,
                infoTextStyle,
                showRightCornerBtn,
                rightCornerBtnStyle,
                btnDisabled,
                rightCornerBtnFunction,
                rightCornerBtnText,
                infoText,
                alreadyParticipate,
                canParticipate,
              ),
              const SizedBox(height: 20),
              _bottomItems(context, leftBottomWidget, rightBottomText, rightBottomValue)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContentJapan(BuildContext context) {
    return Container(
      height: 138,
      width: 350,
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
          children: <Widget>[
            _topItems(
              context,
              infoIconColor,
              infoTextStyle,
              showRightCornerBtn,
              rightCornerBtnStyle,
              btnDisabled,
              rightCornerBtnFunction,
              rightCornerBtnText,
              infoText,
              alreadyParticipate,
              canParticipate,
            ),
            const Spacer(),
            _bottomItems(
              context,
              leftBottomWidget,
              rightBottomText,
              rightBottomValue,
            )
          ],
        ),
      ),
    );
  }
}

Widget _topItems(
  BuildContext context,
  Color infoIconColor,
  TextStyle infoTextStyle,
  bool showRightCornerBtn,
  ButtonStyle? rightCornerBtnStyle,
  bool disabled,
  Function? rightCornerBtnFunction,
  String rightCornerBtnText,
  String infoText,
  bool alreadyParticipate,
  bool canParticipate,
) {
  return Container(
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(children: <Widget>[Icon(Icons.info, color: infoIconColor), const SizedBox(width: 5), Text(infoText, style: infoTextStyle)]),
        if (showRightCornerBtn)
          Container(
            height: 30,
            width: 100,
            child: ElevatedButton(
              style: rightCornerBtnStyle ?? ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(15, 153, 221, 0.2))),
              onPressed: () {
                if (disabled) {
                  debugPrint('Btn is disabled');
                } else {
                  if (rightCornerBtnFunction != null) {
                    rightCornerBtnFunction();
                  }
                }
              },
              child: Text(rightCornerBtnText, style: TextStyle(fontSize: 13, color: Color.fromRGBO(15, 153, 221, disabled ? 0.2 : 1))),
            ),
          ),
      ],
    ),
  );
}

Widget _bottomItems(BuildContext context, Widget? leftBottomWidget, String rightBottomText, String rightBottomValue) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: <Widget>[
      leftBottomWidget ?? const SizedBox(),
      Row(
        children: <Widget>[
          Text(rightBottomText + ': ', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
          Text(rightBottomValue, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color.fromRGBO(15, 153, 221, 1))),
        ],
      ),
    ],
  );
}
