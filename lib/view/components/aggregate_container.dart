import 'package:flutter/material.dart';
import 'package:merit_calculator/utils/app_color.dart';
import 'package:merit_calculator/view/components/reuseable_row.dart';

class AggregateContainer extends StatelessWidget {

  String matric, fsc, mdcat, totalAggregate;

  AggregateContainer({super.key,
    required this.matric,
    required this.fsc,
    required this.mdcat,
    required this.totalAggregate });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 221,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColor.primaryColor, // Border color
          width: 2.0,         // Border width
        ),
      ),
      child: Column(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: 50,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Text('Aggregate',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          const SizedBox(height: 5,),
          ReuseableRow(title: 'MATRIC', value: matric),
          const Divider(),
          ReuseableRow(title: 'FSC', value: fsc),
          const Divider(),
          ReuseableRow(title: 'MDCAT', value: mdcat),
          const SizedBox(height: 5,),
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: 50,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('TOTAL',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(totalAggregate,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
