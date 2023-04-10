import 'package:bloc_clean/src/features/home/data/model/home_model.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({Key? key, this.state}) : super(key: key);
  HomeModel? state;

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: ListView.builder(
          itemCount: widget.state?.data?.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
              child: Card(
                  color: Theme.of(context).cardColor,
                  child: ListTile(
                      title: Text(
                        '${widget.state?.data?[index].firstName}  ${widget.state?.data?[index].lastName}',
                        style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '${widget.state?.data?[index].email}',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            widget.state!.data![index].avatar.toString()),
                      ))),
            );
          }),
    );
  }
}
