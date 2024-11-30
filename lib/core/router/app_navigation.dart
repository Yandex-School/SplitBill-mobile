import 'dart:developer';

import 'package:flutter/widgets.dart';

class MyNavigationObserver extends NavigatorObserver {
  MyNavigationObserver();

  @override
  void didPop(Route route, Route? previousRoute) {
    log(
      'previousRoute: ${previousRoute?.settings.name} Argments:${previousRoute?.settings.arguments}, didPop: ${route.settings.name} Argments:${route.settings.arguments}',
    );
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    log(
      'previousRoute: ${previousRoute?.settings.name} Argments:${previousRoute?.settings.arguments}, didPush: ${route.settings.name} Argments:${route.settings.arguments}',
    );
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    log('previousRoute: ${previousRoute?.settings.name} Argments:${previousRoute?.settings.arguments}, didRemove: ${route.settings.name} Argments:${route.settings.arguments}');
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    log('oldRoute: ${oldRoute?.settings.name} Argments:${oldRoute?.settings.arguments},didReplace: ${oldRoute?.settings.name} -> ${newRoute?.settings.name} Argments:${newRoute?.settings.arguments}');
  }

  @override
  void didStartUserGesture(Route route, Route? previousRoute) {
    log('previousRoute: ${previousRoute?.settings.name} Argments:${previousRoute?.settings.arguments} ,didStartUserGesture: ${route.settings.name} Argments:${route.settings.arguments}');
  }

  @override
  void didStopUserGesture() {
    log('didStopUserGesture');
  }
}
