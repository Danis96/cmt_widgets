part of widgets;

class AW_DynamicPolicyCard extends StatelessWidget {
  const AW_DynamicPolicyCard({
    Key? key,
    this.backgroundColor = const Color.fromRGBO(23, 164, 160, 1),
    required this.userName,
    required this.carInfo,
    required this.price,
    required this.extraInfo,
    required this.policyName,
    required this.policyType,
    this.userNameStyle = const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 18
    ),
    this.carInfoStyle = const TextStyle(
      color: Colors.white,
      fontSize: 10,
    ),
    this.priceStyle = const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 18
    ),
    this.extraInfoStyle = const TextStyle(
      color: Colors.white,
      fontSize: 12,
    ),
    this.policyNameStyle = const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 18
    ),
    this.policyTypeStyle = const TextStyle(
      color: Color.fromRGBO(213, 187, 120, 1),
      fontSize: 12,
    ),
    required this.icon,
    this.carInfoOpacity = 0.3,
    required this.priceRange,
    required this.maxPrice,
    this.dividerColor = Colors.white
  }) : super(key: key);

  final Color backgroundColor;
  final Color dividerColor;
  final String userName;
  final String carInfo;
  final String price;
  final String extraInfo;
  final String policyName;
  final String policyType;
  final TextStyle userNameStyle;
  final TextStyle carInfoStyle;
  final double carInfoOpacity;
  final TextStyle priceStyle;
  final TextStyle extraInfoStyle;
  final TextStyle policyNameStyle;
  final TextStyle policyTypeStyle;
  final String maxPrice;
  final String priceRange;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const <BoxShadow>[
          BoxShadow(
              color: Color.fromRGBO(35, 31, 32, 0.15),
              offset: Offset(0,8),
              blurRadius: 24,
              spreadRadius: 0
          )
        ],
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: icon
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        userName,
                        style: userNameStyle,
                      ),
                      Text(
                        carInfo,
                        style: carInfoStyle.copyWith(color: carInfoStyle.color!.withOpacity(carInfoOpacity)),
                      )
                    ],
                  ),
                ),
              ),
              const AW_AmodoBanner()
            ],
          ),
          Divider(color: dividerColor, height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    price,
                    style: priceStyle,
                  ),
                  Text(
                    extraInfo,
                    style: extraInfoStyle,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    maxPrice.toString(),
                    style: carInfoStyle.copyWith(color: carInfoStyle.color!.withOpacity(carInfoOpacity)),
                  ),
                  Text(
                    priceRange,
                    style: carInfoStyle.copyWith(color: carInfoStyle.color!.withOpacity(carInfoOpacity)),
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 30,),
          const Spacer(),
          Text(
            policyName,
            style: policyNameStyle,
          ),
          Text(
            policyType,
            style: policyTypeStyle,
          )
        ],
      ),
    );
  }
}