import 'package:election_2566_poll/pages/my_scaffold.dart';
import 'package:flutter/material.dart';

class PollResultsPage extends StatelessWidget {
  const PollResultsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBar: AppBar(title: const Text('ผลโหวต')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // todo: Add your UI by replacing this Container()
        // คือชุดของหน้าจอ หน้าเว็บ และองค์ประกอบแบบรูปภาพต่างๆ เช่น ปุ่มและไอคอน ซึ่งจะช่วยให้บุคคลสามารถโต้ตอบกับผลิตภัณฑ์หรือบริการได้
        child: Container(),
      ),
    );
  }
}
