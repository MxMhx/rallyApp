import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget(
      {super.key,
      required this.title,
      required this.border,
      required this.onPressed});
  String title;
  bool border;
  void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(!border
              ? Theme.of(context).secondaryHeaderColor
              : Theme.of(context).primaryColor),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          ),
          side: border
              ? MaterialStateProperty.all<BorderSide>(
                  BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Set the border color
                    width: 2.0, // Set the border width
                  ),
                )
              : null,
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        child: Text(title,
            style: !border
                ? Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Theme.of(context).primaryColor)
                : Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Theme.of(context).secondaryHeaderColor)),
      ),
    );
  }
}
