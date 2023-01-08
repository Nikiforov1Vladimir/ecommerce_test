import 'package:ecommerce_test/core/constants/colors.dart';
import 'package:ecommerce_test/data/api/api_client.dart';
import 'package:ecommerce_test/domain/models/product.dart';
import 'package:ecommerce_test/domain/models/review.dart';
import 'package:ecommerce_test/ui/screens/product_screen/widgets/rating_row.dart';
import 'package:ecommerce_test/ui/screens/product_screen/widgets/review_card.dart';
import 'package:ecommerce_test/ui/widgets/sliver_app_bar/sliver_app_bar_background.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

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
      body: FutureBuilder(
        future: ApiClient().getProduct(1),
        builder: (context,AsyncSnapshot<Product> snapshot){
          if(snapshot.hasData){
            return Stack(
              children: [
                CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      toolbarHeight: 350,
                      flexibleSpace: SliverAppBarBackground(
                        images: snapshot.data!.images,
                      ),
                    ),

                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(
                            16,
                            20,
                            16,
                            70
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                              snapshot.data!.title,
                              maxLines: 2,
                              style: Theme.of(context).textTheme.headline2,
                            ),

                            const SizedBox(height: 15),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Flexible(
                                  child: Text(
                                      '\$${snapshot.data!.price - (snapshot.data!.discount ?? 0)}0',
                                      style: Theme.of(context).textTheme.headline1
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Flexible(
                                  child: Text(
                                    '\$${snapshot.data!.price}0',
                                    style: Theme.of(context).textTheme.headline3!.copyWith(
                                        decoration: TextDecoration.lineThrough,
                                        color: AppColors.grey
                                    ),
                                  ),
                                )
                              ],
                            ),

                            const SizedBox(height: 15),

                            RatingRow(rating: snapshot.data!.rating),

                            const SizedBox(height: 15),

                            Text('About product',style: Theme.of(context).textTheme.headline2),

                            const SizedBox(height: 10),

                            ReadMoreText(
                              snapshot.data!.description,
                              trimLines: 3,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),

                            const SizedBox(height: 15),

                            Text('Configuration',style: Theme.of(context).textTheme.headline2),



                            const SizedBox(height: 15),

                            Text('Ratings & Reviews',style: Theme.of(context).textTheme.headline2),

                            const SizedBox(
                              height: 15,
                            ),

                            FutureBuilder(
                                future: ApiClient().getProductReviews(1),
                                builder: (context,AsyncSnapshot<List<Review>> reviewSnapshot){
                                  if(reviewSnapshot.hasData){
                                    return ListView.separated(
                                      physics: const NeverScrollableScrollPhysics(),
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      separatorBuilder: (context,index)=> const SizedBox(height: 10),
                                      shrinkWrap: true,
                                      itemCount: reviewSnapshot.data!.length,
                                      itemBuilder: (context,index) => ReviewCard(
                                          rating: reviewSnapshot.data![index].rating,
                                          title: reviewSnapshot.data![index].title,
                                          description: reviewSnapshot.data![index].description
                                      ),
                                    );
                                  }else{
                                    return Center(child: CircularProgressIndicator(
                                      color: Theme.of(context).colorScheme.secondary,
                                    ));
                                  }
                                }
                            )

                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: MaterialButton(
                    onPressed: (){},
                    height: 70,
                    minWidth: MediaQuery.of(context).size.width,
                    color: Theme.of(context).colorScheme.secondary,
                    child: Text(
                      'Proceed to pay ${snapshot.data!.price - (snapshot.data!.discount ?? 0)}\$',
                      style: Theme.of(context).textTheme.button,
                    )
                  ),
                )
              ],
            );
          }{
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.secondary,
              ),
            );
          }
        },
      ),
    );
  }
}
