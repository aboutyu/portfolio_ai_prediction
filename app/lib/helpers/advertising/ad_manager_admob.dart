import 'package:app/helpers/commons/common_funcs.dart';
import 'package:app/helpers/configures/app_config.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:my_app/config/app_config.dart';
// import 'package:my_app/utils/logger.dart';

class AdManagerAdmob {
  static final AdManagerAdmob _instance = AdManagerAdmob._internal();
  factory AdManagerAdmob() => _instance;
  AdManagerAdmob._internal();

  bool _isAdLoading = false;

  // 특정 화면에서 광고가 이미 노출되었는지 기록하는 Set
  final Set<String> _shownScreens = {};

  /// 특정 화면(screenName)에서 1번만 전면 광고를 노출하는 메서드
  void showInterstitialOnce(String screenName, {Function? onAdClosed}) {
    // 이미 이 화면에서 광고를 본 적이 있다면 바로 패스
    if (_shownScreens.contains(screenName)) {
      debugMessage(['$screenName 에서는 이미 전면 광고가 노출되었습니다.']);
      if (onAdClosed != null) onAdClosed();
      return;
    }

    if (_isAdLoading) return;
    _isAdLoading = true;

    InterstitialAd.load(
      adUnitId: AppConfig.admob.interstitial,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _isAdLoading = false;
          _shownScreens.add(screenName); // 성공적으로 로드되면 노출 기록 추가

          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
              if (onAdClosed != null) onAdClosed();
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              ad.dispose();
              if (onAdClosed != null) onAdClosed();
            },
          );
          ad.show();
        },
        onAdFailedToLoad: (error) {
          _isAdLoading = false;
          debugMessage(['전면 광고 로드 실패: $error']);
          if (onAdClosed != null) onAdClosed();
        },
      ),
    );
  }

  /// 필요하다면 노출 기록을 초기화하는 메서드 (예: 로그아웃 시)
  void clearShownHistory() {
    _shownScreens.clear();
  }
}
