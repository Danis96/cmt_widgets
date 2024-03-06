part of widgets;

class AW_ButtonWithImageBg extends StatelessWidget {
  const AW_ButtonWithImageBg({
    Key? key,
    this.buttonTitle = '',
    this.disabled = false,
    @required this.onPressed,
    this.boxDecorationImage,
    this.disabledBoxDecorationImage,
    this.height = 56.0,
    this.buttonTextStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    this.buttonColor = Colors.white,
  }) : super(key: key);

  final String buttonTitle;
  final bool disabled;
  final Function? onPressed;
  final double height;
  final TextStyle buttonTextStyle;
  final Color buttonColor;

  ///Decoration image that contains svg asset path and size, example:
  /// DecorationImage(
  ///  image: svg_provider.Svg(
  ///  'assets/enabled_button_background.svg',
  ///  size: Size(327, 56),
  ///  ),
  /// )
  final DecorationImage? boxDecorationImage;

  ///Decoration image that contains svg asset path and size, example:
  /// DecorationImage(
  ///  image: svg_provider.Svg(
  ///  'assets/enabled_button_background.svg',
  ///  size: Size(327, 56),
  ///  ),
  /// )
  final DecorationImage? disabledBoxDecorationImage;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disabled ? null : () => onPressed!(),
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(buttonColor)),
      child: Ink(
        height: height,
        decoration: BoxDecoration(
          color: buttonColor,
          image: disabled ? disabledBoxDecorationImage : boxDecorationImage,
          borderRadius: BorderRadius.circular(4.0),
          shape: BoxShape.rectangle,
        ),
        child: Center(
          child: Text(
            buttonTitle,
            textAlign: TextAlign.center,
            style: buttonTextStyle,
          ),
        ),
      ),
    );
  }
}
