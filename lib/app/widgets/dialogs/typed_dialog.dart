part of widgets;

///shows typed dialog (DialogType)
///values are used from the singleton instance TypedDialogConfig that is setup
///at the start of the project (shared main file)
///title and content widget can be forced (instead of tile and content strings)
///customizable values are setup from the type argument
Future<bool?> AW_TypedDialog(
  BuildContext context,
  DialogType type, {
  String title = '',
  String content = '',
  String key = '',
  String imgForSpecificProfile = '',
  String buttonTitle = '',
  bool barrierDismissible = true,
  bool canPop = true,
  bool specificUserProfileDialogInfo = false,
  Widget? titleWidget,
  Widget? contentWidget,
  Widget? bottomWidget,
  Color? contentColor,
  Function? onTap,
}) async {
  late TypedDialogTypeValues values;
  switch (type) {
    case DialogType.INFO:
      values = TypedDialogConfig.instance.values.infoDialogConfiguration;
      break;
    case DialogType.SUCCESS:
      values = TypedDialogConfig.instance.values.successDialogConfiguration;
      break;
    default:
      values = TypedDialogConfig.instance.values.errorDialogConfiguration;
  }

  return await showDialog<bool>(
    barrierDismissible: barrierDismissible,
    context: context,
    builder: (_) => WillPopScope(
        onWillPop: () async {
          return canPop;
        },
        child: AlertDialog(
          contentPadding: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
          key: Key(key),
          content: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Image.asset(values.backgroundImagePath),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: specificUserProfileDialogInfo
                          ? Image.asset(
                              imgForSpecificProfile,
                              height: 70,
                              width: 70,
                            )
                          : Image.asset(
                              values.iconImagePath,
                              height: 70,
                              width: 70,
                            ),
                    ),
                    Positioned(
                        right: 14,
                        top: 10,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              child: const Padding(
                                padding: EdgeInsets.all(12),
                                child: Icon(
                                  Icons.close,
                                  color: Color(0xffE0E0E0),
                                ),
                              ),
                              onTap: () => Navigator.of(context).pop(),
                            ),
                          ),
                        ))
                  ],
                ),
                //content
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: <Widget>[
                      titleWidget ??
                          Text(
                            title,
                            style: values.titleStyle,
                            textAlign: TextAlign.center,
                          ),
                      const SizedBox(
                        height: 14,
                      ),
                      contentWidget ??
                          Text(
                            content,
                            style: values.contentStyle,
                            textAlign: TextAlign.center,
                          ),
                      const SizedBox(height: 40),
                      if (buttonTitle.isNotEmpty)
                        AW_Button(
                          onPressed: () {
                            if (onTap != null) {
                              onTap();
                            } else {
                              //pop and return value
                              //returned to called
                              Navigator.of(context).pop(true);
                            }
                          },
                          buttonTitle: buttonTitle,
                          style: ElevatedButton.styleFrom(backgroundColor: values.buttonColor),
                        ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
                if (bottomWidget != null) bottomWidget else const SizedBox(),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        )),
  );
}

///all dialog types supported
///type must be passed at every point of call
enum DialogType { INFO, SUCCESS, ERROR }

///value field of the singleton
///separated per dialog type
class TypedDialogValues {
  const TypedDialogValues({required this.infoDialogConfiguration, required this.errorDialogConfiguration, required this.successDialogConfiguration});

  final TypedDialogTypeValues infoDialogConfiguration;
  final TypedDialogTypeValues errorDialogConfiguration;
  final TypedDialogTypeValues successDialogConfiguration;
}

///singleton of typed dialog setup
///should be setup from the project
///inside shared main function (not per flavor)
class TypedDialogConfig {
  factory TypedDialogConfig({
    required TypedDialogValues values,
  }) {
    _instance ??= TypedDialogConfig._internal(values);
    return _instance!;
  }

  TypedDialogConfig._internal(this.values);

  final TypedDialogValues values;
  static TypedDialogConfig? _instance;

  static TypedDialogConfig get instance {
    return _instance!;
  }
}

///values passed for dialog type (DialogType)
///values are divided per dialog type
///every type has it's own values
class TypedDialogTypeValues {
  const TypedDialogTypeValues(
      {required this.buttonColor,
      required this.backgroundImagePath,
      required this.iconImagePath,
      required this.titleStyle,
      required this.contentStyle});

  ///image displayed at the top of the dialog
  final String backgroundImagePath;

  ///icon on dialog (usually a car)
  final String iconImagePath;
  final Color buttonColor;
  final TextStyle titleStyle;
  final TextStyle contentStyle;
}
