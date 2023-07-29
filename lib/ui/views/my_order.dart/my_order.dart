
import 'package:easy_shopping/core/data/models/api/model_order.dart';
import 'package:easy_shopping/ui/shared/colors.dart';
import 'package:easy_shopping/ui/shared/custom_widget/custom_button.dart';
import 'package:easy_shopping/ui/views/checkOut/check_out.dart';
import 'package:flutter/material.dart';
import 'package:easy_shopping/core/translations/app_translation.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({Key? key}) : super(key: key);

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        // bottomNavigationBar: const CustomNavigator(index: 5),
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(
                left: 10, right: 10, top: size.height / 20, bottom: 10),
            child: Row(children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                ),
                color: AppColors.gray700,
                iconSize: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height / 25,
                ),
                child: Text(
                  tr('my_order'),
                  style:
                      const TextStyle(fontSize: 25, color: AppColors.gray700),
                ),
              ),
            ]),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: size.width / 20, bottom: size.height / 15),
            child: Row(
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      'https://picsum.photos/498',
                      height: size.height / 5,
                      width: size.width / 3,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        tr('king'),
                        style: const TextStyle(
                            color: AppColors.gray700,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/star.png',
                            width: size.width / 20,
                            height: size.height / 20,
                          ),
                          const Text(
                            '4.9',
                            style: TextStyle(color: AppColors.orange),
                          ),
                          Text(
                            tr('rating'),
                            style: const TextStyle(
                                color: AppColors.gray400, fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 5,
                      ),
                      child: Row(
                        children: [
                          Text(
                            tr('burger'),
                            style: const TextStyle(
                                color: AppColors.gray400, fontSize: 13),
                          ),
                          Container(
                            width: size.width / 110,
                            height: size.height / 160,
                            decoration: BoxDecoration(
                                color: AppColors.orange,
                                borderRadius: BorderRadius.circular(100)),
                          ),
                          Text(
                            tr('wes'),
                            style: const TextStyle(
                                color: AppColors.gray400, fontSize: 13),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/order/Vector.png',
                            color: AppColors.orange,
                            width: size.width / 20,
                            height: size.height / 35,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10, top: 5),
                            child: Text(
                              tr('no'),
                              style: const TextStyle(
                                  color: AppColors.gray400, fontSize: 13),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: Require.orders.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return request(
                  food: Require.orders[index].food,
                  ratings: Require.orders[index].ratings,
                );
              }),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width / 25, /*vertical: size.height / 20*/
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: size.height / 30, top: size.height / 30),
                        child: Text(
                          tr('delivery_ins'),
                          style: const TextStyle(
                              color: AppColors.gray700,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Spacer(),
                      const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.add,
                          color: AppColors.orange,
                          size: 20,
                        ),
                      ),
                      Text(tr('add_n'),
                          style: const TextStyle(
                            color: AppColors.orange,
                            fontSize: 12,
                          ))
                    ],
                  ),
                  Container(
                    width: size.width / 1,
                    height: 1,
                    color: AppColors.gray400,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: size.height / 50, top: size.height / 30),
                    child: Row(
                      children: [
                        Text(
                          tr('sub'),
                          style: const TextStyle(
                              color: AppColors.gray700,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        const Text('68',
                            style: TextStyle(
                                color: AppColors.orange,
                                fontSize: 12,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: size.height / 30, top: size.height / 50),
                    child: Row(
                      children: [
                        Text(
                          tr('cost'),
                          style: const TextStyle(
                              color: AppColors.gray700,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        const Text('2',
                            style: TextStyle(
                                color: AppColors.orange,
                                fontSize: 12,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  Container(
                    width: size.width / 1,
                    height: 1,
                    color: AppColors.gray400,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: size.height / 50, top: size.height / 50),
                    child: Row(
                      children: [
                        Text(
                          tr('to'),
                          style: const TextStyle(
                              color: AppColors.gray700,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        const Text('70',
                            style: TextStyle(
                                color: AppColors.orange,
                                fontSize: 17,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomButton(
            title: tr('check'),
            onpressd: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CheckOut()),
            ),
            backgroundColor: AppColors.orange,
            textColor: AppColors.white,
          ),
        ]),
      ),
    ));
  }

  Widget request({String? food, String? ratings}) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: size.height / 30),
          width: size.width / 1,
          height: size.height / 11,
          color: AppColors.gray300,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width / 25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      food!,
                      style: const TextStyle(
                          color: AppColors.gray600, fontSize: 14),
                    ),
                    const Spacer(),
                    Text(
                      ratings!,
                      style: const TextStyle(
                          color: AppColors.gray600,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          width: size.width / 1,
          height: 1,
          color: AppColors.gray400,
        ),
      ],
    );
  }
}
