import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'title': 'EJI Application',
          'insert text': 'please insert some text',
          'email not': 'sorry ! the emaai is not correct ',
          'password not': 'sorry! the password is not correct',
          'welcomeadmin': 'you loged in as admin !',
          'welcomenormal': 'welcome to EJI Application',
          'loginnot': 'Password || email not correct !!',
          'passempty': 'Please enter a valid password',
          'emailempty': 'Please enter a valid email',
          'team': ' information about the team matches and other info',
          'Players List': ' players list and thier info',
          'Player Statistics': ' players statistics and thier rankings',
          'About EJI': 'Information about EJI Team and Its Philosophy and Laws',
          'Sign Out': ' sign out of the app',
          'title': ' Application',
          'title': ' Application',
          'title': ' Application',
          'title': ' Application',
        },
      };
}
