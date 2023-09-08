import 'package:flutter/material.dart';

import '../components/license.dart';
import '../configs/configs.dart' as configs;
import '../constants/strings.dart';
import '../pages/sign_up_page.dart';
import '../pages/view_source_code.dart';
import '../utils/auth_client.dart';

class LogInPage extends StatelessWidget {

  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Image.asset(configs.flutterLogo,
                height: 100,
                width: 100,
              ),
            const SizedBox(height: 30),
            const Text(Strings.firstPageTitle, style: TextStyle(fontSize: 25)),
            const Text(Strings.firstPageSubTitle, style: TextStyle(fontSize: 25)),
                Image.asset(configs.asgardeoLogo,
                  height: 60,
                  width: 120,
                ),
            const SizedBox(height: 40),
            Container(
            height: 44.0,
            width: 180.0,
            decoration: BoxDecoration(
                color: const Color(configs.primaryColor),
                borderRadius: BorderRadius.circular(configs.buttonRadius)),
            child: ElevatedButton(
              onPressed: () async {
                await AuthClient().loginFunction(context);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent),
              child: const Text(Strings.signInButton, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
            ),
          ),
            const SizedBox(height: 20),
            Container(
              height: 42.0,
              width: 178.0,
              color: Theme.of(context).scaffoldBackgroundColor,
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignUpWebView()));
                },
                style: ElevatedButton.styleFrom(
                    side: const BorderSide(
                      width: 1.0,
                      color: Color(configs.primaryColor),
                    ),
                    shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(configs.buttonRadius),
                    )),
                child: const Text(Strings.signUpButton, style: TextStyle(fontWeight: FontWeight.bold, color: Color(configs.primaryColor))),
              ),
            ),
            const SizedBox(height: 100),
            InkWell(
              onTap: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ViewSourceCode()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(configs.gitHubLogo,
                    height: 25,
                    width: 25,
                  ),
                  const SizedBox(width: 5),
                  const Text(Strings.viewSource, style: TextStyle( fontWeight: FontWeight.w400)),
                ],
              ),
            ),
           const License(90),
          ]
      ),
    );
  }
}
