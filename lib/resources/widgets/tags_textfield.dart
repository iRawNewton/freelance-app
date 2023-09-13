import 'package:flutter/material.dart';
import 'package:freelance_app/resources/widgets/text_widget.dart';
import 'package:textfield_tags/textfield_tags.dart';

import '../constants/colors.dart';

class TagsTextField extends StatefulWidget {
  const TagsTextField({
    super.key,
    required this.label,
    required this.isImp,
  });
  final String label;
  final bool isImp;

  @override
  State<TagsTextField> createState() => _TagsTextFieldState();
}

class _TagsTextFieldState extends State<TagsTextField> {
  late double _distanceToField;
  late TextfieldTagsController _controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = TextfieldTagsController();
  }

  static const List<String> _pickLanguage = <String>[
    'c',
    'c++',
    'java',
    'python',
    'javascript',
    'php',
    'sql',
    'yaml',
    'gradle',
    'xml',
    'html',
    'flutter',
    'css',
    'dockerfile'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomText(
              title: widget.label,
              size: 14.0,
              color: CustomColors.primaryTextColor,
            ),
            const SizedBox(width: 5.0),
            widget.isImp
                ? const CustomText(
                    title: '*',
                    size: 14.0,
                    color: Colors.red,
                  )
                : const SizedBox(),
          ],
        ),
        const SizedBox(height: 5.0),
        Autocomplete<String>(
          optionsViewBuilder: (context, onSelected, options) {
            return Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Material(
                  elevation: 4.0,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 200),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: options.length,
                      itemBuilder: (BuildContext context, int index) {
                        final dynamic option = options.elementAt(index);
                        return TextButton(
                          onPressed: () {
                            onSelected(option);
                          },
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                              child: Text(
                                '#$option',
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 74, 137, 92),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            );
          },
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text == '') {
              return const Iterable<String>.empty();
            }
            return _pickLanguage.where((String option) {
              return option.contains(textEditingValue.text.toLowerCase());
            });
          },
          onSelected: (String selectedTag) {
            _controller.addTag = selectedTag;
          },
          fieldViewBuilder: (context, ttec, tfn, onFieldSubmitted) {
            return TextFieldTags(
              textEditingController: ttec,
              focusNode: tfn,
              textfieldTagsController: _controller,
              initialTags: const [
                'pick',
                'your',
                'favorite',
                'programming',
                'language',
              ],
              textSeparators: const [' ', ','],
              letterCase: LetterCase.normal,
              validator: (String tag) {
                if (tag == 'php') {
                  return 'No, please just no';
                } else if (_controller.getTags!.contains(tag)) {
                  return 'you already entered that';
                }
                return null;
              },
              inputfieldBuilder:
                  (context, tec, fn, error, onChanged, onSubmitted) {
                return ((context, sc, tags, onTagDelete) {
                  return TextField(
                    controller: tec,
                    focusNode: fn,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 0.0),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFE9E9E9),
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3.0,
                          color: CustomColors.primaryColor,
                        ),
                      ),
                      helperText: 'Enter language...',
                      helperStyle: const TextStyle(
                        color: Color.fromARGB(255, 74, 137, 92),
                      ),
                      hintText: _controller.hasTags ? '' : "Enter tag...",
                      errorText: error,
                      prefixIconConstraints:
                          BoxConstraints(maxWidth: _distanceToField * 0.74),
                      prefixIcon: tags.isNotEmpty
                          ? SingleChildScrollView(
                              controller: sc,
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                  children: tags.map((String tag) {
                                return Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20.0),
                                    ),
                                    color: Color.fromARGB(255, 74, 137, 92),
                                  ),
                                  margin: const EdgeInsets.only(right: 10.0),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0,
                                    vertical: 4.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        child: Text(
                                          '#$tag',
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        onTap: () {
                                          //print("$tag selected");
                                        },
                                      ),
                                      const SizedBox(width: 4.0),
                                      InkWell(
                                        child: const Icon(
                                          Icons.cancel,
                                          size: 14.0,
                                          color: Color.fromARGB(
                                              255, 233, 233, 233),
                                        ),
                                        onTap: () {
                                          onTagDelete(tag);
                                        },
                                      )
                                    ],
                                  ),
                                );
                              }).toList()),
                            )
                          : null,
                    ),
                    onChanged: onChanged,
                    onSubmitted: onSubmitted,
                  );
                });
              },
            );
          },
        ),
        // ElevatedButton(
        //   style: ButtonStyle(
        //     backgroundColor: MaterialStateProperty.all<Color>(
        //       const Color.fromARGB(255, 74, 137, 92),
        //     ),
        //   ),
        //   onPressed: () {
        //     _controller.clearTags();
        //   },
        //   child: const Text('CLEAR TAGS'),
        // ),
      ],
    );
  }
}
