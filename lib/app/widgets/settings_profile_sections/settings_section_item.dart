part of widgets;

class SettingsSectionItemModel {
  const SettingsSectionItemModel({
    @required this.onTap,
    this.height = 56.0,
    this.backgroundColor = Colors.white,
    this.padding = const EdgeInsets.only(left: 28.0, right: 32.0),
    this.leftIcon,
    this.rightIcon,
    this.title = '',
    this.tapKey,
      this.titleTextStyle = const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, color: Color.fromRGBO(35, 44, 53, 1)),
    this.badgeNumber,
    this.badgeColor = const Color.fromRGBO(47, 201, 218, 1),
    this.badgeTextStyle = const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w700, color: Colors.white),
  });

  final Key? tapKey;
  final double height;
  final Color backgroundColor;
  final EdgeInsets padding;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final String title;
  final TextStyle titleTextStyle;
  final Function? onTap;
  final int? badgeNumber;
  final Color badgeColor;
  final TextStyle badgeTextStyle;
}

class AW_SettingsSectionItem extends StatelessWidget {
  const AW_SettingsSectionItem({Key? key, this.itemModel = const SettingsSectionItemModel(onTap: null)}) : super(key: key);

  final SettingsSectionItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: itemModel.tapKey,
      onTap: () => itemModel.onTap!(),
      child: Container(
        height: itemModel.height,
        width: double.infinity,
        color: itemModel.backgroundColor,
        child: Padding(
          padding: itemModel.padding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              if (itemModel.leftIcon != null) Padding(padding: const EdgeInsets.only(right: 18.0), child: itemModel.leftIcon) else const SizedBox(),
              Expanded(child: Text(itemModel.title)),
              returnBadgeNumber(itemModel.badgeNumber),
              itemModel.rightIcon ?? const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Widget returnBadgeNumber(int? number) {
    return (number == null || number == 0)
        ? const SizedBox()
        : Padding(
            padding: const EdgeInsets.only(right: 16.59),
            child: Container(
              height: 24.0,
              width: 24.0,
              decoration: BoxDecoration(
                color: itemModel.badgeColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                  child: Text(
                returnTextFromNumber(number),
                style: itemModel.badgeTextStyle,
              )),
            ),
          );
  }

  String returnTextFromNumber(int number) {
    return number < 10 ? '$number' : '9+';
  }
}
