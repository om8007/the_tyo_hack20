import 'dart:convert';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saving the Planet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Saving the Planet'),
        ),
        body: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString('assets/data.json'),
          builder: (context, snapshot) {
            // Decode the JSON
            var pointsData = json.decode(snapshot.data.toString());
            return ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  height: 180,
                  child: Flexible(
                    child: Card(
                      margin: EdgeInsets.all(10),
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              minRadius: 30,
                              backgroundColor: Colors.orange,
                              child: Text(
                                (index + 1).toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      pointsData[index]['heading'],
                                      maxLines: 2,
                                      overflow: TextOverflow.fade,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    pointsData[index]['details'],
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 4,
                                    softWrap: true,
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: pointsData == null ? 0 : pointsData.length,
            );
          },
        ),
      ),
    );
  }
}
