# phpunit-repeat

Simple Linux shell script to run PHPUnit tests given number of times.

Since `--repeat` has been removed from PHPUnit and so far (12.3) not been restored yet, here is simple script to help debugging tests randomly failing.

## Usage

```bash
phpunit-repeat.sh -r 10 -f myFailingTest
```

* `-r` indicates number of repeats (default: 5)
* `-f` passes given parameter to PHPUnit `--filter` argument (default: no filter)

This script assume composer `bin-dir` is set to `vendor-bin` and script is placed at the same level as folder `vendor-bin`, as it expect to run `vendor-bin/phpunit`. If `phpunit` is elsewhere - just edit file and change line `php vendor-bin/phpunit --no-coverage --stop-on-failure $filter`.

By default, it will run **all** tests 5 times. With `-f MyTest` it will run 5 times only `MyTest`

## License

This script is released under the MIT License. See [`LICENSE`](LICENSE) for details.