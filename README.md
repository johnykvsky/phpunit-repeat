# phpunit-repeat

Simple Linux shell script to run PHPUnit tests given number of times.

Since `--repeat` has been removed from PHPUnit and so far (12.3) not been restored yet, here is simple script to help debugging tests randomly failing.

For more details please check [this](https://github.com/sebastianbergmann/phpunit/issues/5174) and [this](https://github.com/sebastianbergmann/phpunit/issues/5718).

## Usage

```bash
phpunit-repeat.sh -r 10 -f myFailingTest
```

* `-r` indicates number of repeats (default: 5)
* `-f` passes given parameter to PHPUnit `--filter` argument (default: no filter)
* `-l` `phpunit` file location (default: `vendor-bin`)

By default, it will run **all** tests 5 times. With `-f MyTest` it will run 5 times only `MyTest`

If your PHPUnit file is i.e. at `vendor/bin/phpunit`, just run script as:

```bash
phpunit-repeat.sh -r 10 -f myFailingTest -l vendor/bin
```

## License

This script is released under the MIT License. See [`LICENSE`](LICENSE) for details.