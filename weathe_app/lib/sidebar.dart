import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
       children: [UserAccountsDrawerHeader(
         accountName: Text('Text.com'), 
         accountEmail: Text('Text@gmail.com'),
         currentAccountPicture: CircleAvatar(
           child: ClipOval(child: Image.network('https://mcdn.nhanh.vn/store/27639/ps/20181112/12182018121823_47bb4f26832fab6c6286b88ceab8cf65_564x564.jpg', width: 90, height: 90, fit: BoxFit.cover,)),
         ),
         decoration: BoxDecoration(
           color: Colors.blue,
           image: DecorationImage(
             image: NetworkImage('https://thumbs.dreamstime.com/b/blue-foggy-mountain-forest-nature-landscape-vector-illustration-eps-blue-foggy-mountain-forest-nature-landscape-133012229.jpg'),
             fit: BoxFit.cover
           ),
         ),
         ),
         ListTile(
           leading: Icon(Icons.today),
           title: Text('Today'),
           onTap: ()=>null,
         ),
          Divider(),
         ListTile(
           leading: Icon(Icons.next_week),
           title: Text('To Week'),
           onTap: ()=>null,
         ),
          Divider(),
         ListTile(
           leading: Icon(Icons.share),
           title: Text('Share'),
           onTap: ()=>null,
         ),
          Divider(),
         ListTile(
           leading: Icon(Icons.notifications),
           title: Text('Request'),
           onTap: ()=>null,
           trailing: ClipOval(
             child: Container(
               color: Colors.red,
               width: 20,
               height: 20,
               child: Center(
                 child: Text(
                   '8', style: TextStyle(color: Colors.white, fontSize: 12),
               ),
             ),
           )
           ),
         ),
        ],
      ),
    );
  }
}