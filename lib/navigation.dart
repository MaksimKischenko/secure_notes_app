// ignore: avoid_classes_with_only_static_members
import 'package:flutter/material.dart';

import 'screens/screens.dart';

/// Simple static class to aggregate navigation
mixin Navigation {

  static GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static void toAuth() => navigatorKey.currentState?.pushNamed(
    AuthScreen.pageRoute,
  );

  static void toCatalog() => navigatorKey.currentState?.pushNamed(
    CatalogScreen.pageRoute,
  );

  static void toAddCatalogElement() => navigatorKey.currentState?.pushNamed(
    CreateCatalogElementScreen.pageRoute,
  );
}