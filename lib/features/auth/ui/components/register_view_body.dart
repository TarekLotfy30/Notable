part of '../screen/register_view.dart';

class _RegisterViewBody extends StatelessWidget {
  const _RegisterViewBody();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        children: [
          _BuildHeaderForAuth(
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
