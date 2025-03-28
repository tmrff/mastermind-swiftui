#!/bin/bash

SCHEME='Mastermind'
DESTINATION='platform=iOS Simulator,OS=latest,name=iPhone 16 Pro'

set -o pipefail && xcodebuild test -scheme $SCHEME -sdk iphonesimulator -destination "$DESTINATION" CODE_SIGNING_ALLOWED='NO' | xcbeautify
