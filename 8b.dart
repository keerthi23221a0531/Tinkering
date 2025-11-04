import 'package:flutter/material.dart';
void main()=>runApp(MaterialApp(home:HelloHeart(),debugShowCheckedModeBanner:false));

class HelloHeart extends StatefulWidget{ @override _HelloHeartState createState()=>_HelloHeartState(); }

class _HelloHeartState extends State<HelloHeart> with SingleTickerProviderStateMixin{
  late AnimationController c; String t="fade";
  @override void initState(){
    super.initState();
    c=AnimationController(vsync:this,duration:Duration(seconds:6))..repeat(reverse:true); // slower speed
  }

  Widget anim(Widget w)=>t=="fade"?FadeTransition(opacity:c,child:w)
    :t=="slide"?SlideTransition(position:Tween(begin:Offset(0,-1),end:Offset(0,1)).animate(c),child:w)
    :t=="scale"?ScaleTransition(scale:c,child:w)
    :RotationTransition(turns:c,child:w);

  @override Widget build(BuildContext ctx)=>Scaffold(
    backgroundColor:Colors.black,
    body:Column(mainAxisAlignment:MainAxisAlignment.center,children:[
      Expanded(child:Center(child:anim(Stack(alignment:Alignment.center,children:[
        Icon(Icons.favorite,color:Colors.red,size:180),
        Text("Hello",style:TextStyle(color:Colors.white,fontSize:30,fontWeight:FontWeight.bold))
      ])))),
      Wrap(children:["fade","slide","scale","rotate"].map((n)=>Padding(
        padding:EdgeInsets.all(4),
        child:ElevatedButton(onPressed:()=>setState(()=>t=n),child:Text(n))
      )).toList())
    ]),
  );
}
