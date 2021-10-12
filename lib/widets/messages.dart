import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

successMessage(BuildContext context, String msg) {
  showTopSnackBar(
    context,
    CustomSnackBar.success(
      message: msg,
    ),
  );
}

errorMessage(BuildContext context, String msg) {
  showTopSnackBar(
    context,
    CustomSnackBar.error(
      message: msg,
    ),
  );
}
