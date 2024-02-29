part of widgets;
PreferredSizeWidget AW_VerticalWidgetsAppBar(
  BuildContext context, {
  Key? key,
  Color backgroundColor = Colors.white,
  Color titleColor = Colors.black,
  Function? onLeadingPressed,
  List<Widget>? actions,
  IconData? leadingIcon,
  String title = '',
  PreferredSizeWidget? bottomWidget,
  bool centerTitle = false,
  double elevation = 0
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: backgroundColor,
    centerTitle: centerTitle,
    toolbarHeight: 70,
    elevation: elevation,
    key: key,
    actions: actions,
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10),
        if (leadingIcon != null) GestureDetector(
          onTap: () => onLeadingPressed!(),
          child: Icon(
            leadingIcon,
            color: titleColor,
          ),
        ) else const SizedBox(),
        Text(
          title,
          style: TextStyle(
            fontSize: 32,
            color: titleColor,
          ),
          textAlign: TextAlign.left,
        )
      ],
    ),
  );
}

