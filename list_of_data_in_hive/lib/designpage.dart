import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import 'package:list_of_data_in_hive/detels.dart';

class HomePageHive extends StatefulWidget {
  const HomePageHive({Key? key}) : super(key: key);

  @override
  State<HomePageHive> createState() => _HomePageHiveState();
}

class _HomePageHiveState extends State<HomePageHive> {
  List mydata=[
    "Bangaladesh","India","Pakistan","AUS","Napal","Afganistan","PNG"

  ];
  List tempList=[];
    List<bool>? _isChecked;
  Box? listBox;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listBox=Hive.box("data-box");
    listBox!.addAll(mydata);
     _isChecked = List<bool>.filled(mydata.length, false);
    

  
    
    

  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hive practice"),
      ),
body: Column(
  children: [
        SizedBox(
          height: 400,
          child: ListView.builder(
            
              itemCount: mydata.length,
            
              
            
              itemBuilder: (context,index)=>CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
            
          title: Text(listBox!.getAt(index).toString()),
            
          
            
          value: _isChecked![index], onChanged: (val){
            
            setState(() {
            
              _isChecked![index]=val!;
            
              if( _isChecked![index]==true){
            
                tempList.add(listBox!.getAt(index).toString());
            
              }else{
            
                tempList.length--;
            
              }
            
            });
            
          })
            
            
            
              
            
              ),
        ),

            Text(tempList.length.toString(),style: TextStyle(fontSize: 16),),

       ElevatedButton(onPressed: (){
           

            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetelsPage(data: tempList,)));
          }, child: Text("Send")),
          
         





  ],
)
    );
    
  }
}