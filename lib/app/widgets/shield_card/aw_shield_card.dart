part of widgets;

class AW_ShieldCard extends StatelessWidget {
  const AW_ShieldCard({
    required this.widgetKey,
    required this.image,
    required this.title,
    this.isInverted = false,
    required this.iconDuration,
    this.durationValue = '',
    required this.iconPrice,
    this.priceValue = '',
  });

  final Key? widgetKey;
  final String? image;
  final String? title;
  final String? iconDuration;
  final String? iconPrice;
  final String? priceValue;
  final String? durationValue;
  final bool isInverted;

  @override
  Widget build(BuildContext context) {
    return Card(
      key: widgetKey,
      child: Container(
        height: 244,
        child: Column(
          children: <Widget>[
            Stack(children: <Widget>[
              Container(
                  height: 160,
                  width: double.infinity,
                  child: image != null && image!.isNotEmpty ? Image.network(image!, fit: BoxFit.cover) : Container(color: Colors.grey)),
              Positioned(
                  bottom: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: 200,
                        child: Text(title!,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(color: isInverted ?  const Color.fromRGBO(23, 72, 213, 1) : Colors.white, fontWeight: FontWeight.w600, fontSize: 20))),
                  )),
            ]),
            _cardFooter(context, iconDuration!, iconPrice!, durationValue!, priceValue!),
          ],
        ),
      ),
    );
  }
}

Widget _cardFooter(
  BuildContext context,
  String iconDuration,
  String iconPrice,
  String durationValue,
  String priceValue,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _cardFooterItem(iconDuration, 'Duration', durationValue, context),
        _cardFooterItem(iconPrice, 'Cost', priceValue, context),
        _moreInfo(context),
      ],
    ),
  );
}

Widget _cardFooterItem(String image, String title, String value, BuildContext context) {
  return Container(
    width: 90,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            SvgPicture.asset(image, width: 18, height: 18, color: const Color.fromRGBO(158, 158, 158, 1)),
            const SizedBox(width: 5),
            Text(title, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        Text(value, maxLines: 2, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.black, fontSize: 14)),
      ],
    ),
  );
}

Widget _moreInfo(BuildContext context) {
  return FittedBox(
      child: Container(
          width: MediaQuery.of(context).size.width / 8,
          child: Text('More info', style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 14, color: const Color.fromRGBO(15, 153, 221, 1)))));
}
