import 'package:courses/constants.dart';
import 'package:courses/widgets/CustomAppBar.dart';
import 'package:flutter/material.dart';

import 'dio/dio_provider.dart';
import 'models/success_model.dart';

class ScreenData extends StatefulWidget {
  const ScreenData({super.key});

  @override
  State<ScreenData> createState() => _ScreenDataState();
}

class _ScreenDataState extends State<ScreenData> {
  SuccessModel? successStory;
  bool isLoading = true;
  getData() async {
    successStory = await ApiServies().getStory();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: KmainColor,
              ),
            )
          : Column(
              children: [
                CustomAppBar(height: 90, title: 'ScreenData'),
                Expanded(
                  child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color:
                                    const Color.fromARGB(255, 207, 211, 209)),
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundColor: KmainColor,
                                      child: Text(
                                        successStory!.model![index].id!,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 150,
                                          child: Text(
                                            successStory!.model![index].title!,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(successStory!
                                            .model![index].createdAt
                                            .toString())
                                      ],
                                    )
                                  ],
                                )),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          color: KmainColor,
                        );
                      },
                      itemCount: successStory!.model!.length),
                ),
              ],
            ),
    );
  }
}
