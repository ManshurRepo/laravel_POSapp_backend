// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fic11_starter_pos/core/components/spaces.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
    Key? key,
    this.value,
    required this.items,
    required this.label,
    this.onChanged,
  }) : super(key: key);

  final String? value;
  final List<String> items;
  final String label;
  final Function(String? value)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SpaceHeight(12.0),
        DropdownButtonFormField<String>(
            value: value,
            onChanged: onChanged,
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: const BorderSide(color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: const BorderSide(color: Colors.grey),
                ),
            ),
            ),
      ],
    );
  }
}
