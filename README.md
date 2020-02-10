# action-codespell

This GitHub action runs [codespell](https://github.com/codespell-project/codespell)
with [reviewdog](https://github.com/reviewdog/reviewdog).

It is based on [action-misspell](https://github.com/reviewdog/action-misspell)
from [haya14busa](https://github.com/haya14busa).
While [misspell](https://github.com/client9/misspell) might be faster, it hasn't
been updated for some time and also so word-list is compiled in making it quite
unflexible.

## Example usage

`uses: plettich/action-codespell@master`

