import 'package:flutter/material.dart';

ElevatedButton elevatedButton(final VoidCallback func) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      // Padding inside the button
      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      // Text style
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    onPressed: func,
    child: const Text('Generate New Image'),
  );
}
