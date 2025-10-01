import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bussniss_logic/character_cubit.dart';
import '../bussniss_logic/character_state.dart';
import '../constants/constant.dart';
import '../core/app_color.dart';
import '../data/models/character_model.dart';
import 'widgets/character_item.dart';
import 'widgets/searched_fild.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late List<CharacterModel> allCharacters;
  late List<CharacterModel> searchedForCharacters;
  final textFiledController = TextEditingController();
  bool isSearched = false;

  @override
  void initState() {
    super.initState();
    context.read<CharacterCubit>().getAllCharacters();
  }

  startSearching() {
    isSearched = true;
    ModalRoute.of(context)!.addLocalHistoryEntry(
      LocalHistoryEntry(
        onRemove: () {
          isSearched = false;
          textFiledController.clear();
          setState(() {});
        },
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.yellow,

        title: isSearched
            ? SearchedFild(
                textEditingController: textFiledController,
                onChanged: (searchCharachter) {
                  searchedForCharacters = allCharacters
                      .where(
                        (character) =>
                            character.fullName.toLowerCase().startsWith(
                              searchCharachter,
                            ),
                      )
                      .toList();
                  setState(() {});
                },
              )
            : Text(
                'Characters',
                style: TextStyle(
                  color: AppColor.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
        actions: isSearched
            ? [
                IconButton(
                  onPressed: () {
                    isSearched = false;
                    Navigator.pop(context);
                    textFiledController.clear();
                    setState(() {});
                  },
                  icon: Icon(Icons.clear),
                ),
              ]
            : [
                IconButton(
                  onPressed: startSearching,
                  icon: Icon(Icons.search),
                ),
              ],
      ),
      body: BlocBuilder<CharacterCubit, CharacterState>(
        builder: (context, state) {
          if (state is CharacterLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColor.yellow,
              ),
            );
          } else if (state is CharacterLoadedState) {
            allCharacters = (state).characters;

            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.grey,
                    ),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2 / 3,
                      ),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: textFiledController.text.isEmpty
                          ? allCharacters.length
                          : searchedForCharacters.length,

                      itemBuilder: (context, index) {
                        return CharacterItem(
                          characterModel: textFiledController.text.isEmpty
                              ? allCharacters[index]
                              : searchedForCharacters[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else if (state is CharacterFailureState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  state.apiErroe.icon ,
                  size: 50,
                ),
                Text(state.apiErroe.title),
                Text(state.apiErroe.subTitle),
              ],
            );
          } else {
            return Center(
              child: Text('Not Found a Data'),
            );
          }
        },
      ),
    );
  }
}
