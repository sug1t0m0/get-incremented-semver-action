# An GitHub action image to put new git tag for next semantic version
#
# Usage:
#   steps:
#     - uses: actions/checkout@v3
#     - uses: sug1t0m0/set-incremented-semver-action@v1
FROM ghcr.io/sug1t0m0/semver-incrementer:latest
ADD ./entrypoint.sh /entrypoint.sh
RUN git config --global --add safe.directory "${GITHUB_WORKSPACE}"
RUN git config --global --add safe.directory /github/workspace
RUN echo "${GITHUB_WORKSPACE}"
ENTRYPOINT ["/bin/sh", "-c"]