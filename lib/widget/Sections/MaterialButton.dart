import 'package:flutter/material.dart';

class MaterialButtoN extends StatefulWidget {
  final String text;
  final void Function() ontape;

  const MaterialButtoN({
    required this.text,
    required this.ontape,
  });

  @override
  _MaterialButtoNState createState() => _MaterialButtoNState();
}

class _MaterialButtoNState extends State<MaterialButtoN> {
  bool _isButtonDisabled = false;

  void _handleTap() {
    if (!_isButtonDisabled) {
      widget.ontape();
      setState(() {
        _isButtonDisabled = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          MaterialButton(
            minWidth: double.infinity,
            height: 50,
            onPressed: _isButtonDisabled ? null : _handleTap,
            color: _isButtonDisabled
                ? Colors.grey.shade400
                : const Color.fromARGB(255, 255, 255, 255),
            textColor: const Color.fromARGB(255, 0, 0, 0),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              widget.text,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
