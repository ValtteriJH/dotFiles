#!/bin/bash

# 1. Get the name of the currently focused workspace
ACTIVE_WORKSPACE=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true) | .name')

# 2. Find which output (monitor) that active workspace belongs to
OUTPUT_NAME=$(i3-msg -t get_workspaces | jq -r --arg ws "$ACTIVE_WORKSPACE" '.[] | select(.name==$ws) | .output')


if [ -z "$OUTPUT_NAME" ] || [ "$OUTPUT_NAME" = "null" ]; then
    echo "Error: Could not determine the active output."
    exit 1
fi

if [ -z "$OUTPUT_NAME" ] || [ "$OUTPUT_NAME" = "bottom" || [ "$OUTPUT_NAME" = "top"]; then
    xrandr --delmonitor top 2>/dev/null || true
    xrandr --delmonitor bottom 2>/dev/null || true

    ACTIVE_WORKSPACE=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true) | .name')
    # 2. Find which output (monitor) that active workspace belongs to
    OUTPUT_NAME=$(i3-msg -t get_workspaces | jq -r --arg ws "$ACTIVE_WORKSPACE" '.[] | select(.name==$ws) | .output')
fi


# 3. Detect the current rotation robustly
# We strip the tracking parentheses line first, then look for the rotation keyword
XRANDR_LINE=$(xrandr --query | grep "^$OUTPUT_NAME")
CLEANED_LINE=$(echo "$XRANDR_LINE" | sed 's/(.*)//')

# If 'left', 'right', or 'inverted' is in the remaining text, that's our rotation.
# If none are found, xrandr defaults to 'normal' (and omits the word entirely).
if echo "$CLEANED_LINE" | grep -q "left"; then
    CURRENT_ROTATION="left"
elif echo "$CLEANED_LINE" | grep -q "right"; then
    CURRENT_ROTATION="right"
elif echo "$CLEANED_LINE" | grep -q "inverted"; then
    CURRENT_ROTATION="inverted"
else
    CURRENT_ROTATION="normal"
fi

echo "Output '$OUTPUT_NAME' is currently: $CURRENT_ROTATION"

# 4. Determine the target rotation and apply it
if [ "$CURRENT_ROTATION" = "normal" ]; then
    TARGET_ROTATION="left"


else
    TARGET_ROTATION="normal"

#    if [ -z "$OUTPUT_NAME" ] || [ "$OUTPUT_NAME" = "HDMI-A-0" ]; then
#        xrandr --delmonitor top 2>/dev/null || true
#        xrandr --delmonitor bottom 2>/dev/null || true
#    fi
fi

echo "Toggling $OUTPUT_NAME to $TARGET_ROTATION..."
xrandr --output "$OUTPUT_NAME" --rotate "$TARGET_ROTATION"
if [ -z "$OUTPUT_NAME" ] || [ "$OUTPUT_NAME" = "HDMI-A-0" && "$TARGET_ROTATION" = left]; then
    ./splitScreen.sh
fi
# xrandr --auto
exec hsetroot -fill ~/.config/wpShuffler/.wallpaper.jpg

