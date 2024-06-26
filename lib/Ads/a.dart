import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class InterstitialAdPage extends StatefulWidget {
  @override
  _InterstitialAdPageState createState() => _InterstitialAdPageState();
}

class _InterstitialAdPageState extends State<InterstitialAdPage> {
  InterstitialAd? _interstitialAd;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _createInterstitialAd();
  }

  void _createInterstitialAd() {
    Connectivity().checkConnectivity().then((connectivityResult) {
      if (connectivityResult != ConnectivityResult.none) {
        InterstitialAd.load(
          adUnitId: "ca-app-pub-7122533733437182/6370095828",
          request: const AdRequest(),
          adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (InterstitialAd ad) {
              _interstitialAd = ad;
              setState(() {
                _isLoading = false;
              });
            },
            onAdFailedToLoad: (LoadAdError error) {
              print('InterstitialAd failed to load: $error');
              _showErrorDialog();
            },
          ),
        ).catchError((error) {
          print('Error loading interstitial ad: $error');
          _showErrorDialog();
        });
      } else {
        _showNoConnectionDialog();
      }
    });
  }

  void _showInterstitialAd() {
    if (_interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          ad.dispose();
          Navigator.pop(context);
        },
      );
      _interstitialAd!.show().catchError((error) {
        print('Error showing interstitial ad: $error');
        _showErrorDialog();
      }).whenComplete(() {
        _interstitialAd!.dispose();
      });
    } else {
      print('InterstitialAd not loaded yet.');
    }
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: const Text('An error occurred while loading the ad.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
              Navigator.pop(context); // Go back to the previous screen
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showNoConnectionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('No Internet Connection'),
        content:
            const Text('Please check your internet connection and try again.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
              Navigator.pop(context); // Go back to the previous screen
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : const SizedBox(),
    );
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    super.dispose();
  }
}
