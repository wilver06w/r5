import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:r5/app/utils/colors.dart';
import 'package:r5/app/utils/spacing.dart';
import 'package:r5/app/utils/text/text.dart';
import 'package:r5/app/utils/text/typography.dart';
import 'package:r5/app/utils/r5_ui.dart';

part 'types/check_input.dart';
part 'types/code_input.dart';
part 'types/input_textarea.dart';
part 'types/number_input.dart';
part 'types/obscure_input.dart';
part 'types/options_input.dart';

class XigoTextField extends StatelessWidget {
  const XigoTextField({
    Key? key,
    this.controller,
    this.counterStyle,
    this.title,
    this.hintText,
    this.initialValue,
    this.keyboardType = TextInputType.text,
    this.textInputFormatters,
    this.autofocus = false,
    this.textCapitalization = TextCapitalization.none,
    this.focusNode,
    this.validator,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.contentPadding,
    this.onChanged,
    this.maxLines = 1,
    this.hintMaxLines = 1,
    this.onTap,
    this.readOnly = false,
    this.inputTextStyle,
    this.hintTextStyle,
    this.labelTextStyle,
    this.borderRadius,
    this.maxLength,
    this.minLines = 1,
    this.textAlign,
    this.showCounter = false,
    this.counterText,
    this.fillColor,
    this.filled,
    this.enabled = true,
    this.onFieldSubmitted,
    this.suffixIcon,
    this.prefixIcon,
    this.suffixIconConstraints,
    this.prefixIconConstraints,
    this.textAlignVertical,
    this.disabledBorder,
    this.errorBorder,
    this.errorStyle,
    this.isRequired,
    this.toolTipRequiredOptionalText,
    this.enabledBorder,
    this.focusedBorder,
    this.alignLabelWithHint = false,
    this.focusedErrorBorder,
    this.titleStyle,
    this.obscureText = false,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.errorText,
    this.cursorColor,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? title;
  final String? hintText;
  final String? initialValue;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? textInputFormatters;
  final bool autofocus;
  final FocusNode? focusNode;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode autovalidateMode;
  final EdgeInsets? contentPadding;
  final Function(String)? onChanged;
  final TextStyle? inputTextStyle;
  final TextStyle? hintTextStyle;
  final TextStyle? labelTextStyle;
  final BorderRadius? borderRadius;
  final int? maxLength;
  final int? hintMaxLines;
  final TextAlign? textAlign;
  final bool? showCounter;
  final String? counterText;
  final Color? fillColor;
  final bool? filled;
  final bool enabled;
  final Function(String)? onFieldSubmitted;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLines;
  final int? minLines;
  final Function? onTap;
  final bool readOnly;
  final TextCapitalization textCapitalization;
  final BoxConstraints? suffixIconConstraints;
  final BoxConstraints? prefixIconConstraints;
  final TextAlignVertical? textAlignVertical;
  final InputBorder? disabledBorder;
  final TextStyle? errorStyle;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final Color? cursorColor;

  ///if is true show red tooltip, if is false, show tooltip black italic
  ///and if is null don`t show tooltip
  final bool? isRequired;

  ///message show next to title(label) when isRequired is true or false,
  /// ej: Nombre * ó Nombre - Opcional
  final String? toolTipRequiredOptionalText;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final bool? alignLabelWithHint;
  final TextStyle? titleStyle;
  final TextStyle? counterStyle;
  final bool obscureText;
  final EdgeInsets scrollPadding;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          _TextFieldTitle(
            title: title!,
            titleStyle: titleStyle,
            isRequired: isRequired,
            errorText: errorText,
            toolTipRequiredOptionalText: toolTipRequiredOptionalText,
          ),
        TextFormField(
          cursorColor: cursorColor ?? VerifikColors.ufoGreen,
          obscureText: obscureText,
          initialValue: initialValue,
          controller: controller,
          keyboardType: keyboardType,
          autofocus: autofocus,
          textCapitalization: textCapitalization,
          focusNode: focusNode,
          enabled: enabled,
          textAlignVertical: textAlignVertical,
          inputFormatters: textInputFormatters,
          maxLength: maxLength,
          maxLines: maxLines,
          minLines: minLines,
          textAlign: textAlign ?? TextAlign.start,
          validator: validator,
          autovalidateMode: autovalidateMode,
          style: inputTextStyle ?? VerifikText.style(),
          onChanged: onChanged,
          onTap: onTap as void Function()?,
          onFieldSubmitted: onFieldSubmitted,
          readOnly: readOnly,
          scrollPadding: scrollPadding,
          decoration: InputDecoration(
            errorText: errorText,
            errorMaxLines: 2,
            alignLabelWithHint: alignLabelWithHint,
            isDense: true,
            counterStyle: counterStyle,
            prefixIcon: prefixIcon,
            prefixIconConstraints: prefixIconConstraints,
            suffixIcon: suffixIcon,
            suffixIconConstraints: suffixIconConstraints,
            contentPadding: contentPadding,
            counterText: (showCounter ?? false) ? counterText : '',
            filled: filled,
            fillColor: fillColor,
            hintText: hintText,
            hintMaxLines: hintMaxLines,
            hintStyle: hintTextStyle ??
                VerifikText.style().copyWith(
                  color: VerifikColors.silver,
                ),
            border: OutlineInputBorder(
              borderRadius:
                  borderRadius ?? const BorderRadius.all(Radius.circular(10.0)),
              borderSide: const BorderSide(
                color: VerifikColors.primaryColor,
              ),
            ),
            focusedBorder: focusedBorder ??
                OutlineInputBorder(
                  borderRadius: borderRadius ??
                      const BorderRadius.all(Radius.circular(10.0)),
                  borderSide: const BorderSide(
                    color: VerifikColors.primaryColor,
                  ),
                ),
            enabledBorder: enabledBorder ??
                OutlineInputBorder(
                  borderRadius: borderRadius ??
                      const BorderRadius.all(Radius.circular(10.0)),
                  borderSide: const BorderSide(
                    color: VerifikColors.whiteSecundary,
                  ),
                ),
            disabledBorder: disabledBorder,
            errorBorder: errorBorder ??
                OutlineInputBorder(
                  borderRadius: borderRadius ??
                      const BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                  borderSide: const BorderSide(
                    color: VerifikColors.dangerColor,
                  ),
                ),
            focusedErrorBorder: focusedErrorBorder,
            labelStyle: labelTextStyle ??
                TextStyle(
                  fontFamily: VerifikTypography.inter,
                  color: Theme.of(context).textSelectionTheme.selectionColor,
                  fontSize: VerifikSpacing.md,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
            errorStyle: errorStyle ??
                VerifikText.style(
                  color: VerifikColors.dangerColor,
                  fontSize: VerifikTypography.verifikSmall,
                  fontWeight: FontWeight.w400,
                ),
          ),
        ),
      ],
    );
  }
}

