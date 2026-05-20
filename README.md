# apitorimmo-deploy

Production deploy helpers for apitorimmo.

## Files

- `docker-compose.yml` runs the release images from GHCR plus MySQL.
- `.env.production` holds secrets and the image tag to deploy.
- `deploy.sh` pulls and starts the selected tag.

## Setup

1. Copy `.env.example` to `.env.production`.
2. Set `GHCR_OWNER` to the GitHub account or org that publishes the images.
3. Set `IMAGE_TAG` to the release tag you want, for example `0.0.1`.
4. Run `./deploy.sh 0.0.1`.

## Notes

- `app` pulls `ghcr.io/$GHCR_OWNER/apitorimmo-app:$IMAGE_TAG`.
- `web` pulls `ghcr.io/$GHCR_OWNER/apitorimmo-web:$IMAGE_TAG`.
- MySQL data is persisted in the `mysql_data` volume.