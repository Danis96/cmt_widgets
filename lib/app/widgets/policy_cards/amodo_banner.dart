
part of widgets;


@immutable
class AW_AmodoBanner extends StatelessWidget {
  const AW_AmodoBanner({
    Key? key,
    this.backgroundColor = Colors.white,
    this.textColor = const Color.fromRGBO(23, 164, 160, 1),
    this.label = 'AMODO'
  }) : super(key: key);

  final Color backgroundColor;
  final Color textColor;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: backgroundColor
      ),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w700
        ),
      ),
    );
  }
}
