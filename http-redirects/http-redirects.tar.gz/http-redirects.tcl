package provide httpRedirects 1.0
package require Tcl 8.6
package require http
package require uri

namespace eval ::httpRedirects {
    namespace export geturl
}

proc ::httpRedirects::geturl {url args} {
    array set URI [::uri::split $url]
    for {set i 0} {$i < 5} {incr i} {
        set token [::http::geturl $url {*}$args]

        if {![string match {30[1237]} [::http::ncode $token]]} {
            return $token
         }

        array set meta [string tolower [set ${token}(meta)]]

        if {![info exist meta(location)]} {
            return $token
        }

        array set uri [::uri::split $meta(location)]

        unset meta

        if {$uri(host) eq {}} {set uri(host) $URI(host)}

        # problem w/ relative versus absolute paths
        set url [::uri::join {*}[array get uri]]
    }
}
