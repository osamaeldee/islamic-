import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

class RewardAdButton extends StatefulWidget {
  final String buttonText;
  final String rewardText;
  const RewardAdButton({required this.buttonText, required this.rewardText});

  @override
  // ignore: library_private_types_in_public_api
  _RewardAdButtonState createState() => _RewardAdButtonState();
}

class _RewardAdButtonState extends State<RewardAdButton> {
  RewardedAd? _rewardedAd;
  bool _isAdLoaded = false;
  bool _isError = false;
  bool _isButtonVisible = true;


  @override
  void initState() {
    super.initState();
    _loadRewardedAd();
  }

  void _loadRewardedAd() {
    try {
      RewardedAd.load(
        adUnitId:"ca-app-pub-7122533733437182/3902493392",
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd ad) {
            _rewardedAd = ad;
            _isAdLoaded = true;
            setState(() {});
          },
          onAdFailedToLoad: (LoadAdError error) {
            _isError = true;
            Fluttertoast.showToast(msg: "هذه الميزة غير متوفرة الآن");
          },
        ),
      );
    } catch (e) {
      _isError = true;
    }
  }

  void _showRewardedAd() {
    try {
      if (_isAdLoaded && !_isError && _rewardedAd != null) {
        _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
          onAdDismissedFullScreenContent: (RewardedAd ad) {
            ad.dispose();
          },
          onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
            ad.dispose();
            _loadRewardedAd();
          },
          onAdShowedFullScreenContent: (RewardedAd ad) {},
        );
        _rewardedAd!.show(
          onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
            String rewardText = widget.rewardText;
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('الإجابة الصحيحة'),
                  content: Text('الإجابة هي: $rewardText'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {
                          _isButtonVisible = false;
                        });
                      },
                      child: const Text('موافق'),
                    ),
                  ],
                );
              },
            );
          },
        );
      } else {
        if (_isError) {
          Fluttertoast.showToast(msg: "هذه الميزة غير متوفرة الآن");
        }
        _loadRewardedAd();
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "حدث خطأ أثناء عرض الإعلان");
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isButtonVisible
        ? IconButton(
            onPressed: () {
              _showRewardedAd();
              Vibrate.vibrate();
            },
            icon: const Icon(
              Icons.help_outline,
              color: Colors.yellow,
            ),
            iconSize: 50,
          )
        : Container();
  }

  @override
  void dispose() {
    _rewardedAd?.dispose();
    super.dispose();
  }
}
