part of widgets;

class AW_ChallengeItemImage extends StatelessWidget {
  const AW_ChallengeItemImage({
    this.image = '',
    this.widgetKey,
    this.title = '',
    this.onButtonPressed,
    this.buttonTitle = '',
    this.subtitle = '',
    this.showJoinButton = true,
  });

  final Key? widgetKey;
  final String image;
  final String title;
  final String subtitle;
  final bool showJoinButton;
  final String buttonTitle;
  final Function? onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: 320,
                height: 115,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(image, fit: BoxFit.cover),
                ),
              ),
              Positioned(left: 12, top: 10, child: _challengeTitle(context, title)),
              Positioned(right: 20, top: 100, child: _bottomChallengeArrow(context)),
            ],
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
               _buildSubtitle(subtitle),
              const SizedBox(height: 5),
              _buildJoinDemoButton(context, buttonTitle, onButtonPressed),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _challengeTitle(BuildContext context, String title) {
  return Container(
    width: 70,
    height: 25,
    decoration: BoxDecoration(color: const Color.fromRGBO(255, 255, 255, 0.2), borderRadius: BorderRadius.circular(10)),
    child: Center(
      child: Text(title, style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w300)),
    ),
  );
}

Widget _bottomChallengeArrow(BuildContext context) {
  return Container(
    width: 25,
    height: 25,
    decoration: const BoxDecoration(color: Color.fromRGBO(255, 255, 255, 0.2), shape: BoxShape.circle),
    child: const Center(child: Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 15)),
  );
}

Widget _buildJoinDemoButton(BuildContext context, String buttonTitle, Function? onButtonPressed) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Container(
      width: 100,
      child: AW_Button(
        onPressed: () {
          if (onButtonPressed != null) {
            onButtonPressed();
          }
        },
        buttonTitle: buttonTitle,
        btnTitleStyle: Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 12),
      ),
    ),
  );
}

Widget _buildSubtitle(String subtitle) {
  return Center(child: Text(subtitle, maxLines: 2, overflow: TextOverflow.ellipsis));
}
