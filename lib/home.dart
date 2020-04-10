import 'package:flutter/material.dart';
import 'package:flutter_app/addResturants.dart';
import 'package:flutter_app/content_scroll.dart';
import 'package:flutter_app/resturant_screen.dart';
import 'package:flutter_app/resturants.dart';

import 'login.dart';
class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  PageController _pagecontroller;
  @override
  void initState(){
    super.initState();
    _pagecontroller=PageController(initialPage: 1,viewportFraction: 0.8);
  }
  _resturantSelector(int index){
    return AnimatedBuilder(
      animation: _pagecontroller,
      builder: (BuildContext context,Widget widget ){
        double value=1;
        if(_pagecontroller.position.haveDimensions){
          value= _pagecontroller.page - index;
          value=(1-(value.abs()*0.3)+0.6).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value)*270,
            width: Curves.easeInOut.transform(value)*400,
            child: widget,
        ),
        );
        },
      child: GestureDetector(
        onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
        builder: (_) => ResturantScreen(Resturant: resturants[index]),
    ),
    ),
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(color: Colors.black54,offset:Offset(0.0,4.0),
                    blurRadius: 10.0
                  )
                ]
              ),
              child: Center(
                child: Hero(
                  tag: resturants[index].imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image(
                      image: AssetImage(resturants[index].imageUrl),
                      height: 220.0,
                      fit: BoxFit.cover,

                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 30.0,
            bottom: 40.0,
            child: Container(
              width: 250.0,
              child: Text(
                resturants[index].title.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration:BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("images/af.jpg")
                )
      ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 120,
                      height: 120,
                      decoration:  BoxDecoration(
                        shape: BoxShape.circle,
                        image:  DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("images/ad.jpg")
                        )
                      ),
                    ),
                  ],
                ),
              ),

    ),

            listTile(Icons.person,"Profile",()=>{}),
            listTile(Icons.notifications,"Notifications",()=>{

            }),
            listTile(Icons.add ,"Add Resturants" ,()=>{
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => addRes()))
            }),
            listTile(Icons.settings,"Setting",()=>{}),
            listTile(Icons.lock,"Log out",()=>{
            Navigator.push(context, MaterialPageRoute(
            builder: (context) => loginpage()))
            }),



    ]
      )
      ),
      appBar: AppBar(
        title: Text("Rate Restro"),
        backgroundColor: Colors.deepPurple,

        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.search), onPressed: null)

        ],

      ),
      body :ListView(
        children: <Widget>[
          Container(
            height: 280,
            width: double.infinity,
            child: PageView.builder(
              controller: _pagecontroller,
              itemCount: resturants.length,
              itemBuilder: (BuildContext context,int index){
                return _resturantSelector(index);
              },
            ),
          ),
          Container(
            height: 90.0,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              scrollDirection: Axis.horizontal,
              itemCount: labels.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(10.0),
                  width: 160.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFFD45253),
                        Color(0xFF9E1F28),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF9E1F28),
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Center(
                    child: InkWell(


                        child: Text(
                            labels[index].toUpperCase(),

                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.8,
                            ),
                          ),
                      onTap: ()=>
                      {
                        print("Tapped")

                      },
                      splashColor: Colors.white,
                      ),

                  ),

                );
              },
            ),
          ),
          SizedBox(height: 20.0),
          ContentScroll(
            images: myList,
            title: 'My List',
            imageHeight: 250.0,
            imageWidth: 150.0,
          ),
          SizedBox(height: 10.0),
          ContentScroll(
            images: popular,
            title: 'Popular',
            imageHeight: 250.0,
            imageWidth: 150.0,
          ),


        ],
      )
    );
  }
}
class listTile extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;

  listTile(this.icon,this.text,this.onTap);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.white70))
        ),
        child: InkWell(
          onTap: onTap,
          splashColor: Colors.pinkAccent,
          child: Container(
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(icon),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(text,style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,

                  ),),
                ),
                Icon(Icons.arrow_right)
              ],
            ),
          ),

        ),
      ),
    );
  }
}

