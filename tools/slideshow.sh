#!/usr/bin/env bash

cat <<EOF
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
          <!-- Indicators -->
          <ol class="carousel-indicators">
EOF

f=true
c=$(ls ${1} | wc -w)
for i in $(seq 0 1 ${c})
do
cat <<EOF
            <li data-target="#myCarousel" data-slide-to="${i}" class="$( ${f} && echo ' active')"></li>
EOF
f=false
done

cat <<EOF
          </ol>

          <!-- Wrapper for slides -->
          <div class="carousel-inner">
EOF

f=true
for i in $(ls "${1}")
do
cat <<EOF
            <div class="item $( ${f} && echo ' active')">
                <img src="images/slideshow/$(basename ${i})" alt="">
            </div>
EOF
f=false
done

cat <<EOF
          </div>

          <!-- Left and right controls -->
          <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
EOF


