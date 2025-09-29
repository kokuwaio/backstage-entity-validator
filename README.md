# Backstage entity validator WoodpeckerCI Plugin

[![pulls](https://img.shields.io/docker/pulls/kokuwaio/backstage-entity-validator)](https://hub.docker.com/r/kokuwaio/backstage-entity-validator)
[![size](https://img.shields.io/docker/image-size/kokuwaio/backstage-entity-validator)](https://hub.docker.com/r/kokuwaio/backstage-entity-validator)
[![dockerfile](https://img.shields.io/badge/source-Dockerfile%20-blue)](https://git.kokuwa.io/woodpecker/backstage-entity-validator/src/branch/main/Dockerfile)
[![license](https://img.shields.io/badge/License-EUPL%201.2-blue)](https://git.kokuwa.io/woodpecker/backstage-entity-validator/src/branch/main/LICENSE)
[![prs](https://img.shields.io/gitea/pull-requests/open/woodpecker/backstage-entity-validator?gitea_url=https%3A%2F%2Fgit.kokuwa.io)](https://git.kokuwa.io/woodpecker/backstage-entity-validator/pulls)
[![issues](https://img.shields.io/gitea/issues/open/woodpecker/backstage-entity-validator?gitea_url=https%3A%2F%2Fgit.kokuwa.io)](https://git.kokuwa.io/woodpecker/backstage-entity-validator/issues)

A [Woodpecker CI](https://woodpecker-ci.org) plugin for [backstage-entity-validator](https://github.com/RoadieHQ/backstage-entity-validator) to lint markdown files.  
Also usable with Gitlab, Github or locally, see examples for usage.

## Example

Woodpecker:

```yaml
steps:
  backstage-entity-validator:
    depends_on: []
    image: kokuwaio/backstage-entity-validator:0.5.1
    when:
      event: pull_request
      paths: [catalog-info.yaml]
```

Gitlab: (using script is needed because of <https://gitlab.com/gitlab-org/gitlab/-/issues/19717>)

```yaml
backstage-entity-validator:
  needs: []
  stage: lint
  image:
    name: kokuwaio/backstage-entity-validator:0.5.1
    entrypoint: [""]
  script: [/usr/local/bin/entrypoint.sh]
  rules:
    - if: $CI_PIPELINE_SOURCE == "merge_request_event"
      changes: [catalog-info.yaml]
```

CLI:

```bash
docker run --rm --volume=$(pwd):$(pwd):ro --workdir=$(pwd) kokuwaio/backstage-entity-validator
```

## Settings

| Settings Name | Environment  | Default             | Description        |
| --------------| ------------ | ------------------- | ------------------ |
| `files`       | PLUGIN_FILES | `catalog-info.yaml` | Files to validate. |
