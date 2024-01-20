part of '../input.dart';

class XigoObscureInput extends StatefulWidget {
  const XigoObscureInput({
    Key? key,
    required this.controller,
    this.filled = true,
    this.fillColor,
    this.title = '',
    this.titleStyle,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.hintText,
  }) : super(key: key);

  final TextEditingController controller;
  final String title;
  final bool filled;
  final Color? fillColor;
  final TextStyle? titleStyle;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final String? hintText;
  @override
  State<XigoObscureInput> createState() => _XigoObscureInputState();
}

class _XigoObscureInputState extends State<XigoObscureInput> {
  late bool _isObscure;

  @override
  void initState() {
    _isObscure = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(
              bottom: R5Spacing.xs,
              left: R5Spacing.xxs,
            ),
            child: RichText(
              text: TextSpan(
                text: widget.title,
                style: widget.titleStyle ??
                    const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      fontFamily: R5Typography.inter,
                      color: R5Colors.disabledColor,
                    ),
                children: const [],
              ),
            ),
          ),
        TextFormField(
          obscureText: _isObscure,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          textAlign: TextAlign.start,
          validator: widget.validator,
          style: R5Text.style(),
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              },
              child: const Icon(Icons.remove_red_eye_outlined),
            ),
            isDense: true,
            filled: widget.filled,
            fillColor: widget.fillColor ?? Colors.white,
            hintText: widget.hintText ?? widget.title,
            hintStyle: R5Text.style().copyWith(
              color: R5Colors.silver,
            ),
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(
                color: R5Colors.whiteSecundary,
              ),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(
                color: R5Colors.error,
              ),
            ),
            labelStyle: TextStyle(
              fontFamily: R5Typography.inter,
              color: Theme.of(context).textSelectionTheme.selectionColor,
              fontSize: R5Spacing.md,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
            errorStyle: const TextStyle(
              color: R5Colors.error,
            ),
          ),
        ),
      ],
    );
  }
}
