part of widgets;

class AW_VoucherBoxLabels extends StatelessWidget {
  const AW_VoucherBoxLabels({
    Key? key,
    this.outsideBoxLabel = '',
    this.insideBoxLabel = '',
    this.outsideBoxTextStyle = const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: Color.fromRGBO(70, 83, 93, 1)),
    this.insideBoxTextStyle = const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: Color.fromRGBO(70, 83, 93, 1)),
    this.boxBorderColor = const Color.fromRGBO(224, 224, 224, 1),
    this.content = const SizedBox(),
  }) : super(key: key);

  final String outsideBoxLabel;
  final String insideBoxLabel;
  final TextStyle outsideBoxTextStyle;
  final TextStyle insideBoxTextStyle;
  final Color boxBorderColor;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(outsideBoxLabel, style: outsideBoxTextStyle),
        const SizedBox(height: 14.0),
        Container(
          padding: const EdgeInsets.only(top: 8.0, bottom: 15.0),
          width: double.infinity,
          child: Column(
            children: <Widget>[
              if (insideBoxLabel.isNotEmpty)
                Text(insideBoxLabel, style: insideBoxTextStyle),
              const SizedBox(height: 5.0),
              content,
            ],
          ),
          decoration: BoxDecoration(
              border: Border.all(
                color: boxBorderColor,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
        ),
      ],
    );
  }
}
