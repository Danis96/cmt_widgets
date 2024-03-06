part of widgets;

class ValidationItemModel {
  ValidationItemModel(
    this.text,
    this.icon,
    this.color, {
    this.itemsTextStyle = const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500, color: Color.fromRGBO(114, 125, 134, 1)),
    this.showIcon = true,
  });

  final String text;
  final IconData icon;
  final Color color;
  final TextStyle itemsTextStyle;
  final bool showIcon;
}

class AW_ValidationMessages extends StatelessWidget {
  const AW_ValidationMessages({
    Key? key,
    this.validationItems = const <ValidationItemModel>[],
  }) : super(key: key);

  final List<ValidationItemModel> validationItems;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: validationItems
          .map((ValidationItemModel e) => Padding(
                padding: const EdgeInsets.only(bottom: 7.0),
                child: Container(
                  child: AW_ValidationMessageItem(
                    key: Key('validation_message_item_${validationItems.indexOf(e)}'),
                    text: e.text,
                    icon: e.icon,
                    showIcon: e.showIcon,
                    iconColor: e.color,
                    textStyle: e.itemsTextStyle,
                  ),
                ),
              ))
          .toList(),
    );
  }
}
