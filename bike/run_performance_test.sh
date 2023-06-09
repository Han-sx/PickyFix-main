#!/bin/bash

declare -a arguments=(
  "CC=gcc TEST_BGF=1 LEVEL=1 RDTSC=1 AVX512=1"
  "CC=gcc TEST_BGF=1 LEVEL=3 RDTSC=1 AVX512=1"
  "CC=gcc TEST_BGF=1 LEVEL=5 RDTSC=1 AVX512=1"
  "CC=gcc TEST_BGF=1 LEVEL=1 RDTSC=1"
  "CC=gcc TEST_BGF=1 LEVEL=3 RDTSC=1"
  "CC=gcc TEST_BGF=1 LEVEL=5 RDTSC=1"
  "CC=gcc LEVEL=1 R_BITS=13829 RDTSC=1 MAX_IT=2 TEST_PICKYFIX=1 AVX512=1"
  "CC=gcc LEVEL=1 R_BITS=13109 RDTSC=1 MAX_IT=3 TEST_PICKYFIX=1 AVX512=1"
  "CC=gcc LEVEL=1 R_BITS=12739 RDTSC=1 MAX_IT=4 TEST_PICKYFIX=1 AVX512=1"
  "CC=gcc LEVEL=1 R_BITS=12413 RDTSC=1 MAX_IT=5 TEST_PICKYFIX=1 AVX512=1"
  "CC=gcc LEVEL=3 R_BITS=27397 RDTSC=1 MAX_IT=2 TEST_PICKYFIX=1 AVX512=1"
  "CC=gcc LEVEL=3 R_BITS=25867 RDTSC=1 MAX_IT=3 TEST_PICKYFIX=1 AVX512=1"
  "CC=gcc LEVEL=3 R_BITS=25189 RDTSC=1 MAX_IT=4 TEST_PICKYFIX=1 AVX512=1"
  "CC=gcc LEVEL=3 R_BITS=24677 RDTSC=1 MAX_IT=5 TEST_PICKYFIX=1 AVX512=1"
  "CC=gcc LEVEL=5 R_BITS=41411 RDTSC=1 MAX_IT=2 TEST_PICKYFIX=1 AVX512=1"
  "CC=gcc LEVEL=5 R_BITS=39901 RDTSC=1 MAX_IT=3 TEST_PICKYFIX=1 AVX512=1"
  "CC=gcc LEVEL=5 R_BITS=39163 RDTSC=1 MAX_IT=4 TEST_PICKYFIX=1 AVX512=1"
  "CC=gcc LEVEL=5 R_BITS=39019 RDTSC=1 MAX_IT=5 TEST_PICKYFIX=1 AVX512=1"
  "CC=gcc LEVEL=1 R_BITS=13829 RDTSC=1 MAX_IT=2 TEST_PICKYFIX=1"
  "CC=gcc LEVEL=1 R_BITS=13109 RDTSC=1 MAX_IT=3 TEST_PICKYFIX=1"
  "CC=gcc LEVEL=1 R_BITS=12739 RDTSC=1 MAX_IT=4 TEST_PICKYFIX=1"
  "CC=gcc LEVEL=1 R_BITS=12413 RDTSC=1 MAX_IT=5 TEST_PICKYFIX=1"
  "CC=gcc LEVEL=3 R_BITS=27397 RDTSC=1 MAX_IT=2 TEST_PICKYFIX=1"
  "CC=gcc LEVEL=3 R_BITS=25867 RDTSC=1 MAX_IT=3 TEST_PICKYFIX=1"
  "CC=gcc LEVEL=3 R_BITS=25189 RDTSC=1 MAX_IT=4 TEST_PICKYFIX=1"
  "CC=gcc LEVEL=3 R_BITS=24677 RDTSC=1 MAX_IT=5 TEST_PICKYFIX=1"
  "CC=gcc LEVEL=5 R_BITS=41411 RDTSC=1 MAX_IT=2 TEST_PICKYFIX=1"
  "CC=gcc LEVEL=5 R_BITS=39901 RDTSC=1 MAX_IT=3 TEST_PICKYFIX=1"
  "CC=gcc LEVEL=5 R_BITS=39163 RDTSC=1 MAX_IT=4 TEST_PICKYFIX=1"
  "CC=gcc LEVEL=5 R_BITS=39019 RDTSC=1 MAX_IT=5 TEST_PICKYFIX=1"
)

i=0
for args in "${arguments[@]}"; do
  make clean 1> /dev/null; make $args 1>/dev/null
  ./bin/perf $i
  i=$(( i + 1 ))
done

