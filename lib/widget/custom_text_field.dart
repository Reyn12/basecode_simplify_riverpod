import 'package:flutter/material.dart';

/// Custom text field minimal untuk basecode.
/// Menghindari dependensi dari project lain (get, flutter_form_builder, dll).
class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.name,
    required this.hint,
    this.label,
    this.labelHelper,
    this.initialValue,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.action = TextInputAction.next,
    this.minLine = 1,
    this.maxLine,
    this.maxLength,
    this.isRequired = false,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.enabled = true,
    this.readOnly = false,
    this.isPassword = false,
    this.isObscure = true,
    this.prefix,
    this.prefixText,
    this.prefixIcon,
    this.suffix,
    this.suffixIcon,
  });

  final String name;
  final String hint;

  final String? label;
  final String? labelHelper;
  final String? initialValue;
  final TextEditingController? controller;

  final TextInputType keyboardType;
  final TextInputAction action;

  final int minLine;
  final int? maxLine;
  final int? maxLength;

  final bool isRequired;

  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSubmitted;

  final bool enabled;
  final bool readOnly;

  final bool isPassword;
  final bool isObscure;

  final Widget? prefix;
  final String? prefixText;
  final Widget? prefixIcon;
  final Widget? suffix;
  final Widget? suffixIcon;

  factory CustomTextField.dropdown({
    required String name,
    required String label,
    String? labelHelper,
    required String hint,
    String? initialValue,
    TextEditingController? controller,
    String? Function(String?)? validator,
    void Function(String?)? onChanged,
  }) {
    return CustomTextField(
      name: name,
      label: label,
      labelHelper: labelHelper,
      hint: hint,
      initialValue: initialValue,
      controller: controller,
      readOnly: true,
      validator: validator,
      onChanged: onChanged,
      suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded),
    );
  }

  factory CustomTextField.password({
    required String name,
    required String hint,
    String? label,
    String? labelHelper,
    String? initialValue,
    TextEditingController? controller,
    bool isObscure = true,
    bool isRequired = false,
    String? Function(String?)? validator,
    void Function(String?)? onChanged,
    void Function(String?)? onSubmitted,
  }) {
    return CustomTextField(
      name: name,
      label: label,
      labelHelper: labelHelper,
      hint: hint,
      initialValue: initialValue,
      controller: controller,
      isPassword: true,
      isObscure: isObscure,
      isRequired: isRequired,
      validator: validator,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
    );
  }

  factory CustomTextField.multiline({
    required String name,
    required String hint,
    String? label,
    String? initialValue,
    TextEditingController? controller,
    int minLine = 3,
    int maxLine = 5,
    bool isRequired = false,
    String? Function(String?)? validator,
    void Function(String?)? onChanged,
  }) {
    return CustomTextField(
      name: name,
      label: label,
      hint: hint,
      initialValue: initialValue,
      controller: controller,
      minLine: minLine,
      maxLine: maxLine,
      isRequired: isRequired,
      validator: validator,
      onChanged: onChanged,
      keyboardType: TextInputType.multiline,
    );
  }

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool obscure = widget.isPassword ? widget.isObscure : false;

  @override
  Widget build(BuildContext context) {
    final showObscureToggle = widget.isPassword;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          if (widget.labelHelper != null) ...[
            const SizedBox(height: 4),
            Text(
              widget.labelHelper!,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).hintColor,
                  ),
            ),
          ],
          const SizedBox(height: 8),
        ],
        TextFormField(
          key: ValueKey(widget.name),
          controller: widget.controller,
          initialValue: widget.controller == null ? widget.initialValue : null,
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          keyboardType: widget.keyboardType,
          textInputAction: widget.action,
          maxLength: widget.maxLength,
          minLines: widget.isPassword ? 1 : widget.minLine,
          maxLines: widget.isPassword ? 1 : widget.maxLine,
          obscureText: widget.isPassword ? obscure : false,
          decoration: InputDecoration(
            hintText: widget.hint,
            prefixIcon: widget.prefixIcon,
            prefix: widget.prefix,
            suffix: widget.suffix,
            suffixIcon: widget.suffixIcon ??
                (showObscureToggle
                    ? IconButton(
                        onPressed: () => setState(() => obscure = !obscure),
                        icon: Icon(
                          obscure ? Icons.visibility_off : Icons.visibility,
                        ),
                      )
                    : null),
          ),
          validator: (value) {
            if (widget.isRequired &&
                (value == null || value.trim().isEmpty)) {
              return 'Wajib diisi';
            }
            return widget.validator?.call(value);
          },
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onSubmitted,
        ),
      ],
    );
  }
}
