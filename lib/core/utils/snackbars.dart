import 'package:flutter/material.dart';

class MySnackbars {
  static error(BuildContext context, String textError) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        dismissDirection: DismissDirection.horizontal,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.redAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        content: ListTile(
          // dense: true,
          contentPadding: EdgeInsets.zero,
          title: Text(
            "Error",
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: Colors.white),
          ),
          subtitle: Text(
            textError,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        margin: const EdgeInsets.all(5.0),
      ),
    );
  }

  static success(BuildContext context, String textSuccess) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        dismissDirection: DismissDirection.horizontal,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.yellowAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        content: ListTile(
          // dense: true,
          contentPadding: EdgeInsets.zero,
          leading: const Icon(
            Icons.check_circle,
            color: Colors.white,
            size: 45.0,
          ),
          title: Text(
            "Success",
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: Colors.white),
          ),
          subtitle: Text(
            textSuccess,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        margin: const EdgeInsets.all(5.0),
      ),
    );
  }
}
