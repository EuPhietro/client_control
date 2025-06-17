import 'package:flutter/material.dart';

class CostumerTile extends StatefulWidget {
   String? title;
  IconData? leading;

  double width = 0;

  CostumerTile({super.key, this.title, this.leading, required this.width});

  @override
  State<CostumerTile> createState() => _CostumerTileState();
}

class _CostumerTileState extends State<CostumerTile> {
  @override
  void initState() {
    super.initState();
    widget.title;
    widget.leading;
    widget.width;
  }

  @override
  void didUpdateWidget(CostumerTile oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: 120,
      padding: EdgeInsets.only(top: 25, left: 8, bottom: 25, right: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 80,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
              child: Center(
                child: Icon(
                  widget.leading ?? Icons.insert_emoticon_rounded,
                  size: 32,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    widget.title == null || widget.title!.isEmpty
                        ? "Sem Categoria"
                        : widget.title!,
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Container(
              width: 80,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).colorScheme.onSecondary,
                  size: 32,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
