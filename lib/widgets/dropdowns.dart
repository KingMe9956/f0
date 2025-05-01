import 'package:flutter/material.dart';

class CustomDropdownExample extends StatefulWidget {
  @override
  _CustomDropdownExampleState createState() => _CustomDropdownExampleState();
}

class _CustomDropdownExampleState extends State<CustomDropdownExample> {
  String? selectedWidget = 'Flutter Widget';
  String? selectedStyle = 'Material Design';

  final widgetOptions = ['Flutter Widget', 'StatelessWidget', 'StatefulWidget'];
  final styleOptions = ['Material Design', 'Cupertino', 'Custom'];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // First dropdown
        Expanded(
          child: _buildDropdown(
            value: selectedWidget!,
            options: widgetOptions,
            onChanged: (val) => setState(() => selectedWidget = val),
          ),
        ),
        SizedBox(width: 16),
        // Second dropdown
        Expanded(
          child: _buildDropdown(
            value: selectedStyle!,
            options: styleOptions,
            onChanged: (val) => setState(() => selectedStyle = val),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown({
    required String value,
    required List<String> options,
    required ValueChanged<String> onChanged,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Color(0xFF1E2733),
        borderRadius: BorderRadius.circular(6),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          icon: Icon(Icons.keyboard_arrow_down, color: Colors.white70),
          dropdownColor: Color(0xFF2A3441),
          style: TextStyle(color: Colors.white),
          items: options.map((opt) {
            return DropdownMenuItem<String>(
              value: opt,
              child: Text(opt),
            );
          }).toList(),
          onChanged: (newVal) {
            if (newVal != null) onChanged(newVal);
          },
        ),
      ),
    );
  }
}
