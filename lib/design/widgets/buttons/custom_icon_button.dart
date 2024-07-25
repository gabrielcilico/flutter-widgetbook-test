import 'package:flutter/material.dart';
import 'package:flutter_widgetbook_test/design/palette.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final double iconSize;
  final Color color;
  final BorderRadius borderRadius;
  final Color iconColor;

  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.iconSize = 24,
    this.color = Palette.tertiary,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.iconColor = Palette.white,
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
      child: Icon(
        icon,
        size: iconSize,
        color: iconColor,
      ),
    );
  }
}

@widgetbook.UseCase(
  name: 'Custom Icon Button',
  type: CustomIconButton,
)
Widget customIconButtonUseCase(BuildContext context) {
  return Center(
    child: CustomIconButton(
      icon: context.knobs.list(label: 'Icon', options: [
        Icons.add,
        Icons.remove,
        Icons.edit,
        Icons.delete,
        Icons.notifications,
        Icons.notifications_active,
      ]),
      iconSize: context.knobs.double
          .slider(label: 'Icon Size', initialValue: 24, min: 8, max: 48),
      color:
          context.knobs.color(label: 'Color', initialValue: Palette.tertiary),
      iconColor:
          context.knobs.color(label: 'Icon Color', initialValue: Palette.white),
      onPressed: () {},
    ),
  );
}
