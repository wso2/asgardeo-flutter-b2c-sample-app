import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/license.dart';
import '../components/text_components.dart';
import '../configs/configs.dart' as configs;
import '../constants/app_constants.dart';
import '../constants/strings.dart';
import '../providers/page.dart';
import '../providers/user.dart';
import '../utils/api_client.dart';

class EditProfilePage extends StatelessWidget{

   const EditProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    final TextEditingController firstNameController = TextEditingController();
    firstNameController.text = context.read<User>().firstName;
    final TextEditingController lastNameController = TextEditingController();
    lastNameController.text = context.read<User>().lastName;
    final TextEditingController countryController = TextEditingController();
    countryController.text = context.read<User>().country;

    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(children: [
            IconButton(
              onPressed: () {
                context.read<CurrentPage>().setPageIndex(AppConstants.profilePage);
              },
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
            const Text(Strings.editProfileTitle, style: TextStyle(fontSize: 30))]),
          const SizedBox(height: 40),
          EditText(Strings.firstNameLabel,firstNameController),
          EditText(Strings.lastNameLabel,lastNameController),
          EditText(Strings.countryLabel,countryController),
          const SizedBox(height: 40),
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(width: 35),
            Container(
              height: 44.0,
              width: 150.0,
              decoration: BoxDecoration(
                  color: const Color(configs.primaryColor),
                  borderRadius: BorderRadius.circular(configs.buttonRadius)),
              child: ElevatedButton(
                onPressed: () async {
                  await APIClient().updateUserProfile(firstNameController.text, lastNameController.text, countryController.text, context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent),
                child: const Text(Strings.saveButton, style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(width: 30),
            Container(
              height: 42.0,
              width: 148.0,
              color: Theme.of(context).scaffoldBackgroundColor,
              child: ElevatedButton(
                onPressed: () async {
                  context.read<CurrentPage>().setPageIndex(AppConstants.profilePage);
                },
                style: ElevatedButton.styleFrom(
                    side: const BorderSide(
                      width: 1.0,
                      color: Color(configs.primaryColor),
                    ),
                    shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(configs.buttonRadius),
                    )),
                child: const Text(Strings.cancelButton, style: TextStyle(color: Color(configs.primaryColor)),),
              ),
            ),
          ]),
          const License(175),
        ]
    );
  }
}
