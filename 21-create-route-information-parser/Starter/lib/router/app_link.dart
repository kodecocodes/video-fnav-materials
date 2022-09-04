class Applink {
  static const String splashPath = '/splash';
  static const String loginPath = '/login';
  static const String signupPath = 'signup';
  static const String homePath = '/';
  static const String detailsPath = '/details';
  static const String readBookPath = '/readbook';
  static const String cartPath = '/cart';
  static const String checkoutPath = '/checkout';
  static const String settingsPath = '/settings';
  static const String mybooksPath = '/mybooks';

  static const String itemPath = '/book';
  static const String idParam = 'id';

  String? location;
  String? itemId;

  Applink({this.itemId, this.location});

  static Applink fromLocation(String? location) {
    location = Uri.decodeFull(location ?? '');
    final uri = Uri.parse(location);

    final param = uri.queryParameters;
    final itemId = param[Applink.idParam];

    final link = Applink(location: uri.path, itemId: itemId);
    return link;
  }

  String toLocation() {
    String addKeyValuePair({required String key, String? value}) =>
        value == null ? '' : '$key=$value';

    switch (location) {
      case splashPath:
        return splashPath;
      case loginPath:
        return loginPath;
      case signupPath:
        return signupPath;
      case homePath:
        return homePath;
      case cartPath:
        return cartPath;
      case settingsPath:
        return settingsPath;
      case checkoutPath:
        return checkoutPath;
      case mybooksPath:
        return mybooksPath;
      case detailsPath:
        return detailsPath;
      case itemPath:
        var loc = '$itemPath?';
        loc += addKeyValuePair(key: idParam, value: itemId);
        return Uri.encodeFull(loc);

      case readBookPath:
        var loc = '$readBookPath?';
        loc += addKeyValuePair(key: idParam, value: itemId);
        return Uri.encodeFull(loc);

      default:
        var loc = '$loginPath?';
        return Uri.encodeFull(loc);
    }
  }
}
