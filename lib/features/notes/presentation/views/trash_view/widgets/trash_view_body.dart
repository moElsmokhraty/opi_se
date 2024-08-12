import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/functions/show_snack_bar.dart';
import 'trash_item.dart';
import 'no_trash_widget.dart';
import '../../../cubits/trash_cubit/trash_cubit.dart';
import '../../../../../../core/widgets/custom_error_widget.dart';

class TrashViewBody extends StatelessWidget {
  const TrashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TrashCubit cubit = BlocProvider.of<TrashCubit>(context);
    return RefreshIndicator(
      onRefresh: () async {
        await cubit.getTrash(page: 1, limit: 10);
      },
      child: BlocConsumer<TrashCubit, TrashState>(
        listener: (context, state) async {
          if (state is FlushTrashLoading) {
            showCustomSnackBar(context, 'Loading...');
          } else if (state is FlushTrashSuccess) {
            showCustomSnackBar(context, 'Trash flushed successfully');
          } else if (state is FlushTrashFailure) {
            showCustomSnackBar(context, state.failure.errMessage);
          } else if (state is DeleteNoteFromTrashLoading) {
            showCustomSnackBar(context, 'Loading...');
          } else if (state is DeleteNoteFromTrashSuccess) {
            showCustomSnackBar(context, 'Note deleted successfully');
          } else if (state is DeleteNoteFromTrashFailure) {
            showCustomSnackBar(context, state.failure.errMessage);
          } else if (state is RestoreNoteLoading) {
            showCustomSnackBar(context, 'Loading...');
          } else if (state is RestoreNoteSuccess) {
            showCustomSnackBar(context, 'Note restored successfully');
          } else if (state is RestoreNoteFailure) {
            showCustomSnackBar(context, state.failure.errMessage);
          }
        },
        builder: (context, state) {
          if (state is GetTrashFailure && cubit.trash.isEmpty) {
            return CustomErrorWidget(
              errorMessage: state.failure.errMessage,
              onPressed: () {},
            );
          } else if (state is GetTrashLoading && cubit.trash.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (cubit.trash.isEmpty) {
              return const NoTrashWidget();
            } else {
              return GridView.builder(
                itemCount: cubit.trash.length,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 12.w,
                  mainAxisSpacing: 16.h,
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  return TrashItem(note: cubit.trash[index]);
                },
              );
            }
          }
        },
      ),
    );
  }
}
