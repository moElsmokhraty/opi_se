import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class TagEditor extends StatefulWidget {
  const TagEditor({
    required this.length,
    required this.tagBuilder,
    required this.onTagChanged,
    this.delimiters = const [],
    required this.controller,
    this.inputDecoration = const InputDecoration(),
    this.onTextFieldChanged,
    super.key,
  });

  final int length;
  final Widget Function(BuildContext, int) tagBuilder;
  final ValueChanged<String> onTagChanged;
  final List<String> delimiters;
  final TextEditingController controller;
  final InputDecoration inputDecoration;
  final void Function(String)? onTextFieldChanged;

  @override
  TagsEditorState createState() => TagsEditorState();
}

class TagsEditorState extends State<TagEditor> {
  late TextEditingController _textFieldController;

  var _previousText = '';

  @override
  void initState() {
    super.initState();
    _textFieldController = widget.controller;
  }

  void _onTagChanged(String string) {
    if (string.isNotEmpty) {
      widget.onTagChanged(string);
      _resetTextField();
    }
  }

  void _onTextFieldChange(String string) {
    widget.onTextFieldChanged?.call(string);
    final previousText = _previousText;
    _previousText = string;

    if (string.isEmpty || widget.delimiters.isEmpty) {
      return;
    }
    if (string.length == 1 && widget.delimiters.contains(string)) {
      _resetTextField();
      return;
    }

    if (string.length > previousText.length) {
      final newChar = string[string.length - 1];
      if (widget.delimiters.contains(newChar)) {
        final targetString = string.substring(0, string.length - 1);
        if (targetString.isNotEmpty) {
          _onTagChanged(targetString);
        }
      }
    }
  }

  void _resetTextField() {
    _textFieldController.text = '';
    _previousText = '';
  }

  @override
  Widget build(BuildContext context) {
    final decoration = widget.inputDecoration.copyWith(
      suffixIcon: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          _onTagChanged(_textFieldController.text);
        },
        icon: const Icon(
          Icons.add_outlined,
          color: Color(0xff036666),
        ),
      ),
    );

    final tagEditorArea = TagLayout(
      delegate: TagEditorLayoutDelegate(
        length: widget.length,
        minTextFieldWidth: 160.0,
        spacing: 8.0,
      ),
      children: List<Widget>.generate(
            widget.length,
            (index) => LayoutId(
              id: TagEditorLayoutDelegate.getTagId(index),
              child: widget.tagBuilder(context, index),
            ),
          ) +
          [
            LayoutId(
              id: TagEditorLayoutDelegate.textFieldId,
              child: TextField(
                enabled: true,
                controller: _textFieldController,
                textCapitalization: TextCapitalization.none,
                autocorrect: false,
                textAlign: TextAlign.start,
                readOnly: false,
                autofocus: false,
                enableSuggestions: true,
                maxLines: 1,
                decoration: decoration,
                onChanged: _onTextFieldChange,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
                ],
              ),
            )
          ],
    );

    return tagEditorArea;
  }
}

class TagLayout extends CustomMultiChildLayout {
  const TagLayout({
    super.key,
    required TagEditorLayoutDelegate super.delegate,
    super.children,
  });

  @override
  TagRenderLayoutBox createRenderObject(BuildContext context) {
    return TagRenderLayoutBox(delegate: delegate as TagEditorLayoutDelegate);
  }
}

class TagRenderLayoutBox extends RenderCustomMultiChildLayoutBox {
  TagRenderLayoutBox({
    super.children,
    required TagEditorLayoutDelegate super.delegate,
  });

  @override
  void performLayout() {
    super.performLayout();
    size = (delegate as TagEditorLayoutDelegate).parentSize;
  }
}

class TagEditorLayoutDelegate extends MultiChildLayoutDelegate {
  TagEditorLayoutDelegate({
    required this.length,
    required this.minTextFieldWidth,
    required this.spacing,
  });

  static const tagId = 'tag_';
  static const textFieldId = 'text_field';

  final int length;
  final double minTextFieldWidth;
  final double spacing;

  Size parentSize = Size.zero;

  static String getTagId(int id) {
    return '$tagId$id';
  }

  static bool _isOverflow({
    required double childWidth,
    required double parentWidth,
    required List<Size> tagSizes,
    required double spacing,
  }) {
    final tagsWidth = tagSizes.fold<double>(0, (result, tag) {
      return result + tag.width;
    });
    final spacingWidth = spacing * max(tagSizes.length - 1, 0);

    return childWidth + tagsWidth + spacingWidth > parentWidth;
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(constraints.maxWidth, 0);
  }

  @override
  void performLayout(Size size) {
    var cursor = Offset.zero;
    var tagSizes = <Size>[];
    for (final index in Iterable<int>.generate(length).toList()) {
      final tagId = getTagId(index);
      if (hasChild(getTagId(index))) {
        final childSize = layoutChild(
          tagId,
          BoxConstraints.loose(
            Size(size.width, double.infinity),
          ),
        );

        if (_isOverflow(
          childWidth: childSize.width,
          parentWidth: size.width,
          tagSizes: tagSizes,
          spacing: spacing,
        )) {
          cursor = Offset(0, cursor.dy + childSize.height);

          tagSizes = <Size>[];
        }

        positionChild(tagId, cursor);
        cursor = Offset(cursor.dx + childSize.width + spacing, cursor.dy);
        tagSizes.add(childSize);
      }
    }

    var textFieldSize = Size.zero;

    if (hasChild(textFieldId)) {
      final currentRowWidth = tagSizes.fold<double>(0, (result, tag) {
        return result + tag.width;
      });
      final spacingWidth = spacing * max(tagSizes.length - 1, 0);
      final leftOverWidth = size.width - currentRowWidth - spacingWidth;
      final textWidth = max(leftOverWidth, minTextFieldWidth);
      if (_isOverflow(
        childWidth: textWidth,
        parentWidth: size.width,
        tagSizes: tagSizes,
        spacing: spacing,
      )) {
        textFieldSize = layoutChild(
          textFieldId,
          BoxConstraints.loose(Size.fromWidth(size.width)),
        );
        cursor = Offset(0, cursor.dy + textFieldSize.height);

        tagSizes = <Size>[];
      } else {
        textFieldSize = layoutChild(
          textFieldId,
          BoxConstraints.loose(Size.fromWidth(textWidth)),
        );
      }
      positionChild(textFieldId, cursor);
    }

    parentSize = Size(size.width, cursor.dy + textFieldSize.height);
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) {
    return false;
  }
}
