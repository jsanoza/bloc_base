enum Flavor {
  dev,
  staging,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Movie Dev';
      case Flavor.staging:
        return 'Movie Staging';
      case Flavor.prod:
        return 'Movie';
      default:
        return 'title';
    }
  }

}
