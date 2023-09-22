import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../configs/configs.dart' as configs;
import '../constants/app_constants.dart';
import '../constants/strings.dart';
import 'edit_profile_page.dart';
import 'external_api_page.dart';
import 'home_page.dart';
import 'login_page.dart';
import '../providers/page.dart';
import 'view_profile_page.dart';

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool isUserLoggedIn = context.watch<CurrentPage>().isUserLoggedIn;
    int pageIndex = context.watch<CurrentPage>().pageIndex;
    return MaterialApp(
      title: Strings.appTitle,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(configs.primaryColor)),
      ),
      home: Scaffold(
        appBar: AppBar(
          leadingWidth: 280,
          leading:  Padding(
            padding: const EdgeInsets.only(left: 116, right: 2,),
            child: isUserLoggedIn ? Image.asset(
              configs.asgardeoLogo,
              scale:0.1,
            ): const Text(''),
          ),
        ),
        body: isUserLoggedIn
            ? pageIndex == AppConstants.homePage
            ? const HomePage()
            : pageIndex == AppConstants.profilePage
            ? const SingleChildScrollView(child: ProfilePage(),)
            : pageIndex == AppConstants.externalAPIResponsePage
            ? const SingleChildScrollView(child: ExternalAPIDataPage())
            : pageIndex == AppConstants.editProfilePage
            ? const SingleChildScrollView(child: EditProfilePage())
            : const LogInPage()
            : const LogInPage(),
      ),
    );
  }

}
