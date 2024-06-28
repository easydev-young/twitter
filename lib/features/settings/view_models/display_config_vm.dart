import 'package:flutter/material.dart';
import 'package:onboarding_flow_part1/features/settings/models/display_config_model.dart';
import 'package:onboarding_flow_part1/features/settings/repos/display_config_repo.dart';

class DisplayConfigViewModel extends ChangeNotifier {
  final DisplayConfigRepository _repository;

  late final DisplayConfigModel _model = DisplayConfigModel(
    darkMode: _repository.isDarkMode(),
  );

  DisplayConfigViewModel(this._repository);

  bool get darkMode => _model.darkMode;

  void setDark(bool value) {
    _repository.setDark(value);
    _model.darkMode = value;
    notifyListeners();
  }
}
