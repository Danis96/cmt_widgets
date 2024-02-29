part of widgets;

enum AW_StepState {
  indexed,
  complete,
  disabled,
}

enum AW_StepperType {
  vertical,
  horizontal,
}

const TextStyle _kStepStyle = TextStyle(
  fontSize: 12.0,
  color: Colors.white,
);

class AW_Step {
  const AW_Step({
    required this.content,
    this.state = AW_StepState.indexed,
    this.isActive = false,
  });

  final Widget content;
  final AW_StepState state;
  final bool isActive;
}

class AW_Stepper extends StatefulWidget {
  const AW_Stepper({
    Key? key,
    required this.steps,
    this.physics,
    this.type = AW_StepperType.vertical,
    this.currentStep = 0,
    this.onStepTapped,
    this.onStepContinue,
    this.onStepCancel,
    this.controlsBuilder,
    this.elevation = 1,
    required this.completeColor,
    required this.activeColor,
    required this.inActiveColor,
    this.index = 0,
  })  : assert(0 <= currentStep && currentStep < steps.length),
        super(key: key);

  final Color? completeColor;
  final Color? activeColor;
  final Color? inActiveColor;
  final List<AW_Step> steps;
  final ScrollPhysics? physics;
  final AW_StepperType type;
  final int currentStep;
  final int index;
  final ValueChanged<int>? onStepTapped;
  final VoidCallback? onStepContinue;
  final VoidCallback? onStepCancel;
  final ControlsWidgetBuilder? controlsBuilder;
  final double? elevation;

  @override
  State<AW_Stepper> createState() => _AW_StepperState();
}

class _AW_StepperState extends State<AW_Stepper> with TickerProviderStateMixin {
  late List<GlobalKey> _keys;
  final Map<int, AW_StepState> _oldStates = <int, AW_StepState>{};

  @override
  void initState() {
    super.initState();
    _keys = List<GlobalKey>.generate(
      widget.steps.length,
      (int i) => GlobalKey(),
    );

    for (int i = 0; i < widget.steps.length; i += 1) _oldStates[i] = widget.steps[i].state;
  }

  @override
  void didUpdateWidget(AW_Stepper oldWidget) {
    super.didUpdateWidget(oldWidget);
    assert(widget.steps.length == oldWidget.steps.length);

    for (int i = 0; i < oldWidget.steps.length; i += 1) _oldStates[i] = oldWidget.steps[i].state;
  }

  bool _isFirst(int index) {
    return index == 0;
  }

  bool _isLast(int index) {
    return widget.steps.length - 1 == index;
  }

  bool _isCurrent(int index) {
    return widget.currentStep == index;
  }

  Widget _buildLine(bool visible) {
    return Container(
      width: visible ? 1.0 : 0.0,
      height: 16.0,
      color: Colors.grey.shade400,
    );
  }

  Widget _buildCircleChild(int index, bool oldState) {
    final AW_StepState state = oldState ? _oldStates[index]! : widget.steps[index].state;
    switch (state) {
      case AW_StepState.indexed:
      case AW_StepState.disabled:
        return Text(
          '${index + 1}',
          style: _kStepStyle,
        );
      case AW_StepState.complete:
        return const Icon(
          Icons.check,
          color: Colors.white,
          size: 18.0,
        );
    }
  }

  Color _circleColor(
    int index,
    Color? completedColor,
    Color? activeColor,
    Color? inActiveColor,
  ) {
    if (widget.steps[index].state == AW_StepState.complete) {
      return Colors.green;
    }
    return widget.steps[index].isActive ? Colors.grey[500]! : Colors.grey[300]!;
  }

