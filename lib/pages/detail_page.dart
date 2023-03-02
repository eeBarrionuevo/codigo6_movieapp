import 'package:codigo6_movieapp/models/movie_detail_model.dart';
import 'package:codigo6_movieapp/services/api_service.dart';
import 'package:codigo6_movieapp/ui/general/colors.dart';
import 'package:codigo6_movieapp/widgets/item_cast_widget.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  int idMovie;
  DetailPage({
    required this.idMovie,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  MovieDetailModel? movie;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    ApiService apiService = ApiService();
    movie = await apiService.getMovieDetails(widget.idMovie);
    print(movie);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
      body: movie != null
          ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: height * 0.33,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://images.wallpapersden.com/image/download/poster-of-dune-2020_bGhmbGmUmZqaraWkpJRoa2lqrWdlamU.jpg",
                        ),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.center,
                              colors: [
                                kBrandPrimaryColor,
                                Colors.transparent,
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 4.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 18.0,
                                ),
                                SizedBox(
                                  width: 3.0,
                                ),
                                Text(
                                  "7.235",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  " | 45324",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.whatsapp_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.share_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          movie!.originalTitle,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "162 min",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              "2022",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Wrap(
                          spacing: 6,
                          runSpacing: -4,
                          children: [
                            Chip(
                              label: Text(
                                "Action",
                              ),
                            ),
                            Chip(
                              label: Text(
                                "Drama",
                              ),
                            ),
                            Chip(
                              label: Text(
                                "Science Fiction",
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          movie!.overview,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 24.0,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: double.infinity,
                            height: 56,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              gradient: LinearGradient(
                                colors: [
                                  kBrandSecondaryColor,
                                  const Color(0xff973FEF),
                                ],
                              ),
                            ),
                            child: Text(
                              "Homepage",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24.0,
                        ),
                        const Text(
                          "Top Cast",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ItemCastWidget(),
                              ItemCastWidget(),
                              ItemCastWidget(),
                              ItemCastWidget(),
                              ItemCastWidget(),
                              ItemCastWidget(),
                              ItemCastWidget(),
                              ItemCastWidget(),
                              ItemCastWidget(),
                              ItemCastWidget(),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 24.0,
                        ),
                        const Text(
                          "Images",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Container(
                          color: Colors.amber,
                          child: MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: GridView.builder(
                              // padding: EdgeInsets.zero,
                              physics: ScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1.35,
                              ),
                              itemCount: 7,
                              itemBuilder: (BuildContext context, int index) {
                                return Image.network(
                                  "https://images.pexels.com/photos/931018/pexels-photo-931018.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24.0,
                        ),
                        const Text(
                          "Reviews",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        ExpansionTile(
                          iconColor: kBrandSecondaryColor,
                          collapsedIconColor: Colors.white,
                          childrenPadding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 6.0,
                          ),
                          tilePadding: const EdgeInsets.symmetric(
                            horizontal: 6,
                          ),
                          title: Row(
                            children: [
                              const CircleAvatar(
                                backgroundColor: Colors.white10,
                                child: Text(
                                  "7.2",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Juan Manuel Gonzales",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "2022-11-14",
                                    style: TextStyle(
                                      color: Colors.white60,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          children: [
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 60.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
