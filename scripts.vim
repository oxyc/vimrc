if did_filetype()
  finish
endif

if getline(1) =~ '^#!.*node'
  setfiletype node
elseif getline(1) =~ '^#!/bin/bash'
  setfiletype sh
elseif getline(1) =~ '^#!/bin/sh'
  setfiletype sh
elseif getline(1) =~ '^#!.*php'
  setfiletype php
endif
