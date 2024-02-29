part of widgets;

enum TripTypes { driver, passenger, bus, train, other, unknown, error }

extension TripTypesAsset on TripTypes {
  String getPath() {
    switch (this) {
      case TripTypes.bus:
        return 'assets/ic_trip_bus.svg';
      case TripTypes.driver:
        return 'assets/ic_trip_driver.svg';
      default:
        return 'assets/ic_trip_analyzed_error.svg';
    }
  }
}

class AW_TripListItemDemo extends StatelessWidget {
  const AW_TripListItemDemo({
    Key? key,
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
    this.tripDateTextStyle = const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: Color.fromRGBO(35, 31, 32, 1)),
    this.tripTimeTextStyle = const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: Color.fromRGBO(35, 31, 32, 1)),
    this.distanceLabelTextStyle = const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color.fromRGBO(158, 158, 158, 1)),
    this.durationLabelTextStyle = const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color.fromRGBO(158, 158, 158, 1)),
    this.topTextStyle = const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color.fromRGBO(158, 158, 158, 1)),
    this.durationValueTextStyle = const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color.fromRGBO(35, 31, 32, 1)),
    this.distanceValueTextStyle = const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color.fromRGBO(35, 31, 32, 1)),
    this.scoreTextStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color.fromRGBO(35, 31, 32, 1)),
    this.scoreNumberTextStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color.fromRGBO(35, 31, 32, 1)),
    this.mapZoomControlsEnabled = false,
    this.mapMyLocationButtonEnabled = false,
    this.mapType = MapType.normal,
    this.mapZoom = 6.0,
    this.mapMarkers = const <Marker>[],
    this.mapPolylines = const <Polyline>{},
    this.mapTarget = const LatLng(0, 0),
    this.mapScrollGesturesEnabled = false,
    this.mapZoomGesturesEnabled = false,
    this.mapFirstAndLastPoints = const <LatLng>[],
    this.backgroundColor = Colors.white,
    this.iconBackgroundColor = Colors.white,
    this.bottomSvgPath,
    this.topSvgPath,
    this.percentIndicatorRadius = 40,
    this.recordedWithBluetooth = false,
    this.tripDateLabel,
    this.topSvgIconShadow,
    this.topSvgIconBackground,
    this.topSvgIconColor,
    this.topTextAlignment = CrossAxisAlignment.center,
    this.tripItemNoteBanner,
    required this.hasError,
    this.drawIndicatorIfError = false,
    this.tagColor = const Color.fromRGBO(242, 153, 74, 1),
    required this.isBluetoothAvailable,
    this.isMap = false,
    this.staticMapUrl = '',
    this.shouldAnimateMap = false,
    this.onImgTap,
    this.topTextPadding = const EdgeInsets.symmetric(horizontal: 8),
    this.valuesSpacing = 0,
    this.tags,
    this.showIconIfError = true,
    this.onScoreTap,
    this.onTopItemTap,
    this.onBottomItemTap,
    this.errorWidget,
    this.disableFixedHeight = false,
  }) : super(key: key);

  final Color scoreColor;
  final Color backgroundColor;
  final Color iconBackgroundColor;
  final String scoreText;
  final double drivingScore;
  final String tripPlace;
  final String tripDate;
  final String durationValue;
  final String distanceValue;
  final String durationLabel;
  final String distanceLabel;
  final TextStyle tripDateTextStyle;
  final TextStyle tripTimeTextStyle;
  final TextStyle durationLabelTextStyle;
  final TextStyle durationValueTextStyle;
  final TextStyle distanceLabelTextStyle;
  final TextStyle distanceValueTextStyle;
  final TextStyle topTextStyle;
  final TextStyle scoreTextStyle;
  final TextStyle scoreNumberTextStyle;
  final Function(LatLng latLng) onTap;
  final bool mapZoomControlsEnabled;
  final bool mapMyLocationButtonEnabled;
  final MapType mapType;
  final bool mapZoomGesturesEnabled;
  final bool mapScrollGesturesEnabled;
  final double mapZoom;
  final LatLng mapTarget;
  final List<Marker> mapMarkers;
  final Set<Polyline> mapPolylines;
  final List<LatLng> mapFirstAndLastPoints;
  final String? bottomSvgPath;
  final String? topSvgPath;
  final Color? topSvgIconColor;
  final Color? topSvgIconBackground;
  final List<BoxShadow>? topSvgIconShadow;
  final double percentIndicatorRadius;
  final bool recordedWithBluetooth;
  final Text? tripDateLabel;
  final CrossAxisAlignment topTextAlignment;
  final Widget? tripItemNoteBanner;
  final bool hasError;
  final bool drawIndicatorIfError;
  final Color tagColor;
  final bool isBluetoothAvailable;
  final String staticMapUrl;
  final bool isMap;
  final bool shouldAnimateMap;
  final Function()? onImgTap;
  final EdgeInsets topTextPadding;
  final double valuesSpacing;
  final Widget? tags;
  final bool showIconIfError;
  final VoidCallback? onScoreTap;
  final VoidCallback? onTopItemTap;
  final VoidCallback? onBottomItemTap;
  final Widget? errorWidget;
  final bool disableFixedHeight;

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
          decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(10), boxShadow: const <BoxShadow>[
            BoxShadow(color: Color.fromRGBO(35, 31, 32, 0.15), offset: Offset(0, 8), blurRadius: 16, spreadRadius: 3)
          ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AW_TripItemTopBar(
                drawIndicatorIfError: drawIndicatorIfError,
                textAlignment: topTextAlignment,
                scoreColor: scoreColor,
                iconBackgroundColor: iconBackgroundColor,
                drivingScore: drivingScore,
                scoreText: scoreText,
                scoreTextStyle: scoreTextStyle,
                topText: tripPlace,
                bottomLeftText: tripDate,
                topTextStyle: topTextStyle,
                tripDateTextStyle: tripDateTextStyle,
                tripTimeTextStyle: tripTimeTextStyle,
                topSvgPath: topSvgPath,
                percentIndicatorRadius: percentIndicatorRadius,
                iconShadows: topSvgIconShadow,
                iconColor: topSvgIconColor,
                hasError: hasError,
                tagColor: tagColor,
                banner: tripItemNoteBanner,
                additionalPadding: topTextPadding,
                showIconIfError: showIconIfError,
                onScoreTap: onScoreTap,
                onTopItemTap: onTopItemTap,
                errorWidget: errorWidget,
              ),
              SizedBox(
                  height: disableFixedHeight ? null : 150,
                  child: isMap
                      ? AW_GoogleMap(
                          onTap: onTap,
                          zoomControlsEnabled: mapZoomControlsEnabled,
                          myLocationButtonEnabled: mapMyLocationButtonEnabled,
                          mapType: mapType,
                          shouldAnimateMap: shouldAnimateMap,
                          zoomGesturesEnabled: mapZoomGesturesEnabled,
                          scrollGesturesEnabled: mapScrollGesturesEnabled,
                          mapTarget: mapTarget,
                          mapZoom: mapZoom,
                          mapMarkers: mapMarkers,
                          mapPolylines: mapPolylines,
                          firstAndLastPoints: mapFirstAndLastPoints,
                        )
                      : GestureDetector(
                          onTap: () {
                            if (onImgTap != null) {
                              onImgTap!();
                            }
                          },
                          child: AW_TripStaticImage(staticMapUrl),
                        ),
              ),
              AW_TripItemBottomBar(
                distanceLabel: distanceLabel,
                distanceLabelTextStyle: distanceLabelTextStyle,
                distanceValue: distanceValue,
                distanceValueTextStyle: distanceValueTextStyle,
                durationLabel: durationLabel,
                durationLabelTextStyle: durationLabelTextStyle,
                durationValue: durationValue,
                durationValueTextStyle: durationValueTextStyle,
                bottomSvgPath: bottomSvgPath,
                recordedWithBluetooth: recordedWithBluetooth,
                hasError: hasError,
                isBluetoothAvailable: isBluetoothAvailable,
                valuesSpacing: valuesSpacing,
                tags: tags,
                onBottomItemTap: onBottomItemTap,
              )
            ],
          ),
        )
      ],
    );
  }
}

