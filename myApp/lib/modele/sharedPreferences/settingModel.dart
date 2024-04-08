import 'setting.dart';
import 'package:flutter/material.dart';

class SettingViewModel extends ChangeNotifier {
  late String _pseudo;
  late int _idAnnonce;
  late SettingRepository _settingRepository;
  String get pseudos => _pseudo;
  int get idAnnonces => _idAnnonce;
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

  set annonce(int value) {
      _idAnnonce = value;
      _settingRepository.saveIdAnnonce(value);
      notifyListeners();
    }

  getIdAnnonce() async {
      _idAnnonce = await _settingRepository.getIdAnnonce() ?? 0;
      notifyListeners();
    }




  clearSettings() {
    _settingRepository.clearSettings();
    _pseudo = "";
    notifyListeners();
  }

}
