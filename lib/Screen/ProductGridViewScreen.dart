import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../RestAPI/RestClient.dart';
import '../Style/Style.dart';

class ProductGridViewScreen extends StatefulWidget {
  const ProductGridViewScreen({Key? key}) : super(key: key);
  @override
  State<ProductGridViewScreen> createState() => _ProductGridViewScreenState();
}


//API Call and store data in list
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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("ProductList"),),
      body:Stack(
        children: [
          ScreenBackground(context),
          Container(
            child:Loading?(Center(child:CircularProgressIndicator())):(
              GridView.builder(
                gridDelegate: ProductGridViewStyle(),
                itemCount:ProductList.length ,
                 itemBuilder:(context,index){
                  if(ProductList[index] !=null && ProductList[index]['Img'] !=null){
                    return Card(
                    child:Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(child: Image.network(ProductList[index]['Img'],fit:BoxFit.fill)),
                    ],
                    ),
                    
                  );
                  }

                  else{
                    return Card(
                        child:Center(
                          child: Text('No Image Available'),
                          )
                    );
                  }
                 
                 }

                )
            ),
          )
        ],
      )
    );

  }
}

