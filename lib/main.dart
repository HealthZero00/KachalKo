import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:KachalKo/models/note_data.dart';
import 'package:KachalKo/pages/notes.dart';
import 'package:KachalKo/routes/routes.dart';
import 'package:flutter_launcher_icons/abs/icon_generator.dart';
import 'package:flutter_launcher_icons/android.dart';
import 'package:flutter_launcher_icons/config/config.dart';
import 'package:flutter_launcher_icons/config/macos_config.dart';
import 'package:flutter_launcher_icons/config/web_config.dart';
import 'package:flutter_launcher_icons/config/windows_config.dart';
import 'package:flutter_launcher_icons/constants.dart';
import 'package:flutter_launcher_icons/custom_exceptions.dart';
import 'package:flutter_launcher_icons/ios.dart';
import 'package:flutter_launcher_icons/logger.dart';
import 'package:flutter_launcher_icons/macos/macos_icon_generator.dart';
import 'package:flutter_launcher_icons/macos/macos_icon_template.dart';
import 'package:flutter_launcher_icons/main.dart';
import 'package:flutter_launcher_icons/pubspec_parser.dart';
import 'package:flutter_launcher_icons/utils.dart';
import 'package:flutter_launcher_icons/web/web_icon_generator.dart';
import 'package:flutter_launcher_icons/web/web_template.dart';
import 'package:flutter_launcher_icons/windows/windows_icon_generator.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => NoteData(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppPage.getNavbar(),
      debugShowCheckedModeBanner: false,
      getPages: AppPage.routes,
    );
  }
}
