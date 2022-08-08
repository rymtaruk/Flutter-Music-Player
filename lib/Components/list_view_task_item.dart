import 'package:flutter/material.dart';
import 'package:musicplayer/Models/result_model.dart';

class ListViewTaskItem extends StatefulWidget {
  final ResultModel? trackData;
  final Function onTrackSelected;

  const ListViewTaskItem(
      {Key? key, this.trackData, required this.onTrackSelected})
      : super(key: key);

  @override
  State<ListViewTaskItem> createState() => _ListViewTaskItemState();
}

class _ListViewTaskItemState extends State<ListViewTaskItem> {
  void onItemSelected() {
    setState(() {
      widget.onTrackSelected(widget.trackData);
    });
  }

  @override
  Widget build(BuildContext context) {
    final album = widget.trackData?.collectionName ?? '';
    final artist = widget.trackData?.artistName ?? '';
    return Card(
      child: ListTile(
        leading: Image.network(widget.trackData?.artworkUrl100 ?? ''),
        title: Text(widget.trackData?.trackName ?? ''),
        subtitle: Text('$album\n$artist'),
        trailing: const Icon(Icons.more_vert),
        isThreeLine: true,
        onTap: () => onItemSelected(),
      ),
    );
  }
}
