import 'package:flutter/material.dart';
import 'package:flutter_widgetbook_test/widgetbook/knobs/color/color_knob.dart';
import 'package:widgetbook/widgetbook.dart';

extension ColorKnobBuilderExtension on KnobsBuilder {
  Color colorPicker({
    required String label,
    Color initialValue = Colors.white,
  }) =>
      onKnobAdded(ColorKnob(label: label, initialValue: initialValue))!;
}
