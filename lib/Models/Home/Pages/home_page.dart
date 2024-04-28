import 'package:carousel_slider/carousel_slider.dart';
import 'package:elera/Utils/Constants/constans_assets.dart';
import 'package:elera/Utils/Wdgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

final List<String> images = [
  Images.slideImage,
  Images.slideImage,
  Images.slideImage,
  Images.slideImage,
];
int activeIndex = 0;

class Category {
  late IconData iconData;
  late String categoryName;
  Category({required this.iconData, required this.categoryName});
}

List<Category> category = [
  Category(iconData: Icons.local_fire_department_sharp, categoryName: 'All'),
  Category(iconData: Icons.lightbulb_outline, categoryName: '3D Design'),
  Category(iconData: Icons.attach_money_outlined, categoryName: 'Bussiness'),
  Category(iconData: Icons.color_lens_outlined, categoryName: '3D Art')
];
final controller = CarouselController();

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(children: [
              const SizedBox(height: 50),
              _header(context),
              _body(),
              const SizedBox(height: 30),
              _footer(),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _footer() {
    return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, index) {
                return Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 1,
                      offset: const Offset(0, .1),
                    ),
                  ], borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(Images.tileImageBlue,
                            height: 100, width: 100, fit: BoxFit.cover),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 25,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 25,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.blue.withOpacity(0.1),
                                            spreadRadius: 2,
                                            blurRadius: 1,
                                            offset: const Offset(0, .1),
                                          ),
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(7)),
                                    child: const Center(
                                      child: Text(
                                        '3D Design',
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.bookmark,
                                    size: 20,
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              '3D Design Illustration',
                              style: TextStyle(
                                  color: Colors.black,
                                  // fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: const [
                                Text(
                                  "\$'48 ",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "\$'80",
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.black45),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow[800],
                                  size: 15,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    " 4.8 | ",
                                    style: TextStyle(color: Colors.black87),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 2.0),
                                  child: Text("8,289 students",
                                      style:
                                          TextStyle(color: Colors.black87)),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
              itemCount: 6,
            );
  }

  Widget _header(context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            "Good Morning",
            style: TextStyle(
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w400,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              "Andrew Ainsley",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey.shade900,
                  fontWeight: FontWeight.bold),
            ),
          ),
          leading: GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: const CircleAvatar()),
          trailing: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(Images.svgNotification),
              const SizedBox(width: 10),
              SvgPicture.asset(Images.svgBookmark),
            ],
          ),
        ),
        const MyTextFormField(
          hintText: "Search",
          prefixIcon: Icon(Icons.search),
          suffixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            // child: InkWell(
            //   onTap: () {},
            //   child: SvgPicture.asset(Images.svgFilter),
            // ),
          ),
        )
      ],
    );
  }

  Widget _body() {
    return Column(
      children: [
        CarouselSlider.builder(
            carouselController: controller,
            itemCount: images.length,
            itemBuilder: (context, index, realIndex) {
              final image = images[index];
              return buildImage(image, index);
            },
            options: CarouselOptions(
              viewportFraction: 1,
              height: 200,
              initialPage: 0,
              reverse: false,
              autoPlay: true,
            )),
        Container(alignment: Alignment.bottomCenter, child: buildIndicator()),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Most Popular Courses',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              'See All',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
        Container(
          height: 40,
          margin: const EdgeInsets.only(top: 25),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => categoryList(category[index]),
              separatorBuilder: (context, _) => const SizedBox(
                    width: 10,
                  ),
              itemCount: 4),
        ),
      ],
    );
  }

  Widget categoryList(Category categoryitem) {
    return Container(
      height: 35,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.blue, width: 2),
      ),
      child: Row(
        children: [
          Icon(
            categoryitem.iconData,
          ),
          Text(
            categoryitem.categoryName,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget buildImage(String image, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 14, horizontal: 5),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue,
      ),
      child: Image.asset(image, fit: BoxFit.fill),
    );
  }

  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: images.length,
      effect: const ExpandingDotsEffect(
          activeDotColor: Colors.blue,
          dotHeight: 5,
          dotWidth: 6,
          dotColor: Colors.blue,
          spacing: 1),
    );
  }
}
