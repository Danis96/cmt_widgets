part of widgets;

class AW_TripListItem extends StatelessWidget {
  const AW_TripListItem({
    Key? key,
    this.isTripAnalized = true,
    this.scoreColor = Colors.orange,
    this.drivingScore = 0.0,
    this.scoreText = '',
    this.tripDate = '',
    this.tripTime = '',
    this.durationValue = '',
    this.distanceValue = '',
    this.durationLabel = '',
    this.distanceLabel = '',
    this.dateTextStyle = const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, color: Color.fromRGBO(28, 37, 53, 1)),
    this.timeTextStyle = const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, color: Color.fromRGBO(28, 37, 53, 1)),
    this.durationLabelTextStyle = const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: Color.fromRGBO(70, 83, 93, 1)),
    this.distanceLabelTextStyle = const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: Color.fromRGBO(70, 83, 93, 1)),
    this.durationValueTextStyle = const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600, color: Color.fromRGBO(28, 37, 53, 1)),
    this.distanceValueTextStyle = const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600, color: Color.fromRGBO(28, 37, 53, 1)),
    this.scoreTextTextStyle = const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600, color: Color.fromRGBO(28, 37, 53, 1)),
    this.scoreNumberTextStyle = const TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600, color: Color.fromRGBO(252, 144, 68, 1)),
    this.onTap,
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
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
    this.itemShadow,
    this.cardColor = const Color.fromRGBO(255, 255, 255, 1),
    this.shouldAnimateMap = true,
    this.hasShadow = true,
    this.bluetoothTagIcon = '',
    this.bluetoothTag = false,
    this.distanceKm = 'km',
    this.percentageScoreHeight = 84,
    this.staticMapUrl = '',
    this.isMap = false,
    this.onImgTap,
  }) : super(key: key);

  final bool isTripAnalized;
  final Color scoreColor;
  final String scoreText;
  final double drivingScore;
  final double percentageScoreHeight;
  final String tripDate;
  final String tripTime;
  final String durationValue;
  final String distanceValue;
  final String durationLabel;
  final String distanceLabel;
  final TextStyle dateTextStyle;
  final TextStyle timeTextStyle;
  final TextStyle durationLabelTextStyle;
  final TextStyle durationValueTextStyle;
  final TextStyle distanceLabelTextStyle;
  final TextStyle distanceValueTextStyle;
  final TextStyle scoreTextTextStyle;
  final TextStyle scoreNumberTextStyle;
  final Function(LatLng latLng)? onTap;
  final Function()? onImgTap;
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
  final List<BoxShadow>? itemShadow;
  final BorderRadius borderRadius;
  final Color cardColor;
  final bool shouldAnimateMap;
  final bool hasShadow;
  final bool bluetoothTag;
  final String bluetoothTagIcon;
  final String distanceKm;
  final String staticMapUrl;
  final bool isMap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: borderRadius,
        boxShadow: hasShadow
            ? const <BoxShadow>[BoxShadow(color: Color.fromRGBO(50, 50, 71, 0.2), spreadRadius: 0, blurRadius: 16, offset: Offset(0, 8))]
            : const <BoxShadow>[],
      ),
      width: 327,
      height: 240,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 10.0, top: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Text(tripDate, style: dateTextStyle),
                    ),
                    if (bluetoothTag)
                      Expanded(
                        child: Container(
                          height: 18,
                          width: 18,
                          child: SvgPicture.asset(
                            bluetoothTagIcon,
                            color: const Color.fromRGBO(6, 62, 89, 1),
                          ),
                        ),
                      ),
                    Expanded(
                      child: Text(
                        tripTime,
                        style: timeTextStyle,
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
              ),
              if (isMap)
                Expanded(
                  child: Container(
                    color: Colors.grey,
                    child: AW_GoogleMap(
                      onTap: (LatLng lng) {
                        if(onTap != null) {
                          onTap!(lng);
                        }
                      },
                      zoomControlsEnabled: mapZoomControlsEnabled,
                      myLocationButtonEnabled: mapMyLocationButtonEnabled,
                      shouldAnimateMap: shouldAnimateMap,
                      mapType: mapType,
                      zoomGesturesEnabled: mapZoomGesturesEnabled,
                      scrollGesturesEnabled: mapScrollGesturesEnabled,
                      mapTarget: mapTarget,
                      mapZoom: mapZoom,
                      mapMarkers: mapMarkers,
                      mapPolylines: mapPolylines,
                      firstAndLastPoints: mapFirstAndLastPoints,
                    ),
                  ),
                )
              else
                Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        if(onImgTap != null) {
                          onImgTap!();
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(staticMapUrl), fit: BoxFit.cover)),
                      ),
                    )),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, left: 16.0, right: 16.0, top: 9.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _footerItem(durationValue, durationLabel),
                    _footerItem('$distanceValue $distanceKm', distanceLabel),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: tripsPercentageIndicator(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                scoreText,
                style: scoreTextTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _footerItem(String value, String name) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(name, style: distanceLabelTextStyle),
        const SizedBox(height: 4),
        Text(value, style: distanceValueTextStyle),
      ],
    );
  }

  Widget tripsPercentageIndicator() {
    return Container(
      decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      height: percentageScoreHeight,
      width: 84,
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: 60,
          width: 60,
          child: SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                showLabels: false,
                showTicks: false,
                startAngle: 180,
                endAngle: 0,
                radiusFactor: 1,
                canScaleToFit: true,
                axisLineStyle: const AxisLineStyle(
                  thickness: 0.15,
                  color: Colors.grey,
                  thicknessUnit: GaugeSizeUnit.factor,
                  cornerStyle: CornerStyle.bothCurve,
                ),
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                    positionFactor: 0.0,
                    angle: 90,
                    widget: Text(
                      isTripAnalized ? drivingScore.toStringAsFixed(0) : '-',
                      style: scoreNumberTextStyle.copyWith(color: scoreColor),
                    ),
                  ),
                ],
                pointers: <GaugePointer>[
                  RangePointer(
                    value: isTripAnalized ? drivingScore : 0,
                    width: 0.15,
                    color: scoreColor,
                    sizeUnit: GaugeSizeUnit.factor,
                    cornerStyle: CornerStyle.bothCurve,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
