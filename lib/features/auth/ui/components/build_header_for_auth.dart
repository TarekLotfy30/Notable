part of '../screen/login_view.dart';

class BuildHeaderForAuth extends StatelessWidget {
  const BuildHeaderForAuth({super.key, 
    required this.title,
    required this.image,
  });

  final String title;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppImages.login,
          fit: BoxFit.contain,
          height: 250.h,
        ),
        verticalSpacing(20),
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyles.textStyle32.copyWith(
            fontWeight: FontWeightHelper.extraBold,
          ),
        ),
      ],
    );
  }
}
