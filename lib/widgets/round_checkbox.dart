import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RoundCheckBox extends StatefulWidget {
  bool value;
  double size;
  final Function(bool)? onChanged;

  RoundCheckBox({Key? key, 
    required this.value,
    this.size = 16,
    this.onChanged,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RoundCheckBoxState createState() => _RoundCheckBoxState();
}

class _RoundCheckBoxState extends State<RoundCheckBox> {
  @override
  Widget build(BuildContext context) => GestureDetector(
    behavior: HitTestBehavior.translucent,
    //splashRadius: 1,
    onTap: () => _onTap(!widget.value),
    child: widget.value? Icon(Icons.check_circle_outline, size: widget.size, color: Colors.blue) 
    : Icon(Icons.radio_button_unchecked, size: widget.size, color: Colors.blue)
  );
  void _onTap(bool value) {
    setState(() {
      widget.value = value;
    });
    widget.onChanged?.call(value);
  }
}