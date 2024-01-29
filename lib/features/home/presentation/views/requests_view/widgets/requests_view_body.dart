import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/utils/socket_service.dart';
import 'request_item.dart';
import 'package:opi_se/core/functions/show_snack_bar.dart';
import '../../../cubits/match_requests_cubit/match_requests_cubit.dart';

class RequestsViewBody extends StatelessWidget {
  const RequestsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    MatchRequestsCubit cubit = BlocProvider.of<MatchRequestsCubit>(context);
    return BlocConsumer<MatchRequestsCubit, MatchRequestsState>(
      listener: (context, state) async {
        if (state is DeclineMatchRequestSuccess) {
          await cubit.getMatchRequests();
        } else if (state is AcceptMatchRequestSuccess) {
          SocketService.emitEvent('acceptPartnerRequest', {
            "notifiedPartner": state.response.notifiedPartner,
            "matchId": state.response.matchId,
            "partnerUserName": state.response.acceptedPartner,
            "partnerImage": "default.png"
          });
          await cubit.getMatchRequests();
        } else if (state is AcceptMatchRequestFailure) {
          showCustomSnackBar(context, state.failure.errMessage);
        } else if (state is DeclineMatchRequestFailure) {
          showCustomSnackBar(context, state.failure.errMessage);
        } else if (state is GetMatchRequestsFailure) {
          showCustomSnackBar(context, state.failure.errMessage);
        } else if (state is DeclineMatchRequestSuccess) {
          showCustomSnackBar(context, 'Request declined successfully');
        } else if (state is AcceptMatchRequestSuccess) {
          showCustomSnackBar(context, 'Request accepted successfully');
        } else if (state is DeclineMatchRequestLoading ||
            state is AcceptMatchRequestLoading) {
          showCustomSnackBar(context, 'Loading...');
        }
      },
      builder: (context, state) {
        if (state is GetMatchRequestsFailure) {
          return Center(
            child: Text(
              state.failure.errMessage,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        } else if (state is GetMatchRequestsLoading) {
          return const Center(
              child: CircularProgressIndicator(color: Color(0xff036666)));
        } else {
          if (cubit.partnerRequests.isEmpty) {
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
            itemCount: cubit.partnerRequests.length,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 40.h),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 32.h),
                child: RequestItem(
                  cubit: cubit,
                  partnerRequest: cubit.partnerRequests[index],
                ),
              );
            },
          );
        }
      },
    );
  }
}
