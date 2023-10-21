import 'package:app_crud/RestAPI/RestClient.dart';
import 'package:flutter/material.dart';
import '../Style/style.dart';
// stateful Widget

class ProductCreateScreen extends StatefulWidget {
  const ProductCreateScreen({super.key});

  @override
  State<ProductCreateScreen> createState() => _ProductCreateScreenState();
}

class _ProductCreateScreenState extends State<ProductCreateScreen> {

    Map<String,String>FormValues={

     


   
    "Img":"",
    "ProductCode":"",
    "ProductName":"",
    "Qty":"",
    "TotalPrice":"",
    "UnitPrice":""

    };
    //Loader Screen

     bool Loading=false;


    // API method Calling
    InputOnChange(Mapkey,Textvalue){
      setState((){
        FormValues.update(Mapkey, (value) => Textvalue);
      });
    }


    // Form Submit for validation

    FormOnSubmit()async{
      if(FormValues['Img']!.isEmpty){
        ErrorToast("Image Link Required");
      }

      else if(FormValues['ProductName']!.isEmpty){
        ErrorToast("Prouduct Name Required"); 
      }
      else if(FormValues['ProductCode']!.isEmpty){
        ErrorToast("Product Code Required");
      }
   

      else if(FormValues['UnitPrice']!.isEmpty){
     ErrorToast("Product UnitPrice is Required");
      }

      else if(FormValues['TotalPrice']!.isEmpty){
        ErrorToast("Product TotalPrice is  Required");
      }

       else if(FormValues['Qty']!.isEmpty){
        ErrorToast("Product Qty is Required");
      }

      else{
       setState(() {
         Loading=true;
       });
       await ProductCreateRequest(FormValues);
       setState(() {
         Loading=false;
       });
     }
       
    }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('CreateProduct'),
        ),
        body: Stack(
          children: [
            //Background Graphics
            ScreenBackground(context),
            Container(
                child: Loading?(Center(child:CircularProgressIndicator(),)):((SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TextFormField(
                          onChanged: (Textvalue) {
                            InputOnChange("ProductName",Textvalue);
                          },
                          decoration: AppInputDecoration('ProductName'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          onChanged: (Textvalue) {
                            InputOnChange("ProductCode", Textvalue);
                          },
                          decoration: AppInputDecoration('ProductCode'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          onChanged: (Textvalue) {
                            InputOnChange("Img", Textvalue);
                          },
                          decoration: AppInputDecoration('ProductImage'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),


                        TextFormField(
                          onChanged: (Textvalue) {
                            InputOnChange("UnitPrice", Textvalue);
                          },
                          decoration: AppInputDecoration('Unit Price'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        TextFormField(
                          onChanged: (Textvalue) {
                            InputOnChange("TotalPrice",Textvalue);
                          },
                          decoration: AppInputDecoration('Total Price'),
                        ),

                        const SizedBox(height: 20,),


                     AppDropDownStyle(
                      DropdownButton(
                        value:FormValues['Qty'] ,
                        items:const [
                          DropdownMenuItem(value: "",child: Text('Select Qt'),),
                          DropdownMenuItem(value: "1 pcs",child: Text('1 pcs'),),
                          DropdownMenuItem(value: '2 pcs',child: Text('2 pcs'),),
                          DropdownMenuItem(value: '3 pcs',child: Text('3 pcs'),),
                          DropdownMenuItem(value: '4 pcs',child: Text('4 pcs'),),
                        ],
                        onChanged: (Textvalue){
                          InputOnChange("Qty", Textvalue);
                        },

                        underline: Container(),
                        isExpanded: true,
                      )
                  ),
                        const SizedBox(height: 20,),

                        Container(
                          child:ElevatedButton(
                            style:AppButtonStyle(),
                            onPressed: (){
                              FormOnSubmit();
                            },
                            
                            child:SuccessButtonChild('Submit'),
                            
                            )
                        )

                      ],
                    )))))
          ],
        ));
  }
}