import 'package:angular/angular.dart';
import 'package:core/list_view_model.dart';
import 'package:core/movie_mapper.dart';
import 'package:core/service.dart';
import 'package:core/mapper.dart';
import 'package:core/model/movie.dart';

import 'src/di/movie_module.dart';

import 'package:http/http.dart' as http;

@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  directives: [coreDirectives],
  providers: [
    ClassProvider(http.Client),
    ClassProvider(Mapper, useClass: MovieMapper),
    ValueProvider.forToken(key, "b445ca0b"),
    ValueProvider.forToken(host, "www.omdbapi.com"),
    FactoryProvider(Service, provideService),
    FactoryProvider(ListViewModel, provideViewModel)
  ],
  styleUrls: [
    'package:angular_components/app_layout/layout.scss.css',
    'package:angular_components/css/mdc_web/card/mdc-card.scss.css',
    'app_component.css',
  ]
)
class AppComponent implements OnInit, OnDestroy {
  AppComponent(this.viewModel);

  final ListViewModel viewModel;

  List<Movie> movies;
  bool loading;
  
  @override
  void ngOnInit() {
    viewModel.outputs.result.listen((data) => movies = data);
    viewModel.outputs.loading.listen((isLoading) => loading = isLoading);

    viewModel.inputs.start('avenger');
  }

  @override
  void ngOnDestroy() {
    viewModel.dispose();
  }
}
