#!/bin/bash
#by nya

LOCKSTATE=$(getprop ro.secureboot.lockstate)
SYSTEMBRAND=$(getprop ro.product.brand)
CPUBRAND=$(getprop ro.product.product.manufacturer)
SYSTEMLOCALE=$(getprop ro.product.locale)
