part of widgets;

class AW_UnderlineTextFormField extends StatefulWidget {
  const AW_UnderlineTextFormField(
      {Key? key,
      this.controller,
      this.cursorColor = Colors.grey,
      this.underlineColor = Colors.grey,
      this.errorUnderlineColor = Colors.red,
      this.hintText = '',
      this.labelText = '',
      this.errorMessage,
      this.readonly = false,
      this.obscureText = false,
      this.keyboardType = TextInputType.text,
      this.onChange,
      this.textColor})
      : super(key: key);

  final TextEditingController? controller;
  final Color cursorColor;
  final Color underlineColor;
  final Color errorUnderlineColor;
  final String hintText;
  final String labelText;
  final String? errorMessage;
  final bool readonly;
  final bool obscureText;
  final TextInputType keyboardType;
  final Function(String)? onChange;
  final Color? textColor;

  @override
  _AW_UnderlineTextFormFieldState createState() => _AW_UnderlineTextFormFieldState();
}

class _AW_UnderlineTextFormFieldState extends State<AW_UnderlineTextFormField> {
  bool visibleText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: widget.textColor != null ? Theme.of(context).textTheme.bodyMedium!.copyWith(color: widget.textColor) : Theme.of(context).textTheme.bodyMedium,
      onChanged: (String value) => widget.onChange!(value),
      cursorHeight: 18.0,
      cursorColor: widget.cursorColor,
      readOnly: widget.readonly,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText && visibleText,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        suffixIcon: widget.obscureText
            ? Padding(
                padding: const EdgeInsets.only(top: 19.0),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: Icon(visibleText ? Icons.visibility : Icons.visibility_off),
                  color: const Color.fromRGBO(189, 195, 199, 1),
                  onPressed: () => onVisibilityIconPress(),
                ),
              )
            : const SizedBox(),
        hintStyle: const TextStyle(height: 1.8),
        contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
        filled: false,
        errorText: widget.errorMessage,
        errorMaxLines: 2,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: widget.underlineColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: widget.underlineColor),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: widget.errorUnderlineColor),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: widget.errorUnderlineColor),
        ),
      ),
    );
  }

  void onVisibilityIconPress() {
    setState(() {
      visibleText = !visibleText;
    });
  }
}
