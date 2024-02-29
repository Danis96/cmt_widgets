part of widgets;

class AW_SettingsSection extends StatelessWidget {
  const AW_SettingsSection({
    Key? key,
    this.sectionName = '',
    this.items = const <SettingsSectionItemModel>[],
    this.dividerColor = const Color.fromRGBO(250, 250, 250, 1),
    this.sectionNameTextStyle = const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700, color: Color.fromRGBO(114, 125, 134, 1)),
    this.sectionNamePadding = const EdgeInsets.only(left: 24.0, bottom: 15.0),
  }) : super(key: key);

  final String sectionName;
  final List<SettingsSectionItemModel> items;
  final Color dividerColor;
  final TextStyle sectionNameTextStyle;
  final EdgeInsets sectionNamePadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
       if (sectionName.isNotEmpty) Padding(
          padding: sectionNamePadding,
          child: Text(sectionName, style: sectionNameTextStyle),
        ) else const SizedBox(),
        ListView.separated(
          shrinkWrap: true,
          itemCount: items.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return AW_SettingsSectionItem(
              key: Key('settings_section_item_$index'),
              itemModel: items[index],
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(height: 1.0, color: dividerColor);
          },
        ),
      ],
    );
  }
}
