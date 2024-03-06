part of widgets;

PreferredSizeWidget AW_IconImageTextIconAlignLeftAppBar(
  BuildContext context, {
  Key? key,
  Function? onBack,
  Color backgroundColor = const Color.fromRGBO(6, 62, 89, 1),
  String title = '',
  Function? onDelete,
  bool? shouldShowImage = true,
  String imageUrl = '',
  TextStyle titleTextStyle = const TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  ),
  Icon rightIcon = const Icon(
    Icons.delete,
    color: Colors.white,
    size: 28,
  ),
  Icon leadingIcon = const Icon(
    Icons.arrow_back_ios,
    color: Colors.white,
  ),
  double elevation = 0.8,
  bool useCached = true
}) {
  return AppBar(
    titleSpacing: 0.0,
    toolbarHeight: 65,
    key: key,
    title: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(width: 24),
        IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          icon: leadingIcon,
          onPressed: onBack == null ? null : () => onBack(),
        ),
        const SizedBox(width: 15),
        if (shouldShowImage ?? false) Expanded(
                flex: 1,
                child: useCached ? CachedNetworkImage(
                  imageUrl: imageUrl.isNotEmpty
                      ? imageUrl
                      : 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png',
                  imageBuilder:
                      (BuildContext context, ImageProvider imageProvider) =>
                          CircleAvatar(
                    backgroundColor: const Color.fromRGBO(227, 233, 239, 1),
                    backgroundImage: imageProvider,
                    radius: 18,
                  ),
                  placeholder: (BuildContext context, _) => CircleAvatar(
                    backgroundColor: Colors.grey[300],
                  ),
                ) :
                CircleAvatar(
                  radius: 18,
                  backgroundColor: const Color.fromRGBO(227, 233, 239, 1),
                  child: Image.network(
                    imageUrl.isNotEmpty
                        ? imageUrl
                        : 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png',
                  ),
                ),
              ) else const SizedBox.shrink(),
        const SizedBox(width: 8),
        Expanded(
          flex: 6,
          child: Text(title,
              style: titleTextStyle, overflow: TextOverflow.ellipsis),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          icon: rightIcon,
          onPressed: onDelete == null ? null : () => onDelete(),
        ),
        const SizedBox(width: 24),
      ],
    ),
    centerTitle: false,
    backgroundColor: backgroundColor,
    elevation: elevation,
    automaticallyImplyLeading: false,
  );
}
