#GraphML Parser
This is a Haskell graphml parser built using parsec.
This parser can parse everything in the following document:
  http://graphml.graphdrawing.org/primer/graphml-primer.html
Currently to use this, run the executable and with your graphs in the path: "/graphs/<example>.graphml"
When the exe will prompt for a file name, it will look in the path and add the extension. Only <example> is replaced.
##More Examples
Input: small
Result: "/graphs/small.graphml"

I: large
Result: "/graphs/large.graphml"
