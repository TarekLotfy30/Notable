import '../../../../core/utils/images/app_images.dart';

class Onboarding {
  Onboarding({
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;
}

List<Onboarding> onboardingList = [
  Onboarding(
    image: AppImages.onboarding1,
    title: 'An Actual notebook in your pocket',
    description:
        'Take notes quickly and easily. Get your ideas penned down, where ever '
        'and when ever',
  ),
  Onboarding(
    image: AppImages.onboarding2,
    title: 'Great way to collaborate and share',
    description:
        'Now you can save and access your notes online. collaborate and share '
        'your notes with friends or circles',
  ),
];