class AW_TripItemTopBar extends StatelessWidget {
  const AW_TripItemTopBar(
      {Key? key,
      required this.scoreColor,
      this.iconBackgroundColor = Colors.white,
      this.drivingScore = 0,
      this.scoreText = '',
      this.scoreTextStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color.fromRGBO(35, 31, 32, 1)),
      this.topText = '',
      this.bottomLeftText = '',
      this.topTextStyle = const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color.fromRGBO(158, 158, 158, 1)),
      this.tripDateTextStyle = const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: Color.fromRGBO(35, 31, 32, 1)),
      this.tripTimeTextStyle = const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: Color.fromRGBO(35, 31, 32, 1)),
      this.topSvgPath,
      this.percentIndicatorRadius = 40,
      this.textAlignment = CrossAxisAlignment.center,
      this.iconShadows,
      this.iconColor,
      required this.hasError,
      this.drawIndicatorIfError = false,
      this.tagColor = const Color.fromRGBO(242, 153, 74, 1),
      required this.banner,
      this.additionalPadding = const EdgeInsets.symmetric(horizontal: 8),
      this.showIconIfError = true,
      this.onScoreTap,
      this.onTopItemTap,
      this.errorWidget})
      : super(key: key);

  final Color scoreColor;
  final double drivingScore;
  final String scoreText;
  final TextStyle scoreTextStyle;
  final String topText;
  final String bottomLeftText;

  final TextStyle topTextStyle;
  final TextStyle tripDateTextStyle;
  final TextStyle tripTimeTextStyle;
  final String? topSvgPath;
  final double percentIndicatorRadius;
  final CrossAxisAlignment textAlignment;
  final List<BoxShadow>? iconShadows;
  final Color? iconBackgroundColor;
  final Color? iconColor;
  final bool hasError;
  final bool drawIndicatorIfError;
  final Color tagColor;
  final Widget? banner;
  final EdgeInsets additionalPadding;
  final bool showIconIfError;
  final VoidCallback? onScoreTap;
  final VoidCallback? onTopItemTap;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (banner != null) banner!,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    if (onScoreTap != null) {
                      onScoreTap!();
                    }
                  },
                  child: TripItemIndicator(
                    percentIndicatorRadius: percentIndicatorRadius,
                    scoreTextStyle: scoreTextStyle,
                    scoreText: scoreText,
                    drivingScore: drivingScore,
                    scoreColor: scoreColor,
                    drawIndicatorIfError: drawIndicatorIfError,
                    hasError: hasError,
                    errorWidget: errorWidget,
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      if (onTopItemTap != null) {
                        onTopItemTap!();
                      }
                    },
                    child: Padding(
                      padding: additionalPadding,
                      child: Column(
                        crossAxisAlignment: textAlignment,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          if (topText.isNotEmpty)
                            Text(
                              topText,
                              style: topTextStyle,
                            )
                          else
                            const SizedBox(),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Flexible(
                                child: Text(
                                  bottomLeftText,
                                  style: tripDateTextStyle,
                                  textAlign: TextAlign.center,
                                  //maxLines: 6,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (onTopItemTap != null) {
                      onTopItemTap!();
                    }
                  },
                  child: _TripItemIcon(
                    hasError: hasError,
                    topSvgPath: topSvgPath,
                    iconShadows: iconShadows,
                    iconBackgroundColor: iconBackgroundColor,
                    iconColor: iconColor,
                    showIconIfError: showIconIfError,
                  ),
                ),
              ],
            )
          ],
        ));
  }
}

