part of widgets;

class AW_Co2RankingWidget extends StatelessWidget {
  const AW_Co2RankingWidget({
    this.widgetKey,
    this.title = '',
    this.rankTopPlace = const <double>[],
    this.rankBottomPlace = const <double>[],
    this.initialsTop = const <String>[],
    this.initialsBottom = const <String>[],
    this.initialsMiddle = '',
    this.nameMiddle = '',
    this.rankMiddle = 0,
    this.namesBottom = const <String>[],
    this.namesTop = const <String>[],
    this.emissionBottom = const <double>[],
    this.emissionTop = const <double>[],
    this.emissionMiddle = 0,
    this.imgSeparator,
    this.valueDesc = '',
    this.isMe = false,
    this.titleColor,
    this.imgSeparatorColor,
    this.separatorColor = const Color.fromRGBO(57, 70, 82, 0.2),
    this.textColor = const Color.fromRGBO(57, 70, 82, 0.2),
    this.isMeTextColor = const Color.fromRGBO(57, 70, 82, 0.2),
    this.circleColor = const Color.fromRGBO(255, 255, 255, 1),
    this.circleIsMeColor = const Color.fromRGBO(255, 255, 255, 1),
  });

  final Key? widgetKey;
  final String title;
  final Color? titleColor;
  final Color? imgSeparatorColor;
  final Color textColor;
  final Color separatorColor;
  final Color isMeTextColor;
  final Color circleColor;
  final Color circleIsMeColor;
  final String? imgSeparator;
  final String valueDesc;
  final bool isMe;

  // rank bottom
  final List<double> rankBottomPlace;
  final List<String> initialsBottom;
  final List<String> namesBottom;
  final List<double> emissionBottom;

  // rank top
  final List<String> initialsTop;
  final List<double> rankTopPlace;
  final List<String> namesTop;
  final List<double> emissionTop;

  // middle rank
  final double rankMiddle;
  final String initialsMiddle;
  final String nameMiddle;
  final double emissionMiddle;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          if (title.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(title,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: titleColor ?? const Color.fromRGBO(0, 0, 0, 1))),
            )
          else
            const SizedBox(),
          const SizedBox(height: 15),
          _co2RankingItem(context, rankTopPlace.first.toStringAsFixed(0), initialsTop.first, namesTop.first,
              emissionTop.first.toStringAsFixed(0), valueDesc,
              separatorColor: separatorColor,
              textColor: textColor,
              isMeTextColor: isMeTextColor,
              circleColor: circleColor,
              isMeCircleColor: circleIsMeColor),
          _co2RankingItem(context, rankTopPlace.last.toStringAsFixed(0), initialsTop.last, namesTop.last,
              emissionTop.last.toStringAsFixed(0), valueDesc,
              separatorColor: separatorColor,
              textColor: textColor,
              isMeTextColor: isMeTextColor,
              circleColor: circleColor,
              isMeCircleColor: circleIsMeColor),
          _returnImgSeparator(imgSeparator: imgSeparator, color: imgSeparatorColor),
          _co2RankingItem(context, rankMiddle.toStringAsFixed(0), initialsMiddle, nameMiddle, emissionMiddle.toStringAsFixed(0), valueDesc,
              isMiddle: true,
              isMe: isMe,
              separatorColor: separatorColor,
              textColor: textColor,
              isMeTextColor: isMeTextColor,
              circleColor: circleColor,
              isMeCircleColor: circleIsMeColor),
          _returnImgSeparator(imgSeparator: imgSeparator, color: imgSeparatorColor),
          _co2RankingItem(context, rankBottomPlace.first.toStringAsFixed(0), initialsBottom.first, namesBottom.first,
              emissionBottom.first.toStringAsFixed(0), valueDesc,
              separatorColor: separatorColor,
              textColor: textColor,
              isMeTextColor: isMeTextColor,
              circleColor: circleColor,
              isMeCircleColor: circleIsMeColor),
          _co2RankingItem(context, rankBottomPlace.last.toStringAsFixed(0), initialsBottom.last, namesBottom.last,
              emissionBottom.last.toStringAsFixed(0), valueDesc,
              separatorColor: separatorColor,
              textColor: textColor,
              isMeTextColor: isMeTextColor,
              circleColor: circleColor,
              isMeCircleColor: circleIsMeColor),
        ],
      ),
    );
  }
}

Widget _returnImgSeparator({String? imgSeparator, Color? color}) {
  return Column(
    children: <Widget>[
      const SizedBox(height: 5),
      if (imgSeparator != null) Center(child: Image.asset(imgSeparator, width: 35, color: color)) else const SizedBox(),
      const SizedBox(height: 5),
    ],
  );
}

Widget _co2RankingItem(
  BuildContext context,
  String index,
  String initials,
  String name,
  String value,
  String valueDesc, {
  bool isMiddle = false,
  bool isMe = false,
  Color separatorColor = const Color.fromRGBO(57, 70, 82, 0.2),
  Color textColor = const Color.fromRGBO(57, 70, 82, 0.2),
  Color isMeTextColor = const Color.fromRGBO(57, 70, 82, 0.2),
  Color isMeCircleColor = const Color.fromRGBO(57, 70, 82, 0.2),
  Color circleColor = const Color.fromRGBO(57, 70, 82, 0.2),
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 18),
    child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                    width: 50,
                    child: Text(index,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: textColor, fontWeight: FontWeight.w700))),
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(color: isMe ? isMeCircleColor : circleColor, shape: BoxShape.circle),
                  child: Center(
                    child: Text(initials.toLowerCase(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.w700, fontSize: 14, color: isMe ? isMeTextColor : textColor)),
                  ),
                ),
                const SizedBox(width: 10),
                Text(name,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.w700, color: isMe ? isMeTextColor : textColor)),
              ],
            ),
            Row(
              children: <Widget>[
                Text(value + ' ',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.w700, color: isMe ? isMeTextColor : textColor)),
                Text(valueDesc,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.w700, color: isMe ? isMeTextColor : textColor)),
              ],
            ),
          ],
        ),
        if (isMiddle) const SizedBox(height: 10) else Divider(color: separatorColor),
      ],
    ),
  );
}
