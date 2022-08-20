import "package:flutter/material.dart";

class CustomButton extends StatelessWidget {
  final void Function() onPressed;

  const CustomButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(Icons.add_box),
    );
  }
}
