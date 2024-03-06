part of widgets;

class AW_ChallengeItemCardDemo extends StatelessWidget {
  const AW_ChallengeItemCardDemo({
    Key? key,
    required this.image,
    required this.newChallengeText,
    required this.challengeTitle,
    required this.joinChallengeText,
    required this.isJoinable,
    required this.isExpired,
    required this.teamNames,
    required this.teamValues,
    required this.hasTeam,
    required this.team,
    required this.withoutTeamBannerText,
    required this.challengeExpired,
    this.height = 310,
    this.imageRadius = const BorderRadius.all(Radius.circular(12)),
    required this.assetPath,
    required this.teamLabel,
    required this.isNewChallenge
  }) : super(key: key);

  final String image;
  final String newChallengeText;
  final String challengeTitle;
  final String joinChallengeText;
  final bool isJoinable;
  final bool isExpired;
  final List<double>? teamValues;
  final List<String>? teamNames;
  final bool hasTeam;
  final String? team;
  final String withoutTeamBannerText;
  final String challengeExpired;
  final double height;
  final BorderRadius imageRadius;
  final String assetPath;
  final String teamLabel;
  final bool isNewChallenge;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Opacity(
        opacity: isExpired ? 0.5 : 1,
        child: Stack(
          fit: StackFit.loose,
          children: <Widget>[
            if (image.isNotEmpty)
              Container(
                height: height,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: imageRadius,
                  child: Image.network(image, fit: BoxFit.fitHeight,),
                ),
              ) else _NoImageContainer(height: height,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child:  Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (isNewChallenge)
                    Text(
                      newChallengeText,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    )
                  else const SizedBox(),
                  Text(
                    challengeTitle,
                    style: const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 20),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: _BottomBanner(
                  joinChallengeText: joinChallengeText,
                  teamName: team,
                  assetPath: assetPath,
                  teamLabel: teamLabel,
                  ended: isExpired,
                  isJoinable: isJoinable,
                  challengeExpired: challengeExpired,
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NoImageContainer extends StatelessWidget {
  const _NoImageContainer({
    Key? key,
    required this.height
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12)
        ),
        color: Color.fromRGBO(158, 158, 158, 1),
      ),
    );
  }
}

class _BottomBanner extends StatelessWidget {
  const _BottomBanner({
    Key? key,
    required this.joinChallengeText,
    required this.teamName,
    required this.assetPath,
    required this.teamLabel,
    required this.ended,
    required this.isJoinable,
    required this.challengeExpired
  }) : super(key: key);

  final String joinChallengeText;
  final String? teamName;
  final String teamLabel;
  final String assetPath;
  final bool ended;
  final bool isJoinable;
  final String challengeExpired;


  @override
  Widget build(BuildContext context) {
    if(ended) {
      return Text(
        challengeExpired,
        style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      );
    }
    if(isJoinable) {
      return _JoinTeam(joinChallengeText: joinChallengeText);
    }
    return _WithTeam(
      teamLabel: teamLabel,
      assetPath: assetPath,
      teamName: teamName?? '',
    );
  }
}


class _JoinTeam extends StatelessWidget {
  const _JoinTeam({
    Key? key,
    required this.joinChallengeText
  }) : super(key: key);

  final String joinChallengeText;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Colors.white, width: 3),
              borderRadius: BorderRadius.circular(10)
          ),
        ),
        const SizedBox(width: 10,),
        Text(
          joinChallengeText,
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 14
          ),
        ),
      ],
    );
  }
}

class _WithTeam extends StatelessWidget {
  const _WithTeam({
    Key? key,
    required this.teamName,
    required this.assetPath,
    required this.teamLabel
  }) : super(key: key);

  final String teamName;
  final String teamLabel;
  final String assetPath;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SvgPicture.asset(assetPath),
        const SizedBox(width: 10,),
        Text(
          '$teamLabel $teamName',
          style: const TextStyle(
            color: Colors.white
          ),
        )
      ],
    );
  }
}




