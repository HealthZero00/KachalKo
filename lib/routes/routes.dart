import 'package:get/get.dart';
import 'package:KachalKo/navbar/navbar.dart';
import 'package:KachalKo/pages/category.dart';
import 'package:KachalKo/pages/notes.dart';
import 'package:KachalKo/pages/plechi.dart';
import 'package:KachalKo/pages/timer.dart';

class AppPage {
  static List<GetPage> routes = [
    GetPage(name: navbar, page: () => NavBar()),
    GetPage(name: category, page: () => Category()),
    GetPage(name: notes, page: () => Notes()),
    GetPage(name: timer, page: () => TTimer()),
    GetPage(name: plechi, page: () => Plechi())
  ];

  static getNavbar() => navbar;
  static getCategory() => category;
  static getNotes() => notes;
  static getTimer() => timer;
  static getTPlechi() => plechi;

  static String navbar = "/";
  static String category = "/category";
  static String notes = "/notes";
  static String timer = "/timer";
  static String plechi = "/plechi";
}
