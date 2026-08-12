#!/usr/bin/env bash

cat <<EOF
      <div id="myCarousel" class="carousel slide mb-6" data-bs-ride="carousel">
          <div class="carousel-indicators">
EOF


f=true
c=$(ls ${1} | wc -w)
for i in $(seq 0 1 ${c})
do
cat <<EOF
              <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="${i}" $(${f} && echo 'class="active" aria-current="true"') aria-label="Slide ${i}"></button>
EOF
f=false
done

cat <<EOF
          </div>
          <div class="carousel-inner">
EOF

f=true
for i in $(ls "${1}")
do
cat <<EOF
            <div class="carousel-item$( ${f} && echo ' active')">
                  <div class="mask bs-secondary-color" width="100%" height="100%" aria-hidden="true">
                    <img src="images/slideshow/$(basename ${i})" class="bd-placeholder-img rounded mx-auto d-block" focusable="false" aria-hidden="true">
                    <!-- <div class="carousel-caption text-start">
                        <h1>Picture Header</h1>
                        <p class="opacity-75">Picture information</p>
                    </div> -->
                  </div>
            </div>
EOF
f=false
done

cat <<EOF
          </div>
          <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
          </button>
          <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
          </button>
      </div>
EOF


