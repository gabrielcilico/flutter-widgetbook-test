// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_widgetbook_test/design/widgets/buttons/custom_button.dart'
    as _i2;
import 'package:flutter_widgetbook_test/design/widgets/buttons/custom_icon_button.dart'
    as _i3;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'design',
    children: [
      _i1.WidgetbookFolder(
        name: 'widgets',
        children: [
          _i1.WidgetbookFolder(
            name: 'buttons',
            children: [
              _i1.WidgetbookLeafComponent(
                name: 'CustomButton',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Custom Button',
                  builder: _i2.customButtonUseCase,
                ),
              ),
              _i1.WidgetbookLeafComponent(
                name: 'CustomIconButton',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Custom Icon Button',
                  builder: _i3.customIconButtonUseCase,
                ),
              ),
            ],
          )
        ],
      )
    ],
  )
];
