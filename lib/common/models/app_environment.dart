import 'package:equatable/equatable.dart';

class AppEnvironment extends Equatable {
  const AppEnvironment({
    required this.env,
    required this.flavor,
    required this.appName,
    required this.databaseName,
  });

  final String env;
  final String flavor;
  final String appName;
  final String databaseName;

  @override
  List<Object> get props => [env, appName, flavor, databaseName];

  Map<String, dynamic> toJson() {
    return {
      'env': env,
      'flavor': flavor,
      'appName': appName,
      'databaseName': databaseName,
    };
  }

  factory AppEnvironment.fromJson(Map<String, dynamic> json) {
    return AppEnvironment(
      env: json['env'],
      flavor: json['flavor'],
      appName: json['appName'],
      databaseName: json['databaseName'],
    );
  }
}
