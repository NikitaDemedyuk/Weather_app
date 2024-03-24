import '../../domain/repositories/token_repository.dart';

class TokenRepositoryImpl implements TokenRepository {
  const TokenRepositoryImpl();

  @override
  String getToken() {
    const token = '944186bb130c62027aeb6ddb680590d4';

    return token;
  }
}
