import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageCarousel extends StatefulWidget {

  final int currentIndex;

  final List cardList;
   
  const ImageCarousel({Key? key, required this.currentIndex, required  this.cardList}) : super(key: key);

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  @override
  Widget build(BuildContext context) {

    int currentIndex = widget.currentIndex;

    
    return  Column(
      children: [

        Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(top: 16.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(left: 22, right: 310,),
                            child: Text(
                              "Foto: $currentIndex de ${widget.cardList.length-1}",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                          InkWell(
                    onTap: () {
                      
                    },
                    
                    child: Container(
                      margin: EdgeInsets.only(),
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            child: const Text(
                              "Editar fotos",
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const Icon(Icons.edit, color: Colors.black),
                        ],
                      ),
                    )
                  ),

                          ],
                      ),
                    ),
                  const SizedBox(width: 24.0),
                ],
              ),

        Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                child: Column(mainAxisAlignment: MainAxisAlignment.center,  children: [
                  CarouselSlider(
                options: CarouselOptions(
                height: 130, 
                viewportFraction: 0.33, 
                enableInfiniteScroll: false, 
                initialPage: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
              items: widget.cardList.map((card){
                return Builder(
                  builder:(BuildContext context){
                    return Container(
                      height: MediaQuery.of(context).size.height*0.30,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        color: Colors.blueAccent,
                        child: card,
                      ),
                    );
                  }
                );
              }).toList(),
            ),
                const SizedBox(height: 20,),
                buildIndicator(),

                ],)
                
              )

      ]

    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
    activeIndex: widget.currentIndex - 1,
    count: widget.cardList.length-1,
    effect: const WormEffect(
      dotWidth: 40,
      dotHeight: 5,
      dotColor: Color.fromARGB(255, 201, 201, 201),
      activeDotColor: Color.fromARGB(255, 104, 104, 104),
    ),
  );
}