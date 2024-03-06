part of widgets;

class AW_SeeAllWidget extends StatelessWidget {
  const AW_SeeAllWidget({
    this.widgetKey,
    this.leftText,
    this.onRightTextClick,
    this.rightText,
    this.rightTextKey,
    this.rightTextColor = const Color.fromRGBO(15, 153, 221, 1),
    this.leftTextStyle,
    this.rightTextStyle,
    this.padding = const EdgeInsets.symmetric(horizontal: 24)
  });

  final Key? widgetKey;
  final Key? rightTextKey;
  final String? leftText;
  final String? rightText;
  final Function? onRightTextClick;
  final Color rightTextColor;
  final TextStyle? leftTextStyle;
  final TextStyle? rightTextStyle;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: widgetKey,
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: Text(
              leftText!,
              style: leftTextStyle ?? Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.w600)
            ),
          ),
          GestureDetector(
            key: rightTextKey,
            onTap: () => onRightTextClick!(),
            child: Text(rightText!, style: rightTextStyle ?? Theme.of(context).textTheme.titleMedium!.copyWith(color: rightTextColor)),
          ),
        ],
      ),
    );
  }
}
