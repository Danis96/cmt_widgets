
part of widgets;


class AW_PolicyCompletion extends StatelessWidget {
  const AW_PolicyCompletion({
    Key? key,
    this.completedColor = const Color.fromRGBO(23, 164, 160, 1),
    this.backgroundColor = const Color.fromRGBO(227, 233, 239, 1),
    this.unit = ' km',
    required this.label,
    required this.maxAvailable,
    this.labelColor = const Color.fromRGBO(59, 72, 86, 1),
    required this.completed,
    this.maxAvailableColor = const Color.fromRGBO(136, 162, 187, 1),
    this.forcedTrailingText = '',
    this.widthReduce = 0.0,
    this.fontFamily,
    this.completedTextSize = 18,
    this.maxAvailableTextSize = 13,
    this.rowAlignment = CrossAxisAlignment.center
  }) : super(key: key);

  final Color completedColor;
  final double completed;
  final double completedTextSize;
  final double maxAvailableTextSize;
  final Color backgroundColor;
  final Color labelColor;
  final String label;
  final String unit;
  final String? fontFamily;
  final double maxAvailable;
  final Color maxAvailableColor;

  //used to completely ignore unit and max available args
  final String forcedTrailingText;
  //used to reduce the max available width, usually padding/margin from the app
  final double widthReduce;
  final CrossAxisAlignment rowAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      key: key,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: rowAlignment,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  color: labelColor,
                  fontSize: 14,
                ),
              ),
            ),
            Text(
              forcedTrailingText.isEmpty ? completed.toStringAsFixed(0) : forcedTrailingText,
              style: TextStyle(
                  color: completedColor,
                  fontSize: completedTextSize,
                  fontWeight: FontWeight.w600,
                  fontFamily: fontFamily
              ),
            ),
            Text(
             forcedTrailingText.isEmpty ? ' /${maxAvailable.toStringAsFixed(0)}$unit' : '',
              style: TextStyle(
                color: maxAvailableColor,
                fontSize: maxAvailableTextSize,
                fontFamily: fontFamily
              ),
            )
          ],
        ),
        const SizedBox(height: 8,),
        Stack(
          children: <Widget>[
            Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: backgroundColor
              ),
              height: 6,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: completedColor
              ),
              width: (completed / maxAvailable) * (MediaQuery.of(context).size.width - widthReduce),
              height: 6,
            ),
          ],
        )
      ],
    );
  }
}
