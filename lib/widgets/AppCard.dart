import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppCard extends StatefulWidget {
  final Map<String, String> keyValuePair;

  AppCard({Key? key, required this.keyValuePair}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlue[50],
      borderOnForeground: true,
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)) ,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Icon(
                      Icons.sports_soccer,
                      size: 14,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                    child: Text('Entry A : the value',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          letterSpacing: 2.0,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        )),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Icon(
                      Icons.sports_soccer,
                      size: 14,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                    child: Text('Entry B : the value',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          letterSpacing: 2.0,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        )),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Icon(
                      Icons.sports_soccer,
                      size: 14,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                    child: Text('Entry C : the value',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          letterSpacing: 2.0,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        )),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Icon(
                      Icons.sports_soccer,
                      size: 14,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                    child: Text('Entry D : the value',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          letterSpacing: 2.0,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        )),
                  )
                ],
              ),
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
