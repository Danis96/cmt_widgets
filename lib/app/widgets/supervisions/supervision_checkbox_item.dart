part of widgets;

class AW_SupervisionCheckboxItem extends StatelessWidget {
  const AW_SupervisionCheckboxItem({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.text
  }) : super(key: key);

  final bool value;
  final Function(bool?) onChanged;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      key: key,
      children: <Widget>[
        Checkbox(
            value: value,
            onChanged: (bool? value) => onChanged(value!)
        ),
        const SizedBox(width: 10,),
        Flexible(
          child: Text(
            text
          ),
        ),
      ],
    );
  }
}
