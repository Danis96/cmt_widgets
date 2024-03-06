import '../../models/helpers/shield_model.dart';

class ShieldListHelper {
  List<ShieldFilter> shields = [
    ShieldFilter(
      id: 0,
      order: 0,
      text: 'Title 1',
      icon:
          'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/82114837-0066-42c3-990d-755b33d0743a/dgw053q-46b09f3e-36a2-4975-a767-df22c40451ca.jpg/v1/fill/w_1192,h_670,q_70,strp/swamp_dragon_by_travis_anderson_dgw053q-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9OTAwIiwicGF0aCI6IlwvZlwvODIxMTQ4MzctMDA2Ni00MmMzLTk5MGQtNzU1YjMzZDA3NDNhXC9kZ3cwNTNxLTQ2YjA5ZjNlLTM2YTItNDk3NS1hNzY3LWRmMjJjNDA0NTFjYS5qcGciLCJ3aWR0aCI6Ijw9MTYwMCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19._SNnsEcUHyx863Ph0fXfTXB5CO_SjLlLcwM3nZbPak8',
    ),
    ShieldFilter(
      id: 0,
      order: 0,
      text: 'Title 2',
      icon:
          'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/82114837-0066-42c3-990d-755b33d0743a/dgw053q-46b09f3e-36a2-4975-a767-df22c40451ca.jpg/v1/fill/w_1192,h_670,q_70,strp/swamp_dragon_by_travis_anderson_dgw053q-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9OTAwIiwicGF0aCI6IlwvZlwvODIxMTQ4MzctMDA2Ni00MmMzLTk5MGQtNzU1YjMzZDA3NDNhXC9kZ3cwNTNxLTQ2YjA5ZjNlLTM2YTItNDk3NS1hNzY3LWRmMjJjNDA0NTFjYS5qcGciLCJ3aWR0aCI6Ijw9MTYwMCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19._SNnsEcUHyx863Ph0fXfTXB5CO_SjLlLcwM3nZbPak8',
    ),
    ShieldFilter(
      id: 0,
      order: 0,
      text: 'Title 3',
      icon:
          'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/82114837-0066-42c3-990d-755b33d0743a/dgw053q-46b09f3e-36a2-4975-a767-df22c40451ca.jpg/v1/fill/w_1192,h_670,q_70,strp/swamp_dragon_by_travis_anderson_dgw053q-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9OTAwIiwicGF0aCI6IlwvZlwvODIxMTQ4MzctMDA2Ni00MmMzLTk5MGQtNzU1YjMzZDA3NDNhXC9kZ3cwNTNxLTQ2YjA5ZjNlLTM2YTItNDk3NS1hNzY3LWRmMjJjNDA0NTFjYS5qcGciLCJ3aWR0aCI6Ijw9MTYwMCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19._SNnsEcUHyx863Ph0fXfTXB5CO_SjLlLcwM3nZbPak8',
    ),
    ShieldFilter(
      id: 0,
      order: 0,
      text: 'Title 4',
      icon:
          'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/82114837-0066-42c3-990d-755b33d0743a/dgw053q-46b09f3e-36a2-4975-a767-df22c40451ca.jpg/v1/fill/w_1192,h_670,q_70,strp/swamp_dragon_by_travis_anderson_dgw053q-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9OTAwIiwicGF0aCI6IlwvZlwvODIxMTQ4MzctMDA2Ni00MmMzLTk5MGQtNzU1YjMzZDA3NDNhXC9kZ3cwNTNxLTQ2YjA5ZjNlLTM2YTItNDk3NS1hNzY3LWRmMjJjNDA0NTFjYS5qcGciLCJ3aWR0aCI6Ijw9MTYwMCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19._SNnsEcUHyx863Ph0fXfTXB5CO_SjLlLcwM3nZbPak8',
    ),
    ShieldFilter(
      id: 0,
      order: 0,
      text: 'Title 5',
      icon:
          'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/82114837-0066-42c3-990d-755b33d0743a/dgw053q-46b09f3e-36a2-4975-a767-df22c40451ca.jpg/v1/fill/w_1192,h_670,q_70,strp/swamp_dragon_by_travis_anderson_dgw053q-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9OTAwIiwicGF0aCI6IlwvZlwvODIxMTQ4MzctMDA2Ni00MmMzLTk5MGQtNzU1YjMzZDA3NDNhXC9kZ3cwNTNxLTQ2YjA5ZjNlLTM2YTItNDk3NS1hNzY3LWRmMjJjNDA0NTFjYS5qcGciLCJ3aWR0aCI6Ijw9MTYwMCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19._SNnsEcUHyx863Ph0fXfTXB5CO_SjLlLcwM3nZbPak8',
    ),
    ShieldFilter(
      id: 0,
      order: 0,
      text: 'Title 6',
      icon:
          'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/82114837-0066-42c3-990d-755b33d0743a/dgw053q-46b09f3e-36a2-4975-a767-df22c40451ca.jpg/v1/fill/w_1192,h_670,q_70,strp/swamp_dragon_by_travis_anderson_dgw053q-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9OTAwIiwicGF0aCI6IlwvZlwvODIxMTQ4MzctMDA2Ni00MmMzLTk5MGQtNzU1YjMzZDA3NDNhXC9kZ3cwNTNxLTQ2YjA5ZjNlLTM2YTItNDk3NS1hNzY3LWRmMjJjNDA0NTFjYS5qcGciLCJ3aWR0aCI6Ijw9MTYwMCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19._SNnsEcUHyx863Ph0fXfTXB5CO_SjLlLcwM3nZbPak8',
    ),
  ];
}
