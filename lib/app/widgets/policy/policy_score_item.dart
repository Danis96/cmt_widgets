
part of widgets;

class AW_PolicyScoreItem extends StatelessWidget {
  const AW_PolicyScoreItem({
    Key? key,
    required this.label,
    required this.score,
    required this.backgroundColor,
    this.maxHeight = 60,
    this.scoreColor = Colors.white,
    this.labelColor = const Color.fromRGBO(57, 70, 82, 1),
    this.width = 25,
    this.padding = const EdgeInsets.only(right: 8)
  }) : super(key: key);

  final double score;
  final Widget label;
  final Color backgroundColor;
  final Color scoreColor;
  final Color labelColor;
  final double maxHeight;
  final double width;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: backgroundColor
            ),
            width: width,
            height: (score / 100) * maxHeight,
            child: Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(
                score.round().toString(),
                style: TextStyle(
                  color: scoreColor,
                  fontSize: 10,
                  fontFamily: 'Raleway'
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 6),
          label,
        ],
      ),
    );
  }
}
