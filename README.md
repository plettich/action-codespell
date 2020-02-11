# action-codespell

This GitHub action runs [codespell](https://github.com/codespell-project/codespell)
with [reviewdog](https://github.com/reviewdog/reviewdog).

It is based on [action-misspell](https://github.com/reviewdog/action-misspell)
from [haya14busa](https://github.com/haya14busa).
While [misspell](https://github.com/client9/misspell) might be faster, it hasn't
been updated for some time and also the word-list is compiled in making it quite
unflexible.

## Inputs

### `github_token`

**Required**. Must be in form of `github_token: ${{ secrets.github_token }}`'.
Defaults to `${{ github.token }}`

### `level`

Optional. Report level for reviewdog [info,warning,error].
It's same as `-level` flag of reviewdog.

### `reporter`

Optional. Reporter of reviewdog command [github-pr-check,github-pr-review].
It's same as `-reporter` flag of reviewdog.

## Configuration

The codespell action can be configured with two files in the main repository:
- `.codespell_skip` contains one path or pattern per line (paths starting
  with `./`) which will be skipped during the check.
- `-codespell_exclude` contains source lines which will not be checked.

## Example usage

```yml
name: reviewdog
on: [pull_request]
jobs:
  codespell:
    name: runner / codespell
    runs-on: ubuntu-latest
    steps:
      - name: Check out code.
        uses: actions/checkout@v1
      - name: codespell
        uses: plettich/action-codespell@master
        with:
          github_token: ${{ secrets.github_token }}
```

## TODO
- [ ] update word list
- [ ] add words to ignore during check
- [ ] add own wordlist (exclusive or additional)
