part of widgets;

void AW_InfoPopup(
  BuildContext context, {
  String title = '',
  String content = '',
  String buttonText = '',
  String buttonTwoText = '',
  Color titleColor = Colors.black,
  Color contentColor = Colors.black,
  Color buttonColor = Colors.white,
  Color buttonTextColor = Colors.black,
  String key = '',
  Widget? contentWidget,
  Widget? titleWidget,
  IconData? iconForTitle,
  Color? iconColor = Colors.black,
  Function? onButtonPressed,
  Function? onButtonTwoPressed,
  bool dismiss = true,
  bool twoButtons = false,
  bool canPop = true,
}) {
  showDialog(
    barrierDismissible: dismiss,
    context: context,
    builder: (_) => WillPopScope(
      onWillPop: () async {
        return canPop;
      },
      child: AlertDialog(
        key: Key(key),
        title: titleWidget ??
            Column(
              children: [
                Icon(
                  iconForTitle,
                  color: iconColor,
                ),
                const SizedBox(height: 5),
                Text(title, style: TextStyle(fontSize: 24.0, color: titleColor, fontWeight: FontWeight.bold)),
              ],
            ),
        content: contentWidget ??
            (content.contains('<!DOCTYPE')
                ? html.HtmlWidget(content)
                : Text(
                    content,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0, color: titleColor),
                  )),
        actions: <Widget>[
          Container(
              height: 50,
              child: buttonTwoText.isEmpty
                  ? _buildOneButtonPopup(context,
                      onPressed: onButtonPressed, title: buttonText, buttonColor: buttonColor, buttonTextColor: buttonTextColor)
                  : _buildTwoButtonsPopup(context,
                      buttonText: buttonText, buttonTwoText: buttonTwoText, onPressed: onButtonPressed, onButtonTwoPressed: onButtonTwoPressed)),
        ],
      ),
    ),
  );
}

Widget _buildOneButtonPopup(BuildContext context,
    {Function? onPressed, String title = '', Color buttonColor = Colors.white, Color buttonTextColor = Colors.black}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AW_Button(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(buttonColor),
              foregroundColor: MaterialStateProperty.all(buttonTextColor),
            ),
            onPressed: () {
              if (onPressed != null) {
                onPressed();
              } else {
                Navigator.of(context).pop();
              }
            },
            buttonTitle: title,
          ),
        ),
      )
    ],
  );
}

Widget _buildTwoButtonsPopup(
  BuildContext context, {
  Function? onPressed,
  String buttonText = '',
  Function? onButtonTwoPressed,
  String buttonTwoText = '',
  Color titleColor = Colors.black,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      TextButton(
        onPressed: () {
          if (onPressed != null) {
            onPressed();
          } else {
            Navigator.of(context).pop();
          }
        },
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16.0, color: titleColor),
        ),
      ),
      TextButton(
        onPressed: () {
          if (onButtonTwoPressed != null) {
            onButtonTwoPressed();
          } else {
            Navigator.of(context).pop();
          }
        },
        child: Text(
          buttonTwoText,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16.0, color: titleColor),
        ),
      )
    ],
  );
}
