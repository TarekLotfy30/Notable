import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors/app_colors.dart';
import '../utils/typography/app_text_styles.dart';

/// Shows a SnackBar with the provided [message] and optional [action].

Future<void> showSuccessSnackBar(
  BuildContext context,
  String message, {
  String? action,
}) async {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.successColor,
            ),
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.check,
              color: AppColors.darkSuccessColor,
              size: 20.sp,
            ),
          ),
          Text(
            message,
            style: AppTextStyles.textStyle16.copyWith(
              color: AppColors.darkSuccessColor,
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.lightSuccessColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      duration: const Duration(seconds: 900),
      margin: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 20.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 10.h,
      ),
      dismissDirection: DismissDirection.horizontal,
      action: action != null
          ? SnackBarAction(
              label: action,
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            )
          : null,
      clipBehavior: Clip.antiAlias,
    ),
  );
}

Future<void> showErrorSnackBar(
  BuildContext context,
  String message, {
  String? action,
}) async {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.errorColor,
            ),
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.error_outline,
              color: AppColors.darkErrorColor,
              size: 20.sp,
            ),
          ),
          Text(
            message,
            style: AppTextStyles.textStyle16.copyWith(
              color: AppColors.darkErrorColor,
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.lightErrorColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      duration: const Duration(seconds: 900),
      margin: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 20.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 10.h,
      ),
      dismissDirection: DismissDirection.horizontal,
      action: action != null
          ? SnackBarAction(
              label: action,
              textColor: AppColors.errorColor,
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            )
          : null,
      clipBehavior: Clip.antiAlias,
    ),
  );
}

Future<void> showWarningSnackBar(
  BuildContext context,
  String message, {
  String? action,
}) async {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.warningColor,
            ),
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.warning_amber,
              color: AppColors.darkWarningColor,
              size: 20.sp,
            ),
          ),
          Text(
            message,
            style: AppTextStyles.textStyle16.copyWith(
              color: AppColors.darkWarningColor,
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.lightWarningColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      duration: const Duration(seconds: 900),
      margin: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 20.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 10.h,
      ),
      dismissDirection: DismissDirection.horizontal,
      action: action != null
          ? SnackBarAction(
              label: action,
              textColor: AppColors.warningColor,
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            )
          : null,
      clipBehavior: Clip.antiAlias,
    ),
  );
}

/*
// Success
showSuccessSnackBar(context, "Operation completed successfully");

// Error
showErrorSnackBar(context, "An error occurred", action: "Retry");

// Warning
showWarningSnackBar(context, "Proceed with caution", action: "Dismiss");
*/
