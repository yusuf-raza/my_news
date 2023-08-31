import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/utils/route_names.dart';
import 'package:news_app/utils/utils.dart';

class TopicForm extends StatefulWidget {
  const TopicForm({super.key});

  @override
  State<TopicForm> createState() => _TopicFormState();
}

class _TopicFormState extends State<TopicForm> {
  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Utils utils = Utils();



  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.all(16.0), // Adjust the padding as needed
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please enter a topic';
                }
                return null;
              },
              textInputAction: TextInputAction.done,
              style: const TextStyle(
                color: Colors.blue, // Customize text color
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
                  if (kDebugMode) {
                    print(_controller.text.toString());
                  }
                  if (_formKey.currentState!.validate()) {
                    GoRouter.of(context).pop();
                    String topicForNews = _controller.text;
                    //GoRouter.of(context).go('/topicalNewsScreen/$topicForNews');
                    GoRouter.of(context).goNamed(RouteNames.topicalNewsScreen, pathParameters: { 'topicForNews' : topicForNews});
                  }
                },
                child: const Text(
                  'get news',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
