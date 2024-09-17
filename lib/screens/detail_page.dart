import 'package:flutter/material.dart';
import 'package:grocery_shopping_app/models/items_model.dart';
import 'package:grocery_shopping_app/utils/colors.dart';
import 'package:grocery_shopping_app/widgets/detail_item_header.dart';
import 'package:grocery_shopping_app/widgets/detail_item_widget.dart';
import 'package:readmore/readmore.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.food});
  final FoodDetail food;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

int quantity = 1;

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: ListView(
        children: [
          const SizedBox(height: 20),
          const DetailItemHeader(),
          const SizedBox(height: 20),
          DetailItemImage(imageUrl: widget.food.image),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //for name
                        Text(
                          widget.food.name,
                          maxLines: 1,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 34,
                              color: Colors.black),
                        ),
                        //for price
                        Text(
                          '\$${widget.food.price}.',
                          style: const TextStyle(
                              color: primaryColor,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
                    Material(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(30),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                if (quantity > 1) {
                                  quantity -= 1;
                                  setState(() {});
                                }
                              },
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              )),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            '$quantity',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 25),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          IconButton(
                              onPressed: () {
                                quantity += 1;
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      widget.food.rate.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.fiber_manual_record,
                      color: Colors.red,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      '${widget.food.kcal}kcal',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.access_time_filled,
                      color: Colors.amber,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      widget.food.cookingTime,
                      maxLines: 1,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Text(
                  'About Food',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 16),
                ReadMoreText(
                  textAlign: TextAlign.justify,
                  widget.food.description,
                  trimLines: 2,
                  trimExpandedText: 'show less',
                  moreStyle:const TextStyle(color: primaryColor),
                  trimCollapsedText: 'read more',
                  lessStyle:const TextStyle(color: primaryColor),
                  trimMode: TrimMode.Line,
                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 30),
                Material(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(15),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 21),
                      child: const Text(
                        'Add to cart',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
