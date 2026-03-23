import 'package:flutter/material.dart';
import 'package:basecode_simplify_riverpod/resources/resources.dart';

///  default button on this project with primary color
///  change it as needed
class PrimaryButton extends StatelessWidget {
  /// first option to use widget inside the button
  final Widget? child;

  /// Display text in button.
  final String? text;

  /// action function when button is onClick
  final void Function() onPressed;

  /// the option to change button color
  final Gradient? gradient;

  /// the width of the button.
  final double width;

  /// the height of the button.
  final double? height;

  /// wether the button is can be clicked or not
  final bool enabled;

  /// for reversing only the color of the button including text if the code is using [title]
  final bool reverse;

  /// Background color of button. Default value is primary color.
  final Color? color;

  /// Border radius of the button
  final BorderRadiusGeometry? borderRadius;

  /// The radius of the button shape.
  final double radiusValue;

  /// Width of the border
  final double? borderWidth;

  /// Text color of button, default value is white.
  final Color? borderColor;

  /// Elevation value of button.
  final double elevation;

  /// Leading icon inside button.
  final IconData? icon;

  /// Text color of leading icon, default value is white.
  final Color? iconColor;

  /// Leading icon with Widget
  final Widget? leading;

  /// Text color of button, default value is white.
  final Color? textColor;

  /// The style of text button.
  final TextStyle? textStyle;

  /// The size of text button.
  final double? fontSize;

  /// Font weight text and icon inside button.
  final FontWeight? fontWeight;

  final EdgeInsetsGeometry? margin;

  final EdgeInsetsGeometry? padding;

  /// The button width will follow the content
  final bool wrapContent;

  /// The label box fit.
  final BoxFit? boxFit;

  const PrimaryButton({
    super.key,
    this.child,
    required this.text,
    required this.onPressed,
    this.gradient,
    this.width = double.infinity,
    this.height = 48,
    this.borderRadius,
    this.radiusValue = 100,
    this.borderWidth,
    this.borderColor,
    this.elevation = 0,
    this.icon,
    this.iconColor,
    this.leading,
    this.enabled = true,
    this.reverse = false,
    this.color,
    this.textColor,
    this.textStyle,
    this.fontSize,
    this.fontWeight,
    this.margin,
    this.padding,
    this.wrapContent = false,
    this.boxFit,
  });

  const PrimaryButton.icon({
    super.key,
    required this.child,
    this.text,
    required this.onPressed,
    this.gradient,
    this.width = double.infinity,
    this.height = 48,
    this.borderRadius,
    this.radiusValue = 12,
    this.borderWidth,
    this.borderColor,
    this.elevation = 0,
    this.icon,
    this.iconColor,
    this.leading,
    this.enabled = true,
    this.reverse = false,
    this.color,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.margin,
    this.padding,
    this.wrapContent = false, 
    this.textStyle,
    this.boxFit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (wrapContent) ? null : width,
      height: (wrapContent) ? null : height,
      margin: margin,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius ?? BorderRadius.circular(radiusValue),
      ),
      child: ElevatedButton.icon(
        icon: Visibility(
          visible: (leading != null || icon != null),
          child: leading ??
              Icon(
                icon,
                color: iconColor ??
                    ((reverse) ? color ?? AppColors.primary : Colors.white),
              ),
        ),
        onPressed: (enabled) ? onPressed : null,
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          backgroundColor: gradient != null
              ? Colors.transparent
              : (reverse)
                  ? Colors.transparent
                  : color,
          disabledBackgroundColor: AppColors.neutral30,
          shadowColor: reverse ? Colors.transparent : null,
          padding: (icon != null || leading != null)
              ? const EdgeInsets.symmetric(horizontal: 10, vertical: 10)
              : const EdgeInsets.fromLTRB(0, 10, 10, 10),
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(radiusValue),
            side: BorderSide(
              color: enabled
                  ? (reverse)
                      ? borderColor ?? color ?? AppColors.primary
                      : borderColor ?? Colors.transparent
                  : AppColors.neutral40,
              width: borderWidth ?? 1.5,
              style: BorderStyle.solid,
            ),
          ),
        ),
        label: Container(
          padding: padding,
          child: FittedBox(
            fit: boxFit ?? BoxFit.scaleDown,
            child: child ??
                Text(
                  text ?? '',
                  textAlign: TextAlign.center,
                  style: (textStyle ?? Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: fontSize,
                        fontWeight: fontWeight ?? FontWeight.w400,
                        color: (!enabled)
                            ? AppColors.neutral60
                            : textColor ??
                                (reverse
                                    ? color ?? AppColors.primary
                                    : AppColors.neutral10),
                      )),
                ),
          ),
        ),
      ),
    );
  }
}
