import 'package:app_crud/Style/style.dart';
import 'package:flutter/material.dart';
import 'package:app_crud/RestAPI/RestClient.dart';

class ProductGridViewScreen extends StatefulWidget{
   const ProductGridViewScreen({super.key});

  @override
  State<ProductGridViewScreen>createState() => _ProductGridViewScreenState();

}


//caling REST API

class _ProductGridViewScreenState extends State<ProductGridViewScreen> {

  List ProductList=[];
  bool Loading=true;

  @override
  void initState(){
    CallData();
    super.initState();
  }


  CallData() async{
    Loading=true;
    var data= await ProductGridViewListRequest();
    setState(() {
      ProductList=data;
      Loading=false;
    });
  }



  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List Product'),),
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            child:Loading?(Center(child:CircularProgressIndicator())):(
              GridView.builder(
                gridDelegate: ProductGridViewStyle(), 
                
                itemBuilder: (context,index){
                    return Card(
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(child:Image.network(ProductList[index]['Img'],fit:BoxFit.fill))
                        ],
                      )
                    );
                }
                
                
                )
            )
          )
        ],
      ),
  
    );
  }
}
