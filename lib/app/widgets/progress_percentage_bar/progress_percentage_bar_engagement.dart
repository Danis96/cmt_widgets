part of widgets;

// number of items in [names,values,colors] needs to be the same

class AW_PercentageProgressBarEngagement extends StatelessWidget {
  const AW_PercentageProgressBarEngagement(
      {@required this.values,
      @required this.colors,
      @required this.widgetKey,
      required this.userValue,
      required this.userValueTitle,
      this.team1Name = 'Team 1',
      this.team2Name = 'Team 2',
      this.myScore = 'My score: ',
      this.teamScore = 'Team score: ',
      this.team1Value = 'km',
      this.team2Value = 'km',
      this.height = 60,
      this.valueTitle = 'km',
      this.isExpired = false,
      this.totalSum = 0,
      this.widthReduce = 0.0,
      this.singleTeamColor,
      this.useValues = false,
      this.padding = const EdgeInsets.all(16.0),
      this.innerHeight = 30,
      this.valuesSpacing = 5});

  // values needs always to be between 0 and 1
  final List<double>? values;
  final List<String>? colors;
  final List<String>? singleTeamColor;
  final Key? widgetKey;
  final double height;
  final String valueTitle;
  final bool isExpired;
  final double totalSum;
  final double userValue;
  final String userValueTitle;
  final String team1Name;
  final String team2Name;
  final String team1Value;
  final String team2Value;
  final String myScore;
  final String teamScore;

  //represents padding/margin around widget, supplied by caller
  //deducted from context width
  final double widthReduce;
  final bool useValues;
  final EdgeInsets padding;
  final double? innerHeight;
  final double valuesSpacing;

  @override
  Widget build(BuildContext context) {
    double _sum;
    if (values != null && values!.isNotEmpty) {
      _sum = values!.reduce((double a, double b) => a + b);
    } else {
      _sum = 0;
    }

    return Container(
      key: widgetKey,
      height: height,
      padding: padding,
      child: Container(
        height: innerHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (values!.length == 1)
              Column(
                children: [
                  _buildNamesOneTeam(),
                  const SizedBox(height: 6),
                  Container(
                      height: 10,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(16)),
                        child: _getValueOneTeam(values![0], userValue, context),
                      )),
                ],
              ),
            if (values!.length == 2)
              Column(
                children: [
                  _buildNamesTwoTeams(),
                  const SizedBox(height: 6),
                  Container(
                      height: 10,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(16)),
                        child: _getValueTwoTeam(values![0], values![1], context),
                      ))
                ],
              ),
            if (values!.length > 2)
              Column(
                children: [
                  _buildNamesAndPercentage(_sum),
                  const SizedBox(height: 6),
                  Container(
                    height: 10,
                    child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(16)),
                        child: Row(children: useValues ? _getValueItems(totalSum, context) : _getProgressItems(_sum))),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  List<Widget> _getValueItems(double totalSum, BuildContext context) {
    return values!.mapIndex((double item, int index) {
      return Container(
        width: (totalSum == 0) ? 0 : (item / totalSum) * (MediaQuery.of(context).size.width - widthReduce),
        color: Color(int.parse(colors![index])),
      );
    }).toList();
  }

  Widget _buildNamesOneTeam() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
        height: 12,
        child: Row(
          children: [
            Text(
              myScore,
              style: TextStyle(fontSize: 10, color: Color.fromRGBO(57, 70, 82, 1)),
            ),
            Text('$userValue $userValueTitle',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Color(int.parse(singleTeamColor![0]))))
          ],
        ),
      ),
      Container(
        height: 12,
        child: Row(
          children: [
            Text(
              teamScore,
              style: TextStyle(
                fontSize: 10,
              ),
            ),
            Text(
              values![0].round().toString() + ' $userValueTitle',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(int.parse(colors![0])),
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    ]);
  }

  Widget _getValueOneTeam(double sum, double item, BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width - widthReduce,
          color: Color(int.parse(colors![0])),
        ),
        Container(
            width: (sum == 0) ? 0 : (item / sum) * (MediaQuery.of(context).size.width - widthReduce),
            color: Color(
              int.parse(singleTeamColor![0]),
            )),
      ],
    );
  }

  Widget _buildNamesTwoTeams() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
        height: 12,
        child: Row(
          children: [
            Text(
              '$team1Name : ',
              style: TextStyle(fontSize: 10, color: Color.fromRGBO(57, 70, 82, 1)),
            ),
            Text(team1Value, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Color(int.parse(colors![0]))))
          ],
        ),
      ),
      Container(
        height: 12,
        child: Row(
          children: [
            Text(
              '$team2Name : ',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
            Text(
              team2Value,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(int.parse(colors![1])),
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    ]);
  }

  Widget _getValueTwoTeam(double team1, double team2, BuildContext context) {
    final double sum = team1 + team2;
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width - widthReduce,
          color: Color(int.parse(colors![1])),
        ),
        Container(
          width: (sum == 0) ? 0 : (team1 / sum) * (MediaQuery.of(context).size.width - widthReduce),
          color: Color(int.parse(colors![0])),
        ),
      ],
    );
  }

  List<Widget> _getProgressItems(double sum) {
    return values!.mapIndex((double item, int index) {
      return Flexible(
        flex: (sum == 0) ? 1 : (item / sum * 100).round(),
        child: Container(color: Color(int.parse(colors![index]))),
      );
    }).toList();
  }

  Widget _buildNamesAndPercentage(double sum) {
    return Container(
      alignment: Alignment.centerRight,
      height: 12,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, int index) {
          final double item = values![index];
          return Padding(
            padding: const EdgeInsets.only(right: 20, left: 5),
            child: Container(
              constraints: const BoxConstraints(minWidth: 20),
              child: Text(
                item == 0 ? '0 $valueTitle' : '${item.round()} $valueTitle',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(int.parse(colors![index])),
                  fontSize: 10,
                ),
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
            padding: const EdgeInsets.only(right: 15),
            child: Container(
              constraints: const BoxConstraints(minWidth: 20),
              child: Text(totalSum == 0 ? '0' : '${item.toStringAsFixed(1)} $valueTitle',
                  style: TextStyle(fontSize: 10, color: Color(int.parse(colors![index])))),
            ),
          );
        },
        itemCount: values!.length,
      ),
    );
  }
}
