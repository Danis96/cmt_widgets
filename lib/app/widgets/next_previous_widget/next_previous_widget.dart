part of widgets;

class AW_NextPreviousWidget extends StatelessWidget {
  const AW_NextPreviousWidget({
    this.widgetKey,
    this.textColor = const Color.fromRGBO(33, 33, 33, 1),
    this.arrowColor = const Color.fromRGBO(158, 158, 158, 1),
    this.backgroundColor = const Color.fromRGBO(232, 235, 237, 1),
    this.onNextPressed,
    this.onPreviousPressed,
    this.middleText = '',
  });

  final Key? widgetKey;
  final Color arrowColor;
  final Color backgroundColor;
  final Color textColor;
  final Function? onPreviousPressed;
  final Function? onNextPressed;
  final String middleText;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: widgetKey,
      color: backgroundColor,
      height: 56,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
              width: 50,
              child: IconButton(
                  icon: Icon(Icons.arrow_back_ios, size: 15, color: arrowColor), splashColor: Colors.transparent, onPressed: () => onPreviousPressed!())),
          Container(child: Text(middleText, style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: textColor))),
          Container(width: 50, child: IconButton(icon: Icon(Icons.arrow_forward_ios, size: 15, color: arrowColor), onPressed: () => onNextPressed!())),
        ],
      ),
    );
  }
}
