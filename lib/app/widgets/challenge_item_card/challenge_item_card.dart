part of widgets;

class AW_ChallengeItemCard extends StatelessWidget {
  const AW_ChallengeItemCard({
    @required this.image,
    @required this.widgetKey,
    @required this.withoutTeamBannerText,
    @required this.withTeamBannerText,
    @required this.challengeBody,
    @required this.challengeName,
    @required this.image1,
    @required this.image2,
    @required this.image3,
    @required this.title1,
    @required this.title2,
    @required this.title3,
    @required this.subtitle1,
    @required this.subtitle2,
    @required this.subtitle3,
    this.bannerColorStateWithoutTeam = const Color.fromRGBO(232, 235, 237, 1),
    this.bannerColorStateWithTeam = const Color.fromRGBO(192, 214, 241, 1),
    this.bannerColorStateWithoutTeamTextColor = const Color.fromRGBO(127, 144, 159, 1),
    this.bannerColorStateWithTeamTextColor = const Color.fromRGBO(23, 72, 213, 1),
    this.hasTeam = false,
    this.isExpired = false,
    this.teamNames = const <String>['Team1', 'Team2'],
    this.teamValues = const <double>[0, 0],
  });

  final Key? widgetKey;
  final String? image;
  final String? withoutTeamBannerText;
  final String? withTeamBannerText;
  final String? challengeName;
  final String? challengeBody;
  final Color? bannerColorStateWithoutTeam;
  final Color? bannerColorStateWithTeam;
  final Color? bannerColorStateWithoutTeamTextColor;
  final Color? bannerColorStateWithTeamTextColor;
  final bool hasTeam;
  final bool isExpired;
  final String? image1;
  final String? image2;
  final String? image3;
  final String? title1;
  final String? title2;
  final String? title3;
  final String? subtitle1;
  final String? subtitle2;
  final String? subtitle3;
  final List<double>? teamValues;
  final List<String>? teamNames;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: isExpired ? Colors.black.withOpacity(0.05) : Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _imageContainer(image!),
            _joinChallengeBanner(
              context,
              withoutTeamBannerText!,
              withTeamBannerText!,
              hasTeam: hasTeam,
              bannerColorStateWithoutTeam: bannerColorStateWithoutTeam,
              bannerColorStateWithoutTeamTextColor: bannerColorStateWithoutTeamTextColor,
              bannerColorStateWithTeam: bannerColorStateWithTeam,
              bannerColorStateWithTeamTextColor: bannerColorStateWithTeamTextColor,
            ),
            _titleAndSubtitle(challengeName!, challengeBody!, context),
            if (hasTeam)
              _percentageBar(teamValues!, teamNames!, isExpired)
            else
              _teamsParticipantsDays(context, image1!, image2!, image3!, title1!, title2!, title3!, subtitle1!, subtitle2!, subtitle3!),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

Widget _imageContainer(String image) {
  bool isImageNotEmpty() => image.isNotEmpty;

  return Container(
      height: 190, child: isImageNotEmpty() ? Center(child: Image.network(image)) : Container(height: 190, color: const Color.fromRGBO(158, 158, 158, 1)));
}

Widget _joinChallengeBanner(
  BuildContext context,
  String withoutTeamText,
  String teamName, {
  bool hasTeam = false,
  Color? bannerColorStateWithoutTeam,
  Color? bannerColorStateWithTeam,
  Color? bannerColorStateWithoutTeamTextColor,
  Color? bannerColorStateWithTeamTextColor,
}) {
  return Container(
    height: 25,
    color: hasTeam ? bannerColorStateWithTeam : bannerColorStateWithoutTeam,
    child: hasTeam
        ? _rowBannerTextAndIcon(
            context,
            Icon(Icons.check, color: bannerColorStateWithTeamTextColor, size: 15),
            teamName,
            bannerColorStateWithTeamTextColor!,
          )
        : _rowBannerTextAndIcon(
            context,
            Container(
              decoration: BoxDecoration(border: Border.all(color: const Color.fromRGBO(127, 144, 159, 1)), shape: BoxShape.circle),
              child: const Icon(Icons.circle, color: Colors.transparent, size: 12),
            ),
            withoutTeamText,
            bannerColorStateWithoutTeamTextColor!),
  );
}

Widget _rowBannerTextAndIcon(BuildContext context, Widget icon, String text, Color textColor) {
  return Container(
    margin: const EdgeInsets.only(left: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        icon,
        const SizedBox(width: 5),
        Text(text, style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: textColor)),
      ],
    ),
  );
}

Widget _titleAndSubtitle(String title, String subtitle, BuildContext context) {
  return Container(
    //height: 150,
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title, style: Theme.of(context).textTheme.displayMedium),
        const SizedBox(height: 8),
        Text(subtitle, maxLines: 5, overflow: TextOverflow.ellipsis),
      ],
    ),
  );
}

Widget _percentageBar(List<double> teamValues, List<String> teamNames, bool isExpired) {
  return Container(
    padding: const EdgeInsets.all(10),
    child: AW_PercentageProgressBar(
      widgetKey: const Key('challenge_item_percentage_key'),
      title: null,
      borderColor: Colors.transparent,
      height: 110,
      boxShadow: const <BoxShadow>[BoxShadow(color: Colors.white, spreadRadius: 4, blurRadius: 8, offset: Offset(0, 8))],
      colors: const <Color>[Color.fromRGBO(255, 130, 0, 1), Color.fromRGBO(255, 191, 63, 1)],
      names: teamNames,
      values: teamValues,
      isExpired: isExpired,
      onInfoPressed: () {},
    ),
  );
}

Widget _teamsParticipantsDays(
  BuildContext context,
  String image1,
  String image2,
  String image3,
  String title1,
  String title2,
  String title3,
  String subtitle1,
  String subtitle2,
  String subtitle3,
) {
  return TeamsParticipantsDays(
    image1: image1,
    image2: image2,
    image3: image3,
    title1: title1,
    title2: title2,
    title3: title3,
    subtitle1: subtitle1,
    subtitle2: subtitle2,
    subtitle3: subtitle3,
  );
}

Widget _littleItem(String image, String title, String subtitle, BuildContext context) {
  return Flexible(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(height: 20, child: SvgPicture.asset(image, color: const Color.fromRGBO(189, 189, 189, 1))),
        const SizedBox(width: 4),
        Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(subtitle, style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.black, fontSize: 14))
            ],
          ),
        )
      ],
    ),
  );
}
