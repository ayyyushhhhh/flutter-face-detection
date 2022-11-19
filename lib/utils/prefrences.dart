import 'package:shared_preferences/shared_preferences.dart';

// ignore: avoid_classes_with_only_static_members
class Prefrences {
  static SharedPreferences? preferences;

  static Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static void saveFacialData(String employeeID, String facialData) {
    preferences!.setString(employeeID, facialData);
  }

  static void getFacialData(String employeeID) {
    preferences!.getString(employeeID);
  }
}
