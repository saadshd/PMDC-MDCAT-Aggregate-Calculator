import 'package:flutter/material.dart';
import 'package:merit_calculator/view/components/formula_dialog.dart';
import 'package:merit_calculator/view/previous_merit_screen.dart';

class MyPopupMenuButton extends StatelessWidget {
  const MyPopupMenuButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      offset: const Offset(0, 50),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
      ),
      onSelected: (selectedValue) {
        switch (selectedValue) {
          case 0:
            buildFormulaDialog(context);
            break;
          case 1:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const PreviousMeritScreen()));
            break;
        }
      },
      itemBuilder: (context) => [
        const PopupMenuItem(
            value: 0,
            child: Text('Aggregate Formula')),
        const PopupMenuItem(
            value: 1,
            child: Text('Previous Closing Merit')),
      ],
    );
  }
}