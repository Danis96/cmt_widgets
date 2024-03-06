part of widgets;

class AW_PageViewIndicatorDots extends StatelessWidget {

  const AW_PageViewIndicatorDots({
    this.currentIndex = 0,
    this.numberOfDots = 0,
    this.selectedColor = const Color.fromRGBO(5, 23, 108, 1),
    this.unselectedColor = const Color.fromRGBO(110, 110, 110, 1),
    this.widgetKey,
  });
  final int currentIndex;
  final int numberOfDots;
  final Color selectedColor;
  final Color unselectedColor;
  final Key? widgetKey;

  @override
  Widget build(BuildContext context) {
    final List<Widget> dots = <Widget>[];
    for (int i = 0; i < numberOfDots; i++) {
      dots.add(Container(
        key: Key('dot_$i'),
        height: 8,
        width: 8,
        decoration: BoxDecoration(
          color: i == currentIndex ? selectedColor : unselectedColor,
          borderRadius: BorderRadius.circular(100),
        ),
      ));
      if (i < numberOfDots - 1) {
        dots.add(const SizedBox(
          width: 8,
        ));
      }
    }
    return Row(
      key: widgetKey,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: dots,
    );
  }
}
