import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomerPage extends StatefulWidget {
  static const String routeName='/coustomer';

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {

  final searchCon=TextEditingController();
  final nameCon=TextEditingController();
  final addCon=TextEditingController();
  final phoneCon=TextEditingController();
  final emailCon=TextEditingController();
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Information'),
        centerTitle: true,
        actions: [
          Text('Next')
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 5,),
          Text('Existing Customer?',style: TextStyle(fontSize: 18),),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                  label: Text('Enter Phone Number'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6))
                  )
              ),

            ),
          ),
          SizedBox(height: 10,),
          Card(

            elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('New Customer?',style: TextStyle(fontSize: 18),),
                  ],
                ),
              )),
          SizedBox(height: 10,),
          Form(
              child:
              Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Enter Name'),
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.all(Radius.circular(6))
                   )
                  ),

                ),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      label: Text('Enter Phone'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6))
                      )
                  ),

                ),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      label: Text('Customer Email'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6))
                      )
                  ),

                ),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      label: Text('Customer Street Address'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6))
                      )
                  ),

                ),
              ),
              SizedBox(height: 5,),
            ],
          ))

        ],
      ),
    );
  }
}
