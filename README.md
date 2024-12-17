# phpunit-repeat

Simple Linux shell script to run PHPunit tests given number of times.

Since `--repeat` has been removed from PHPUnit and so far (11.5) not been restored yet, here is simple script to help debugging tests randomly failing.

## Usage

```bash
phpunit-repeat.sh -r 10 -f myFailingTest
```

* `-r` indicates number of repeats (default: 5)
* `-f` passes given parameter to PHPUnit `--filter` argument (default: skipped)

This script should be placed just outside `vendor` directory, as it expect to run `vendor/bin/phpunit`.

By default it will run all tests 5 times.

## License

This script is released under the MIT License. See [`LICENSE`](LICENSE) for details.