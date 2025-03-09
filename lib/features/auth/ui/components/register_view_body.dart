part of '../screens/register_view.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        children: [
          const BuildHeaderForAuth(
            image: AppImages.register,
            title: 'Register',
          ),
          verticalSpacing(12),
          //LoginForm(),
          verticalSpacing(12),
          AuthButton(
            onPressed: () {},
            title: 'Register',
          ),
          verticalSpacing(12),
        ],
      ),
    );
  }
}
