import 'package:flutter/material.dart';
import '../../constants/constant.dart';
import '../../core/app_color.dart';
import '../../data/models/character_model.dart';
import '../details_view.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({super.key, required this.characterModel});
  final CharacterModel characterModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        color: AppColor.grey,
        child: InkWell(
          onTap: () => Navigator.pushNamed(
            context,
            detailsView,
            arguments: characterModel,
          ),
          child: GridTile(
            footer: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.black54,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  characterModel.fullName,
                  style: TextStyle(
                    color: AppColor.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            child: Hero(
              tag: characterModel.id,
              child: Container(
                color: AppColor.grey,

                child: characterModel.image.isNotEmpty
                    ? FadeInImage(
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        placeholder: AssetImage('assets/images/loading.gif'),
                        image: NetworkImage(characterModel.image),
                      )
                    : Image.asset('assets/images/spongpop.jpeg'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