class _TripItemIcon extends StatelessWidget {
  const _TripItemIcon(
      {Key? key, required this.hasError, this.topSvgPath, this.iconShadows, this.iconBackgroundColor, this.iconColor, this.showIconIfError = true})
      : super(key: key);

  final bool hasError;
  final String? topSvgPath;
  final List<BoxShadow>? iconShadows;
  final Color? iconBackgroundColor;
  final Color? iconColor;
  final bool showIconIfError;

  @override
  Widget build(BuildContext context) {
    if (hasError && showIconIfError) {
      return const Icon(Icons.info_outline, color: Color.fromRGBO(235, 87, 87, 1));
    }
    return (topSvgPath == null)
        ? const SizedBox()
        : Container(
            decoration: BoxDecoration(boxShadow: iconShadows, borderRadius: BorderRadius.circular(10)),
            child: ClipOval(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    height: 40,
                    width: 40,
                    color: iconBackgroundColor ?? Colors.white,
                  ),
                  SvgPicture.asset(
                    topSvgPath!,
                    color: iconColor,
                  )
                ],
              ),
            ),
          );
  }
}

class TripItemIndicator extends StatelessWidget {
  const TripItemIndicator(
      {Key? key,
      required this.percentIndicatorRadius,
      required this.scoreTextStyle,
      required this.scoreText,
      required this.drivingScore,
      required this.scoreColor,
      required this.drawIndicatorIfError,
      required this.hasError,
      this.alignment = Alignment.centerLeft,
      this.errorWidget})
      : super(key: key);

