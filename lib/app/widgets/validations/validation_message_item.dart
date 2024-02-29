part of widgets;

class AW_ValidationMessageItem extends StatelessWidget {
  const AW_ValidationMessageItem({
    Key? key,
    this.icon = Icons.arrow_forward,
    this.iconColor = Colors.grey,
    this.text = '',
    required this.textStyle,
    this.showIcon = true,
  }) : super(key: key);

  final IconData icon;
  final Color iconColor;
  final String text;
  final TextStyle textStyle;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        if (showIcon) Icon(icon, color: iconColor) else const SizedBox(),
        const SizedBox(width: 8.67),
        Container(child: Text(text, style: textStyle), width: MediaQuery.of(context).size.width / 1.3),
      ],
    );
  }
}
