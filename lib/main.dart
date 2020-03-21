import 'package:flutter/material.dart';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString("data/data.json"),
          builder: (BuildContext context,snapshot){
            var mydata = jsonDecode(snapshot.data.toString());

            return ListView.builder(
              itemCount: mydata.length,
                itemBuilder: (context,int index){
              return Card(
                child: GestureDetector(
                  child: ListTile(
                    title: Text("${mydata[index]['name']}"),
                    subtitle: Text("${mydata[index]['age']}"),
                  ),
                  onTap: (){
                    print("${mydata[index]['name']}");
                  },
                ),
              );
            });

          },
        )
      )
    );
  }
}
