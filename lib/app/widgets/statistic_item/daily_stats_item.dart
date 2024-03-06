part of widgets;

///displays users daily stats in a form of scrollable horizontal list
class AW_DailyStatsItem extends StatelessWidget {
  const AW_DailyStatsItem({
    Key? key,
    this.itemMargin = const EdgeInsets.only(left: 20),
    this.itemPadding = const EdgeInsets.fromLTRB(16, 16, 8, 6),
    this.itemHeight = 180,
    this.itemDecoration = const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Color.fromRGBO(35, 31, 32, 0.15),
          spreadRadius: 0,
          blurRadius: 24,
          offset: Offset(0, 8)
        )
      ]
    ),
    required this.itemLabel,
    this.levelsStyle = const TextStyle(fontSize: 9, color: Color.fromRGBO(57, 70, 82, 0.3)),
    this.levelsDividerColor = const Color.fromRGBO(57, 70, 82, 0.92),
    this.levelsDividerHeight = 0.5,
    required this.scores,
    required this.pillarColorFunction,
    required this.pillarLabel,
    required this.noScoreWidget
  }) : super(key: key);

  final EdgeInsets itemMargin;
  final EdgeInsets itemPadding;
  final double itemHeight;
  final BoxDecoration itemDecoration;
  final Widget itemLabel;
  final TextStyle levelsStyle;
  final Color levelsDividerColor;
  final double levelsDividerHeight;
  final List<double?> scores;
  final Color Function(double) pillarColorFunction;
  final List<Widget> pillarLabel;
  final List<Widget> noScoreWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: itemPadding,
          margin: itemMargin,
          height: itemHeight,
          decoration: itemDecoration,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              itemLabel,
              const SizedBox(height: 12,),
              SizedBox(
                height: 140,
                width: double.maxFinite,
                child: Stack(
                  children: <Widget>[
                    _buildDivider(15),
                    _buildDivider(39),
                    _buildDivider(62),
                    _buildDivider(86),
                    Positioned.fill(
                      top: 0,
                      left: 30,
                      child: SizedBox(
                        height: 140,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: scores.length,
                          padding: const EdgeInsets.only(bottom: 15),
                          itemBuilder: (_, int index) {
                            final double? score = scores[index];
                            if (score != null) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: AW_PolicyScoreItem(
                                  backgroundColor: pillarColorFunction(score),
                                  padding: EdgeInsets.zero,
                                  maxHeight: 92,
                                  label: pillarLabel[index],
                                  score: score,
                                  width: 25,
                                ),
                              );
                            }
                            return noScoreWidget[index];
                          },
                        ),
                      ),
                    ),



                    Positioned(
                      top: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '100',
                            style: levelsStyle
                          ),
                          const SizedBox(height: 12,),
                          Text(
                            '75',
                            style: levelsStyle,
                          ),
                          const SizedBox(height: 12,),
                          Text(
                            '50',
                            style: levelsStyle,
                          ),
                          const SizedBox(height: 12,),
                          Text(
                            '25',
                            style: levelsStyle,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDivider(double topOffset) {
    return Positioned(
      top: topOffset,
      right: 10,
      left: 30,
      child: Container(
        color: levelsDividerColor,
        height: levelsDividerHeight,
      ),
    );
  }
}

