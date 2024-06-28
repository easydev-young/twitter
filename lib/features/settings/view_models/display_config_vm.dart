import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboarding_flow_part1/features/settings/models/display_config_model.dart';
import 'package:onboarding_flow_part1/features/settings/repos/display_config_repo.dart';

class DisplayConfigViewModel extends Notifier<DisplayConfigModel> {
  final DisplayConfigRepository _repository;

  DisplayConfigViewModel(this._repository);

  void setDark(bool value) {
    _repository.setDark(value);
    state = DisplayConfigModel(
      darkMode: value,
    );
  }

  @override
  DisplayConfigModel build() {
    return DisplayConfigModel(
      darkMode: _repository.isDarkMode(),
    );
  }
}

final displayConfigProvider =
    NotifierProvider<DisplayConfigViewModel, DisplayConfigModel>(
  () => throw UnimplementedError(),
);
