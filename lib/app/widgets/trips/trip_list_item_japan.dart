part of widgets;

class AW_TripListItemJapan extends StatelessWidget {
  final Color scoreColor;

  const AW_TripListItemJapan(
      {Key? key,
      required this.onTap,
      this.scoreColor = Colors.orange,
      this.drivingScore = 0.0,
      this.tripPlace = '',
      this.scoreText = '',
      this.tripDate = '',
      this.durationValue = '',
      this.distanceValue = '',
      this.durationLabel = '',
      this.distanceLabel = '',
      this.tripDateTextStyle = const TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Color.fromRGBO(68, 68, 68, 1)),
      this.tripTimeTextStyle = const TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Color.fromRGBO(57, 70, 82, 1)),
      this.topTextStyle = const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color.fromRGBO(158, 158, 158, 1)),
      this.durationValueTextStyle = const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color.fromRGBO(35, 31, 32, 1)),
      this.distanceValueTextStyle = const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color.fromRGBO(35, 31, 32, 1)),
      this.scoreTextStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color.fromRGBO(35, 31, 32, 1)),
      this.scoreNumberTextStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color.fromRGBO(35, 31, 32, 1)),
      this.backgroundColor = Colors.white,
      this.iconBackgroundColor = Colors.white,
      this.percentIndicatorRadius = 40,
      this.tripDateLabel,
      required this.hasError,
      this.onImgTap,
      this.topTextPadding = const EdgeInsets.symmetric(horizontal: 8),
      required this.tags,
      this.showIconIfError = true,
      this.onScoreTap,
      this.onTopItemTap,
      this.onBottomItemTap,
      this.errorWidget,
      this.tripTime = '',
      this.shadowOpacity = 0.15,
      this.tagWidget})
      : super(key: key);
  final Color backgroundColor;
  final Color iconBackgroundColor;
  final String scoreText;
  final double drivingScore;

  final String tripPlace;
  final String tripDate;
  final String tripTime;
  final String durationValue;
  final String distanceValue;
  final String durationLabel;
  final String distanceLabel;
  final TextStyle tripDateTextStyle;
  final TextStyle tripTimeTextStyle;

  final TextStyle durationValueTextStyle;

  final TextStyle distanceValueTextStyle;
  final TextStyle topTextStyle;
  final TextStyle scoreTextStyle;
  final TextStyle scoreNumberTextStyle;
  final Function(LatLng latLng) onTap;
  final double percentIndicatorRadius;
  final double shadowOpacity;

  final Text? tripDateLabel;
  final bool hasError;
  final Function()? onImgTap;
  final EdgeInsets topTextPadding;

  final Widget tags;
  final bool showIconIfError;
  final VoidCallback? onScoreTap;
  final VoidCallback? onTopItemTap;
  final VoidCallback? onBottomItemTap;
  final Widget? errorWidget;
  final Widget? tagWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (tripDateLabel == null)
          const SizedBox()
        else
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: tripDateLabel,
          ),
        Container(
          decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(10), boxShadow: <BoxShadow>[
            BoxShadow(color: Color.fromRGBO(35, 31, 32, shadowOpacity), offset: const Offset(0, 8), blurRadius: 16, spreadRadius: 3)
          ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 6,
              ),
              AW_TripItemTopBarJapan(tripTimeTextStyle: tripTimeTextStyle, onTap: onTopItemTap, tripTime: tripTime, tags: tags),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 18), child: Divider(color: Color.fromRGBO(15, 153, 221, 0.1))),
              AW_TripItemBottomBarJapan(
                distanceValue: distanceValue,
                distanceValueTextStyle: distanceValueTextStyle,
                durationValue: durationValue,
                durationValueTextStyle: durationValueTextStyle,
                onBottomItemTap: onBottomItemTap,
                tripDate: tripDate,
                tripDateTextStyle: tripDateTextStyle,
                drivingScore: drivingScore,
                hasError: hasError,
                scoreColor: scoreColor,
                scoreTextStyle: scoreTextStyle,
                percentIndicatorRadius: percentIndicatorRadius,
                scoreText: scoreText,
                errorWidget: errorWidget,
                onScoreTap: onScoreTap,
                onTap: onBottomItemTap,
                tagWidget: tagWidget,
              ),
              const SizedBox(
                height: 6,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class AW_TripItemTopBarJapan extends StatelessWidget {
  const AW_TripItemTopBarJapan({Key? key, required this.tripTimeTextStyle, required this.tripTime, this.onTap, required this.tags}) : super(key: key);

  final String tripTime;
  final TextStyle tripTimeTextStyle;

  final VoidCallback? onTap;
  final Widget tags;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: GestureDetector(
                  onTap: onTap,
                  child: Text(
                    tripTime,
                    style: tripTimeTextStyle,
                  ),
                )),
                tags
              ],
            ),
          ],
        ));
  }
}

class AW_TripItemBottomBarJapan extends StatelessWidget {
  const AW_TripItemBottomBarJapan(
      {Key? key,
      this.distanceValue = '',
      this.distanceValueTextStyle = const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color.fromRGBO(68, 68, 68, 1)),
      this.durationValue = '',
      this.durationValueTextStyle = const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color.fromRGBO(68, 68, 68, 1)),
      this.onBottomItemTap,
      required this.tripDate,
      required this.tripDateTextStyle,
      required this.drivingScore,
      required this.hasError,
      required this.percentIndicatorRadius,
      required this.scoreTextStyle,
      required this.scoreColor,
      required this.scoreText,
      this.errorWidget,
      this.onScoreTap,
      this.onTap,
      this.tagWidget})
      : super(key: key);

  final String distanceValue;
  final TextStyle distanceValueTextStyle;
  final String durationValue;
  final TextStyle durationValueTextStyle;
  final VoidCallback? onBottomItemTap;
  final String tripDate;
  final String scoreText;
  final TextStyle tripDateTextStyle;
  final double percentIndicatorRadius;
  final TextStyle scoreTextStyle;
  final double drivingScore;
  final Color scoreColor;
  final bool hasError;
  final Widget? errorWidget;
  final VoidCallback? onScoreTap;
  final VoidCallback? onTap;
  final Widget? tagWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: onScoreTap,
            child: TripItemIndicator(
              percentIndicatorRadius: percentIndicatorRadius,
              scoreTextStyle: scoreTextStyle,
              scoreText: scoreText,
              drivingScore: drivingScore,
              scoreColor: scoreColor,
              drawIndicatorIfError: false,
              hasError: hasError,
              errorWidget: errorWidget,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: GestureDetector(
              onTap: onTap,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    tripDate,
                    style: tripDateTextStyle,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        durationValue,
                        style: durationValueTextStyle,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text('\u2022'),
                      ),
                      Text(
                        distanceValue,
                        style: distanceValueTextStyle,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          if (tagWidget != null) tagWidget!
        ],
      ),
    );
  }
}
