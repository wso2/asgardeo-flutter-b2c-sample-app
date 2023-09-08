import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/app_constants.dart';
import '../constants/strings.dart';
import '../providers/page.dart';

class ExternalAPIDataPage extends StatelessWidget{

  const ExternalAPIDataPage({super.key});

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
              const Text(Strings.externalAPIPageTitle, style: TextStyle(fontSize: 30)),
            ]
            ),
            const SizedBox(height: 40),
            Padding(padding: const EdgeInsets.only(left:35, bottom: 0, right: 10, top:0), child: Text(context.watch<CurrentPage>().apiData)),
          ]
      ),
    );
  }
}
