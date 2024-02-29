
part of widgets;

class AW_PolicyPopupItem extends StatelessWidget {
  const AW_PolicyPopupItem({
    Key? key,
    required this.label,
    required this.value,
    this.onInfoTap,
    this.textColor = Colors.white,
    this.iconData = Icons.info_outline,
    this.height = 30
  }) : super(key: key);

  final Color textColor;
  final String label;
  final String value;
  final VoidCallback? onInfoTap;
  final IconData iconData;
  /// items with info icon are higher than those without one
  /// this arg makes them equal in height
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: key,
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: height,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  label,
                  style: TextStyle(
                    color: textColor,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
                if(onInfoTap != null)
                  IconButton(
                    onPressed: onInfoTap!,
                    icon: Icon(iconData, color: Colors.white.withOpacity(0.3),),
                    splashRadius: 20,
                    padding: EdgeInsets.zero,
                  )
              ],
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: textColor,
              fontSize: 18,
              height: 1.5
            ),
          ),
        ],
      ),
    );
  }
}
