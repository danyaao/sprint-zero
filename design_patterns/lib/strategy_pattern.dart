enum FetchPolicy {
  networkOnly,
  networkPreferably,
  cashPreferably,
}

class Photo {}

abstract interface class LoadPhotoUseCase {
  Photo call({
    required FetchPolicy fetchPolicy,
  });
}

class LoadPhotoFromNetworkOnlyUseCase implements LoadPhotoUseCase {
  @override
  Photo call({required FetchPolicy fetchPolicy}) {
    print('Loading photo from network');

    return Photo();
  }
}

class LoadPhotoFromNetworkPreferablyUseCase implements LoadPhotoUseCase {
  @override
  Photo call({required FetchPolicy fetchPolicy}) {
    print('Trying to load photo from network');
    print('No internet, loading photo from cash');

    return Photo();
  }
}

class LoadPhotoFromCashPreferablyUseCase implements LoadPhotoUseCase {
  @override
  Photo call({required FetchPolicy fetchPolicy}) {
    print('Trying to load photo from cash');
    print('OS error, loading photo from network');

    return Photo();
  }
}

class LoadPhotoUseCaseStrategy {
  late FetchPolicy fetchPolicy;

  Map<FetchPolicy, LoadPhotoUseCase> mapping = {
    FetchPolicy.networkOnly: LoadPhotoFromNetworkOnlyUseCase(),
    FetchPolicy.networkPreferably: LoadPhotoFromNetworkPreferablyUseCase(),
    FetchPolicy.cashPreferably: LoadPhotoFromCashPreferablyUseCase(),
  };

  void setStrategy(FetchPolicy fetchPolicy) => this.fetchPolicy = fetchPolicy;

  void call() => mapping[fetchPolicy]?.call(fetchPolicy: fetchPolicy);
}
