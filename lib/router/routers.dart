
import 'package:memos/auth/login_page.dart';
import 'package:memos/auth/contact_me.dart';
import 'package:flutter/material.dart';
import 'package:memos/auth/main_page.dart';
import 'package:memos/auth/start_page.dart';
import 'package:memos/pages/more_page.dart';

Map routes = {
  '/login': (context) => const LoginWidget(),
  "/contact_me": (context) => const ContactMe(),
  "/lead_page": (context) =>   LeadPage(showStart: true,),
  "/main_page": (context) =>  const MainPage(),
  "/more_page": (context) =>  const MorePage(),
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