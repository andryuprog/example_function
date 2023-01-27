import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String? text;
  final Color? fillColor;
  final Color? textColor;
  final double? textSize;
  final VoidCallback? callback;

  const CalculatorButton({
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
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 0.5,
          color: Colors.white,
        ),
      ),
      margin: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 70,
        height: 70,
        child: MaterialButton(
            highlightColor: Colors.deepPurpleAccent,
            splashColor: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              text!,
              style: TextStyle(
                fontSize: textSize,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Colors.red;
              callback!();
            }),
      ),
    );
  }
}
