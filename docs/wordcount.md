<script src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML" type="text/javascript"></script>

<script type="text/x-mathjax-config">
MathJax.Hub.Config({
  TeX: { equationNumbers: { autoNumber: "AMS" } },
  tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}
});
</script>


<head>
<link rel="stylesheet" href="style.css">
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<header class="site-header">

  <div class="wrap title-wrap">
    <a class="site-title" href="/">HADOOP MapReduce Example: Word count in Python </a>
  </div>

</header>

Map reduce is typically used in applications where we can split the input into key and value pairs. By key value pairs, wee mean something like this

- key1  : value1
- key2 : value2

every key has a value or multiple values
- In the Map step, the input is converted into key:value pairs
- In the Reduce step, common keys are grouped together and the corresponding values are reduced or aggregated into a single value
- By following this Map Reduce frame work, the computational complexity is easily distributed or parallelized.
# Example 1: Count Words in a file

This is a standard example for Map reduce. The objective is simple, count the number of words in a file or multiple files. For example

- Input string: "This is a very large sentence. This sentence can be broken down into words. The words are counted separately"
-Output: "This":2, "is":1, "a":1, "very": 1, "large": 1, "sentence"
: 2, "can":1,"be":1,"broken":1, "down":1, "into":1, The:1, "are":1,"counted":1, "separately":1

- This was relatively simple and we do not really need a map reduce framework to do it. But imagine we have several thousands of files ranging in sizes of multiple gigabytes or terabytes, then map reduce is really useful
# links and references