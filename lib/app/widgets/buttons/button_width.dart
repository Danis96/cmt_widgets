part of widgets;

class AW_ButtonWidth extends StatelessWidget {
  const AW_ButtonWidth({
    Key? key,
    this.buttonTitle = '',
    this.disabled = false,
    @required this.onPressed,
    this.style,
    this.btnTitleStyle,
    this.widthOfButton = 60,
    this.forceStyleOverGradient = false,
    this.disableDefaultWidth = false,
  }) : super(key: key);

  final String buttonTitle;
  final bool disabled;
  final Function? onPressed;
  final ButtonStyle? style;
  final TextStyle? btnTitleStyle;
  final double widthOfButton;
  final bool disableDefaultWidth;

  ///used to force style gradient
  final bool forceStyleOverGradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: disableDefaultWidth ? null : widthOfButton,
      decoration: applyDecoration,
      child: ElevatedButton(
        onPressed: disabled
            ? null
            : () {
                if (onPressed != null) {
                  onPressed!();
                }
              },
        style: applyStyle,
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(buttonTitle,
                textAlign: TextAlign.center, style: btnTitleStyle)),
      ),
    );
  }

  BoxDecoration? get applyDecoration {
    final GradientButtonConfig? instance = GradientButtonConfig.instance;
    if (instance == null || forceStyleOverGradient) {
      return null;
    }
    return BoxDecoration(
        gradient: disabled
            ? instance.values.disabledGradient
            : instance.values.gradient,
        borderRadius: instance.values.borderRadius);
  }

  ButtonStyle? get applyStyle {
    final GradientButtonConfig? instance = GradientButtonConfig.instance;
    if (instance == null || forceStyleOverGradient) {
      return style;
    }
    final GradientButtonValues values = instance.values;
    return ElevatedButton.styleFrom(
        backgroundColor: values.backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: values.borderRadius));
  }
}
