part of widgets;

class AW_LeaderboardWidget extends StatelessWidget {
  const AW_LeaderboardWidget(
      {Key? key,
      this.afterSeparatorShow = true,
      this.nextSeparatorShow = true,
      this.color1 = const Color(0xFF0F99DD),
      this.color2 = const Color(0xFF394652),
      this.imgSeparator,
      this.isMyUser = false,
      this.noRankingYet = false,
      this.imgNoRankingYet,
      this.leadboardTitle = '',
      this.leadboardDistance = '',
      this.leadboardNoRankingText = '',
      this.leadboardNoRankingTitle = '',
      this.leadboardRank = '',
      this.leadboardReset = '',
      this.leadboardScore = '',
      this.leadboardUser = '',
      this.firstRank = const <int>[],
      this.firstImg = const <String>[],
      this.firstUser = const <String>[],
      this.firstDistance = const <String>[],
      this.firstScore = const <double>[],
      this.firstIsMyUser = const <bool>[],
      this.middleRank = const <int>[],
      this.middleImg = const <String>[],
      this.middleUser = const <String>[],
      this.middleDistance = const <String>[],
      this.middleScore = const <double>[],
      this.middleIsMyUser = const <bool>[],
      this.lastRank = const <int>[],
      this.lastImg = const <String>[],
      this.lastUser = const <String>[],
      this.lastDistance = const <String>[],
      this.lastScore = const <double>[],
      this.lastIsMyUser = const <bool>[]})
      : super(key: key);
  final String? imgSeparator;
  final Color color1;
  final Color color2;
  final bool isMyUser;
  final bool noRankingYet;
  final String? imgNoRankingYet;

  //first two
  final List<int> firstRank;
  final List<String> firstImg;
  final List<String> firstUser;
  final List<String> firstDistance;
  final List<double> firstScore;
  final List<bool> firstIsMyUser;

  //middle
  final List<int> middleRank;
  final List<String> middleImg;
  final List<String> middleUser;
  final List<String> middleDistance;
  final List<double> middleScore;
  final List<bool> middleIsMyUser;

  //last two
  final List<int> lastRank;
  final List<String> lastImg;
  final List<String> lastUser;
  final List<String> lastDistance;
  final List<double> lastScore;
  final List<bool> lastIsMyUser;

  //text
  final String leadboardTitle;
  final String leadboardReset;
  final String leadboardNoRankingTitle;
  final String leadboardNoRankingText;
  final String leadboardRank;
  final String leadboardUser;
  final String leadboardDistance;
  final String leadboardScore;

  final bool nextSeparatorShow;
  final bool afterSeparatorShow;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const <BoxShadow>[BoxShadow(color: Color.fromRGBO(35, 31, 32, 0.15), spreadRadius: 0, blurRadius: 24, offset: Offset(0, 8))]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(leadboardTitle, style: TextStyle(fontSize: 12, color: color2)),
                Text(leadboardReset, style: TextStyle(fontSize: 12, color: color1)),
                if (noRankingYet)
                  Column(children: [
                    const SizedBox(height: 20),
                    if (imgNoRankingYet != null) Center(child: Image.asset(imgNoRankingYet!, width: 35)) else const SizedBox(),
                    const SizedBox(height: 5),
                    Text(leadboardNoRankingTitle,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: color2), textAlign: TextAlign.center),
                    const SizedBox(height: 10),
                    Text(leadboardNoRankingText, style: TextStyle(fontSize: 12, color: color2), textAlign: TextAlign.center),
                    const SizedBox(height: 20),
                  ])
                else
                  SizedBox(),
                const SizedBox(height: 18),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    child: Container(
                        alignment: Alignment.center, child: Text(leadboardRank, style: TextStyle(fontSize: 10, color: color2.withOpacity(0.3)))),
                    flex: 1),
                const SizedBox(width: 70),
                Expanded(child: Text(leadboardUser, style: TextStyle(fontSize: 10, color: color2.withOpacity(0.3))), flex: 2),
                Expanded(
                    child: Container(
                        alignment: Alignment.center, child: Text(leadboardDistance, style: TextStyle(fontSize: 10, color: color2.withOpacity(0.3)))),
                    flex: 2),
                Expanded(
                    child: Container(
                        alignment: Alignment.center, child: Text(leadboardScore, style: TextStyle(fontSize: 10, color: color2.withOpacity(0.3)))),
                    flex: 1)
              ],
            ),
          ),
          AW_Leaderboard(
              rank: firstRank[0].toString(),
              userName: firstUser[0],
              distance: firstDistance[0],
              score: firstScore[0].round(),
              picture: firstImg[0],
              isMyUser: firstIsMyUser[0]),
          AW_Leaderboard(
              rank: firstRank[1].toString(),
              userName: firstUser[1],
              distance: firstDistance[1],
              score: firstScore[1].round(),
              picture: firstImg[1],
              isMyUser: firstIsMyUser[1]),
          if (nextSeparatorShow) _returnImgSeparator(imgSeparator: imgSeparator) else const SizedBox(),
          if (!noRankingYet)
            Column(
              children: [
                AW_Leaderboard(
                  rank: middleRank[0].toString(),
                  userName: middleUser[0],
                  distance: middleDistance[0],
                  score: middleScore[0].round(),
                  picture: middleImg[0],
                  isMyUser: middleIsMyUser[0],
                ),
                AW_Leaderboard(
                  rank: middleRank[1].toString(),
                  userName: middleUser[1],
                  distance: middleDistance[1],
                  score: middleScore[1].round(),
                  picture: middleImg[1],
                  isMyUser: middleIsMyUser[1],
                ),
                if (middleRank.length > 2)
                  AW_Leaderboard(
                    rank: middleRank[2].toString(),
                    userName: middleUser[2],
                    distance: middleDistance[2],
                    score: middleScore[2].round(),
                    picture: middleImg[2],
                    isMyUser: middleIsMyUser[2],
                  ),
              ],
            )
          else
            SizedBox(),
          if (!noRankingYet)
            if (afterSeparatorShow) _returnImgSeparator(imgSeparator: imgSeparator) else SizedBox(),
          AW_Leaderboard(
            rank: lastRank[0].toString(),
            userName: lastUser[0],
            distance: lastDistance[0],
            score: lastScore[0].round(),
            picture: lastImg[0],
            isMyUser: lastIsMyUser[0],
          ),
          AW_Leaderboard(
            rank: lastRank[1].toString(),
            userName: lastUser[1],
            distance: lastDistance[1],
            score: lastScore[1].round(),
            picture: lastImg[1],
            isMyUser: lastIsMyUser[1],
          ),
        ],
      ),
    );
  }

  Widget _returnImgSeparator({String? imgSeparator, Color? color}) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 5),
        if (imgSeparator != null) Center(child: Image.asset(imgSeparator, width: 35, color: color)) else const SizedBox(),
        const SizedBox(height: 10),
      ],
    );
  }
}
