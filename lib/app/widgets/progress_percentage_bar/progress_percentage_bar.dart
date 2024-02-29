part of widgets;

// number of items in [names,values,colors] needs to be the same

class AW_PercentageProgressBar extends StatelessWidget {
  const AW_PercentageProgressBar({
    @required this.title,
    @required this.names,
    @required this.values,
    @required this.colors,
    @required this.onInfoPressed,
    @required this.widgetKey,
    this.boxShadow,
    this.borderColor = const Color.fromRGBO(245, 246, 247, 1),
    this.height = 160,
    this.valueTitle = 'km',
    this.hasIcon = true,
    this.isExpired = false,
    this.totalSum = 0,
    this.widthReduce = 0.0,
    this.useValues = false,
    this.namesStyle = const TextStyle(
      fontWeight: FontWeight.w400,
      color: Color.fromRGBO(70, 83, 93, 1),
      fontSize: 11,
    ),
    this.valuesStyle = const TextStyle(
      fontWeight: FontWeight.w600,
      color: Color.fromRGBO(35, 31, 32, 1.0),
      fontSize: 14,
    ),
    this.titleStyle = const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600),
    this.padding = const EdgeInsets.all(16.0),
    this.innerHeight = 120,
    this.valuesSpacing = 5,
    this.isOneTeam = false,
  });

  final String? title;
  final List<String>? names;

  // values needs always to be between 0 and 1
  final List<double>? values;
  final List<Color>? colors;
  final List<BoxShadow>? boxShadow;
  final Color? borderColor;
  final Function? onInfoPressed;
  final Key? widgetKey;
  final double height;
  final bool hasIcon;
  final String valueTitle;
  final bool isExpired;
  final bool isOneTeam;
  final double totalSum;

  //represents padding/margin around widget, supplied by caller
  //deducted from context width
  final double widthReduce;
  final bool useValues;
  final TextStyle namesStyle;
  final TextStyle valuesStyle;
  final TextStyle titleStyle;
  final EdgeInsets padding;
  final double? innerHeight;
  final double valuesSpacing;

  @override
  Widget build(BuildContext context) {
    final double _sum = values!.reduce((double a, double b) => a + b);

    return Container(
      key: widgetKey,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: isExpired ? Colors.black.withOpacity(0.05) : Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        border: Border.all(color: borderColor ?? Colors.white, width: 1),
      ),
      child: Container(
        height: innerHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            if (title != null) _buildTitleAndIcon(context, hasIcon) else const SizedBox(),
            SizedBox(height: valuesSpacing),
            Container(
              height: 10,
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: Row(children: useValues ? _getValueItems(totalSum, context) : _getProgressItems(_sum))),
            ),
            const Spacer(),
            if (useValues) isOneTeam ? _buildNamesAndValuesForOneTeam(totalSum) : _buildNamesAndValues(totalSum) else _buildNamesAndPercentage(_sum),
          ],
        ),
      ),
    );
  }

  List<Widget> _getValueItems(double totalSum, BuildContext context) {
    if(values == null) {
      return <Widget>[];
    }
    return values!.mapIndex((double item, int index) {
      return Container(
        width: (totalSum == 0) ? 0 : (item / totalSum) * (MediaQuery.of(context).size.width - widthReduce),
        color: isOneTeam
            ? index == 0
                ? colors![index]
                : const Color.fromRGBO(2, 23, 100, 1)
            : colors![index],
      );
    }).toList();
  }

  List<Widget> _getProgressItems(double sum) {
    return values!.mapIndex((double item, int index) {
      return Flexible(
        flex: (sum == 0) ? 1 : (item / sum * 100).round(),
        child: Container(color: colors![index]),
      );
    }).toList();
  }

  Widget _buildTitleAndIcon(BuildContext context, bool hasIcon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(title!, style: titleStyle),
        if (hasIcon)
          IconButton(onPressed: () => onInfoPressed!(), icon: const Icon(Icons.info_outline, size: 20, color: Color.fromRGBO(127, 144, 159, 1)))
        else
          const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildNamesAndPercentage(double sum) {
    return Container(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, int index) {
          final double item = values![index];
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              constraints: const BoxConstraints(minWidth: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 5,
                    height: 20,
                    decoration: BoxDecoration(
                      color: colors![index],
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        names![index],
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(70, 83, 93, 1),
                          fontSize: 11,
                        ),
                      ),
                      Text(
                        sum == 0 ? '0' : '${(item / sum * 100).round()} $valueTitle',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(35, 31, 32, 1.0),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: values!.length,
      ),
    );
  }

  Widget _buildNamesAndValues(double totalSum) {
    return Container(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, int index) {
          final double item = values![index];
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              constraints: const BoxConstraints(minWidth: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 5,
                    height: 20,
                    decoration: BoxDecoration(
                      color: colors![index],
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(names![index], style: namesStyle),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(totalSum == 0 ? '0' : '${item.toStringAsFixed(0)}$valueTitle',
                          style: valuesStyle.copyWith(
                            color: isOneTeam
                                ? index == 0
                                    ? colors![index]
                                    : const Color.fromRGBO(2, 23, 100, 1)
                                : Colors.red,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: values!.length,
      ),
    );
  }
  
  Widget _buildNamesAndValuesForOneTeam(double totalSum) {
    return Container(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, int index) {
          final double item = values![index];
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              constraints: const BoxConstraints(minWidth: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 5,
                    height: 20,
                    decoration: BoxDecoration(
                      color: colors![index],
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(names![index], style: namesStyle),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(totalSum == 0 ? '0' : '${item.toStringAsFixed(0)}$valueTitle',
                          style: valuesStyle.copyWith(
                            color: isOneTeam
                                ? index == 0
                                    ? colors![index]
                                    : const Color.fromRGBO(2, 23, 100, 1)
                                : Colors.red,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: values!.length,
      ),
    );
  }
}

extension ExtendedIterable<E> on Iterable<E> {
  /// Like Iterable<T>.map but callback have index as second argument
  Iterable<T> mapIndex<T>(T f(E e, int i)) {
    int i = 0;
    // ignore: always_specify_types
    return map((e) => f(e, i++));
  }

  void forEachIndex(void f(E e, int i)) {
    int i = 0;
    // ignore: always_specify_types
    forEach((e) => f(e, i++));
  }
}
