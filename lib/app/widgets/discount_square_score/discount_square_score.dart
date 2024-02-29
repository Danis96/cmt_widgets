part of widgets;

//note: to get an empty state of this widget just pass [topLeftNumber] and [topRightNumber] as 0
class AW_DiscountSquareWidget extends StatelessWidget {
  const AW_DiscountSquareWidget({@required this.title, @required this.topLeftNumber, @required this.topRightNumber, @required this.widgetKey, this.price = '...'});

  final Key? widgetKey;
  final String? title;
  final int? topLeftNumber;
  final int? topRightNumber;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: widgetKey!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(width: 100, child: Center(child: Text(title!))),
          const SizedBox(height: 1),
          Row(
            children: <Widget>[
              _squareWidget(context: context, topLeftRadius: true, discount: topLeftNumber!, isActive: topLeftNumber != null && topLeftNumber != 0),
              const SizedBox(width: 1.5),
              _squareWidget(context: context, topRightRadius: true, discount: topRightNumber!, isPercentage: true, isActive: topRightNumber != null && topRightNumber != 0),
            ],
          ),
          const SizedBox(height: 1.5),
          _squareWidget(
            context: context,
            bottomLeftRadius: true,
            bottomRightRadius: true,
            discount: (price != '...' || price.isNotEmpty) ? price : '...',
            isPercentage: false,
            width: 97,
            isEmptyState: topRightNumber == 0 && topLeftNumber == 0,
            isActive: price != '...' && price != '0' && price != '-1',
          ),
        ],
      ),
    );
  }

  Widget _squareWidget({
    @required BuildContext? context,
    bool topLeftRadius = false,
    bool topRightRadius = false,
    bool bottomLeftRadius = false,
    bool bottomRightRadius = false,
    dynamic discount,
    bool isPercentage = false,
    bool isEmptyState = false,
    double width = 48,
    double height = 39,
    bool isActive = false,
  }) {
    bool isDiscountZero() => discount == 0;
    String discountText() {
      return isDiscountZero() && !isPercentage
          ? '-'
          : isDiscountZero() && isPercentage
              ? '0%'
              : '$discount${isPercentage ? '%' : ''}';
    }

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: isActive ? const Color.fromRGBO(6, 62, 89, 1) : const Color.fromRGBO(127, 144, 159, 1),
        borderRadius: BorderRadius.only(
          topLeft: topLeftRadius ? const Radius.circular(4) : Radius.zero,
          topRight: topRightRadius ? const Radius.circular(4) : Radius.zero,
          bottomRight: bottomRightRadius ? const Radius.circular(4) : Radius.zero,
          bottomLeft: bottomLeftRadius ? const Radius.circular(4) : Radius.zero,
        ),
      ),
      child: Center(child: Text(discountText(), style: Theme.of(context!).textTheme.bodyLarge!.copyWith(color: Colors.white))),
    );
  }
}
