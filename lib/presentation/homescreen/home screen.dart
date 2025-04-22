import 'package:apigetandpost/presentation/Login/login%20screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../resources/Resources.dart';
import 'cubic/homescreen_cubit.dart';


class homeScreen extends StatelessWidget {
  homeScreen({super.key, required this.token});

  String token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer : Drawer(
        child:
            DrawerHeader(
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.logout_outlined),
                      title: Text("Logout"),
                      onTap: ()async{
                        final navigator = Navigator.of(context);
                        await remPrefs();
                        navigator.pushReplacement(MaterialPageRoute(builder:(_) => LoginPage(),));
                      },
                    )
                  ],
                )
            )

      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // leading: Icon(Icons.menu, color: Colors.black),
        title: Text("Lead List", style: TextStyle(color: Colors.black)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.notifications_none, color: Colors.black),
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => HomescreenCubit(token),
        child: BlocBuilder<HomescreenCubit, HomescreenState>(
          builder: (context, state) {
            return
            state is HomescreenLoading?
              Center(child: const CircularProgressIndicator()):
             state is HomescreenLoaded?
             ListView.builder(
               padding: const EdgeInsets.all(12),
               itemCount:state.data.data.leads.length,
               itemBuilder: (context, index) {
                 return LeadCard(
                   name:  state.data.data.leads[index].name,
                 company: "Flutter",
                 createdDate: state.data.data.leads[index].createdAt.toString(),
                   email: state.data.data.leads[index].email.toString(),
                   location: state.data.data.leads[index].location.toString(),
                   mobile: state.data.data.leads[index].mobile,
                 );
               },
             ):
            SizedBox();
          },
        ),
      ),
    );
  }
}


class LeadCard extends StatelessWidget {
  final String name;
  final String email;
  final String createdDate;
  final String mobile;
  final String location;
  final String company;

  const LeadCard({
    super.key,
    required this.name,
    required this.email,
    required this.createdDate,
    required this.mobile,
    required this.location,
    required this.company,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar with initials
            CircleAvatar(
              backgroundColor: Colors.grey.shade200,
              radius: 25,
              child: Text(
                name.isNotEmpty ? name[0].toUpperCase() : '?',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(width: 12),

            // Main info column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 4),
                  Text(email),
                  Text("Created: $createdDate"),
                  Text("Mob: $mobile"),
                ],
              ),
            ),

            // Right-aligned info
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.location_on_outlined, size: 16),
                    const SizedBox(width: 4),
                    Text(location),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        company,
                        style: const TextStyle(color: Colors.blue),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.call, color: Colors.indigo, size: 28),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
