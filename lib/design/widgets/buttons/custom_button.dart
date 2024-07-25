import 'package:flutter/material.dart';
import 'package:flutter_widgetbook_test/design/palette.dart';
import 'package:flutter_widgetbook_test/widgetbook/knobs/color/color_knob_builder_extension.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final double fontSize;
  final Color color;
  final BorderRadius borderRadius;
  final FontWeight fontWeight;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.fontSize = 16,
    this.color = Palette.primary,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.fontWeight = FontWeight.bold,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(color),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
      ),
      child: Text(text,
          style: TextStyle(
            color: Palette.white,
            fontSize: fontSize,
            overflow: TextOverflow.ellipsis,
            fontWeight: fontWeight,
          )),
    );
  }
}

@widgetbook.UseCase(
  name: 'Custom Button',
  type: CustomButton,
)
Center customButtonUseCase(BuildContext context) {
  return Center(
    child: CustomButton(
      text: context.knobs.string(label: 'Text', initialValue: 'Primary Button'),
      color: context.knobs.colorPicker(
          label: 'Background Color', initialValue: Palette.primary),
      fontWeight: context.knobs.list(
          label: 'Font Weight',
          options: FontWeight.values,
          initialOption: FontWeight.bold,
          labelBuilder: (value) => '${value.value}'),
      fontSize: context.knobs.double
          .slider(label: 'Font Size', initialValue: 16, min: 8, max: 72),
      borderRadius: BorderRadius.circular(context.knobs.double
          .slider(label: 'Border Radius', initialValue: 16, min: 0, max: 128)),
      onPressed: () {},
    ),
  );
}
