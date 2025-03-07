part of '../screen/login_view.dart';

class _AuthButton extends StatelessWidget {
  const _AuthButton({
    required this.onPressed,
    required this.title,
  });

  final void Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
            minimumSize: WidgetStateProperty.all(
              Size(192.w, 56.h),
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
      child: Text(
        title,
      ),
    );
  }
}
