#!/bin/sh

cd "$GITHUB_WORKSPACE"
git config --global --add safe.directory "$GITHUB_WORKSPACE"

export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

cs_cmdline=""
if [[ -r .codespell_skip ]]; then
  cs_cmdline="${cs_cmdline} -S $(paste -s -d, .codespell_skip)"
fi

if [[ -r .codespell_exclude ]]; then
  cs_cmdline="${cs_cmdline} -x .codespell_exclude"
fi

codespell -q 3 ${cs_cmdline} . \
  | reviewdog -efm="%f:%l: %m" -name="codespell" -reporter="${INPUT_REPORTER:-github-pr-check}" -level="${INPUT_LEVEL}"
