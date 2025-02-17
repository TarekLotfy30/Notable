import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../utils/colors/app_colors.dart';
import '../utils/typography/app_text_styles.dart';

/// Returns a vertical spacing box with [height].
SizedBox verticalSpacing(double height) => SizedBox(height: height.h);

/// Returns a horizontal spacing box with [width].
SizedBox horizontalSpacing(double width) => SizedBox(width: width.w);

/// Shows a date picker dialog and returns the selected date.

/// Shows a SnackBar with the provided [message] and optional [action].
Future<void> showSnackBar(
    BuildContext context, String message, Color backgroundColor,
    {String? action}) async {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: AppTextStyles.textStyle16,
      ),
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      duration: const Duration(seconds: 1),
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
              onPressed: () =>
                  ScaffoldMessenger.of(context).hideCurrentSnackBar(),
            )
          : null,
    ),
  );
}

Future<DateTime?> datePicker({
  required BuildContext context,
  TextEditingController? textEditingController,
}) {
  return showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2019, 5, 21),
    lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
    builder: (context, child) {
      return Theme(
        data: ThemeData.light().copyWith(
          colorScheme: const ColorScheme.light(
            primary: AppColors.primaryColor, // change to your desired color
            onPrimary: Colors.white, // change to your desired color
          ),
          buttonTheme: const ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
          ),
        ),
        child: child!,
      );
    },
  ).then(
    (value) {
      //2024-03-03 => api
      //3/3/2024 => ui
      if (value != null) {
        textEditingController?.text =
            convertUIDateToAPIFormat(DateFormat.yMd().format(value));
      }
      return value;
    },
  );
}

String convertUIDateToAPIFormat(String uiDate) {
  // Define the input format for the UI date
  final uiDateFormat = DateFormat('M/d/yyyy');

  // Parse the UI date string
  final DateTime parsedDate = uiDateFormat.parse(uiDate);

  // Define the output format for the API date
  final apiDateFormat = DateFormat('yyyy-MM-dd');

  // Format the parsed date into the API format
  final String apiDate = apiDateFormat.format(parsedDate);

  return apiDate;
}

Future<void> showGenericDialog(
  BuildContext context, {
  required Widget Function(BuildContext, Animation<double>, Animation<double>)
      pageBuilder,
}) {
  return showGeneralDialog(
    context: context,
    transitionDuration: const Duration(milliseconds: 500),
    pageBuilder: (ctx, anim1, anim2) => pageBuilder(ctx, anim1, anim2),
    transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
      filter:
          ImageFilter.blur(sigmaX: 3 * anim1.value, sigmaY: 3 * anim1.value),
      child: FadeTransition(
        opacity: anim1,
        child: child,
      ),
    ),
    barrierDismissible: false,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
  );
}
