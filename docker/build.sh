#!/usr/bin/env bash

set -e

rm -frd temp || true
mkdir temp

echo "Copying resources from other modules. Note they should be generated first."


cp ../mirrorgate-api/build/libs/*.jar temp
cp -R ../mirrorgate-dashboard/dist temp/public

rm -frd temp/public/backoffice || true
cp -R ../mirrorgate-backoffice/dist temp/public/backoffice

rm -frd temp/public/docs || true
cp -R ../mirrorgate-docs/dist temp/public/docs

docker build -t mirrorgate .
