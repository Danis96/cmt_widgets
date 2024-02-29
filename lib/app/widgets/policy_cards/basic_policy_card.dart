part of widgets;

class AW_BasicPolicyCard extends StatelessWidget {
  const AW_BasicPolicyCard({
    Key? key,
    this.backgroundColor = const Color.fromRGBO(23, 164, 160, 1),
    required this.policyName,
    this.extraInfo = '',
    this.extraInfoStyle = const TextStyle(color: Colors.white, fontSize: 12),
    this.policyNameStyle = const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),
    this.price = '',
    this.underPriceText = '',
  }) : super(key: key);

  final Color backgroundColor;
  final String extraInfo;
  final String policyName;
  final String price;
  final String underPriceText;

  final TextStyle extraInfoStyle;
  final TextStyle policyNameStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const <BoxShadow>[BoxShadow(color: Color.fromRGBO(35, 31, 32, 0.15), offset: Offset(0, 8), blurRadius: 24, spreadRadius: 0)]),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(policyName, style: policyNameStyle),
              ),
              const AW_AmodoBanner()
            ],
          ),
          const Divider(color: Colors.white, height: 20),
         Container(
          alignment: Alignment.centerRight,
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(price, style: const TextStyle(color: Color.fromRGBO(255, 255, 255, 0.3))),
                Text(underPriceText, style: const TextStyle(color: Color.fromRGBO(255, 255, 255, 0.3))),
              ],
            ),
         ),
         Text(extraInfo, style: extraInfoStyle)
        ],
      ),
    );
  }
}
