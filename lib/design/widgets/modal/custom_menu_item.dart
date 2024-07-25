import 'package:flutter/material.dart';
import 'package:flutter_widgetbook_test/design/palette.dart';
import 'package:flutter_widgetbook_test/widgetbook/knobs/color/color_knob_builder_extension.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class CustomMenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onTap;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;

  const CustomMenuItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.backgroundColor = Palette.secondary,
    this.textColor = Palette.white,
    this.iconColor = Palette.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: textColor),
        ),
        leading: Icon(icon, color: iconColor),
        onTap: () => onTap(),
      ),
    );
  }
}

@widgetbook.UseCase(
  name: 'Custom Menu Item',
  type: CustomMenuItem,
)
Widget customMenuItemUseCase(BuildContext context) {
  return Center(
    child: SizedBox(
      width: 256,
      child: CustomMenuItem(
        title: context.knobs.string(label: 'Title', initialValue: 'Menu Item'),
        icon: context.knobs.list(
            label: 'Icon',
            options: [
              Icons.add,
              Icons.remove,
              Icons.edit,
              Icons.delete,
              Icons.notifications,
              Icons.notifications_active,
            ],
            labelBuilder: (icon) => icon.toString()),
        backgroundColor: context.knobs.colorPicker(
            label: 'Background Color', initialValue: Palette.secondary),
        textColor: context.knobs
            .colorPicker(label: 'Text Color', initialValue: Palette.white),
        iconColor: context.knobs
            .colorPicker(label: 'Icon Color', initialValue: Palette.primary),
        onTap: () {},
      ),
    ),
  );
}
