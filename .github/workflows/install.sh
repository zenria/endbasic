#! /bin/sh
# EndBASIC
# Copyright 2020 Julio Merino
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not
# use this file except in compliance with the License.  You may obtain a copy
# of the License at:
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
# License for the specific language governing permissions and limitations
# under the License.

set -eux

# Test the installation workflow with the given set of feature flags (if any),
# and ensure that the resulting binary is minimally functional.
rm -f "${HOME}/.cargo/bin/endbasic"
cargo install --path cli "${@}"
ret=0; echo "EXIT 123" | "${HOME}/.cargo/bin/endbasic" || ret="$?"
if [ "${ret}" -ne 123 ]; then
    echo "Installed endbasic binary doesn't seem to work" 1>&2
    exit 1
fi
