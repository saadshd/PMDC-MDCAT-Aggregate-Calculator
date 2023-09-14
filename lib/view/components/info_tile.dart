import 'package:flutter/material.dart';
import 'package:merit_calculator/utils/app_color.dart';

class InfoTile extends StatelessWidget {
  String info;

  InfoTile({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.tileColor,
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                color: Colors.red.shade700,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Icon(
                    Icons.error,
                    color: AppColor.tileColor,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                info,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
