import 'package:flutter/material.dart';

class AggregateProvider with ChangeNotifier {
  final matricController = TextEditingController();
  final fscController = TextEditingController();
  final mdcatController = TextEditingController();
  FocusNode matricFocusNode = FocusNode();
  FocusNode fscFocusNode = FocusNode();
  FocusNode mdcatFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  double matric = 0.0;
  double fsc = 0.0;
  double mdcat = 0.0;
  bool _showResults = false;
  bool resultsVisible = false;

  double get matricAggregate => (matric * 10) / 1100;

  double get fscAggregate => (fsc * 40) / 1100;

  double get mdcatAggregate => (mdcat * 50) / 200;

  double get totalAggregate => matricAggregate + fscAggregate + mdcatAggregate;

  bool get showResults => _showResults;

  void toggleShowResults() {
    _showResults = !_showResults;
    notifyListeners();
  }

  void updateMatric() {
    matric = double.tryParse(matricController.text) ?? 0.0;
    notifyListeners();
  }

  void updateFsc() {
    fsc = double.tryParse(fscController.text) ?? 0.0;
    notifyListeners();
  }

  void updateMdcat() {
    mdcat = double.tryParse(mdcatController.text) ?? 0.0;
    notifyListeners();
  }

  void reset() {
    matricController.text = '';
    fscController.text = '';
    mdcatController.text = '';
  }
}
