part of widgets;

void AW_FullPageDialog(
  BuildContext context, {
  String? title,
  String content = '',
  String buttonText = '',
  Color titleColor = Colors.black,
  Color contentColor = Colors.black,
  Color buttonColor = Colors.black,
  String key = '',
  Widget? contentWidget,
  bool noButton = false,
  EdgeInsetsGeometry contentPadding = const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
  EdgeInsetsGeometry? titlePadding,
  EdgeInsets insetPadding = const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
  ButtonStyle? buttonStyle,
  ShapeBorder? shape,
      double? height,
  VoidCallback? onButtonPressed
}) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      shape: shape,
      contentPadding: contentPadding,
      titlePadding: titlePadding,
      insetPadding: insetPadding,
      key: Key(key),
      title: title != null ? Text(title, style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 18)) : const SizedBox(),
      content: content.contains('<!DOCTYPE')
          ? html.HtmlWidget(content)
          : contentWidget != null
              ? Container(width: double.maxFinite, height: height ?? double.maxFinite, child: contentWidget)
              : Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  child: ListView(shrinkWrap: true, children: <Widget>[Text(content, style: Theme.of(context).textTheme.titleSmall)])),
      actions: <Widget>[
        if (noButton)
          const SizedBox()
        else
          Center(
            child: AW_Button(
              style: buttonStyle,
              onPressed: () => onButtonPressed == null ? Navigator.of(context).pop() : onButtonPressed(),
              buttonTitle: buttonText,
            ),
          ),
      ],
    ),
  );
}
