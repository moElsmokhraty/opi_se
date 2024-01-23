import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'request_item.dart';
import '../../../cubits/match_requests_cubit/match_requests_cubit.dart';

class RequestsViewBody extends StatelessWidget {
  const RequestsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MatchRequestsCubit, MatchRequestsState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetMatchRequestsFailure) {
          return Center(
            child: Text(
              state.failure.errMessage,
              style: TextStyle(
                color: Colors.red,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        } else if (state is GetMatchRequestsSuccess) {
          if (state.response.data?.partnerRequests?.isEmpty ?? true) {
            return Center(
              child: Text(
                'No requests yet',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          }
          return ListView.builder(
            itemCount: state.response.data!.partnerRequests!.length,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 40.h),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 32.h),
                child: RequestItem(
                    partnerRequest:
                        state.response.data?.partnerRequests?[index]),
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
