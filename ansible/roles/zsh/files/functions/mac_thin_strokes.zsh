#!/bin/sh

mac_thin_stroke() {
  if [[ ! $(defaults read -g CGFontRenderingFontSmoothingDisabled 2> /dev/null) = 0 ]]; then
    defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO
  else
    defaults write -g CGFontRenderingFontSmoothingDisabled -bool YES
  fi
}
