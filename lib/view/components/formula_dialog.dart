import 'package:flutter/material.dart';
import 'package:merit_calculator/view/components/reuseable_row.dart';

Future<dynamic> buildFormulaDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('PMDC Aggregate Formula'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ReuseableRow(title: 'MATRIC', value: '10%'),
              ReuseableRow(title: 'FSC', value: '40%'),
              ReuseableRow(title: 'MDCAT', value: '50%'),
              const SizedBox(height: 10,),
              const Divider(),
              const Text('Aggregate = [(Matric*10)/1100] + [(FSc*40)/100] + [(MDCAT Score*50)/200]'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            )
          ],
        );
      }
  );
}