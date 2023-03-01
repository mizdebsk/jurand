#!/bin/bash

set -eux

readonly metafile="target/installed_files"

install_file()
{
	local attr="${1}"; shift
	local target_dir="${1}"; shift
	
	for source_file in "${@}"; do
		install -m "${attr}" -p -D -t "${target_dir}" "${source_file}"
		echo "${target_dir}/${source_file##*/}" >> "${metafile}"
	done
}

install_file 755 "${bindir}" target/bin/java_remove_symbols
install_file 644 "${rpmmacrodir}" macros/macros.jurand
install_file 644 "${mandir}" target/manpages/*.7
