part of widgets;

Future<void> showMyDialog({
  BuildContext? context,
  String title = '',
  String msg = '',
  Color color = Colors.white,
  Widget? mainWidget,
  Widget? action,
  double elevation = 0,
  bool barrier = false,
}) async {
  return showDialog<void>(
    context: context!,
    barrierDismissible: barrier,
    builder: (BuildContext context) {
      return WillPopScope(
          child: AlertDialog(
            elevation: 0,
            backgroundColor: color,
            title: Text(title),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[Container(child: mainWidget ?? const SizedBox())],
              ),
            ),
            actions: <Widget>[
              action ?? const SizedBox(),
            ],
          ),
          onWillPop: () async => false);
    },
  );
}

Future<void> AW_LoaderCircleWhite({
  @required BuildContext? context,
}) {
  return showMyDialog(
    msg: '',
    action: const SizedBox(),
    context: context,
    barrier: false,
    title: '',
    mainWidget: const SpinKitCircle(
      size: 80.0,
      color: Colors.white,
    ),
    color: Colors.transparent,
    elevation: 0,
  );
}

Widget AW_FutureBuilderLoader({
  @required BuildContext? context,
}) {
  Future<void>.delayed(
      Duration.zero,
      () => showMyDialog(
            msg: '',
            action: const SizedBox(),
            context: context,
            barrier: false,
            title: '',
            mainWidget: const SpinKitCircle(
              size: 80.0,
              color: Colors.white,
            ),
            color: Colors.transparent,
            elevation: 0,
          ));
  return Container();
}

Future<void> AW_LoaderDotsWave({
  required BuildContext context,
  double size = 80,
  bool barrierDismissible = true,
  Color backgroundColor = const Color.fromRGBO(57, 70, 82, 0.8),
  Color dotsColor = Colors.white,
  double dotsSize = 45
}) async{
  showGeneralDialog(
    context: context,
    barrierColor: Colors.transparent,
    barrierDismissible: barrierDismissible,
    transitionDuration: const Duration(milliseconds: 100),
    barrierLabel: '',
    pageBuilder: (_, __, ___) {
      return WillPopScope(
        onWillPop: () {
          return Future<bool>.value(barrierDismissible);
        },
        child: Container(
          color: backgroundColor,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: LoadingAnimationWidget.staggeredDotsWave(color: dotsColor, size: dotsSize),
          ),
        ),
      );
    },
  );



}

Widget AW_FutureBuilderDots(BuildContext context, {bool barrierDismissible = true}) {
  Future<void>.delayed(Duration.zero, () {
    AW_LoaderDotsWave(context: context, barrierDismissible: barrierDismissible);
  });
  return Container();
}

