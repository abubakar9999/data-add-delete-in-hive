import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class DetelsPage extends StatefulWidget {
  DetelsPage({Key? key,this.data}) : super(key: key);
 List? data;

  @override
  State<DetelsPage> createState() => _DetelsPageState();
}

class _DetelsPageState extends State<DetelsPage> {
  Box?detelsBox;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    detelsBox=Hive.box("detels-box");
    detelsBox!.addAll(widget.data!.toList());
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        
        itemCount: detelsBox!.length,
        itemBuilder: (context,index)=>Card(
        child: ListTile(title: Text(detelsBox!.getAt(index).toString()),
        trailing: Container(
          width: 50,
          child:IconButton(icon: Icon(Icons.delete),onPressed: (){
            setState(() {
              detelsBox!.deleteAt(index);
            });
          },)
        ),
        
        
        ),
      )),

    );
  }
}