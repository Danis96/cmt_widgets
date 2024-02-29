part of widgets;

class AW_Button extends StatelessWidget {
  const AW_Button({
    Key? key, this.buttonTitle = '',
    required this.onPressed,
    this.disabled = false,
    this.style,
    this.btnTitleStyle,
    this.forceStyleOverGradient = false,
    this.width,
    this.minWidth,
    this.padding = 10,

  })
      : super(key: key);

  final String buttonTitle;
  final bool disabled;
  final Function? onPressed;
  final ButtonStyle? style;
  final TextStyle? btnTitleStyle;
  final double padding;
  ///used to force style gradient
  final bool forceStyleOverGradient;
  final double? width;
  final double? minWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: minWidth != null ? BoxConstraints(
        minWidth: minWidth!
      ) : null,
      decoration: applyDecoration,
      width: width,
      child: ElevatedButton(
        onPressed: disabled ? null : () {
          if (onPressed != null) {
            onPressed!();
          }
        },
        style: applyStyle,
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Text(
            buttonTitle,
            textAlign: TextAlign.center,
            style: btnTitleStyle
          )
        ),
      ),
    );
  }

  BoxDecoration? get applyDecoration {
    final GradientButtonConfig? instance = GradientButtonConfig.instance;
    if(instance == null || forceStyleOverGradient) {
      return null;
    }
    return BoxDecoration(
      gradient: disabled ? instance.values.disabledGradient : instance.values.gradient,
      borderRadius: instance.values.borderRadius
    );
  }

  ButtonStyle? get applyStyle {
    final GradientButtonConfig? instance = GradientButtonConfig.instance;
    if(instance == null || forceStyleOverGradient) {
      return style;
    }
    final GradientButtonValues values = instance.values;
    return ElevatedButton.styleFrom(
      backgroundColor: values.backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: values.borderRadius)
    );

  }
}

///singleton of gradient button setup
///should be setup from the project
///inside shared main function (not per flavor)
///if project singleton instance is null
///null BoxDecoration is applied
class GradientButtonConfig {
  factory GradientButtonConfig({
    required GradientButtonValues values,
  }) {
    _instance ??= GradientButtonConfig._internal(values);
    return _instance!;
  }

  GradientButtonConfig._internal(this.values);

  final GradientButtonValues values;
  static GradientButtonConfig? _instance;

  static GradientButtonConfig? get instance {
    return _instance;
  }
}

class GradientButtonValues {
  const GradientButtonValues({
    required this.backgroundColor,
    required this.gradient,
    required this.borderRadius,
    required this.disabledGradient
  });

  final Gradient gradient;
  final Gradient disabledGradient;
  final Color backgroundColor;
  final BorderRadius borderRadius;
}

