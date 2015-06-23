# == Class: rcs
#
# Manage /etc/default/rcS variables to affect the behaviour of boot scripts.
#
# === Parameters
#
# [*tmptime*]
#   Delete files from /tmp if they are older than tmptime value.
#   Provide the value in terms of days.
#   Default: 0 (always remove, regardless of age).
#
# [*sulogin*]
#   Cause init to spawn sulogin on the console early in the boot process.
#   If no administrator logs in within 30s, the boot process continues.
#   Default: NO
#
# [*delaylogin*]
#   Normally, the system will not let non-root users log in until the boot
#   process is complete and the system has finished safely switching to the
#   default runlevel (2). However, some operating systems allow login to occur
#   at an earlier stage, namely just after inetd has started. Ensures this
#   isn't possible.
#   Default: NO
#
# [*utc*]
#   Governs how the BIOS clock is read and written to.
#   If set to 'yes', it is assumed that the BIOS clock approximates to utc.
#   Else, the hardware clock will be assumed to be local time.
#   Default: YES
#
# [*verbose*]
#   Make the boot process more verbose.
#   Default: NO
#
# [*fsckfix*]
#   Automatically repair filesystems with inconsistencies during boot.
#   Default: NO
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
  $tmptime = '0',
  $sulogin = 'NO',
  $delaylogin = 'NO',
  $utc = 'YES',
  $verbose = 'NO',
  $fsckfix = 'NO',
){

  validate_string($tmptime)
  validate_string($sulogin)
  validate_string($delaylogin)
  validate_string($utc)
  validate_string($verbose)
  validate_string($fsckfix)

  anchor { 'rcs::begin': } ->
  class { '::rcs::config': } ->
  anchor { '::rcs::end': }

}
