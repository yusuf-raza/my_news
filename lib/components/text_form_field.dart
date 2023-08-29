import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PaddingTextFieldForm extends StatefulWidget {
  const PaddingTextFieldForm({super.key});

  @override
  State<PaddingTextFieldForm> createState() => _PaddingTextFieldFormState();
}

class _PaddingTextFieldFormState extends State<PaddingTextFieldForm> {
  final TextEditingController _controller = TextEditingController();
  //final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Adjust the padding as needed
      child: Column(
        children: [
          TextFormField(
            style: const TextStyle(
              color:Colors.blue, // Customize text color
            ),
            cursorColor: Colors.blue,
            autocorrect: true,
            controller: _controller,
            decoration: const InputDecoration(
              focusColor: Colors.blue,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue)),
              labelText: 'enter any topic',
              labelStyle: TextStyle(
                color: Colors.blue,
              ),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16.0),
          // Add some spacing between the text field and other content
          Container(
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(10)),
            child: TextButton(
              onPressed: () {

              },
              child: const Text(
                'get news',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