  final double percentIndicatorRadius;
  final Color scoreColor;
  final double drivingScore;
  final String scoreText;
  final TextStyle scoreTextStyle;
  final bool hasError;
  final bool drawIndicatorIfError;
  final Alignment alignment;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    if (hasError) {
      if (drawIndicatorIfError) {
        return CircularPercentIndicator(
          radius: percentIndicatorRadius,
          progressColor: scoreColor,
          lineWidth: 2,
          percent: 1,
          center:
              errorWidget ?? Text(scoreText, style: hasError ? const TextStyle(fontSize: 14, color: Color.fromRGBO(235, 87, 87, 1)) : scoreTextStyle),
        );
      }

      return errorWidget ??
          Text(
            scoreText,
            style: const TextStyle(fontSize: 12, color: Color.fromRGBO(235, 87, 87, 1)),
          );
    }
    return Align(
      alignment: alignment,
      child: CircularPercentIndicator(
        radius: percentIndicatorRadius,
        progressColor: scoreColor,
        lineWidth: 2,
        percent: drivingScore / 100,
        center: Text(scoreText, style: scoreTextStyle),
      ),
    );
  }
}

class AW_TripItemBottomBar extends StatelessWidget {
  const AW_TripItemBottomBar(
      {Key? key,
      required this.distanceLabel,
      this.distanceLabelTextStyle = const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color.fromRGBO(158, 158, 158, 1)),
      this.distanceValue = '',
      this.distanceValueTextStyle = const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color.fromRGBO(35, 31, 32, 1)),
      this.bottomSvgPath,
      required this.durationLabel,
      this.durationLabelTextStyle = const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color.fromRGBO(158, 158, 158, 1)),
      this.durationValue = '',
      this.durationValueTextStyle = const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color.fromRGBO(35, 31, 32, 1)),
      required this.recordedWithBluetooth,
      required this.hasError,
      required this.isBluetoothAvailable,
      this.valuesSpacing = 0,
      this.tags,
      this.onBottomItemTap})
      : super(key: key);

  final String distanceLabel;
  final TextStyle distanceLabelTextStyle;
  final String distanceValue;
  final TextStyle distanceValueTextStyle;
  final String? bottomSvgPath;
  final String durationLabel;
  final TextStyle durationLabelTextStyle;
  final String durationValue;
  final TextStyle durationValueTextStyle;
  final bool recordedWithBluetooth;
  final bool hasError;

  ///controls whether the bluetooth icon will be displayed
  ///some projects don't have bluetooth supported which don't show the icon at all
  ///if projects supports bluetooth icon will be displayed (depending on #recordedWithBluetooth)
  final bool isBluetoothAvailable;
  final double valuesSpacing;
  final Widget? tags;
  final VoidCallback? onBottomItemTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (onBottomItemTap != null) {
                  onBottomItemTap!();
                }
              },
              behavior: HitTestBehavior.translucent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (distanceLabel.isNotEmpty)
                    Text(
                      distanceLabel,
                      style: distanceLabelTextStyle,
                    ),
                  SizedBox(
                    height: valuesSpacing,
                  ),
                  Text(
                    distanceValue,
                    style: distanceValueTextStyle,
                  )
                ],
              ),
            ),
          ),
          // Expanded(
          //
          //     //behavior: HitTestBehavior.translucent,
          //     child: Container(),
          //
          //   ),
          _buildTags(),
          // GestureDetector(
          //     onTap: () {
          //       if (onBottomItemTap != null) {
          //         onBottomItemTap!();
          //       }
          //     },
          //     behavior: HitTestBehavior.translucent,
          //     child: const Spacer(),
          //
          //   ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (onBottomItemTap != null) {
                  onBottomItemTap!();
                }
              },
              behavior: HitTestBehavior.translucent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  if (durationLabel.isNotEmpty)
                    Text(
                      durationLabel,
                      style: durationLabelTextStyle,
                    ),
                  SizedBox(
                    height: valuesSpacing,
                  ),
                  Text(
                    durationValue,
                    style: durationValueTextStyle,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTags() {
    if (tags != null) {
      return tags!;
    }
    if (isBluetoothAvailable && bottomSvgPath != null)
      return SvgPicture.asset(bottomSvgPath!, color: recordedWithBluetooth ? Colors.blue : const Color.fromRGBO(197, 205, 211, 1));
    return const SizedBox();
  }
}

