import 'package:shared_preferences/shared_preferences.dart';



class SettingRepository{
  // ignore: constant_identifier_names
  static const PSEUDO_KEY = "pseudo";

  saveSettingsPseudo(String value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(PSEUDO_KEY, value);
  }

  Future<String?> getSettingsPseudo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(PSEUDO_KEY);
  }
  saveIdAnnonce(int value) async {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setInt("idAnnonce", value);
    }
  Future<int?> getIdAnnonce() async {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      return sharedPreferences.getInt("idAnnonce");
    }

  clearSettings() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}
