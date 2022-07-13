import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:secure_notes_app/styles.dart';

class AppTextField extends StatelessWidget {
  final String labelText;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final String? initialValue;
  final bool isReadOnly;
  final TextEditingController? controller;
  final bool mandatory;
  final Function(String value)? onSaved;
  final int? maxLength;
  final TextInputFormatter? formatter;
  final String? prefix;
  final String? hint;
  final Function(String?)? onChanged;
  final Function(String value)? onFieldSubmitted;
  final String? Function(String)? validator;
  final String? helperText;
  final int? maxLines;

  const AppTextField({
    Key? key,
    required this.labelText,
    this.keyboardType,
    this.focusNode,
    this.initialValue,
    this.isReadOnly = false,
    this.controller,
    this.mandatory = false,
    this.onSaved,
    this.maxLength,
    this.formatter,
    this.prefix,
    this.hint,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    this.helperText,
    this.maxLines,
  }) : super(key: key);


  
  @override
  Widget build(BuildContext context) => SizedBox(
    width: 300,
    child: TextFormField(
      keyboardType: keyboardType,
      focusNode: focusNode,
      cursorColor: AppStyles.mainColor,
      controller: controller,
      inputFormatters: formatter != null ? [formatter!] : [],
      autocorrect: false,  
      readOnly: isReadOnly,
      initialValue: initialValue,
      minLines: 1,
      maxLines: maxLines,
      textInputAction: TextInputAction.done,
      style: const TextStyle(
        color: AppStyles.mainTextColor
      ),
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      maxLength: maxLength,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide:  BorderSide(color: Colors.grey.withOpacity(0.6), width: 1),
          borderRadius: BorderRadius.circular(8)
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1)
        ),
        alignLabelWithHint: true,
        filled: true,
        isDense: true,
        fillColor: isReadOnly ? Colors.grey.shade300 : AppStyles.mainColor.withOpacity(0.03),
        labelText: mandatory ? '$labelText *' : labelText,
        floatingLabelStyle: AppStyles.labelTextStyle,
        prefixText: prefix,
        hintText: hint,
        helperText: helperText,
        labelStyle: const TextStyle(
          color: AppStyles.mainTextColor
        ),
        hintStyle: const TextStyle(
          color: AppStyles.mainTextColor
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8)
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:  BorderSide(color: Colors.grey.withOpacity(0.6), width: 1),
          borderRadius: BorderRadius.circular(8)
        )
      ),
      validator: (value) {
        if (mandatory && (value?.isEmpty ?? true)) {
          return 'Поле обязательное для заполнения';
        }
        return validator?.call(value!);
      },
      onSaved: (value) => onSaved?.call(value!),
    ),
  );
}
