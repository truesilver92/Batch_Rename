Batch_Rename
============

What it does:
     Provides a simple way to rename similarly named files at the same time

How to use:

batch_rename [options]
  -h, --help Display this help
  -f, --function [lambda expression] A Lambda expression accepting totalfilecount and current file as arguments and returning the altered filename
  -d, --directory [Directory] The directory containing the files that function will act on
