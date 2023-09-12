import 'package:flutter/material.dart';
import 'package:merit_calculator/provider/aggregate_provider.dart';
import 'package:merit_calculator/view/components/aggregate_container.dart';
import 'package:merit_calculator/view/filtered_colleges_screen.dart';
import 'package:merit_calculator/view/components/popup_menu_button.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('PMDC Aggregate Calculator'),
        actions: const [
          MyPopupMenuButton(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Consumer<AggregateProvider>(builder: (context, aggregateProvider, child){
            return Form(
              key: aggregateProvider.formKey,
              child: Column(
                children: [
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: aggregateProvider.matricController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'MATRIC Marks',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      suffixText: '/1100',
                    ),
                    onChanged: (value) {
                      aggregateProvider.updateMatric();
                    },
                    validator: (value) {
                      if(value!.isEmpty){
                        return ('Please enter MATRIC marks');
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: aggregateProvider.fscController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'FSC Marks',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      suffixText: '/1100',
                    ),
                    onChanged: (value) {
                      aggregateProvider.updateFsc();
                    },
                    validator: (value) {
                      if(value!.isEmpty){
                        return ('Please enter FSC marks');
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: aggregateProvider.mdcatController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'MDCAT Marks',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      suffixText: '/200',
                    ),
                    onChanged: (value) {
                      aggregateProvider.updateMdcat();
                    },
                    validator: (value) {
                      if(value!.isEmpty){
                        return ('Please enter MDCAT marks');
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: (){
                      if(aggregateProvider.formKey.currentState!.validate()){
                        aggregateProvider.toggleShowResults();
                        aggregateProvider.resultsVisible = true;
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: const Text('Calculate'),
                  ),
                  const SizedBox(height: 20,),
                  Selector<AggregateProvider, bool>(
                    selector: (context, aggregateProvider) => aggregateProvider.showResults,
                    builder: (context, showResults, child) {
                      return aggregateProvider.resultsVisible
                          ? Column(
                              children: [
                                AggregateContainer(
                                  matric: '${aggregateProvider.matricAggregate.toStringAsFixed(4)} %',
                                  fsc: '${aggregateProvider.fscAggregate.toStringAsFixed(4)} %',
                                  mdcat: '${aggregateProvider.mdcatAggregate.toStringAsFixed(4)} %',
                                  totalAggregate: '${aggregateProvider.totalAggregate.toStringAsFixed(4)} %',
                                ),
                                const SizedBox(height: 20,),
                            ElevatedButton(
                                onPressed: (){
                                  Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => const FilteredCollegesScreen()));
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size.fromHeight(50),
                                ),
                                child: const Text('View Your Colleges as per Merit List 2022')
                            ),
                                const SizedBox(height: 20,),
                                ElevatedButton(
                                    onPressed: (){
                                      aggregateProvider.reset();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: const Size.fromHeight(50),
                                    ),
                                    child: const Text('Recalculate')
                                ),
                            // const FilteredColleges(),
                        ],
                      )
                          : const SizedBox.shrink();
                    },
                  ),
                ],
              ),
            );
          })
        ),
      ),
    );
  }
}