  Widget _buildCircle(
    int index,
    bool oldState,
    Color? completedColor,
    Color? activeColor,
    Color? inActiveColor,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      width: 24,
      height: 24,
      child: AnimatedContainer(
        curve: Curves.fastOutSlowIn,
        duration: kThemeAnimationDuration,
        decoration: BoxDecoration(
          color: _circleColor(index, completedColor, activeColor, inActiveColor),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: _buildCircleChild(index, oldState && widget.steps[index].state == StepState.error),
        ),
      ),
    );
  }

  Widget _buildIcon(
    int index,
    Color? completedColor,
    Color? activeColor,
    Color? inActiveColor,
  ) {
    if (widget.steps[index].state != _oldStates[index]) {
      return AnimatedCrossFade(
        firstChild: _buildCircle(index, true, completedColor, activeColor, inActiveColor),
        secondChild: _buildCircle(index, true, completedColor, activeColor, inActiveColor),
        firstCurve: const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
        secondCurve: const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
        sizeCurve: Curves.fastOutSlowIn,
        crossFadeState: widget.steps[index].state == StepState.error ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: kThemeAnimationDuration,
      );
    } else {
      return _buildCircle(index, false, completedColor, activeColor, inActiveColor);
    }
  }

  Widget _buildVerticalControls() {
    if (widget.controlsBuilder != null)
      return widget.controlsBuilder!(
          context,
          ControlsDetails(
            stepIndex: widget.index,
            currentStep: widget.currentStep,
            onStepContinue: widget.onStepContinue,
            onStepCancel: widget.onStepCancel,
          ));

    final Color cancelColor;
    switch (Theme.of(context).brightness) {
      case Brightness.light:
        cancelColor = Colors.black54;
        break;
      case Brightness.dark:
        cancelColor = Colors.white70;
        break;
    }

    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;
    final MaterialLocalizations localizations = MaterialLocalizations.of(context);

    const OutlinedBorder buttonShape = RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(2)));
    const EdgeInsets buttonPadding = EdgeInsets.symmetric(horizontal: 16.0);

    return Container(
      margin: const EdgeInsets.only(top: 16.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints.tightFor(height: 48.0),
        child: Row(
          children: <Widget>[
            TextButton(
              onPressed: widget.onStepContinue,
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                  return states.contains(MaterialState.disabled) ? null : (colorScheme.onPrimary);
                }),
                backgroundColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                  return colorScheme.primary;
                }),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(buttonPadding),
                shape: MaterialStateProperty.all<OutlinedBorder>(buttonShape),
              ),
              child: Text(localizations.continueButtonLabel),
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(start: 8.0),
              child: TextButton(
                onPressed: widget.onStepCancel,
                style: TextButton.styleFrom(
                  foregroundColor: cancelColor, padding: buttonPadding,
                  shape: buttonShape,
                ),
                child: Text(localizations.cancelButtonLabel),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVerticalHeader(
    int index,
    Color? completedColor,
    Color? activeColor,
    Color? inActiveColor,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              _buildLine(!_isFirst(index)),
              _buildIcon(index, completedColor, activeColor, inActiveColor),
              _buildLine(!_isLast(index)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVerticalBody(int index) {
    return Stack(
      children: <Widget>[
        PositionedDirectional(
          start: 24.0,
          top: 0.0,
          bottom: 0.0,
          child: SizedBox(
            width: 24.0,
            child: Center(
              child: SizedBox(
                width: _isLast(index) ? 0.0 : 1.0,
                child: Container(
                  color: Colors.grey.shade400,
                ),
              ),
            ),
          ),
        ),
        AnimatedCrossFade(
          firstChild: Container(height: 0.0),
          secondChild: Container(
            margin: const EdgeInsetsDirectional.only(
              start: 60.0,
              end: 24.0,
              bottom: 24.0,
            ),
            child: Column(
              children: <Widget>[
                widget.steps[index].content,
                _buildVerticalControls(),
              ],
            ),
          ),
          firstCurve: const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
          secondCurve: const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
          sizeCurve: Curves.fastOutSlowIn,
          crossFadeState: _isCurrent(index) ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: kThemeAnimationDuration,
        ),
      ],
    );
  }

  Widget _buildVertical({
    @required Color? completedColor,
    @required Color? activeColor,
    @required Color? inActiveColor,
  }) {
    return ListView(
      shrinkWrap: true,
      physics: widget.physics,
      children: <Widget>[
        for (int i = 0; i < widget.steps.length; i += 1)
          Column(
            key: _keys[i],
            children: <Widget>[
              InkWell(
                onTap: widget.steps[i].state != StepState.disabled
                    ? () {
                        Scrollable.ensureVisible(
                          _keys[i].currentContext!,
                          curve: Curves.fastOutSlowIn,
                          duration: kThemeAnimationDuration,
                        );

                        widget.onStepTapped?.call(i);
                      }
                    : null,
                canRequestFocus: widget.steps[i].state != StepState.disabled,
                child: _buildVerticalHeader(i, completedColor, activeColor, inActiveColor),
              ),
              _buildVerticalBody(i),
            ],
          ),
      ],
    );
  }

  Widget _buildHorizontal({
    @required Color? completedColor,
    @required Color? activeColor,
    @required Color? inActiveColor,
  }) {
    final List<Widget> children = <Widget>[
      for (int i = 0; i < widget.steps.length; i += 1) ...<Widget>[
        InkResponse(
          onTap: widget.steps[i].state != StepState.disabled
              ? () {
                  widget.onStepTapped?.call(i);
                }
              : null,
          canRequestFocus: widget.steps[i].state != StepState.disabled,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 72.0,
                child: Center(
                  child: _buildIcon(i, completedColor, activeColor, inActiveColor),
                ),
              ),
            ],
          ),
        ),
        if (!_isLast(i))
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            width: 24,
            height: 1.0,
            color: Colors.grey.shade400,
          ),
      ],
    ];

    return Column(
      children: <Widget>[
        Material(
          elevation: widget.elevation ?? 2,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          ),
        ),
        Expanded(
          child: ListView(
            physics: widget.physics,
            padding: const EdgeInsets.all(0.0),
            children: <Widget>[
              AnimatedSize(
                curve: Curves.fastOutSlowIn,
                duration: kThemeAnimationDuration,
                child: widget.steps[widget.currentStep].content,
              ),
              _buildVerticalControls(),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    assert(debugCheckHasMaterialLocalizations(context));
    assert(() {
      if (context.findAncestorWidgetOfExactType<Stepper>() != null)
        throw FlutterError(
          'Steppers must not be nested.',
        );
      return true;
    }());
    switch (widget.type) {
      case AW_StepperType.vertical:
        return _buildVertical(completedColor: widget.completeColor, activeColor: widget.activeColor, inActiveColor: widget.inActiveColor);
      case AW_StepperType.horizontal:
        return _buildHorizontal(completedColor: widget.completeColor, activeColor: widget.activeColor, inActiveColor: widget.inActiveColor);
    }
  }
}
