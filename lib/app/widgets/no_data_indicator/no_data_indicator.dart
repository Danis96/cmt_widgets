part of widgets;

class AW_NoDataIndicator extends StatelessWidget {
  const AW_NoDataIndicator(
      {this.imagePath = '',
      this.text = '',
      this.textStyle = const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Color.fromRGBO(33, 33, 33, 1),
      ),
      this.widgetKey,
      this.imageColor = const Color.fromRGBO(127, 144, 159, 1),
      this.textAlign = TextAlign.start,
      this.imageWidth = 49,
      this.imageHeight = 42});

  final Key? widgetKey;
  final String imagePath;
  final String text;
  final TextStyle textStyle;
  final Color imageColor;
  final TextAlign textAlign;
  final double imageWidth;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    return Center(
      key: widgetKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            imagePath,
            height: imageHeight,
            width: imageWidth,
            color: imageColor,
          ),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            text,
            style: textStyle,
            textAlign: textAlign,
          ),
        ],
      ),
    );
  }
}
