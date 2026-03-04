import 'package:app/helpers/commons/common_funcs.dart';
import 'package:app/helpers/configures/app_config.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdBannerAdmob extends StatefulWidget {
  const AdBannerAdmob({super.key, this.bottomMargin = 16.0});

  final double bottomMargin;

  @override
  State<AdBannerAdmob> createState() => _AdBannerAdmobState();
}

class _AdBannerAdmobState extends State<AdBannerAdmob> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadBanner();
  }

  void _loadBanner() {
    _bannerAd = BannerAd(
      adUnitId: AppConfig.admob.adaptiveBanner,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _isLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          debugMessage('BannerAd failed to load: $error');
          ad.dispose();
        },
      ),
    )..load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLoaded || _bannerAd == null) {
      return const SizedBox.shrink();
    }

    return Container(
      width: _bannerAd!.size.width.toDouble(),
      height: _bannerAd!.size.height.toDouble(),
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: widget.bottomMargin),
      child: AdWidget(ad: _bannerAd!),
    );
  }
}
