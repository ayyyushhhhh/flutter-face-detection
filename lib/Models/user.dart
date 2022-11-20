class User {
  static const String employeeKey = "employeeKey";
  static const String arrayKey = "user_array";

  String? employeeID;
  List? array;

  User({this.employeeID, this.array});

  factory User.fromJson(Map<dynamic, dynamic> json) => User(
        employeeID: json[employeeKey],
        array: json[arrayKey],
      );

  Map<String, dynamic> toJson() => {
        employeeKey: employeeID,
        arrayKey: array,
      };
}
