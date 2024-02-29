part of widgets;

class AW_PolicyData extends StatelessWidget {
  const AW_PolicyData({
    Key? key,
    this.backgroundColor = Colors.white,
    this.scoreLabel = '',
    this.totalScore = 0,
    this.scoreColor = const Color.fromRGBO(57, 70, 82, 1),
    required this.items,
    this.rangeLabel = '',
    this.rangeLabelColor = const Color.fromRGBO(23, 164, 160, 1),
    this.listHeight = 140,
    this.marginBetweenItems,
    this.numberOfItemsToTake = 0,
    this.shouldTakeSpecificNumOfItems = false,
    this.isReversed = false,
  }) : super(key: key);

  final Color backgroundColor;
  final Color scoreColor;
  final Color rangeLabelColor;
  final String scoreLabel;
  final double totalScore;
  final String rangeLabel;
  final double listHeight;
  final List<Widget> items;
  final double? marginBetweenItems;
  final bool shouldTakeSpecificNumOfItems;
  final int numberOfItemsToTake;
  final bool isReversed;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      padding: const EdgeInsets.fromLTRB(16, 16, 8, 16),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const <BoxShadow>[BoxShadow(color: Color.fromRGBO(35, 31, 32, 0.15), spreadRadius: 0, blurRadius: 24, offset: Offset(0, 8))]),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              if (scoreLabel.isNotEmpty)
                Text(
                  scoreLabel,
                  style: TextStyle(color: scoreColor, fontSize: 14),
                ),
              if (totalScore != 0)
                Text(
                  ' ${totalScore.toStringAsFixed(0)}',
                  style: TextStyle(color: scoreColor, fontWeight: FontWeight.bold, fontSize: 14),
                ),
              const Spacer(),
              if (rangeLabel.isNotEmpty)
                Text(
                  rangeLabel,
                  style: TextStyle(color: rangeLabelColor, fontSize: 12, fontFamily: 'SourceSansPro'),
                )
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: listHeight,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: shouldTakeSpecificNumOfItems ? items.take(numberOfItemsToTake).length : items.length,
              itemBuilder: (_, int index) => Container(
                  margin: index == 0
                      ? null
                      : marginBetweenItems != null
                          ? EdgeInsets.only(left: marginBetweenItems!)
                          : null,
                  child: items[index]),
            ),
          )
        ],
      ),
    );
  }
}