class _TextFieldTitle extends StatelessWidget {
  const _TextFieldTitle({
    required this.title,
    this.titleStyle,
    this.errorText,
    this.isRequired,
    this.toolTipRequiredOptionalText,
  });

  final String title;
  final TextStyle? titleStyle;
  final String? errorText;
  final bool? isRequired;
  final String? toolTipRequiredOptionalText;

  Color titleColor() =>
      errorText != null ? VerifikColors.dangerColor : VerifikColors.sonicSilver;

  TextSpan getSpamRequired() {
    return isRequired!
        ? TextSpan(
            text: toolTipRequiredOptionalText ?? '',
            style: const TextStyle(color: VerifikColors.dangerColor),
          )
        : TextSpan(
            text: toolTipRequiredOptionalText ?? '',
            style: const TextStyle(fontStyle: FontStyle.italic),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: VerifikSpacing.xs,
      ),
      child: Row(
        children: [
          Flexible(
            child: RichText(
              text: TextSpan(
                text: title,
                style: titleStyle ??
                    TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: VerifikTypography.medium,
                      fontFamily: VerifikTypography.inter,
                      color: titleColor(),
                    ),
                children: [
                  const TextSpan(text: ' '),
                  if (isRequired != null) getSpamRequired(),
                ],
              ),
            ),
          ),
          if (errorText != null)
            SvgPicture.asset(
              R5UiValues.worldSvg,
              colorFilter: const ColorFilter.mode(
                VerifikColors.dangerColor,
                BlendMode.srcIn,
              ),
            ),
        ],
      ),
    );
  }
}
