import 'package:app/helpers/cores/app_config.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AdmobConfig {
  const AdmobConfig();

  // 1. 앱 ID
  String get appId =>
      dotenv.env[AppConfig.isIOS
          ? 'ADMOB_APP_ID_IOS' // .env에 iOS 키가 있다면 이걸 사용
          : 'ADMOB_APP_ID_ANDROID'] ??
      '';

  // 2. 오프닝 광고 (Launch Banner)
  String get launchBanner =>
      dotenv.env[AppConfig.isIOS
          ? 'ADMOB_AD_ID_IOS_LAUNCH_BANNER'
          : 'ADMOB_AD_ID_ANDROID_LAUNCH_BANNER'] ??
      '';

  // 3. 적응형 배너
  String get adaptiveBanner =>
      dotenv.env[AppConfig.isIOS
          ? 'ADMOB_AD_ID_IOS_ADAPT_BANNER'
          : 'ADMOB_AD_ID_ANDROID_ADAPT_BANNER'] ??
      '';

  // 4. 고정 크기 배너
  String get fixedBanner =>
      dotenv.env[AppConfig.isIOS
          ? 'ADMOB_AD_ID_IOS_FIXED_BANNER'
          : 'ADMOB_AD_ID_ANDROID_FIXED_BANNER'] ??
      '';

  // 5. 전면 광고 (Interstitial)
  String get interstitial =>
      dotenv.env[AppConfig.isIOS
          ? 'ADMOB_AD_ID_IOS_INTERSTITIAL'
          : 'ADMOB_AD_ID_ANDROID_INTERSTITIAL'] ??
      '';

  // 6. 보상형 광고 (Rewarded)
  String get rewarded =>
      dotenv.env[AppConfig.isIOS
          ? 'ADMOB_AD_ID_IOS_REWARDED'
          : 'ADMOB_AD_ID_ANDROID_REWARDED'] ??
      '';

  // 7. 보상형 전면 광고 (Rewarded Interstitial)
  String get rewardedInterstitial =>
      dotenv.env[AppConfig.isIOS
          ? 'ADMOB_AD_ID_IOS_REWARDED_INTERSTITIAL'
          : 'ADMOB_AD_ID_ANDROID_REWARDED_INTERSTITIAL'] ??
      '';
}
