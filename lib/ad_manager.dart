import 'dart:io';

class AdManager {

  static String get appId {
    if (Platform.isAndroid) {
      return "ca-app-pub-9838187586217611~1861440148";
    } else if (Platform.isIOS) {
      return "ca-app-pub-9838187586217611~1861440148";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-9838187586217611/4168055199";
    } else if (Platform.isIOS) {
      return "ca-app-pub-9838187586217611/4168055199";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-9838187586217611/4168055199";
    } else if (Platform.isIOS) {
      return "ca-app-pub-9838187586217611/4168055199";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-9838187586217611/4168055199";
    } else if (Platform.isIOS) {
      return "ca-app-pub-9838187586217611/4168055199";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }
}