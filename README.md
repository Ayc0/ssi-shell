# Docker image for a ssi introduction

Works with [thuv](https://github.com/gandem/thuv).

## Files

- `Dockerfile`, install packages and copies scripts/config
- `setup.sh`, Dockerfile entrypoint, pass login|password as arguments of docker run

## Commands

- Build: `docker build -t ssi_tuto .`
- Run: `docker run -it --rm --security-opt seccomp=unconfined -p 3000:22 ssi_tuto <login> <passwd>`
- SSH: `ssh -p 3000 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null <login>@0.0.0.0`
- tests: `ssh -p 3000 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -t root@0.0.0.0 '/usr/local/tests/tests.sh'`
