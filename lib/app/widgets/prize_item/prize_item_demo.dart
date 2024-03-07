part of widgets;

class AW_PrizeItemDemo extends StatelessWidget {
  const AW_PrizeItemDemo({
    Key? key,
    this.image = '',
    this.prizeBody = '',
    this.prizeTitle = '',
    this.prizesRemaining,
    this.badgesWidget,
    this.alreadyParticipate = false,
    this.prizeRemainingText = '',
    this.buttonTitle = '',
    required this.newPrizeText,
    required this.isActive,
    required this.canParticipate,
    required this.prizedExpiredIcon,
    required this.prizeClaimedIcon,
    required this.notActionableMessage,
    required this.isNewPrize,
    required this.prizeExpired,
    required this.onTap
  }) : super(key: key);

  final String image;
  final String prizeTitle;
  final String prizeBody;
  final String prizeRemainingText;
  final String buttonTitle;
  final int? prizesRemaining;
  final Widget? badgesWidget;
  final bool alreadyParticipate;
  final String newPrizeText;
  final bool isActive;
  final bool canParticipate;
  final SvgPicture prizeClaimedIcon;
  final SvgPicture prizedExpiredIcon;
  final String notActionableMessage;
  final bool isNewPrize;
  final String prizeExpired;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isActive  ? 1 : 0.5,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12)
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Color.fromRGBO(50, 50, 71, 0.2),
                spreadRadius: 2,
                blurRadius: 10,
            )
          ]
        ),
        height: 280,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _ImageContainer(
              image: image,
              prizesRemaining: prizesRemaining,
              prizesRemainingText: prizeRemainingText,
              alreadyParticipate: alreadyParticipate,
              newPrizeText: newPrizeText,
              prizeTitle: prizeTitle,
              isNewPrize: isNewPrize,
            ),
            const SizedBox(height: 20),
            if (badgesWidget != null) badgesWidget! else const SizedBox(),
            AW_PrizeItemDemoBottomBanner(
              canParticipate: canParticipate,
              isActive: isActive,
              alreadyParticipates: alreadyParticipate,
              buttonTitle: buttonTitle,
              prizeClaimedText: notActionableMessage,
              prizeExpiredIcon: prizedExpiredIcon,
              prizeClaimedIcon: prizeClaimedIcon,
              prizeExpired: prizeExpired,
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }
}

class _ImageContainer extends StatelessWidget {
  const _ImageContainer({
    Key? key,
    required this.image,
    this.prizesRemaining,
    required this.prizesRemainingText,
    required this.alreadyParticipate,
    required this.newPrizeText,
    required this.prizeTitle,
    required this.isNewPrize
  }) : super(key: key);

  final String image;
  final int? prizesRemaining;
  final String prizesRemainingText;
  final bool alreadyParticipate;
  final String newPrizeText;
  final String prizeTitle;
  final bool isNewPrize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        if (image.isNotEmpty)
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12)
              )
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12)
              ),
              child: Image.network(image, fit: BoxFit.fitHeight,),
          ),
        ) else const NoImageContainer(),
        _prizeHeadline(context),
        if(prizesRemaining != null)
        _prizeBottomLine(context)
      ],
    );
  }

  Widget _prizeHeadline(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child:  Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (isNewPrize)
            Text(
              newPrizeText,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Colors.white
              ),
            )
          else const SizedBox(),
          Text(
            prizeTitle,
            style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w700,
                color: Colors.white
            ),
          )
        ],
      ),
    );
  }

  Widget _prizeBottomLine(BuildContext context) {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                prizesRemainingText,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 12
                ),
              ),
              const Spacer(),
              Text(
                prizesRemaining.toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 12
                ),
              )
            ],
          ),
        )
    );
  }
}

class NoImageContainer extends StatelessWidget {
  const NoImageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
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

class AW_PrizeItemDemoBottomBanner extends StatelessWidget {
  const AW_PrizeItemDemoBottomBanner({
    Key? key,
    required this.canParticipate,
    required this.alreadyParticipates,
    required this.isActive,
    required this.buttonTitle,
    required this.prizeClaimedText,
    required this.prizeExpiredIcon,
    required this.prizeClaimedIcon,
    required this.prizeExpired,
    required this.onTap
  }) : super(key: key);

  final bool canParticipate;
  final bool alreadyParticipates;
  final bool isActive;
  final String buttonTitle;
  final String prizeClaimedText;
  final SvgPicture prizeExpiredIcon;
  final SvgPicture prizeClaimedIcon;
  final String prizeExpired;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    if(!isActive) {
      return Expanded(
        key: key,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            prizeExpiredIcon,
            const SizedBox(width: 10,),
            Text(
              prizeExpired,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black
              ),
            )
          ],
        ),
      );
    }
    if(alreadyParticipates) {
      return Row(
        key: key,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          prizeClaimedIcon,
          const SizedBox(width: 10,),
          Text(
            prizeClaimedText,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 16
            ),
          )
        ],
      );
    }
    if(canParticipate) {
      return Padding(
        key: key,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: AW_Button(
          onPressed: () {
            onTap();
          },
          buttonTitle: buttonTitle,
        ),
      );
    }

    return Opacity(
      key: key,
      opacity: 0.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: AW_Button(
          onPressed: () {},
          buttonTitle: buttonTitle,
          style: ElevatedButton.styleFrom(
            splashFactory: NoSplash.splashFactory,
          ),
        )
      ),
    );
  }
}







