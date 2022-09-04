import 'package:flutter/material.dart';

import 'app_link.dart';

class BookRouterParser extends RouteInformationParser<Applink> {
  @override
  Future<Applink> parseRouteInformation(
      RouteInformation routeInformation) async {
    final link = Applink.fromLocation(routeInformation.location);
    return link;
  }

  @override
  RouteInformation? restoreRouteInformation(Applink applink) {
    final location = applink.toLocation();
    return RouteInformation(location: location);
  }
}
