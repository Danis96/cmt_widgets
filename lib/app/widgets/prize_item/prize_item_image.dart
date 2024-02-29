part of widgets;

class AW_PrizeItemImage extends StatelessWidget {
  const AW_PrizeItemImage({
    this.image = '',
    this.alreadyParticipate = false,
    this.badgesWidget,
    this.buttonDisabled = false,
    this.buttonTitle = '',
    this.onButtonPressed,
    this.showClaimButton = true,
    this.widgetKey,
    this.title = ''
  });

  final Key? widgetKey;
  final String image;
  final String title;
  final Widget? badgesWidget;
  final bool alreadyParticipate;
  final bool showClaimButton;
  final bool buttonDisabled;
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
                height: 135,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(image, fit: BoxFit.cover),
                ),
              ),
              Positioned(left: 12, top: 10, child: _prizeTitle(context, title)),
              Positioned(right: 20, top: 100, child: _bottomArrow(context)),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (badgesWidget != null) badgesWidget! else const SizedBox(),
              if (showClaimButton) _buildClaimDemoButton(context, buttonDisabled, buttonTitle, onButtonPressed),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _prizeTitle(BuildContext context, String title) {
  return Container(
    width: 70,
    height: 25,
    decoration: BoxDecoration(color: const Color.fromRGBO(255, 255, 255, 0.2), borderRadius: BorderRadius.circular(10)),
    child: Center(
      child:
          Text(title, style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w300)),
    ),
  );
}

Widget _bottomArrow(BuildContext context) {
  return Container(
    width: 25,
    height: 25,
    decoration: const BoxDecoration(color: Color.fromRGBO(255, 255, 255, 0.2), shape: BoxShape.circle),
    child: const Center(child: Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 15)),
  );
}

Widget _buildClaimDemoButton(BuildContext context, bool disabled, String buttonTitle, Function? onButtonPressed) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Container(
      width: MediaQuery.of(context).size.width / 3,
      child: AW_Button(
        disabled: disabled,
        onPressed: () {
          !disabled ? onButtonPressed!() : null;
        },
        key: const Key('claim_prize_key'),
        buttonTitle: buttonTitle,
        btnTitleStyle: Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 12),
      ),
    ),
  );
}
