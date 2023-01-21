import 'package:ariam_handcraft/shared/component/strings.dart';
import 'package:ariam_handcraft/shared/style/widgets/defualtText.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../shared/component/component.dart';
import '../../shared/component/routes_strings.dart';
import '../../shared/cubit/add_products/add_data_cubit.dart';
import '../../shared/cubit/add_products/add_data_state.dart';
import '../../shared/helper/shared_preferences.dart';
import '../../shared/style/colors.dart';
import '../../shared/style/widgets/defultButton.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<AddDataCubit, AddDataState>(
      listener: (context, state) {},
      builder: (context, state) {
        AddDataCubit cubit = AddDataCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                appText(
                  text: "Admin Panel",
                  color: white,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, addDataScreen);
                  },
                  icon: Icon(
                    Iconsax.add_square,
                    color: white,
                    size: height * .04,
                  ),
                ),
                IconButton(
                    onPressed: () async {
                      Navigator.pushReplacementNamed(context, bottomNavigationBar);
                      await FirebaseAuth.instance.signOut();
                    },
                    icon: Icon(
                      Iconsax.logout_1,
                      color: white,
                      size: height * .04,
                    ))
              ],
            ),
            backgroundColor: fayroozy,
            elevation: 10,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: adminPanelCard(context, height, width,),
              )
            ],
          ),
        );
      },
    );
  }
}
