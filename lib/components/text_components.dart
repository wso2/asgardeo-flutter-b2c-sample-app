import 'package:flutter/material.dart';

class DisplayText extends StatelessWidget{
  final String content;
  final double gap;

  const DisplayText(this.content, this.gap, {super.key});

  @override
  Widget build(BuildContext context) {
  return Column(
    children: [
      Text(
        content,
        maxLines: 2,
        softWrap: true,
        style: const TextStyle(fontSize: 18),
      ),
      SizedBox(height: gap),
    ],
  );
  }

}

class DisplayLabel extends StatelessWidget{
  final String content;
  final double gap;

  const DisplayLabel(this.content, this.gap, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(content, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: gap),
      ],
    );
  }

}

class EditText extends StatelessWidget{
  final String label;
  final TextEditingController controller;

 const EditText(this.label, this.controller, {super.key});
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left:35, bottom: 10, right: 30, top:0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, textAlign: TextAlign.start, style:const TextStyle(fontSize: 16) ,),
            const SizedBox(height: 8),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  )
              ),
            ),
          ]
      ),
    );
  }

}
