import 'package:dental_notes/app/features/home/current%20month/cubit/current_month_cubit.dart';
import 'package:dental_notes/data/remote_data_sources/workdone_remote_data_source.dart';
import 'package:dental_notes/domain/models/workdone_model.dart';
import 'package:dental_notes/domain/reporitories/workdone_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentMonth extends StatefulWidget {
  const CurrentMonth({
    Key? key,
  }) : super(key: key);

  @override
  State<CurrentMonth> createState() => _CurrentMonthState();
}

class _CurrentMonthState extends State<CurrentMonth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => CurrentMonthCubit(
            WorkdoneRepository(WorkdoneRemoteDataSource()),
            WorkdoneRemoteDataSource()..workdone()),
        child: BlocBuilder<CurrentMonthCubit, CurrentMonthState>(
          builder: (context, state) {
            // if (snapshot.hasError) {
            //         return const Text('Wystąpił nieoczekiwany błąd');
            //       }
            //       if (snapshot.connectionState == ConnectionState.waiting) {
            //         return const Text('Proszę czekać trwa ładowanie danych');
            //       }

            final workdoneModels = state.workdone;
            return ListView.builder(
                shrinkWrap: true,
                itemCount: workdoneModels.length,
                itemBuilder: ((context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(workdoneModels[index].date.toString()),
                      Text(workdoneModels[index].doctor),
                      Text(workdoneModels[index].patient),
                      Text(workdoneModels[index].quantity.toString()),
                      Text(workdoneModels[index].color),
                      Text(workdoneModels[index].teeth),
                      Text(workdoneModels[index].type),
                    ],
                  );
                }));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class WorkdoneWidget extends StatelessWidget {
  const WorkdoneWidget({
    Key? key,
    required this.workdoneModel,
  }) : super(key: key);

  final WorkdoneModel workdoneModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(workdoneModel.date.toString()),
              Text(workdoneModel.doctor),
              Text(workdoneModel.patient),
              Text(workdoneModel.quantity.toString()),
              Text(workdoneModel.color),
              Text(workdoneModel.teeth),
              Text(workdoneModel.type),
            ],
          ),
        ],
      ),
    );
  }
}
