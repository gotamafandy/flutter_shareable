abstract class Service<R, T> {
  Future<T> execute(R request);
}