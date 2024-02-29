part of widgets;

class AW_BadgeJapan extends StatelessWidget {
  const AW_BadgeJapan({
    required this.badges,
    this.textInfo = '',
    this.widgetKey,
    this.isJapan = false,
  });

  final Widget badges;
  final String textInfo;
  final Key? widgetKey;
  final bool isJapan;

  @override
  Widget build(BuildContext context) {
    return !isJapan ? _buildContent(context) : _buildContentJapan(context);
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Color.fromRGBO(35, 31, 32, 0.15),
                offset: Offset(0, 8),
                blurRadius: 24,
                spreadRadius: 0
            )
          ]
      ),
      height: 180,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildTop(context, textInfo),
              const SizedBox(height: 15),
              badges,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContentJapan(BuildContext context) {
    return Container(
      height: 180,
      margin: const EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Color.fromRGBO(35, 31, 32, 0.15),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ]
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildTop(context, textInfo),
            const SizedBox(height: 15),
            badges,
          ],
        ),
      ),
    );
  }

  Widget _buildTop(BuildContext context, String textInfo) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        children: <Widget>[
          const Icon(
            Icons.info,
            color: Color.fromRGBO(15, 153, 221, 1),
          ),
          const SizedBox(width: 5),
          Text(textInfo, style: const TextStyle(fontSize: 12))
        ],
      ),
    );
  }

  ///util method to use the correct alignment for Engagement section
  ///necessary to achieve the correct alignment of maximum of 3 Badge widgets
  ///introduced in AiG Drive
  ///1 Badge - centered
  ///2 Badges - spaced evenly
  ///3 Badges - space between
  ///Task: https://amodo.teamwork.com/app/tasks/37451223
  static MainAxisAlignment badgeAlignment(int numberOfBadges) {
    if(numberOfBadges >= 3) {
      return MainAxisAlignment.spaceBetween;
    }
    if(numberOfBadges == 2) {
      return MainAxisAlignment.spaceEvenly;
    }
    return MainAxisAlignment.center;
  }
}
