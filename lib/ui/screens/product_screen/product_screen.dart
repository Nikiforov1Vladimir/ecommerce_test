import 'package:ecommerce_test/data/api/api_client.dart';
import 'package:ecommerce_test/domain/models/product.dart';
import 'package:ecommerce_test/ui/widgets/sliver_app_bar/sliver_app_bar_background.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    ApiClient().getProduct(1);
    return Scaffold(
      body: CustomScrollView(
        slivers: [

          SliverAppBar(
            toolbarHeight: 350,
            flexibleSpace: FutureBuilder(
              future: ApiClient().getProduct(1),
              builder: (context,AsyncSnapshot<Product> snapshot){
                if(snapshot.hasData){
                  return SliverAppBarBackground(
                    images: snapshot.data!.images,
                  );
                }
                else{
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.deepPurpleAccent,
                    ),
                  );
                }
              },
            ),
          ),

          SliverToBoxAdapter(
            child: FutureBuilder(
              future: ApiClient().getProduct(1),
              builder: (context,AsyncSnapshot<Product> snapshot){
                if(snapshot.hasData){
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 16
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          snapshot.data!.title,
                          maxLines: 2,
                          style: Theme.of(context).textTheme.headline2,
                        )

                      ],
                    ),
                  );
                }
                else{
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          )

        ],
      ),
    );
  }
}
