cmake_minimum_required(VERSION 3.11)

project(caffeine-rtc)

# find_package(webrtc REQUIRED)

set(caffeine-rtc_HEADERS
    caffeine/caffeine.h)

set(caffeine-rtc_SOURCES
    caffeine/caffeine.cc)

if(WIN32)
    list(APPEND caffeine-rtc_SOURCES
        caffeine/caffeine.def)
endif()

add_library(caffeine-rtc MODULE
    ${caffeine-rtc_SOURCES}
    ${caffeine-rtc_HEADERS})
