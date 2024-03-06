part of widgets;

enum DotType {
  fullDot,
  emptyDot,
  dotWithRing,
}

class AW_DotContainerWithStates extends StatelessWidget {
  const AW_DotContainerWithStates({this.type = DotType.emptyDot, this.widgetKey, this.dotColor = Colors.black, this.isNotActiveAncCurrent = false,});

  final DotType type;
  final Key? widgetKey;
  final Color dotColor;
  final bool isNotActiveAncCurrent;

  Color _returnDotColor(DotType dotType) {
    if (dotType == DotType.emptyDot) {
      return const Color.fromRGBO(232, 235, 237, 1);
    } else {
      return dotColor;
    }
  }

  bool isTypeWithRing() => type == DotType.dotWithRing;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: widgetKey,
      height: 18,
      width: 18,
      child: CircleAvatar(
        backgroundColor: isTypeWithRing() ? dotColor : Colors.transparent,
        child: ClipOval(
            child: Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(border: Border.all(color: isNotActiveAncCurrent ? const Color.fromRGBO(16, 51, 68, 1) : Colors.white), shape: BoxShape.circle, color: _returnDotColor(type)))),
      ),
    );
  }
}
