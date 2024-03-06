part of widgets;

class AW_CardDiscountPercentage extends StatelessWidget {
  const AW_CardDiscountPercentage({
    required this.widgetKey,
    required this.cardPercentage,
    required this.cardTitle,
    this.percentageColor = const Color.fromRGBO(23, 72, 213, 1),
    this.percentageValue = 0,
    this.isUnlocked = true,
    this.imageUnlocked,
    this.progressText = '',
  });

  final Key? widgetKey;
  final String? cardTitle;
  final String? cardPercentage;
  final String? imageUnlocked;
  final String? progressText;
  final double? percentageValue;
  final Color? percentageColor;
  final bool isUnlocked;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: Platform.isAndroid ? MediaQuery.of(context).size.height / 4.5 : MediaQuery.of(context).size.height / 5,
        child: Column(
          children: <Widget>[
            _buildCardHeadline(context),
            _buildCardPercentage(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCardHeadline(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 8.8,
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(cardTitle!,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: isUnlocked ? Colors.black : const Color.fromRGBO(158, 158, 158, 1), fontSize: 15)),
          ),
          const SizedBox(width: 6),
          Expanded(
              child: imageUnlocked != null && imageUnlocked!.isNotEmpty
                  ? Container(child: Image.network(imageUnlocked!))
                  : Text(cardPercentage! + '%',
                      maxLines: 1,
                      style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: isUnlocked ? const Color.fromRGBO(23, 72, 213, 1) : const Color.fromRGBO(158, 158, 158, 1)))),
        ],
      ),
    );
  }

  Widget _buildCardPercentage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            progressText ?? '',
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w400, fontSize: 11, color: Colors.black),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                  child: LinearProgressIndicator(
                      value: percentageValue, color: percentageColor, minHeight: 5, backgroundColor: const Color.fromRGBO(224, 224, 224, 1)),
                  flex: 7),
              const SizedBox(width: 10),
              Expanded(
                  child:
                      Text('${(percentageValue! * 100).toStringAsFixed(0)}%', style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 14)),
                  flex: 1),
            ],
          ),
        ],
      ),
    );
  }
}
