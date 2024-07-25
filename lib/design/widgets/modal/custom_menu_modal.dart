import 'package:flutter/material.dart';
import 'package:flutter_widgetbook_test/design/widgets/buttons/custom_button.dart';
import 'package:flutter_widgetbook_test/design/widgets/modal/custom_menu_item.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class CustomMenuModal extends StatelessWidget {
  final List<CustomMenuItem> items;
  final Function(CustomMenuItem) onItemTap;

  const CustomMenuModal(
      {super.key, required this.items, required this.onItemTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index].title),
            onTap: () {
              onItemTap(items[index]);
            },
          );
        },
      ),
    );
  }
}

@widgetbook.UseCase(
  name: 'Custom Menu Modal',
  type: CustomMenuModal,
)
Widget customMenuModalUseCase(BuildContext context) {
  return Center(
    child: CustomButton(
      text: 'Open Menu',
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return SizedBox(
              width: 128,
              child: CustomMenuModal(
                items: [
                  CustomMenuItem(
                    title: 'Item 1',
                    icon: Icons.add,
                    onTap: () {},
                  ),
                  CustomMenuItem(
                    title: 'Item 2',
                    icon: Icons.remove,
                    onTap: () {},
                  ),
                  CustomMenuItem(
                    title: 'Item 3',
                    icon: Icons.edit,
                    onTap: () {},
                  ),
                ],
                onItemTap: (item) {
                  item.onTap();
                  Navigator.of(context).pop();
                },
              ),
            );
          },
        );
      },
    ),
  );
}
