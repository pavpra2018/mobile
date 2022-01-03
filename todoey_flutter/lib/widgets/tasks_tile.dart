import 'package:flutter/material.dart';

class TasksTile extends StatefulWidget {
  final String title;
  final bool isChecked;
  final Function checkboxcallback;
  final VoidCallback longPresscallback;

  const TasksTile({
    required this.title,
    required this.isChecked,
    required this.checkboxcallback,
    required this.longPresscallback,
    Key? key,
  }) : super(key: key);

  @override
  State<TasksTile> createState() => _TasksTileState();
}

class _TasksTileState extends State<TasksTile> {
  late bool _isChecked;

  @override
  void initState() {
    _isChecked = widget.isChecked;
    super.initState();
  }

  // void checkboxCallback(bool newValue) {
  //   setState(() {
  //     _isChecked = newValue;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: widget.longPresscallback,
      title: Text(
        widget.title,
        style: TextStyle(
            decoration: _isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: _isChecked,
        onChanged: (value) {
          widget.checkboxcallback(value);
          setState(() {
            _isChecked = value!;
          });
        },
      ),
    );
  }
}

// class TaskCheckBox extends StatelessWidget {
//   final bool checkboxState;
//   final VoidCallback toggleState;

//   TaskCheckBox({required this.checkboxState, required this.toggleState});

//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//         value: checkboxState,
//         activeColor: Colors.lightBlueAccent,
//         onChanged: toggleState);
//   }
// }
