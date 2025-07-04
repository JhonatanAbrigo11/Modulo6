import 'package:flutter/material.dart';

class SearchBarGeneral extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final void Function(String) onChanged;
  final String nameSearch;

  const SearchBarGeneral({
    required super.key,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    required this.nameSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        autofocus: false,
        onChanged: (value) {
          final query = value.trim();
          onChanged(query); // pasamos el valor limpio al callback
        },
        decoration: InputDecoration(
          hintText: nameSearch,
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          filled: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        ),
      ),
    );
  }
}
