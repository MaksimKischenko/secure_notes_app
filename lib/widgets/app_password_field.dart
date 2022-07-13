import 'package:flutter/material.dart';

import 'package:secure_notes_app/styles.dart';

class AppPasswordField extends StatefulWidget {
  final String labelText;
  final String? initialValue;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function(String value)? onSaved;
  final String? Function(String)? validator;
  final Function(String value)? onChanged;
  final Function(String value)? onFieldSubmitted;

  
  const AppPasswordField({
    Key? key,
    required this.labelText,
    this.initialValue,
    this.controller,
    this.focusNode,
    this.onSaved,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AppPasswordFieldState createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {

  bool _passwordHidden = true;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: 300,
    child: TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      autocorrect: false,  
      obscureText:_passwordHidden,
      cursorColor: AppStyles.mainColor,
      initialValue: widget.initialValue,
      textInputAction: TextInputAction.done,
      style: const TextStyle(
        color: AppStyles.mainTextColor
      ),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide:  BorderSide(color: Colors.grey.withOpacity(0.6), width: 1),
          borderRadius: BorderRadius.circular(8)
        ),
        suffixIcon: IconButton(
          onPressed: () => setState(() => _passwordHidden = !_passwordHidden),
          icon: Icon(
            _passwordHidden ? Icons.visibility : Icons.visibility_off,
            size: 20,
            color: Colors.grey.withOpacity(0.6)
          ),
        ),
        alignLabelWithHint: true,
        filled: true,
        isDense: true,
        fillColor: AppStyles.mainColor.withOpacity(0.03),
        labelText: widget.labelText,
        floatingLabelStyle: AppStyles.labelTextStyle,
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
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1)
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:  BorderSide(color: Colors.grey.withOpacity(0.6), width: 1),
          borderRadius: BorderRadius.circular(8)
        )
      ),
      validator: (value) => widget.validator?.call(value!),
      onSaved: (value) => widget.onSaved?.call(value!),
      onChanged: (value) => widget.onChanged?.call(value),
      onFieldSubmitted: (value) => widget.onFieldSubmitted?.call(value),
    ),
  );
}