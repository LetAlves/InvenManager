class User{
    final String name;
    final String login;
    final String password;
    final Product products;
    final String email;
    final String phone;

    User ({
        required this.name,
        required this.login,
        required this.password,
        required this.products,
        required this.email,
        required this.phone,
    });
}