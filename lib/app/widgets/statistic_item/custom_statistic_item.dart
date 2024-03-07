part of widgets;

class AW_StatisticHomeItem extends StatelessWidget {
  const AW_StatisticHomeItem({
    this.widgetHeight = 152,
    this.widgetKey,
    this.title,
    this.value,
    this.actionItemIcon,
    this.actionItemTitle,
    this.actionItemValue,
    this.centerItemIcon,
    this.centerItemTitle,
    this.centerItemValue,
    this.leadingItemIcon,
    this.leadingItemTitle,
    this.leadingItemValue,
    this.valuesTextStyle,
    this.totalValueStyle,
    this.valuesVerticalSpacing = 0
  });

  final double widgetHeight;
  final Key? widgetKey;
  final String? title;
  final String? value;
  final String? leadingItemIcon;
  final String? leadingItemTitle;
  final String? leadingItemValue;
  final String? centerItemIcon;
  final String? centerItemTitle;
  final String? centerItemValue;
  final String? actionItemIcon;
  final String? actionItemTitle;
  final String? actionItemValue;

  //necessary for new demo design
  //only used if passed by the caller
  final TextStyle? valuesTextStyle;
  final TextStyle? totalValueStyle;
  final double valuesVerticalSpacing;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: widgetKey!,
      height: widgetHeight,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title!, style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 20)),
              const SizedBox(height: 5),
              Text(
                value!,
                style: totalValueStyle ?? Theme.of(context).textTheme.headline1!.copyWith(fontSize: 24, fontWeight: FontWeight.w600)
              ),
              const SizedBox(height: 5),
              const Divider(),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildRowItem(context: context, icon: leadingItemIcon, title: leadingItemTitle, value: leadingItemValue, spacing: valuesVerticalSpacing),
                  _buildRowItem(context: context, icon: centerItemIcon, title: centerItemTitle, value: centerItemValue, spacing: valuesVerticalSpacing),
                  _buildRowItem(context: context, icon: actionItemIcon, title: actionItemTitle, value: actionItemValue, spacing: valuesVerticalSpacing),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRowItem({
    BuildContext? context,
    String? title,
    String? value,
    String? icon,
    double spacing = 0.0
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(height: 18, width: 18, child: SvgPicture.asset(icon!)),
        const SizedBox(width: 4),
        Column(
          children: <Widget>[
            FittedBox(
              child: Text(
                title!, style: Theme.of(context!).textTheme.bodyLarge),
            ),
            SizedBox(height: spacing,),
            FittedBox(
              child: Text(
                value!,
                style: valuesTextStyle ?? Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 14)
              ),
            ),
          ],
        ),
      ],
    );
  }
}
