import 'package:flutter/material.dart';

ElevatedButton elevatedButton({
  required VoidCallback onPressed,
  required String label,
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
      // Button background color
      foregroundColor: Colors.white,
      // Text color
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    onPressed: onPressed,
    child: Text(label),
  );
}
