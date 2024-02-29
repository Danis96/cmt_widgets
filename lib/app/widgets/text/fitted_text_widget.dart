part of widgets;


class AW_FittedText extends StatelessWidget {
  const AW_FittedText({@required this.widgetKey, @required this.text, this.boxFit = BoxFit.contain, this.style, this.textAlign = TextAlign.start});

  final String? text;
  final TextStyle? style;
  final BoxFit boxFit;
  final TextAlign textAlign;
  final Key? widgetKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: widgetKey!,
      child: FittedBox(
        fit: boxFit,
        child: Text(text!, textAlign: textAlign, style: style),
      ),
    );
  }
}
