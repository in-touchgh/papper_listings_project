import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../Providers/routes_provider.dart';
import '../../../Utils/app_colors.dart';
import '../../../Widgets/custom_button.dart';
import 'footer.dart';

class LaBrasserieReuse extends StatefulWidget {
  final Widget child;
  const LaBrasserieReuse({Key? key, required this.child}) : super(key: key);

  @override
  State<LaBrasserieReuse> createState() => _LaBrasserieReuseState();
}

class _LaBrasserieReuseState extends State<LaBrasserieReuse> {
  final pc = PanelController();
  bool open = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final routesProvider = Provider.of<RoutesProvider>(context);

    return Scaffold(
      body: SlidingUpPanel(
        controller: pc,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        color: AppColors.defaultRed,
        minHeight: 60,
        panel: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        !open ? routesProvider.active['name'] : 'Menu',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          if (pc.isPanelClosed) {
                            pc.open();
                            setState(() {
                              open = true;
                            });
                          } else {
                            pc.close();
                            setState(() {
                              open = false;
                            });
                          }
                        },
                        icon: Icon(
                          !open
                              ? CupertinoIcons.chevron_up
                              : CupertinoIcons.chevron_down,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  !open
                      ? const SizedBox.shrink()
                      : const Divider(
                          thickness: 1.2,
                          color: Colors.white,
                        )
                ],
              ),
            ),
            // SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: routesProvider.routes.map((e) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 30),
                      child: InkWell(
                        onTap: () {
                          routesProvider.setActive(e);
                        },
                        child: Text(
                          e['name'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  }).toList()),
            )
          ],
        ),
        body: ListView(
          primary: true,
          children: [
            SizedBox(
              height: size.height * 0.5,
              width: size.width,
              child: Stack(
                children: [
                  SizedBox(
                    height: size.height * 0.5,
                    width: size.width,
                    child: Image.asset(
                      'assets/images/faq.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'La Brasserie',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        Row(
                          children: [
                            CustomButton(
                              onPress: () {},
                              height: 40,
                              width: 40,
                              borderRadius: BorderRadius.circular(20),
                              padding: EdgeInsets.zero,
                              child: const Icon(
                                Icons.phone,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            CustomButton(
                              onPress: () {},
                              height: 40,
                              width: 40,
                              padding: EdgeInsets.zero,
                              borderRadius: BorderRadius.circular(20),
                              child: const Icon(
                                CupertinoIcons.chat_bubble_text_fill,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      height: size.height * 0.5,
                      width: size.width,
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Enjoy a healthy Delicious meal',
                              style: GoogleFonts.greatVibes(
                                fontSize: 30,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const Text(
                              'We are an elegant restaurant with a vast range of African food from Cameroon, Nigeria, Kenya. Visit us \nand we promise you a very tasteful meal.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  color: Colors.grey[100],
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Open now',
                        style: TextStyle(
                          color: AppColors.defaultRed,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('Tuesday - Wednesday'),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '10 AM - 10 PM',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                widget.child
              ],
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class LaBrasserieReuseWeb extends StatefulWidget {
  final Widget child;
  const LaBrasserieReuseWeb({Key? key, required this.child}) : super(key: key);

  @override
  State<LaBrasserieReuseWeb> createState() => _LaBrasserieReuseWebState();
}

class _LaBrasserieReuseWebState extends State<LaBrasserieReuseWeb> {
  final scrollController = ScrollController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final routesProvider = Provider.of<RoutesProvider>(context);

    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
            child: Stack(
              children: [
                SizedBox(
                  height: size.height,
                  width: size.width,
                  child: Image.asset(
                    'assets/images/faq.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 60.0, vertical: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'La Brasserie',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Row(
                        children: [
                          CustomButton(
                            onPress: () {},
                            height: 40,
                            width: 120,
                            child: const Text('Call Now'),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          CustomButton(
                            onPress: () {},
                            height: 40,
                            width: 180,
                            child: const Text('Direct Message'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Enjoy a healthy Delicious meal',
                          style: GoogleFonts.greatVibes(
                            fontSize: 60,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'We are an elegant restaurant with a vast range of African food from Cameroon, Nigeria, Kenya. Visit us \nand we promise you a very tasteful meal.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Column(
            children: [
              Container(
                color: Colors.grey[100],
                padding: const EdgeInsets.symmetric(
                  horizontal: 60,
                  vertical: 20,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Open now',
                      style: TextStyle(
                        color: AppColors.defaultRed,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Tuesday - Wednesday'),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '10 AM - 10 PM',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: routesProvider.routes.map((e) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ChoiceChip(
                        onSelected: (value) {
                          routesProvider.setActive(e);
                        },
                        selectedColor: AppColors.defaultRed,
                        backgroundColor: Colors.transparent,
                        label: Text(e['name']),
                        labelStyle: TextStyle(
                          color: routesProvider.active['route'] == e['route']
                              ? Colors.white
                              : Colors.black,
                        ),
                        selected: routesProvider.active['route'] == e['route'],
                      ),
                    );
                  }).toList(),
                ),
              ),
              widget.child
            ],
          ),
          Footer(controller: scrollController)
        ],
      ),
    );
  }
}
