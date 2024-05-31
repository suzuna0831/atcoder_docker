#!/bin/bash

cp -r ./templates/* $(acc config-dir)
acc config default-task-choice all