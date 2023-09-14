import 'package:flutter/material.dart';
import 'package:merit_calculator/provider/aggregate_provider.dart';
import 'package:merit_calculator/utils/utils.dart';
import 'package:merit_calculator/view/components/info_tile.dart';
import 'package:provider/provider.dart';

class FilteredCollegesScreen extends StatelessWidget {
  const FilteredCollegesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final aggregateProvider = Provider.of<AggregateProvider>(context);
    final filteredColleges =
        Utils.getCollegesByAggregate(aggregateProvider.totalAggregate);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Your Colleges'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (filteredColleges.isNotEmpty)
            Expanded(
              child: Column(
                children: [
                  InfoTile(
                    info:
                        'These colleges are shown after comparing your current aggregate with last year closing merit. Its just an estimation for comparison with last year.',
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: filteredColleges.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: CircleAvatar(
                            child: Text('${index + 1}'),
                          ),
                          title: Text(filteredColleges[index].name),
                          subtitle:
                              Text("Merit: ${filteredColleges[index].merit}"),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          else
            Center(
              child: Text(
                  'No colleges found for this aggregate. \nKeep working hard.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium
              ),
            ),
        ],
      ),
    );
  }
}
