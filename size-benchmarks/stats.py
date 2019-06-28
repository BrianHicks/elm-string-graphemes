#!/usr/bin/env python
import subprocess

with_filename = 'withSegmentation.js'
without_filename = 'withoutSegmentation.js'

def compare(kind, filename_a, filename_b):
    a_contents = open(filename_a, "rb").read()
    b_contents = open(filename_b, "rb").read()

    print('{}:\t{:.2f}kb to {:.2f}kb\t({:+.2f}kb)'.format(
        kind,
        len(a_contents) / 1024,
        len(b_contents) / 1024,
        (len(b_contents) - len(a_contents)) / 1024,
    ))

# uncompressed

subprocess.check_output(['elm', 'make', '--optimize', '--output={}'.format(with_filename), 'src/WithSegmentation.elm'])
subprocess.check_output(['elm', 'make', '--optimize', '--output={}'.format(without_filename), 'src/WithoutSegmentation.elm'])

compare('Optimized', without_filename, with_filename)

# uglify

def uglify(filename, out):
    compressed = subprocess.check_output(['uglifyjs', filename, '--compress', 'pure_funcs=[F2,F3,F4,F5,F6,F7,F8,F9,A2,A3,A4,A5,A6,A7,A8,A9],pure_getters,keep_fargs=false,unsafe_comps,unsafe'])
    subprocess.run(['uglifyjs', filename, '--mangle', '--output={}'.format(out)], input=compressed)

with_filename_min = with_filename.replace('.js', '.min.js')
without_filename_min = without_filename.replace('.js', '.min.js')

uglify(with_filename, with_filename_min)
uglify(without_filename, without_filename_min)

compare('Uglified', without_filename_min, with_filename_min)

# gzip

with_filename_min_gz = with_filename_min + '.gz'
without_filename_min_gz = without_filename_min + '.gz'

subprocess.check_call(['gzip', '-9', '-k', '-f', with_filename_min])
subprocess.check_call(['gzip', '-9', '-k', '-f', without_filename_min])

compare('Gzipped', without_filename_min_gz, with_filename_min_gz)
