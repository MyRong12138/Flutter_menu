import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
        ),
        body: new MenuWidget(),
      ),
    );
  }
}

class MenuWidget extends StatefulWidget {
  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}


class _MenuWidgetState extends State<MenuWidget> with SingleTickerProviderStateMixin{


  int groupValue=1;

  List menuList =[
    {
      "title1": "菜单一",
      "title2": "说明",
      "type":0,
    },
    {
      "title1": "菜单二",
      "title2": "说明",
      "type":1
    },
    {
      "title1": "菜单三",
      "title2": "说明",
      "type":2
    },
    {
      "title1": "菜单一",
      "title2": "说明",
      "type":3
    },
    {
      "title1": "菜单四",
      "title2": "说明",
      "type":4
    },
    {
      "title1": "菜单五",
      "title2": "说明",
      "type":5
    },
    {
      "title1": "菜单六",
      "title2": "说明",
      "type":6
    },
    {
      "title1": "菜单七",
      "title2": "说明",
      "type":7
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      // 内容
      slivers: <Widget>[
        new SliverPadding(
          padding: const EdgeInsets.all(0.0),
          sliver: new SliverList(
            delegate: new SliverChildListDelegate(
              <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .center,
                    children: <Widget>[

                      Container(
                        //height: 120.0,
                        width: double.maxFinite,
                        margin: EdgeInsets.only(top: 20.0,
                            left: 0.0,
                            bottom: 0.0), //容器外填充
                        padding: EdgeInsets.only(top: 0.0,
                            left: 30.0,
                            right: 20.0,
                            bottom: 0.0), //容器内填充
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .center,
                              children: <Widget>[
                                menuListItem(context,menuList[0]),
                                menuListItem(context,menuList[1]),
                                menuListItem(context,menuList[2]),
                                menuListItem(context,menuList[3]),
                                menuListItem(context,menuList[4]),
                                menuListItem(context,menuList[5]),
                                menuListItem(context,menuList[6]),
                                menuListItem(context,menuList[7]),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .center,
                              children: <Widget>[
                                dataListItem(context),
                              ],
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
  Widget menuListItem(context,value) {
    print(value['type']);
    return groupValue==value['type'] ?
    Container(
      height: 77.0,
      width: 120,
      child: FlatButton(
          onPressed: (){
            updateGroupValue(value['type']);
          },
          child:Text.rich(TextSpan(
              children: [
                TextSpan(
                  text: value['title1'],
                  style: TextStyle(
                    color: Color(0xFFFA3F3F),
                    fontSize: 14,
                  ),
                ),
                TextSpan(
                  text: "\n"+value['title2'],
                  style: TextStyle(
                    color: Color(0xFF999999),
                    fontSize: 12,
                  ),
                ),
              ]
          ))
        /*Text(value['title1'],style: TextStyle(color: Colors.red),),*/
      ),
    )
        :
    Container(
      height: 77.0,
      width: 120,
      child: FlatButton(
          color: Colors.white,
          onPressed: (){
            updateGroupValue(value['type']);
          },
          child:Text.rich(TextSpan(
              children: [
                TextSpan(
                  text: value['title1'],
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                TextSpan(
                  text: "\n"+value['title2'],
                  style: TextStyle(
                    color: Color(0xFF999999),
                    fontSize: 12,
                  ),
                ),
              ]
          ))
        /*Text(value['title1'],style: TextStyle(color: Colors.red),),*/
      ),
    );
  }
  Widget dataListItem(context) {
    return Text("这是菜单的内容："+groupValue.toString(), style: TextStyle(fontSize: 30.0),);
  }
  void updateGroupValue(int v){
    setState(() {
      groupValue=v;
    });
  }
}
