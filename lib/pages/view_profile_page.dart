import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/license.dart';
import '../components/text_components.dart';
import '../configs/configs.dart' as configs;
import '../constants/app_constants.dart';
import '../constants/strings.dart';
import '../providers/page.dart';
import '../providers/user.dart';

class ProfilePage extends StatelessWidget {

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(children: [
            IconButton(
              onPressed: () {
                context.read<CurrentPage>().setPageIndex(AppConstants.homePage);
              },
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
            const Text(Strings.viewProfileTitle, style: TextStyle(fontSize: 30))
          ]),
          const SizedBox(height: 50),
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(configs.primaryColor), width: 2.0),
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: NetworkImage(
                    context.read<User>().photo),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Card(
            elevation: 0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DisplayLabel(Strings.firstNameLabel,10),
                        DisplayLabel(Strings.lastNameLabel,10),
                        DisplayLabel(Strings.dOBLabel,10),
                        DisplayLabel(Strings.mobileLabel,10),
                        DisplayLabel(Strings.countryLabel,10),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DisplayText(context.read<User>().firstName,10),
                        DisplayText(context.read<User>().lastName,10),
                        DisplayText(context.read<User>().dateOfBirth,10),
                        DisplayText(context.read<User>().mobile,10),
                        DisplayText(context.read<User>().country,10),
                      ],
                    ),
                  ),
                ),
              ],
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
              onPressed: () {
                context.read<CurrentPage>().setPageIndex(AppConstants.editProfilePage);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
              ),
              child: const Text(Strings.editProfileButton, style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold)),
            ),
          ),
          const License(100),
        ],
      ),
    );
  }
}
