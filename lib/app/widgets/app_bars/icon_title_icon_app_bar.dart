part of widgets;

PreferredSizeWidget AW_AppBarIconTitleIcon(
  BuildContext context, {
  Key? key,
  String title = '',
  bool implyLeading = true,
  bool implyAction = true,
  bool centerTitle = true,
  Color backgroundColor = Colors.white,
  Color titleColor = Colors.white,
  @required Function? onActionPressed,
  @required Function? onLeadingPressed,
  IconData? leadingIcon,
  Widget? actionWidget,
  Key? actionKey,
  Color leadingIconColor = Colors.grey,
  double arrowLeftMargin = 0,
  double? leadingWidth,
  PreferredSizeWidget? bottomWidget,
  ShapeBorder? shape,
  //widget to be in place of title, if this is not null then text 'title' will never be shown
  Widget? titleWidget,
  //widget to be in place of leadingIcon, if this is not null then leadingIcon will never be shown
  Widget? leadingWidget,
  bool useTheme = false,
  double? elevation,
  Color? shadowColor
}) {
  return AppBar(
    key: key,
    shape: shape,
    title: titleWidget ??
        Text(
          title,
          style: useTheme ? Theme.of(context).appBarTheme.titleTextStyle : Theme.of(context).appBarTheme.titleTextStyle?.copyWith(fontSize: 18, color: titleColor),
        ),
    bottom: bottomWidget,
    elevation: elevation,
    shadowColor: shadowColor,
    centerTitle: centerTitle,
    backgroundColor: backgroundColor,
    leading: implyLeading ? returnLeading(leadingWidget, leadingIcon, leadingIconColor, onLeadingPressed, arrowLeftMargin) : const SizedBox(),
    leadingWidth: leadingWidth,
    actions: <Widget>[
      if (implyAction)
        GestureDetector(
          key: actionKey,
          onTap: () => onActionPressed!(),
          child: Center(
            child: Container(
              margin: const EdgeInsets.only(right: 24),
              child: actionWidget,
            ),
          ),
        )
      else
        const SizedBox(),
    ],
  );
}

Widget returnLeading(
  Widget? leadingWidget,
  IconData? leadingIcon,
  Color leadingIconColor,
  Function? onLeadingPressed,
  double arrowLeftMargin,
) {
  return leadingWidget ??
      Container(
        margin: EdgeInsets.only(left: arrowLeftMargin),
        child: IconButton(
          onPressed: () => onLeadingPressed!(),
          icon: Icon(
            leadingIcon,
            color: leadingIconColor,
          ),
        ),
      );
}
