import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce_test/core/constants/colors.dart';
import 'package:ecommerce_test/core/utils/utils.dart';
import 'package:ecommerce_test/data/models/basket.dart';
import 'package:ecommerce_test/services/api_client.dart';
import 'package:ecommerce_test/view/widgets/custom_icon_button.dart';
import 'package:ecommerce_test/view/widgets/custom_material_button.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.04
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomIconButton(
                onPressed: () => Navigator.of(context).pop(),
                color: appBlue,
                icon: const Icon(Icons.arrow_back_ios_new_rounded,size: 20,color: Colors.white,),
              ),
              CustomIconButton(
                onPressed: (){},
                icon: const Icon(Icons.location_on_outlined,color: Colors.white),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [

          Expanded(
            flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.08
                ),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'My Cart',
                    style: TextStyle(
                      color: appBlue,
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              )
          ),

          Expanded(
            flex: 8,
              child: Container(
                width: MediaQuery.of(context).size.width,

                decoration: const BoxDecoration(
                  color: appBlue,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(40)
                  )
                ),

                child: FutureBuilder(
                    future: ApiClient().getBasket(),
                    builder: (context,AsyncSnapshot<Basket> snapshot){
                      if(snapshot.hasData){
                        return Column(
                          children: [
                            Expanded(
                                flex: 6,
                                child: ListView.builder(
                                    padding: EdgeInsets.symmetric(
                                        vertical: MediaQuery.of(context).size.height * 0.04
                                    ),
                                    itemCount: snapshot.data!.basket.length,
                                    itemBuilder: (context,index) =>
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: MediaQuery.of(context).size.width * 0.08,
                                              vertical: MediaQuery.of(context).size.height * 0.03
                                          ),
                                          child: SizedBox(
                                            height: MediaQuery.of(context).size.height * 0.1,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                ClipRRect(
                                                  borderRadius: BorderRadius.circular(20),
                                                  child: SizedBox(
                                                    width: MediaQuery.of(context).size.width * 0.2,
                                                    child: Image(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(
                                                        snapshot.data!.basket[index].images,
                                                      ),
                                                    ),
                                                  ),
                                                ),

                                                Container(
                                                  width: MediaQuery.of(context).size.width * 0.435,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: MediaQuery.of(context).size.width * 0.04
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      AutoSizeText(
                                                        snapshot.data!.basket[index].title,
                                                        maxLines: 2,
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontWeight: FontWeight.w600,
                                                            fontSize: 20
                                                        ),
                                                      ),
                                                      AutoSizeText(
                                                        '\$${snapshot.data!.basket[index].price}.00',
                                                        maxLines: 1,
                                                        style: const TextStyle(
                                                            color: appOrange,
                                                            fontWeight: FontWeight.w600,
                                                            fontSize: 20
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),

                                                Container(
                                                  width: MediaQuery.of(context).size.width * 0.06,
                                                  height: MediaQuery.of(context).size.height * 0.1,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white24,
                                                      borderRadius: BorderRadius.circular(20)
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      SizedBox(
                                                        height: 30,
                                                        child: IconButton(
                                                          onPressed: (){
                                                            setState(() {

                                                            });
                                                          },
                                                          splashRadius: 10,
                                                          padding: const EdgeInsets.all(0),
                                                          icon: const Icon(Icons.add,size: 20,),
                                                        ),
                                                      ),

                                                      Text('${snapshot.data!.basket.length}'),

                                                      SizedBox(
                                                        height: 30,
                                                        child: IconButton(
                                                          onPressed: (){
                                                            setState(() {

                                                            });
                                                          },
                                                          splashRadius: 10,
                                                          padding: const EdgeInsets.all(0),
                                                          icon: const Icon(Icons.remove,size: 20,),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),

                                                IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(Icons.delete,color: Colors.grey,)
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                )
                            ),

                            Expanded(
                              flex: 4,
                              child: Column(
                                      children: [
                                        const Divider(
                                          color: Colors.grey,
                                          height: 0,
                                        ),

                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: MediaQuery.of(context).size.height * 0.03,
                                              horizontal: MediaQuery.of(context).size.width * 0.08
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text('Total',style: Theme.of(context).textTheme.bodyText1),
                                                  Text('\$ ${snapshot.data!.total}.00 US',style: Theme.of(context).textTheme.bodyText2)
                                                ],
                                              ),
                                              addVerticalSpace(MediaQuery.of(context).size.height * 0.02),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text('Delivery',style: Theme.of(context).textTheme.bodyText1),
                                                  Text(snapshot.data!.delivery,style: Theme.of(context).textTheme.bodyText2)
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Divider(color: Colors.grey,height: 0,),

                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: MediaQuery.of(context).size.height * 0.03,
                                              horizontal: MediaQuery.of(context).size.width * 0.08
                                          ),
                                          child: CustomMaterialButton(
                                            verticalPadding: MediaQuery.of(context).size.height * 0.02,
                                            onPressed: (){},
                                            child: Text('Checkout',style: Theme.of(context).textTheme.button),
                                          ),
                                        )
                                      ],
                              )
                            )
                          ]
                        );
                      }
                      else{
                        return const Center(
                          child: CircularProgressIndicator(
                            color: appOrange,
                          ),
                        );
                      }
                    }
                ),
              )
          )
        ],
      ),
    );
  }
}
