import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project2/product_model.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Home Screen"),
      automaticallyImplyLeading: false,
    ),
    body: Padding(
      padding: const EdgeInsets.all(15),
      child: GridView.builder(
          itemCount: ProductList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
          childAspectRatio:6/6,
            crossAxisSpacing: 15,
          ),

          itemBuilder: (context,index){
            return Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
              Container(
                color: Colors.pink,
                child: Stack(
                  children: [
                    Image.network(ProductList[index].image!),
                    InkWell(
                      onTap: (){
                        setState(() {
                          ProductList[index].isFavourite = !ProductList[index].isFavourite!;
                        });
                      },
                      child: Icon(
                        ProductList[index].isFavourite == true
                      ?  Icons.favorite
                     :  Icons.favorite_border ,
                    color: Colors.black,),
                    ),

                  ],
                ),
              ),
              Text(ProductList[index].name!),
              Text( r'$' +ProductList [index].price.toString()),
            ],);
          }
      ),
    ),);
  }
}