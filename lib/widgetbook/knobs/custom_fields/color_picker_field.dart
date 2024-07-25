import 'package:flutter/material.dart';
import 'package:flutter_widgetbook_test/design/palette.dart';
import 'package:widgetbook/widgetbook.dart';

class ColorPickerField extends Field<Color> {
  ColorPickerField({
    required super.name,
    required super.initialValue,
  }) : super(
          type: FieldType.color,
          codec: FieldCodec(
            toParam: (color) => color.value.toRadixString(16),
            toValue: (param) {
              if (param == null) return null;
              if (param == '0') return Colors.transparent;
              return Color(
                int.parse(
                  param.length == 6 ? '00$param' : param,
                  radix: 16,
                ),
              );
            },
          ),
        );

  final TextEditingController hexController = TextEditingController();
  final TextEditingController alphaController = TextEditingController();
  final TextEditingController redController = TextEditingController();
  final TextEditingController greenController = TextEditingController();
  final TextEditingController blueController = TextEditingController();

  Color selectBorderColor(Color color) =>
      color.computeLuminance() > 0.5 ? Colors.black : Colors.white;

  @override
  Widget toWidget(BuildContext context, String group, Color? value) {
    hexController.text = value?.value.toRadixString(16).substring(2) ?? '';
    alphaController.text = value?.alpha.toString() ?? '';
    redController.text = value?.red.toString() ?? '';
    greenController.text = value?.green.toString() ?? '';
    blueController.text = value?.blue.toString() ?? '';

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildPresetsColors(context, group, value),
        const SizedBox(height: 8),
        const Divider(),
        const SizedBox(height: 8),
        _buildPreviewColor(value),
        const SizedBox(height: 16),
        _hexFormField(context, group),
        const SizedBox(height: 8),
        _argbFormFields(context, group, value),
        const SizedBox(height: 8),
        _buildChannelSlider('A', value?.alpha ?? 0, (v) {
          updateField(
            context,
            group,
            Color.fromARGB(
              v.toInt(),
              value!.red,
              value.green,
              value.blue,
            ),
          );
        }),
        const SizedBox(height: 8),
        _buildChannelSlider('R', value?.red ?? 0, (v) {
          updateField(
            context,
            group,
            Color.fromARGB(
              value!.alpha,
              v.toInt(),
              value.green,
              value.blue,
            ),
          );
        }),
        const SizedBox(height: 8),
        _buildChannelSlider('G', value?.green ?? 0, (v) {
          updateField(
            context,
            group,
            Color.fromARGB(
              value!.alpha,
              value.red,
              v.toInt(),
              value.blue,
            ),
          );
        }),
        const SizedBox(height: 8),
        _buildChannelSlider('B', value?.blue ?? 0, (v) {
          updateField(
            context,
            group,
            Color.fromARGB(
              value!.alpha,
              value.red,
              value.green,
              v.toInt(),
            ),
          );
        }),
      ],
    );
  }

  Wrap buildPresetsColors(BuildContext context, String group, Color? value) {
    return Wrap(
      children: Palette.allColors.map((color) {
        return GestureDetector(
          onTap: () => updateField(context, group, color),
          child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: color,
                border: Border.all(
                  color: value == color ? selectBorderColor(color) : color,
                  width: 2,
                ),
              ),
              child: value == color
                  ? Icon(
                      Icons.check,
                      color: selectBorderColor(color),
                    )
                  : null),
        );
      }).toList(),
    );
  }

  Row _buildChannelSlider(
      String label, int value, void Function(double) onChanged) {
    return Row(
      children: [
        Text(label),
        Expanded(
          child: Slider(
              value: value.toDouble(), min: 0, max: 255, onChanged: onChanged),
        ),
      ],
    );
  }

  TextFormField _hexFormField(BuildContext context, String group) {
    return TextFormField(
      controller: hexController,
      onChanged: (value) {
        updateField(
          context,
          group,
          Color(
            int.parse(
              value.length == 6 ? '00$value' : value,
              radix: 16,
            ),
          ),
        );
      },
      decoration: const InputDecoration(
        labelText: 'HEX',
        border: OutlineInputBorder(),
      ),
    );
  }

  Row _buildPreviewColor(Color? value) {
    return Row(
      children: [
        Expanded(
            child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            border: Border.all(
              color: value ?? Colors.transparent,
              width: 2,
            ),
          ),
          child: Container(
            color: value,
            height: 16,
          ),
        )),
      ],
    );
  }

  Row _argbFormFields(BuildContext context, String group, Color? value) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: alphaController,
            onChanged: (v) {
              updateField(
                context,
                group,
                Color.fromARGB(
                  int.parse(v),
                  value!.red,
                  value.green,
                  value.blue,
                ),
              );
            },
            decoration: const InputDecoration(
              labelText: 'A',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: TextFormField(
            controller: redController,
            onChanged: (v) {
              updateField(
                context,
                group,
                Color.fromARGB(
                  value!.alpha,
                  int.parse(v),
                  value.green,
                  value.blue,
                ),
              );
            },
            decoration: const InputDecoration(
              labelText: 'R',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: TextFormField(
            controller: greenController,
            onChanged: (v) {
              updateField(
                context,
                group,
                Color.fromARGB(
                  value!.alpha,
                  value.red,
                  int.parse(v),
                  value.blue,
                ),
              );
            },
            decoration: const InputDecoration(
              labelText: 'G',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: TextFormField(
            controller: blueController,
            onChanged: (v) {
              updateField(
                context,
                group,
                Color.fromARGB(
                  value!.alpha,
                  value.red,
                  value.green,
                  int.parse(v),
                ),
              );
            },
            decoration: const InputDecoration(
              labelText: 'B',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
