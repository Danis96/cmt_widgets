part of widgets;

class AW_PrizeItem extends StatelessWidget {
  const AW_PrizeItem({
    @required this.widgetKey,
    this.image = '',
    this.prizeIcon = '',
    this.prizeBody = '',
    this.prizeTitle = '',
    this.prizesRemaining,
    this.prizeIconColor = const Color.fromRGBO(6, 62, 89, 1),
    this.badgesWidget,
    this.alreadyParticipate = false,
    this.prizeRemainingText = '',
    this.prizeClaimed = '',
    this.prizeNeedsToBeClaimed = '',
    this.showClaimButton = false,
    this.buttonDisabled = false,
    this.buttonTitle = '',
    this.onButtonPressed,
  });

  final Key? widgetKey;
  final String image;
  final String? prizeIcon;
  final Color prizeIconColor;
  final String prizeTitle;
  final String prizeBody;
  final String prizeRemainingText;
  final String prizeClaimed;
  final String prizeNeedsToBeClaimed;
  final int? prizesRemaining;
  final Widget? badgesWidget;
  final bool alreadyParticipate;
  final bool showClaimButton;
  final bool buttonDisabled;
  final String buttonTitle;
  final Function? onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      key: widgetKey,
      child: Container(
        height: showClaimButton ? 450 : 500,
        child: Column(
          children: <Widget>[
            _buildImageContainer(image),
            if (prizesRemaining != null) _remainingBanner(context, prizesRemaining!, prizeRemainingText) else const SizedBox(),
            // _iconAndClaim(context, prizeIcon!, prizeIconColor, alreadyParticipate, prizeNeedsToBeClaimed, prizeClaimed),
            _buildTitleAndBody(context, prizeTitle, prizeBody),
            const SizedBox(height: 10),
            if (badgesWidget != null) badgesWidget!  else const SizedBox(),
            if (showClaimButton) _buildClaimButton(context, buttonDisabled, buttonTitle, onButtonPressed),
          ],
        ),
      ),
    );
  }
}

Widget _buildImageContainer(String image) {
  return image.isNotEmpty
      ? Container(
          height: 190,
          width: 400,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10)
            )
          ),
          child: Image.network(image, fit: BoxFit.scaleDown),
        )
      : _buildImageEmptyContainer();
}

Widget _buildImageEmptyContainer() {
  return Container(
    height: 190,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10)
      ),
      color: Color.fromRGBO(158, 158, 158, 1),
    ),
  );
}

Widget _remainingBanner(BuildContext context, int prizesRemaining, String prizeRemainingText) {
  return Container(
    height: 25,
    padding: const EdgeInsets.symmetric(horizontal: 10),
    color: const Color.fromRGBO(232, 235, 237, 1),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(prizeRemainingText, style: _remainingTextStyle(context)),
        Text('$prizesRemaining', style: _remainingTextStyle(context)),
      ],
    ),
  );
}

Widget _iconAndClaim(BuildContext context, String prizesIcon, Color prizeIconColor, bool alreadyParticipate, String prizeNeedsToBeClaimed, String alreadyClaimed) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        if (prizesIcon.isNotEmpty) SvgPicture.asset(prizesIcon, color: prizeIconColor, height: 30,width: 30) else const SizedBox(),
        if(prizesIcon.isNotEmpty) const SizedBox(width: 10,) else const SizedBox(),
        Expanded(
          child: Text(
            alreadyParticipate ? alreadyClaimed : prizeNeedsToBeClaimed,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(color: const Color.fromRGBO(197, 205, 211, 1),
           )
          ),
        )
      ],
    ),
  );
}

Widget _buildTitleAndBody(BuildContext context, String title, String body) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title, style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: const Color.fromRGBO(28, 37, 53, 1), fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Text(body, maxLines: 3, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleSmall),
      ],
    ),
  );
}

Widget _buildClaimButton(BuildContext context, bool disabled, String buttonTitle, Function? onButtonPressed) {
  return Padding(
    key: const Key('prizes_details_buildClaimButton'),
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Container(
      width: double.infinity,
      child: AW_Button(
        disabled: disabled,
        onPressed: () {
          !disabled ? onButtonPressed!() : null;
        },
        key: const Key('claim_prize_key'),
        buttonTitle: buttonTitle,
      ),
    ),
  );
}

TextStyle _remainingTextStyle(BuildContext context) =>
    Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 12, fontWeight: FontWeight.w600, color: const Color.fromRGBO(127, 144, 159, 1));
