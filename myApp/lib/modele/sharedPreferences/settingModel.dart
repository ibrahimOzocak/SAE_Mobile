import 'setting.dart';
import 'package:flutter/material.dart';

class SettingViewModel extends ChangeNotifier {
  late String _pseudo;
  late SettingRepository _settingRepository;
  String get pseudos => _pseudo;
  SettingViewModel() {
    _settingRepository = SettingRepository();
    getSettingsPseudo();
  }


  set pseudo(String value) {
    _pseudo = value;
    _settingRepository.saveSettingsPseudo(value);
    notifyListeners();
  }


  getSettingsPseudo() async {
    _pseudo = await _settingRepository.getSettingsPseudo() ?? "";
    notifyListeners();
  }


  clearSettings() {
    _settingRepository.clearSettings();
    _pseudo = "";
    notifyListeners();
  }

}
