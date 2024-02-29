part of widgets;

class AW_QuoteNavbar extends StatelessWidget {
  const AW_QuoteNavbar({
    Key? key,
    this.backgroundColor = const Color.fromRGBO(23, 164, 160, 1),
    required this.buttonText,
    required this.onButtonTap,
    this.buttonDisabled = false,
    this.questionText,
    this.actionText,
    this.questionStyle = const TextStyle(color: Color(0xff394652), fontSize: 12),
    this.onAction,
    this.defaultStyle = const TextStyle(color: Colors.white, fontSize: 12),
    this.linkStyle = const TextStyle(
        color: Colors.white,
        fontSize: 12,
        decoration: TextDecoration.underline),
    this.buttonBorderColor = Colors.white,
    this.borderColorOpacity = 0.4,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.leftIcon,
    this.onLeftIconTap,
    this.padding = const EdgeInsets.all(12),
    this.buttonPadding,
    this.buttonStyle,
    this.buttonWidth = 120,
    this.disableDefaultWidth = false,
  }) : super(key: key);

  final Color backgroundColor;
  final String buttonText;
  final VoidCallback onButtonTap;
  final bool buttonDisabled;
  final String? questionText;
  final String? actionText;
  final VoidCallback? onAction;

  final TextStyle questionStyle;
  final TextStyle defaultStyle;
  final TextStyle linkStyle;
  final Color buttonBorderColor;
  final double borderColorOpacity;
  final MainAxisAlignment mainAxisAlignment;
  final String? leftIcon;
  final Function? onLeftIconTap;
  final EdgeInsets padding;
  final EdgeInsets? buttonPadding;
  final ButtonStyle? buttonStyle;
  final double buttonWidth;
  final bool disableDefaultWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      color: backgroundColor,
      padding: padding,
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Row(
                children: [
                  if (questionText != null)
                    Flexible(
                      child: FittedBox(
                        child: Text(
                          questionText! + ' ',
                          style: questionStyle,
                        ),
                      ),
                    ),
                  if (leftIcon != null)
                    GestureDetector(
                      onTap: () => onLeftIconTap!(),
                      child: Image.asset(leftIcon!, height: 20),
                    ),
                  if (actionText != null)
                    AW_TappableText(
                      links: actionText,
                      text: actionText,
                      onPressed: (_) {
                        if (onAction != null) {
                          onAction!();
                        }
                      },
                      defaultStyle: defaultStyle,
                      linkStyle: linkStyle,
                    ),
                ],
              ),
            ),
          ),
          AW_ButtonWidth(
            onPressed: onButtonTap,
            disabled: buttonDisabled,
            buttonTitle: buttonText,
            disableDefaultWidth: disableDefaultWidth,
            widthOfButton: buttonWidth,
            style: buttonStyle ??
                ElevatedButton.styleFrom(
                    backgroundColor: buttonBorderColor.withOpacity(borderColorOpacity),
                    padding: buttonPadding),
          ),
        ],
      ),
    );
  }
}
