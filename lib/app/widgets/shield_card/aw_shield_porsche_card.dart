part of widgets;

class AW_ShieldPorscheCard extends StatelessWidget {
  const AW_ShieldPorscheCard({
    required this.widgetKey,
    required this.price,
    required this.image,
    required this.title,
    required this.bottomRightText,
    required this.per,
    this.didBuy = false,
    this.priceType = '€',
    this.coverageStart = '-',
    this.isSummaryPage = false,
    this.coverageStartDateTitle = '',
    this.priceTitle = '',
    this.height = 250
  });

  final Key? widgetKey;
  final String title;
  final String price;
  final String per;
  final String bottomRightText;
  final String image;
  final String priceType;
  final bool didBuy;
  final String coverageStart;
  final bool isSummaryPage;
  final String coverageStartDateTitle;
  final String priceTitle;
  final double height;

  @override
  Widget build(BuildContext context) {
    final String priceFormatted = price.replaceAll('.', ',');
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Card(
            surfaceTintColor: Colors.transparent,
            margin: EdgeInsets.only(top: 24),
            //color: Colors.white,
            child: Container(
                height: height,
                child: Column(
                  children: <Widget>[
                    //const SizedBox(height: 24,),
                    if (image.isNotEmpty)
                      ClipRRect(
                        borderRadius:const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                        child: Container(
                            height: 200,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)),
                            child: Align(alignment: Alignment.bottomLeft, child: Text(title, style: _titleStyle(context)))),
                      )
                    else
                      Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Color.fromRGBO(127, 144, 159, 1),
                          ),
                          padding: const EdgeInsets.all(15),
                          height: 200,
                          width: double.infinity,
                          child: Align(alignment: Alignment.bottomLeft, child: Text(title, style: _titleStyle(context)))),
                    const SizedBox(height: 9,),
                    _cardFooterShieldPorsche(context, priceFormatted, bottomRightText, per, priceType, isSummaryPage, coverageStart, coverageStartDateTitle, priceTitle),
                  ],
                )),
          ),
        ),
        if (didBuy) Positioned(child: _doneArrow(), top: 0,) else const SizedBox(),
      ],
    );
  }
}

Widget _cardFooterShieldPorsche(BuildContext context, String priceFormatted, String bottomRightText, String per, String priceType, bool isSummaryPage, String coverageDate, String coverageDateTitle, String priceTitle) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
      if (isSummaryPage)
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(coverageDateTitle, style: Theme.of(context).textTheme.displayMedium),
          Text(coverageDate,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(color: const Color.fromRGBO(125, 143, 161, 1), fontWeight: FontWeight.bold)),
        ],
      ),
      if (isSummaryPage && coverageDate != '-')
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(priceTitle, style: Theme.of(context).textTheme.displayMedium),
          Row(
            children: <Widget>[
              Container(child: Text('$priceType $priceFormatted', style: Theme.of(context).textTheme.displayMedium!.copyWith(color: const Color.fromRGBO(125, 143, 161, 1), fontWeight: FontWeight.bold))),
              Container(child: Text(' / $per', style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 13.0, color: const Color.fromRGBO(125, 143, 161, 1), fontWeight: FontWeight.bold))),

            ],
          ),

        ],
      ),
      if (!isSummaryPage && coverageDateTitle != '-')
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(child: Text('$priceType $priceFormatted', style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 22))),
          Container(child: Text(' / $per', style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 13),), alignment: Alignment.bottomCenter,),
        ],
      ),
      if (!isSummaryPage)
      Row(
        children: <Widget>[
          Text(bottomRightText, style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 13)),
          const Icon(Icons.arrow_forward_ios, size: 13, color: Color.fromRGBO(114, 125, 134, 1)),
        ],
      ),
    ]),
  );
}

Widget _doneArrow() {
  return Container(
    width: 50,
    height: 50,
    margin: const EdgeInsets.only(left: 10),
    decoration: const BoxDecoration(color: Color.fromRGBO(16, 51, 68, 1), shape: BoxShape.circle),
    child: const Icon(
      Icons.done,
      color: Colors.white,
      size: 35,
    ),
  );
}

TextStyle _titleStyle(BuildContext context) => Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.white, fontSize: 20);
