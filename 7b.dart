import 'package:flutter/material.dart';
void main()=>runApp(MaterialApp(home:DancePage(),debugShowCheckedModeBanner:false));
class DancePage extends StatefulWidget{@override _DancePageState createState()=>_DancePageState();}
class _DancePageState extends State<DancePage>{
final f=GlobalKey<FormState>();String? n,g,s,p;
@override Widget build(BuildContext c)=>Scaffold(
body:Container(decoration:BoxDecoration(gradient:LinearGradient(colors:[Colors.pinkAccent,Colors.lightBlueAccent])),
child:Center(child:Card(shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
elevation:10,margin:EdgeInsets.all(20),child:Padding(padding:EdgeInsets.all(16),
child:Form(key:f,child:Column(mainAxisSize:MainAxisSize.min,children:[
Text("💃 Dance Registration",style:TextStyle(fontSize:20,color:Colors.purple,fontWeight:FontWeight.bold)),
TextFormField(decoration:InputDecoration(labelText:"Name",prefixIcon:Icon(Icons.person,color:Colors.purple)),
onChanged:(v)=>n=v,validator:(v)=>v!.isEmpty?"Enter name":null),
DropdownButtonFormField(value:g,hint:Text("Gender"),items:['Male','Female','Other']
.map((e)=>DropdownMenuItem(value:e,child:Text(e))).toList(),
onChanged:(v)=>setState(()=>g=v),validator:(v)=>v==null?"Select gender":null),
TextFormField(decoration:InputDecoration(labelText:"Dance Style",prefixIcon:Icon(Icons.music_note,color:Colors.purple)),
onChanged:(v)=>s=v,validator:(v)=>v!.isEmpty?"Enter style":null),
TextFormField(decoration:InputDecoration(labelText:"Phone",prefixIcon:Icon(Icons.phone,color:Colors.purple)),
keyboardType:TextInputType.phone,onChanged:(v)=>p=v,validator:(v)=>v!.length<10?"Enter valid":null),
SizedBox(height:15),ElevatedButton(style:ElevatedButton.styleFrom(backgroundColor:Colors.purple),
onPressed:(){if(f.currentState!.validate())showDialog(context:c,builder:(_)=>AlertDialog(
title:Text("✅ Success"),content:Text("$n | $g | $s | $p")));},
child:Text("Submit",style:TextStyle(color:Colors.white)))
])))))));}
