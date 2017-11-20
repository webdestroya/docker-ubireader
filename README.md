# UBIReader Docker Image

A docker image to easily extract files from UBI/UBIFS images.

Uses the [ubi_reader](https://github.com/jrspruitt/ubi_reader) project by Jason Pruitt.

## Usage

```
$ docker run --rm -it -v $(pwd):/firmware webdestroya/ubireader:latest <command> <params>
```

### Example

This example shows a common extraction flow. It creates and destroys temporary docker containers.

```
$ docker run --rm -it -v $(pwd):/firmware webdestroya/ubireader:latest ubireader_display_info custom_ubiimage

UBI File
---------------------
  Min I/O: 2048
  LEB Size: 155572
  PEB Size: 155572
  Total Block Count: 125
  Data Block Count: 123
  Layout Block Count: 2
  Internal Volume Block Count: 0
  Unknown Block Count: 0
  First UBI PEB Number: 0

  Image: 1413066557
  ---------------------
    Image Sequence Num: 1413066557
    Volume Name:somevolname
    PEB Range: 0 - 123

    Volume: somevolname
    ---------------------
      Vol ID: 0
      Name: somevolname
      Block Count: 123

      Volume Record
      ---------------------
        alignment: 1
        crc: '0xffffffff'
        data_pad: 0
        errors: ''
        flags: 'autoresize'
        name: 'somevolname'
        name_len: 20
        padding: '\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
        rec_index: 0
        reserved_pebs: 991
        upd_marker: 0
        vol_type: 'dynamic'


$ docker run --rm -it -v $(pwd):/firmware webdestroya/ubireader:latest ubireader_extract_files -o firmware_export custom_ubiimage

```