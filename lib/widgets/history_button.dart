import 'package:flutter/material.dart';

class HistoryButton extends StatelessWidget {
  final String? text;
  final Color? fillColor;
  final Color? textColor;
  final double? textSize;
  final VoidCallback? callback;

  const HistoryButton({
    super.key,
    this.text,
    this.fillColor,
    this.textColor,
    this.textSize,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
      width: double.infinity,
      height: 50,
      child: MaterialButton(
        highlightColor: Colors.deepPurpleAccent,
        splashColor: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: const BorderSide(
            width: 0.5,
            color: Colors.white,
          ),
        ),
        onPressed: callback,
        child: Text(
          text!,
          style: TextStyle(
            letterSpacing: 20.0,
            fontSize: textSize,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
