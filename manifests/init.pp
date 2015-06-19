# == Class: rcs
#
# Manage /etc/default/rcS variables to affect the behaviour of boot scripts.
#
# === Parameters
#
# [*TMPTIME*]
#   Delete files from /tmp if they are older than TMPTIME value.
#   Provide the value in terms of days.
#   Default: 0 (always remove, regardless of age).
#
# [*SULOGIN*]
#   Cause init to spawn sulogin on the console early in the boot process.
#   If no administrator logs in within 30s, the boot process continues.
#   Default: no
#
# [*DELAYLOGIN*]
#
# [*UTC*]
#   Governs how the BIOS clock is read and written to.
#   If set to 'yes', it is assumed that the BIOS clock approximates to UTC.
#   Else, the hardware clock will be assumed to be local time.
#   Default: yes
#
# [*VERBOSE*]
#   Make the boot process more verbose.
#   Default: no
#
# [*FSCKFIX*]
#   Automatically repair filesystems with inconsistencies during boot.
#   Default: no
#
# === Authors
#
# Andrew Langhorn <andrew@ajlanghorn.com>
#
# === Copyright
#
# Copyright 2015 Andrew Langhorn, unless otherwise noted.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
class rcs(
  $TMPTIME      = $rcs::params::tmptime,
  $SULOGIN      = $rcs::params::sulogin,
  $DELAYLOGIN   = $rcs::params::delaylogin,
  $UTC          = $rcs::params::utc,
  $VERBOSE      = $rcs::params::verbose,
  $FSCKFIX      = $rcs::params::fsckfix,
){

  validate_string($TMPTIME)
  validate_string($SULOGIN)
  validate_string($DELAYLOGIN)
  validate_string($UTC)
  validate_string($VERBOSE)
  validate_string($FSCKFIX)

  anchor { 'rcs::begin': } ->
  class { '::rcs::config': } ->
  anchor { '::rcs::end': }

}
