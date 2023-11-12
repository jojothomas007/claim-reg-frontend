import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppCard extends StatefulWidget {
  final List<String> valueList;

  AppCard({Key? key, required this.valueList}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppCardState(valueList);
}

class _AppCardState extends State<AppCard> {
  late List<String> valueList;
  _AppCardState(this.valueList);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlue[50],
      borderOnForeground: true,
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: valueList?.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Icon(
                          Icons.sports_soccer,
                          size: 14,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                        child: Text(valueList[index].toString(),
                            style: const TextStyle(
                              color: Colors.blueGrey,
                              letterSpacing: 2.0,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            )),
                      )
                    ],
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('EDIT'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('DELETE'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
