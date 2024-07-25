import 'package:flutter/material.dart';
import 'package:flutter_widgetbook_test/design/palette.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final double fontSize;
  final bool primary;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.fontSize = 16,
    this.primary = true,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
            primary ? Palette.primary : Palette.secondary),
      ),
      child: Text(text,
          style: TextStyle(
            color: Palette.white,
            fontSize: fontSize,
          )),
    );
  }
}

@widgetbook.UseCase(
  name: 'Custom Button Primary',
  type: CustomButton,
)
CustomButton customButtonPrimaryUseCase(BuildContext context) {
  return CustomButton(
    text: 'Custom Button Primary',
    primary: true,
    onPressed: () {},
  );
}

@widgetbook.UseCase(
  name: 'Custom Button Secondary',
  type: CustomButton,
)
CustomButton customButtonSecondaryUseCase(BuildContext context) {
  return CustomButton(
    text: 'Custom Button Secondary',
    primary: false,
    onPressed: () {},
  );
}
