import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  PersistentBottomSheetController? _controller = null;
  var _isVisible = true;

  void openEndDrawer(){
    scaffoldKey.currentState!.openEndDrawer();
  }

  void openBottomSheet(){

   
    // ignore: unnecessary_null_comparison
    if(_controller == null){


      _controller = scaffoldKey.currentState!.showBottomSheet(
        
        (context) => Container(
          
          height: 140,
          decoration:const BoxDecoration(
            color: Color.fromRGBO(242, 242, 242, 1),
            boxShadow:[
              BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.3),
              blurRadius: 10,
              spreadRadius: 1,
              offset: Offset(0, 1)
              
            )],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    // ignore: prefer_const_literals_to_create_immutables
                    Row(children: [
                      const Icon(Icons.credit_card),
                      const SizedBox(width: 10),
                      const Text('Сумма'),
                    ],),
                    
                    Text('200 KZT')
                  ],
                ),
              ),

              ElevatedButton(onPressed: (){
                
                Navigator.pop(context);
                
              }, child:const Text('Оплатить'))
            ],
          ),
          
        ));
    } else{
      
      _controller!.close();
      // ignore: unnecessary_null_comparison
      _controller = null;
   
      
    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Homework App'),
        centerTitle: false,
        actions: [
          IconButton(onPressed: (){
            openEndDrawer();
          }, icon:const Icon(Icons.person)),
        ],

      ),

      drawer: Drawer(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          // ignore: prefer_const_constructors
          children:  [
            
            const DrawerHeader(
              
              child: CircleAvatar(
                radius: 60,
                backgroundImage:  NetworkImage('https://instagram.fala6-1.fna.fbcdn.net/v/t51.2885-19/s320x320/241139279_405868381266776_443658724050377629_n.jpg?_nc_ht=instagram.fala6-1.fna.fbcdn.net&_nc_cat=108&_nc_ohc=6jEZD0UAot0AX9ZcWkm&tn=ffwAhYcteTpBfjvn&edm=ABfd0MgBAAAA&ccb=7-4&oh=00_AT-uX4dsBI0kOmXAQapX1lq7vxVVwui6Kb177TGixRL1CQ&oe=62114751&_nc_sid=7bff83'),
              ),
            ),
            const ListTile(
              title: Text('Home'),
              leading:  Icon(Icons.home),
              trailing:  Icon(Icons.arrow_forward_ios_sharp),
            ),
            const ListTile(
              title: Text('Profile'),
              leading: Icon(Icons.person),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
            ),
            const ListTile(
              title: Text('Images'),
              leading:  Icon(Icons.image),
              trailing:  Icon(Icons.arrow_forward_ios_sharp),
            ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                              // Respond to button press
                                },
                                child: Text('Выход'),
                              ),
                            ElevatedButton(
                                onPressed: () {
                              // Respond to button press
                                },
                                child: Text('Регистрация'),
                              ),
                            
                          ],
                        ),
                      ),
                    ),
                  ),
    
            
            
          ],
        ),
      ),

      endDrawer: const Drawer(
        child: Center(
          child: DrawerHeader(
                  
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage:  NetworkImage('https://instagram.fala6-1.fna.fbcdn.net/v/t51.2885-19/s320x320/241139279_405868381266776_443658724050377629_n.jpg?_nc_ht=instagram.fala6-1.fna.fbcdn.net&_nc_cat=108&_nc_ohc=6jEZD0UAot0AX9ZcWkm&tn=ffwAhYcteTpBfjvn&edm=ABfd0MgBAAAA&ccb=7-4&oh=00_AT-uX4dsBI0kOmXAQapX1lq7vxVVwui6Kb177TGixRL1CQ&oe=62114751&_nc_sid=7bff83'),
                  ),
                ),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Visibility(
        visible: _isVisible,
        child: FloatingActionButton.extended(
          onPressed: openBottomSheet, label: Text('Open'), icon: Icon(Icons.add),)
      ),

      
      bottomNavigationBar: BottomAppBar(

        child: Container(
          child: BottomNavigationBar(
            elevation: 0,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
              BottomNavigationBarItem(icon: Icon(Icons.circle), label: 'Images'),
            ],
          ),
        ),
      ),


    );
  }
}
