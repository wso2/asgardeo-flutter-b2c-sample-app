import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/my_asgardeo_app.dart';
import '../providers/page.dart';
import '../providers/user.dart';
import '../providers/user_session.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => User()),
        ChangeNotifierProvider(create: (_) => UserSession()),
        ChangeNotifierProvider(create: (_) => CurrentPage()),
      ],
      child: const MyApp(),
    ),
  );
}
