if did_filetype()
  finish
endif

if getline(1) =~ '^#!.*node'
  setf=node
elseif getline(1) =~ '^#!/bin/bash'
  setf=sh
elseif getline(1) =~ '^#!/bin/sh'
  setf=sh
elseif getline(1) =~ '^#!.*php'
  setf=php
endif
