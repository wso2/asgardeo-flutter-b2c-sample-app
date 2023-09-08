import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/license.dart';
import '../configs/configs.dart' as configs;
import '../constants/strings.dart';
import '../providers/user.dart';
import '../utils/api_client.dart';
import '../utils/auth_client.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      APIClient().getUserName(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 100),
          Text("${Strings.welcome} ${context.watch<User>().userName} ${Strings.greeting}", style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 100),
          Container(
            height: 44.0,
            width: 170.0,
            decoration: BoxDecoration(
                color: const Color(configs.primaryColor),
                borderRadius: BorderRadius.circular(configs.buttonRadius)),
            child: ElevatedButton(
              onPressed: () async {
                await APIClient().getUserProfileData(context);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent),
              child: const Text(Strings.viewProfileButton, style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 44.0,
            width: 170.0,
            decoration: BoxDecoration(
               color: const Color(configs.primaryColor),
                borderRadius: BorderRadius.circular(configs.buttonRadius)),
            child: ElevatedButton(
              onPressed: () async {
                await APIClient().callExternalAPIFunction(context);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent),
              child: const Text(Strings.callExternalAPIButton, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 43.0,
            width: 170.0,
            color: Theme.of(context).scaffoldBackgroundColor,
            child: ElevatedButton(
              onPressed: () async {
                await AuthClient().logOutUser(context);
              },
              style: ElevatedButton.styleFrom(
                  side: const BorderSide(
                    width: 1.0,
                    color: Color(configs.primaryColor),
                  ),
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(configs.buttonRadius),
                  )),
              child: const Text(Strings.logOutButton, style: TextStyle(fontWeight: FontWeight.bold, color: Color(configs.primaryColor))),
            ),
          ),
          const License(170),
        ],
      ),
    );
  }
}
