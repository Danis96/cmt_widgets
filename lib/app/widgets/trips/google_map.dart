part of widgets;

class AW_GoogleMap extends StatefulWidget {
  const AW_GoogleMap({
    Key? key,
    required this.onTap,
    this.zoomControlsEnabled = false,
    this.myLocationButtonEnabled = false,
    this.mapType = MapType.normal,
    this.mapZoom = 6.0,
    this.mapMarkers = const <Marker>[],
    this.mapPolylines = const <Polyline>{},
    this.mapTarget = const LatLng(0,0),
    this.scrollGesturesEnabled = false,
    this.zoomGesturesEnabled = false,
    this.firstAndLastPoints = const <LatLng>[],
    this.onMapCreated,
    this.circles = const <Circle>{},
    this.isZoomAnimation = false,
    this.shouldAnimateMap = true,
    this.recognizers
  }) : super(key: key);


  final Function(LatLng lng) onTap;
  final bool zoomControlsEnabled;
  final bool myLocationButtonEnabled;
  final MapType mapType;
  final bool zoomGesturesEnabled;
  final bool scrollGesturesEnabled;
  final double mapZoom;
  final LatLng mapTarget;
  final List<Marker> mapMarkers;
  final Set<Polyline> mapPolylines;
  final List<LatLng> firstAndLastPoints;
  final Function(GoogleMapController controller)? onMapCreated;
  final Set<Circle> circles;
  final bool isZoomAnimation;
  final bool shouldAnimateMap;
  final Set<Factory<OneSequenceGestureRecognizer>>? recognizers;
  @override
  _AW_GoogleMapState createState() => _AW_GoogleMapState();
}

class _AW_GoogleMapState extends State<AW_GoogleMap> {

  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();
  late GoogleMapController mapController;
  late LatLng targetLatLng;


  @override
  void initState() {
    targetLatLng = widget.mapTarget;
    super.initState();
  }

  Future<void> check(CameraUpdate u, GoogleMapController c) async {
    if (widget.shouldAnimateMap) {
      c.animateCamera(u);
      mapController.animateCamera(u);
    } else {
      c.moveCamera(u);
      mapController.moveCamera(u);
    }
    final LatLngBounds l1 = await c.getVisibleRegion();
    final LatLngBounds l2 = await c.getVisibleRegion();
    if (l1.southwest.latitude == -90 || l2.southwest.latitude == -90)
      check(u, c);
  }

  void _onMapCreated(GoogleMapController controller) {
    Future<void>.delayed(const Duration(seconds: 1), () {
      mapController = controller;
      _controller.complete(controller);
      LatLngBounds boundsFromLatLngList(List<LatLng> list) {
        try {
          assert(list.isNotEmpty);
        } catch (e) {
          print(e);
        }
        double? x0, x1, y0, y1;
        for (final LatLng latLng in list) {
          if (x0 == null) {
            x0 = x1 = latLng.latitude;
            y0 = y1 = latLng.longitude;
          } else {
            if (latLng.latitude > x1!) {
              x1 = latLng.latitude;
            }
            if (latLng.latitude < x0) {
              x0 = latLng.latitude;
            }
            if (latLng.longitude > y1!) {
              y1 = latLng.longitude;
            }
            if (latLng.longitude < y0!) {
              y0 = latLng.longitude;
            }
          }
        }
        return LatLngBounds(
            northeast: LatLng(x1 ?? 0, y1 ?? 0), southwest: LatLng(x0 ?? 0, y0 ?? 0));
      }

      final CameraUpdate u2 = CameraUpdate.newLatLngBounds(boundsFromLatLngList(widget.firstAndLastPoints), 50);
      final CameraUpdate u3 = CameraUpdate.newLatLngZoom(widget.firstAndLastPoints.last, 15);
      final CameraUpdate cameraUpdateIsZoom = widget.isZoomAnimation ? u3 : u2;
      if (widget.shouldAnimateMap) {
        mapController.animateCamera(cameraUpdateIsZoom).then((void v) {
          check(cameraUpdateIsZoom, mapController);
        });
      } else {
        mapController.moveCamera(widget.isZoomAnimation ? u3 : u2).then((void v) {
          check(cameraUpdateIsZoom, mapController);
        });
      }
    });
  }

  void _onCameraMove(CameraPosition position) {
    targetLatLng = position.target;
  }


  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onTap: (LatLng lng) => widget.onTap(lng),
      zoomControlsEnabled: widget.zoomControlsEnabled,
      myLocationButtonEnabled: widget.myLocationButtonEnabled,
      mapType: widget.mapType,
      zoomGesturesEnabled: widget.zoomGesturesEnabled,
      scrollGesturesEnabled: widget.scrollGesturesEnabled,
      initialCameraPosition: CameraPosition(
        target: targetLatLng,
        zoom: widget.mapZoom,
      ),
      markers: Set<Marker>.of(widget.mapMarkers),
      polylines: widget.mapPolylines,
      // ignore: always_specify_types
      gestureRecognizers: widget.recognizers ?? <Factory<OneSequenceGestureRecognizer>>{}..add(
        Factory<PanGestureRecognizer>(
              () => PanGestureRecognizer(),
        ),
      ),
      onCameraMove: _onCameraMove,
      onMapCreated: widget.onMapCreated ?? _onMapCreated,
      circles: widget.circles
    );
  }
}
