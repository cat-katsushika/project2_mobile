import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          showDragHandle: true,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return const BottomSheetForm();
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }
}

class BottomSheetForm extends StatefulWidget {
  const BottomSheetForm({Key? key}) : super(key: key);

  @override
  _BottomSheetFormState createState() => _BottomSheetFormState();
}

class _BottomSheetFormState extends State<BottomSheetForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 40.0,
          right: 20.0,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                '新規チーム作成',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Row(
                children: <Widget>[
                  const Icon(Icons.people),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Team Name',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  const Icon(Icons.people),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Description',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(height: 160.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FilledButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                    child: const Text('作成'),
                  ),
                ],
              ),
              const SizedBox(height: 50.0),
            ],
          ),
        ));
  }
}
