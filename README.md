# Nimble Santa 🌲

Ruby script to organize Secret Santa at [Nimble][hire].

## Usage

- Clone the repository

```shell
$  git clone git@github.com:nimblehq/git-template.git`
```

- Install dependencies

```shell
$  bundle install
```

- Add participants in `participants.yml`

```yaml
- name: Bob
  email: bob@gmail.com
- name: Alice
  email: alice@gmail.com
```

- Execute the script

```
$  ruby santa.rb
```

Review the output of the participants matches in the terminal:

```shell
{:santa=>{:name=>"Bob", :email=>"bob@gmail.com"}, :receiver=>{:name=>"Alice", :email=>"alice@gmail.com"}}
{:santa=>{:name=>"Alice", :email=>"alice@gmail.com"}, :receiver=>{:name=>"Bob", :email=>"bob@gmail.com"}}
```

## Troubleshooting

For all email issues, refer to the `gmail` gem [documentation](https://github.com/gmailgem/gmail#troubleshooting).

## License

This project is Copyright (c) 2014 and onwards Nimble. It is free software,
and may be redistributed under the terms specified in the [LICENSE] file.

[LICENSE]: /LICENSE

## About

![Nimble](https://assets.nimblehq.co/logo/dark/logo-dark-text-160.png)

This project is maintained and funded by Nimble.

We love open source and do our part in sharing our work with the community!
See [our other projects][community] or [hire our team][hire] to help build your product.

[community]: https://github.com/nimblehq
[hire]: https://nimblehq.co/
