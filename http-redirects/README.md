# httpRedirects

Handle the vicissitudes of HTTP.

## Synopsis

This package provides a `::httpRedirects::geturl` procedure that wraps tcllib's
`::http::geturl` to add support for redirects.

## Usage

Install with `$ tackle add http-redirects`, and then use as below:

```
package require http
package require httpRedirects

set token [::httpRedirects::geturl http://example.com]
set data  [::http::data $token]

puts $data
```

Credit for this code to Donal Fellows, adapted from his contribution to the
[Tclers' wiki](https://wiki.tcl-lang.org/page/Following+Redirectss).

