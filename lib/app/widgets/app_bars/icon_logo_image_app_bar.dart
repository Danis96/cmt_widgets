part of widgets;

PreferredSizeWidget AW_AppBarIconLogoImage(
  BuildContext context, {
  String? logo,
  String profileImage = '',
  IconData? leadingIcon,
  Function? onLeadingPressed,
  Color? backgroundColor = const Color.fromRGBO(2, 23, 100, 1),
  Color? leadingColor = const Color.fromRGBO(255, 255, 255, 1),
  Key? widgetKey,
  Key? leadingKey,
  Key? profileImageKey,
  String? userInitials = '',
  Function? onProfileImgTap,
  List<Widget>? actionWidget,
  Function? onActionTap,
  Function? onBatteryTap,
  bool isOnlyProfileImg = true,
}) {
  return AppBar(
    key: widgetKey,
    backgroundColor: backgroundColor,
    title: logo != null ? SvgPicture.asset(logo) : const SizedBox(),
    leading: IconButton(
      key: leadingKey,
      onPressed: () => onLeadingPressed!(),
      icon: Icon(leadingIcon, color: leadingColor),
    ),
    actions: <Widget>[
      if (isOnlyProfileImg)
        GestureDetector(
          key: profileImageKey,
          onTap: () => onProfileImgTap!(),
          child: Container(
            margin: const EdgeInsets.only(right: 24),
            height: 32,
            width: 30,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Container(
                  height: 30,
                  width: 30,
                  color: Colors.grey,
                  child: profileImage.isNotEmpty ? Image.network(profileImage) : _errorImageReturn(context, userInitials!),
                ),
              ),
            ),
          ),
        )
      else
        Container(
          child: Row(
            children: <Widget>[
              if (actionWidget != null)
                Container(
                    width: Platform.isAndroid ? MediaQuery.of(context).size.width / 5.3 : 30,
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: actionWidget)),
              const SizedBox(width: 15),
              GestureDetector(
                key: profileImageKey,
                onTap: () => onProfileImgTap!(),
                child: Container(
                  margin: const EdgeInsets.only(right: 24),
                  height: 32,
                  width: 32,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: Container(
                        height: 30,
                        width: 30,
                        color: Colors.grey,
                        child: profileImage.isNotEmpty ? Image.network(profileImage) : _errorImageReturn(context, userInitials!),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
    ],
  );
}

Widget _errorImageReturn(BuildContext context, String userInitials) {
  return Container(
    height: 30,
    width: 30,
    color: const Color.fromRGBO(224, 224, 224, 1),
    child: Center(
      child: Text(
        userInitials,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: const Color.fromRGBO(6, 62, 89, 1), fontWeight: FontWeight.w700),
      ),
    ),
  );
}
