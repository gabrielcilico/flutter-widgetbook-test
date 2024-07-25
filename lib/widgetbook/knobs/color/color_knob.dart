import 'package:flutter/material.dart';
import 'package:flutter_widgetbook_test/widgetbook/knobs/custom_fields/color_picker_field.dart';
import 'package:widgetbook/widgetbook.dart';

class ColorKnob extends Knob<Color> {
  ColorKnob({
    required super.label,
    required super.initialValue,
  });

  @override
  List<Field> get fields => [
        ColorPickerField(
          name: label,
          initialValue: initialValue,
        ),
      ];

  @override
  Color valueFromQueryGroup(Map<String, String> group) {
    final String? value = group[label];
    if (value == null) {
      return initialValue;
    }
    return Color(int.parse(
      value.length == 6 ? '00$value' : value,
      radix: 16,
    ));
  }
}
