# Mod Key #
set $mod Mod4

# Colors #
set $gray   #5C6370
set $dark   #282C34
set $light  #ABB2BF

# Workspaces #
set $w1 1
set $w2 2
set $w3 3
set $w4 4

# Startup Programs #
exec --no-startup-id xrdb ~/.Xresources
exec --no-startup-id compton
exec --no-startup-id redshift -l 42:-71

# Settings #
focus_follows_mouse no
focus_wrapping no

# Starting Gaps #
gaps inner 70
gaps outer 0

# Floating Windows #
floating_modifier $mod
bindsym $mod+e floating toggle

# Default Mode #
bindsym $mod+d exec rofi -show drun -drun-match-fields name
bindsym $mod+t exec xterm -tn xterm-256color
bindsym $mod+x exec i3lock -c 282C34 -u

bindsym $mod+b bar mode toggle
bindsym $mod+f fullscreen toggle
bindsym $mod+q kill
bindsym $mod+s split toggle
bindsym $mod+z restart

bindsym $mod+h focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+l focus right

bindsym $mod+y workspace $w1
bindsym $mod+u workspace $w2
bindsym $mod+i workspace $w3
bindsym $mod+o workspace $w4

# Gaps Mode #
bindsym $mod+g mode "gaps"
mode "gaps"
{
    bindsym h gaps outer current minus 10
    bindsym j gaps inner current minus 10
    bindsym k gaps inner current plus 10
    bindsym l gaps outer current plus 10
    bindsym Escape mode "default"
}

# Move Mode #
bindsym $mod+m mode "move"
mode "move"
{
    bindsym h move left
    bindsym j move down
    bindsym k move up
    bindsym l move right
    bindsym y move container to workspace $w1
    bindsym u move container to workspace $w2
    bindsym i move container to workspace $w3
    bindsym o move container to workspace $w4
    bindsym Escape mode "default"
}

# Resize Mode #
bindsym $mod+r mode "resize"
mode "resize"
{
    bindsym h resize shrink width 10 px or 10 ppt
    bindsym j resize shrink height 10 px or 10 ppt
    bindsym k resize grow height 10 px or 10 ppt
    bindsym l resize grow width 10 px or 10 ppt
    bindsym Escape mode "default"
}

# Volume Mode #
bindsym $mod+v mode "volume"
mode "volume"
{
    bindsym h exec pactl set-sink-mute 0 1
    bindsym j exec pactl set-sink-volume 0 -10%
    bindsym k exec pactl set-sink-volume 0 +10%
    bindsym l exec pactl set-sink-mute 0 0
    bindsym Escape mode "default"
}

# Workspace Mode #
bindsym $mod+w mode "workspace"
mode "workspace"
{
    bindsym h move workspace to output left
    bindsym j move workspace to output down
    bindsym k move workspace to output up
    bindsym l move workspace to output right
    bindsym Escape mode "default"
}

# Appearance #
for_window[class="^.*"] border pixel 3

client.focused          $light $light $light $light $light
client.focused_inactive $gray  $gray  $gray  $gray  $gray
client.unfocused        $gray  $gray  $gray  $gray  $gray

# Bar #
bar
{

    modifier none
    status_command i3status --config ~/.config/i3/bar
    position top
    font pango:Hack 10
    tray_output none
    tray_padding 0
    separator_symbol " "

    colors
    {
        background $dark
        statusline $light
        focused_workspace $dark $dark $light
        inactive_workspace $dark $dark $gray
    }
}
