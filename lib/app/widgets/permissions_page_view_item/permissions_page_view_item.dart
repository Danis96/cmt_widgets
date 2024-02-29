part of widgets;

class AW_PermissionsPageViewItem extends StatelessWidget {
  const AW_PermissionsPageViewItem({
    required this.onEnabledTap,
    required this.onSkipTap,
    this.skipButtonText = '',
    this.enableButtonText = '',
    this.enableButtonColor = const Color.fromRGBO(19, 82, 222, 1),
    this.contentText = '',
    this.contentTextStyle = const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 15,
      color: Color.fromRGBO(97, 97, 97, 1),
    ),
    this.imageAssetPath = '',
    this.title = '',
    this.titleTextStyle = const TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 21,
      color: Color.fromRGBO(33, 33, 33, 1),
    ),
    this.skipButtonTextStyle = const TextStyle(
      color: Color.fromRGBO(19, 82, 222, 1),
      fontSize: 19,
      fontWeight: FontWeight.w700,
    ),
    this.widgetKey,
    this.buttonWithImageBg,
    this.ignoreSizes = false,
    this.contentSpacing = 8.0,
    this.topSpacing = 24,
    this.instructionsContent
  });

  final Function onEnabledTap;
  final Function onSkipTap;
  final String? skipButtonText;
  final String? enableButtonText;
  final Color? enableButtonColor;
  final String? contentText;
  final TextStyle? contentTextStyle;
  final String? imageAssetPath;
  final String? title;
  final TextStyle? titleTextStyle;
  final TextStyle? skipButtonTextStyle;
  final Key? widgetKey;
  final bool ignoreSizes;
  final double contentSpacing;
  final double topSpacing;
  final Widget? instructionsContent;

  ///if 'buttonWithImageBg' is null then default button will be shown
  final AW_ButtonWithImageBg? buttonWithImageBg;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomNavigationBar: Container(width: double.infinity, height: 56, child: returnButton()),
      body: Container(
        key: widgetKey,
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          children: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: const EdgeInsets.only(top: 15),
                child: TextButton(
                  key: const Key('permission_page_view_skip_text_button'),
                  child: Text(
                    skipButtonText ?? '',
                    style: skipButtonTextStyle,
                  ),
                  onPressed: () => onSkipTap(),
                ),
              ),
            ),
            SizedBox(height: topSpacing),
            returnImageBasedOnPath(screenHeight, screenWidth, ignoreSizes: ignoreSizes),
            const SizedBox(height: 57),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: SizedBox(
                width: screenWidth - 24,
                child: Text(
                  title!,
                  style: titleTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: contentSpacing),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: SizedBox(
                width: screenWidth - 30,
                child: Text(
                  contentText!,
                  style: contentTextStyle,
                  textAlign: TextAlign.center,
                  maxLines: 4,
                ),
              ),
            ),
            const SizedBox(height: 15),
            instructionsContent ?? const SizedBox()
          ],
        ),
      ),
    );
  }

  Widget returnButton() {
    return buttonWithImageBg ??
        AW_Button(
          key: const Key('permission_page_view_enable_button'),
          buttonTitle: enableButtonText!,
          // btnBackground: enableButtonColor!,
          onPressed: () => onEnabledTap(),
        );
  }

  //ignoreSizes param added for warta reusability
  Widget returnImageBasedOnPath(double screenHeight, double screenWidth, {bool ignoreSizes = false}) {
    if (imageAssetPath != null) {
      if (imageAssetPath!.contains('svg')) {
        return SvgPicture.asset(
          imageAssetPath!,
          height: ignoreSizes ? null : (screenHeight * 0.37),
          width: ignoreSizes ? null : (screenWidth * 0.90),
        );
      } else {
        return Image.asset(
          imageAssetPath!,
          height: screenHeight * 0.35,
          width: screenWidth * 0.90,
        );
      }
    } else {
      return Container();
    }
  }
}
