import 'package:flutter/material.dart';

class AttributeButton extends StatefulWidget {
  const AttributeButton({super.key, required this.name});

  final String name;

  @override
  State<AttributeButton> createState() => _AttributeButtonState();
}

class _AttributeButtonState extends State<AttributeButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        setState(() {
          isSelected = !isSelected;
        });
        print(isSelected); //////////////////////////////////////////////////////////////////////////////////////
      },
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(vertical: 12, horizontal: 24)),
        backgroundColor: isSelected
            ? const MaterialStatePropertyAll<Color>(Colors.pink)
            : const MaterialStatePropertyAll<Color>(Color(0xffededed)),
      ),
      child: Text(
        widget.name,
        style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.normal),
      ),
    );
  }
}
