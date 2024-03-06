part of widgets;

class AW_DemoStatisticItem extends StatelessWidget {
  const AW_DemoStatisticItem({
    Key? key,
    required this.title,
    required this.value,
    required this.actionItemIcon,
    required this.actionItemTitle,
    required this.actionItemValue,
    required this.centerItemIcon,
    required this.centerItemTitle,
    required this.centerItemValue,
    required this.leadingItemIcon,
    required this.leadingItemTitle,
    required this.leadingItemValue,
    required this.valuesVerticalSpacing,
    required this.totalValueStyle,
    required this.valuesTextStyle,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.showSpacers = true,
    this.titleStyle,
    this.innerPadding = const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    this.iconColor = const Color(0xff17A4A0),
  }) : super(key: key);


  final String title;
  final String value;
  final String leadingItemIcon;
  final String leadingItemTitle;
  final String leadingItemValue;
  final String centerItemIcon;
  final String centerItemTitle;
  final String centerItemValue;
  final String actionItemIcon;
  final String actionItemTitle;
  final String actionItemValue;

  final TextStyle? valuesTextStyle;
  final TextStyle? totalValueStyle;
  final TextStyle? titleStyle;
  final double valuesVerticalSpacing;
  final EdgeInsets innerPadding;
  final Color iconColor;
  final MainAxisAlignment mainAxisAlignment;
  final bool showSpacers;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Color.fromRGBO(35, 31, 32, 0.15),
            spreadRadius: 0,
            blurRadius: 24,
            offset: Offset(0, 8)
          )
        ]
      ),
      child: Padding(
        padding: innerPadding,
        child: Column(
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: titleStyle ?? Theme.of(context).textTheme.displayMedium
            ),

            if(showSpacers)
              const SizedBox(height: 15),

            Text(
              value,
              style: totalValueStyle
            ),

            if(showSpacers)
              const SizedBox(height: 5),

            const Divider(),

            if(showSpacers)
              const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildRowItem(context: context, icon: leadingItemIcon, title: leadingItemTitle, value: leadingItemValue, spacing: valuesVerticalSpacing, iconColor: iconColor),
                _buildRowItem(context: context, icon: centerItemIcon, title: centerItemTitle, value: centerItemValue, spacing: valuesVerticalSpacing, iconColor: iconColor),
                _buildRowItem(context: context, icon: actionItemIcon, title: actionItemTitle, value: actionItemValue, spacing: valuesVerticalSpacing, iconColor: iconColor,),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRowItem({
    BuildContext? context,
    required String title,
    required String value,
    required String icon,
    required Color iconColor,
    double spacing = 0.0
  }) {
    final List<String> customTitle = title.split(' ');
    String newTitle = '';
    for(int i = 0; i < customTitle.length; i++) {
      newTitle = newTitle + customTitle[i] + ' ';
      if(i < customTitle.length - 1) {
        newTitle = newTitle + customTitle[i + 1];
        newTitle = newTitle;
        if(i + 1 != customTitle.length - 1) {
          newTitle = newTitle + '\n';
        }
        i++;
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(height: 18, width: 18, child: SvgPicture.asset(icon, color: iconColor,)),
        const SizedBox(width: 6),
        Column(
          children: <Widget>[
            FittedBox(
              child: Text(
                newTitle,
                style: Theme.of(context!).textTheme.bodySmall ?? Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 13), maxLines: 4, textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: spacing,),
            FittedBox(
              child: Text(
                value,
                style: valuesTextStyle
              ),
            ),
          ],
        ),
      ],
    );
  }
}
