
#!/bin/sh
right_now="$(date +"%A"," %b %d"," %Y":"  %H%M")"
var=$1
if [ "$1" = "" ]; then
        echo "usage: modify filename [filename ...]"
fi

for var; do
if [ -d $var ]; then
        echo "modify: " $var ", is a directory."
fi
if [ -x $var ]; then
        echo "modify: " $var ", cannot edit executables."
fi
if [ "$(file $var)" = "$var: ASCII text" ]; then
ed -s $var<<EOF
a
Modified on: $right_now
Modified by: Jared Sleep
.
w
q
EOF

ed -s $var<<EOF
2t0
3d
w
q
EOF

ed -s $var<<EOF
,s/Gradez/Grades/g
w
q
EOF
fi
done
