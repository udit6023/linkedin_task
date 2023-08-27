import 'package:flutter/material.dart';
import 'package:wellfyn_assignment/func/api_func.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    apifunc.get_func2();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
           
            children: [
              _buildCard1(context),
            
              Divider(height: 50,),
              _buildCard2(context)
            ],
        ),
      ),
    );
  }

  Widget _buildCard1(BuildContext context) {
    
    return  FutureBuilder(
          builder: (ctx, snapshot) {
            // Checking if future is resolved or not
            if (snapshot.connectionState == ConnectionState.done) {
              // If we got an error
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    '${snapshot.error} occurred',
                    style: TextStyle(fontSize: 18),
                  ),
                );
 
                // if we got our data
              } else if (snapshot.hasData) {
                // Extracting data from snapshot object
                final data = snapshot.data;
               // print(data);
                return ListView.builder(
                  scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (context, int index) {
          return Container(child: Column(children: [
            Text(('${data['fund_house']}')),
            Text(('${data['scheme_type']}')),
            Text(('${data['scheme_category']}')),
            Text(('${data['scheme_code']}')),
            Text(('${data['scheme_name']}')),
          ],));
        }
    );
              }
            }
 
            // Displaying LoadingSpinner to indicate waiting state
            return Center(
              child: CircularProgressIndicator(),
            );
          },
 
          // Future that needs to be resolved
          // inorder to display something on the Canvas
          future: apifunc.get_func1(),
        );
  }


  Widget _buildCard2(BuildContext context) {
    
    return  FutureBuilder(
          builder: (ctx, snapshot) {
            // Checking if future is resolved or not
            if (snapshot.connectionState == ConnectionState.done) {
              // If we got an error
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    '${snapshot.error} occurred',
                    style: TextStyle(fontSize: 18),
                  ),
                );
 
                // if we got our data
              } else if (snapshot.hasData) {
                // Extracting data from snapshot object
                final data = snapshot.data;
               // print(data);
                return ListView.builder(
                  scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: data!.length,
        itemBuilder: (context, int index) {
          return Container(child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            Text('${data[index]['date']}'),
            Text('${data[index]['nav']}'),
          ],));
        }
    );
              }
            }
 
            // Displaying LoadingSpinner to indicate waiting state
            return Center(
              child: CircularProgressIndicator(),
            );
          },
 
          // Future that needs to be resolved
          // inorder to display something on the Canvas
          future: apifunc.get_func2(),
        );
  }
}