class ScorePercentIndicator extends StatelessWidget {
  const ScorePercentIndicator(
      {Key? key,
      this.radius = 72,
      required this.scoreColor,
      required this.scoreText,
      required this.scoreTextStyle,
      required this.percent,
      required this.lineWidth,
      required this.tripType,
      this.error})
      : super(key: key);

  final double radius;
  final Color scoreColor;
  final double lineWidth;
  final double percent;
  final String scoreText;
  final TextStyle scoreTextStyle;
  final TripTypes tripType;
  final String? error;

  @override
  Widget build(BuildContext context) {
    if (tripType == TripTypes.unknown) {
      return Text(
        error == null ? '' : error!,
        style: const TextStyle(fontSize: 12, color: Color.fromRGBO(235, 87, 87, 1)),
      );
    }
    return CircularPercentIndicator(
      radius: radius,
      progressColor: scoreColor,
      percent: percent,
      center: Text(
        scoreText,
        style: scoreTextStyle,
      ),
    );
  }
}

class TripItemNoteBanner extends StatelessWidget {
  const TripItemNoteBanner({Key? key, required this.text, this.implyLeadingInfo = true, this.textIconColor = Colors.black}) : super(key: key);

  final String text;
  final bool implyLeadingInfo;
  final Color textIconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          if (implyLeadingInfo)
            Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Icon(
                  Icons.info_outline,
                  color: textIconColor,
                  size: 20,
                ))
          else
            const SizedBox(),
          Flexible(
              child: Text(
            text,
            style: TextStyle(color: textIconColor, fontSize: 14),
            textAlign: TextAlign.center,
          ))
        ],
      ),
    );
  }
}
