# Mode Analytics Bridge

A [Dockerized](https://hub.docker.com/r/rjocoleman/mode-bridge/) [Bridge Connector](https://about.modeanalytics.com/data-sources/) for [Mode Analytics](https://modeanalytics.com).

*Features:*

* Based on debian:jessie-slim
* Downloads the [latest bridge package](https://packagecloud.io/modeanalytics) on on build.
* Not demonized.
* Configured via Environment variables.

## Usage

Create a new bridge [manually](https://modeanalytics.com/settings/data_source_bridges) to obtain your ENV variables.

```
$ docker run \
  -e MODE_ACCESS_TOKEN=foo \
  -e MODE_TOKEN_SECRET=bar \
  -e MODE_SERVER=baz \
  --restart=always \
  --detach \
  kariusdx/mode-analytics-bridge
```