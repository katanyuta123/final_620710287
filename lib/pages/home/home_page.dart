import 'package:election_2566_poll/services/api.dart';
import 'package:flutter/material.dart';

import '../../models/poll.dart';
import '../my_scaffold.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Poll>? _polls;
  var _isLoading = false;
  bool _isError = false;
  String _errMessage = '';



  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    // todo: Load list of polls here
    setState(() {
      _isLoading = true;
      _isError = false;
    });

    await Future.delayed(const Duration(seconds: 3), () {});

    try {
      var result = await ApiClient().getAllPolls();
      setState(() {
        _polls = result;
      });
    } catch (e) {
      setState(() {
        _errMessage = e.toString();
        _isError = true;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: Column(
        children: [
          Image.network('https://cpsu-test-api.herokuapp.com/images/election.jpg'),
          Expanded(
            child: Stack(
              children: [
                if (_polls != null) _buildList(),
                if (_isLoading) _buildProgress(),
              ],
            ),
          ),
        ],
      ),
    );
  }

 /* ListView _buildList() {
    return ListView.builder(
      itemCount: _polls!.length,
      itemBuilder: (BuildContext context, int index) {
        return Text(_polls![index].id.toString()+" "+_polls![index].question+" "+_polls![index].choices.toString());

      },
    );
  }*/

  ListView _buildList() {
    return ListView.builder(
      itemCount: _polls!.length,
      itemBuilder: (BuildContext context, int index) {

        return Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                 Column(
                   children: [
                     Row(
                       children: [
                             Text(_polls![index].id.toString()+". "+_polls![index].question),
                       ],
                     ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),

                      child: ElevatedButton(
                        onPressed: () {

                        },
                        child:  Text(_polls![index].choices[index].toString()),
                      ),

                    ),
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: ElevatedButton(onPressed: (){

                       },
                           child:  Text('ดูผลโหวต'),
                       ),
                     ),
                  ],
                ),
            ),
            //_polls![index].choices.toString());
        );
      },
    );
  }

  Widget _buildProgress() {
    return Container(
      color: Colors.black.withOpacity(0.6),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            CircularProgressIndicator(color: Colors.white),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('รอสักครู่', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
