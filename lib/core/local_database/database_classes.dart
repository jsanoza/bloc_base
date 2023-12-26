import '../../common/models/app_environment.dart';

abstract class BaseDatabaseConstants<T> {
  String get name;
}

class AppEnvironmentDatabase extends BaseDatabaseConstants<AppEnvironment> {
  @override
  String get name => 'app_environment';

  Map<String, dynamic>? valueToMap(AppEnvironment value) {
    return value.toJson();
  }
}
