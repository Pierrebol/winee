Rails.configuration.stripe = {
  publishable_key: ENV['pk_test_51J7jJnBJK5NflEUoTJ4umajg0Yt5g5GSYMJTSf1RMEh6hzOMdw1PfvUJC60ADHYzuhUjfVS5fE7iZyKt9lR6breI00W88DXIDl'],
  secret_key:      ENV['sk_test_51J7jJnBJK5NflEUoWZ6utxb6oW0pBCvXG5RwMg08lvstsG3rXrhwPDiusq79OfQimkGeL0h7NvKJMb4PbQMklKcB00OhyYW0n1']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
