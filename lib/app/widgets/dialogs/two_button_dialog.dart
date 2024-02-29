part of widgets;

void AW_TwoButtonDialog(
  BuildContext context, {
  String title = '',
  String content = '',
  String leftButtonText = '',
  String rightButtonText = '',
  Color titleColor = Colors.black,
  Color contentColor = Colors.black,
  Color buttonColor = Colors.black,
  String key = '',
  Function? onRightButtonPressed,
}) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      key: Key(key),
      title: Text(
        title,
        style: TextStyle(fontSize: 16.0, color: titleColor),
      ),
      content: content.contains('<!DOCTYPE')
          ? html.HtmlWidget(content)
          : Text(
              content,
              style: TextStyle(fontSize: 15.0, color: titleColor),
            ),
      actions: <Widget>[
        TextButton(
          child: Text(
            leftButtonText,
            style: TextStyle(fontSize: 16.0, color: titleColor),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text(
            rightButtonText,
            style: TextStyle(fontSize: 16.0, color: titleColor),
          ),
          onPressed: () => onRightButtonPressed!(),
        ),
      ],
    ),
  );
}
