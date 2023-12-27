import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:movie/common/extensions/app_text_extension.dart';
import 'package:movie/themes/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../common/const/preference_keys.dart';
import '../../dependencies/dependency_manager.dart';
import '../../generated/l10n.dart';
import '../../routes/route_helper.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  void setOnBoardingSeenAndNavigate() async {
    sl<SharedPreferences>().setBool(PreferenceKeys.hasSeenOnBoarding, true);
    sl<RouteHelper>().popAllAndPushToLoginScreen();
    return;
  }

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      indicatorAbove: true,
      finishButtonText: S.current.register,
      centerBackground: true,
      onFinish: () {
        setOnBoardingSeenAndNavigate();
      },
      finishButtonStyle: const FinishButtonStyle(
        backgroundColor: AppColors.kBlackColor,
      ),
      skipTextButton: Text(S.current.skip, style: context.textTheme.labelLarge),
      trailing: Text(S.current.register, style: context.textTheme.labelLarge),
      trailingFunction: () {
        setOnBoardingSeenAndNavigate();
      },
      controllerColor: kDefaultIconLightColor,
      totalPage: 3,
      headerBackgroundColor: Colors.white,
      pageBackgroundColor: Colors.white,
      imageVerticalOffset: 100,
      background: [
        'assets/onboarding/slide_1.png',
        'assets/onboarding/slide_2.png',
        'assets/onboarding/slide_3.png',
      ].map((asset) => Image.asset(asset, height: 300)).toList(),
      speed: 1.8,
      pageBodies: [
        _buildOnboardingPage(
          'assets/onboarding/slide_1.png',
          S.current.onboardingPage1Title,
          S.current.onboardingPage1Description,
        ),
        _buildOnboardingPage(
          'assets/onboarding/slide_2.png',
          S.current.onboardingPage2Title,
          S.current.onboardingPage2Description,
        ),
        _buildOnboardingPage(
          'assets/onboarding/slide_3.png',
          S.current.onboardingPage3Title,
          S.current.onboardingPage3Description,
        ),
      ],
    );
  }

  Container _buildOnboardingPage(
      String imageAsset, String title, String description) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 480,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: context.textTheme.bodyLarge!
                .copyWith(fontWeight: FontWeight.w600, fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: context.textTheme.bodySmall!
                .copyWith(fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
