
import 'package:memos/auth/login_page.dart';
import 'package:memos/auth/contact_me.dart';
import 'package:flutter/material.dart';
import 'package:memos/auth/start_page.dart';

Map routes = {
  '/login': (context) => const LoginWidget(),
  "/contact_me": (context) => const ContactMe(),
  "/lead_page": (context) =>  const LeadPage(),
};


var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (settings.arguments != null) {
    final Route route = MaterialPageRoute(
        builder: (context) =>
            pageContentBuilder(context, arguments: settings.arguments));
    return route;
  } else {
    final Route route =
    MaterialPageRoute(builder: (context) => pageContentBuilder(context));
    return route;
  }
};