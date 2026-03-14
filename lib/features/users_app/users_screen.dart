import 'package:depi_03/features/users_app/users_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}
  List<UsersModel> users=[];

class _UsersScreenState extends State<UsersScreen> {
  @override
  void initState() {
    super.initState();
    fetchUsers();
  }
  @override
  Widget build(BuildContext context) {
    var h=MediaQuery.sizeOf(context).height;
    var w=MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Users" , style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold),),
      ),

      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: users.length,
        itemBuilder: (context, index) {
         return Padding(
           padding:  EdgeInsets.symmetric(horizontal: w*.04 , vertical: 5),
           child: Container(
            height: h*.3,
            width: w*.7,
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black26,
                offset: Offset(2, 10)
              ),
            ]
            ),

            child: Column(
              crossAxisAlignment: .start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(users[index].name ?? "" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
                ),

                customeRow(icon: Icon(Icons.person , size: 30,), text: users[index].username??"",),
                SizedBox(height: h*.015,),
                customeRow(icon: Icon(Icons.email, size: 30,), text: users[index].email??"",),
                SizedBox(height: h*.015,),
                customeRow(icon: Icon(Icons.phone_android_rounded, size: 30,), text: users[index].phone??"",),
                SizedBox(height: h*.015,),
                customeRow(icon: Icon(Icons.location_city_sharp, size: 30,), text: users[index].address?.city??"",),
                SizedBox(height: h*.015,),
              ],
            ),
           ),
         );
      },),
    );
  }
}

class customeRow extends StatelessWidget {
  const customeRow({
    super.key, required this.icon, required this.text,
  });

  final Icon icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        Text(text)
      ],
    );
  }
}

void fetchUsers() async{
  Dio dio = Dio();
  final res =await dio.get("https://jsonplaceholder.typicode.com/users");
  var data = res.data as List;
  users = data.map((e) => UsersModel.fromJson(e)).toList();
}


