import 'package:flutter/material.dart';
import 'package:secure_notes_app/styles.dart';


class LoadingIndicator extends StatelessWidget {
  final Color color;
  
  const LoadingIndicator({
    Key? key,
    this.color = AppStyles.mainColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation<Color>(color),
  );
}