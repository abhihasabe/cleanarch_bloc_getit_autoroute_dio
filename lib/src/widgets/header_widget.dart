import 'package:bloc_clean/core/manager/platform_manager.dart';
import 'package:bloc_clean/core/theme/app_colors.dart';
import 'package:bloc_clean/core/theme/app_dimens.dart';
import 'package:flutter/material.dart';


class Header extends StatelessWidget {
  const Header(
      {Key? key, this.iconColor, this.headerTitle, this.bgColor, this.textColor})
      : super(key: key);

  final Color? iconColor, bgColor, textColor;
  final String? headerTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: SafeArea(
        child: PlatFormManager.isMobile(context)
            ? Container(
                color: bgColor,
                child: appBar(context, headerTitle, textColor!),
              )
            : appBar(context, headerTitle, textColor!),
      ),
    );
  }
}

Widget appBar(BuildContext context, title, Color textColor) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      if (!PlatFormManager.isDesktop(context))
        IconButton(
          icon: const Icon(Icons.menu, color: iconColor),
          onPressed: (){},
        ),
      Padding(
        padding: !PlatFormManager.isMobile(context)
            ? const EdgeInsets.only(left: 48.0)
            : const EdgeInsets.only(left: 8.0),
        child: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: textColor),
        ),
      ),
      if (!PlatFormManager.isMobile(context))
        Spacer(flex: PlatFormManager.isDesktop(context) ? 2 : 1),
      if (!PlatFormManager.isMobile(context))
        const Expanded(child: SearchField()),
      /*if (!PlatFormServices.isMobile(context))*/
      const Align(
        alignment: Alignment.centerRight,
        child: ProfileCard(),
      )
    ],
  );
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: InkWell(
        onTap: (){
         /* context.read<LoginCubit>().logout();
          VxNavigator.of(context).push(Uri.parse(loginScreen));*/
        },
        child: Card(
          elevation: 2,
          child: Container(
            padding: const EdgeInsets.all(defaultPadding * 0.40),
            margin: const EdgeInsets.symmetric(
                horizontal: defaultPadding / 10, vertical: defaultPadding / 10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Image.asset("assets/images/profile.png"),
          ),
        ),
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: SizedBox(
        height: 42,
        child: TextField(
          decoration: InputDecoration(
            isDense: true,
            hintText: "Search",
            fillColor: onPrimaryVariantColor,
            filled: true,
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            suffixIcon: InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(defaultPadding * 0.65),
                margin: const EdgeInsets.symmetric(
                    horizontal: defaultPadding / 6,
                    vertical: defaultPadding / 6),
                decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Image.asset("assets/icons/Search.svg"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}