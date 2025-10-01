import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bussniss_logic/character_cubit.dart';
import '../bussniss_logic/character_state.dart';
import '../core/app_color.dart';
import '../data/models/character_model.dart';
import 'widgets/animated_qoutes.dart';

class DetailsViwe extends StatelessWidget {
  const DetailsViwe({
    super.key,
    required this.character,
  });
  final CharacterModel character;

  Widget createSliverAppBar() {
    return SliverAppBar(
      leading: BackButton(
        color: AppColor.grey,
      ),
      expandedHeight: 600,
      stretch: true,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          character.fullName,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        background: Hero(
          tag: character.id,
          child: Image.network(
            character.image,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  Widget buildCharacterInfo({required String titel, required String value}) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: '$titel:',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          TextSpan(
            text: value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      height: 30,
      color: AppColor.yellow,
      endIndent: endIndent,
      thickness: 3,
    );
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CharacterCubit>(context).provideAllQuotes();
    return Scaffold(
      backgroundColor: AppColor.grey,
      body: CustomScrollView(
        slivers: [
          createSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                padding: EdgeInsets.all(4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildCharacterInfo(
                      titel: 'name : ',
                      value: character.fullName,
                    ),
                    buildDivider(270),
                    buildCharacterInfo(
                      titel: 'family : ',
                      value: character.family,
                    ),
                    buildDivider(300),
                    buildCharacterInfo(
                      titel: 'id ',
                      value: character.id.toString(),
                    ),
                    buildDivider(300),
                    buildCharacterInfo(
                      titel: 'title ',
                      value: character.titel,
                    ),
                    buildDivider(250),
                    buildCharacterInfo(
                      titel: 'firstName',
                      value: character.firstName,
                    ),
                    buildDivider(250),
                    buildCharacterInfo(
                      titel: 'lastName',
                      value: character.lastName,
                    ),
                    buildDivider(150),
                    SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<CharacterCubit, CharacterState>(
                      builder: (context, state) {
                        if (state is CharacterLoadedQuotesState) {
                          return AnimatedQoutes(state: state);
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              color: AppColor.yellow,
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 500,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
