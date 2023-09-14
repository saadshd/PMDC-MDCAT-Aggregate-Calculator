import 'package:flutter/material.dart';
import 'package:merit_calculator/utils/college_list.dart';
import 'package:merit_calculator/view/components/info_tile.dart';

class PreviousMeritScreen extends StatelessWidget {
  const PreviousMeritScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Previous Closing Merits'),
        ),
        body: Column(
          children: [
            InfoTile(info: 'As per UHS Final Closing Merit List 2022'),
            Expanded(
              child: ListView.builder(
                itemCount: collegeList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                    ),
                    title: Text(collegeList[index].name),
                    subtitle:
                        Text('Closing Merit: ${collegeList[index].merit} %'),
                  );
                },
              ),
            ),
          ],
        ),
    );
  }
}
