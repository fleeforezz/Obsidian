```yaml
version: '3.9'

services:
  master:
    image: chrislusf/seaweedfs # Sử dụng image chính thức từ Hub
    command: master -ip=master
    ports:
      - "9333:9333"
      - "19333:19333"

  volume:
    image: chrislusf/seaweedfs
    command: volume -mserver="master:9333" -port=8080 -ip=volume
    ports:
      - "8080:8080"
      - "18080:18080"
    volumes:
      - ./data:/data # Ánh xạ thư mục lưu trữ dữ liệu
    depends_on:
      - master

  filer:
    image: chrislusf/seaweedfs
    command: filer -master="master:9333"
    ports:
      - "8888:8888"
      - "18888:18888"
    depends_on:
      - master
      - volume

  s3:
    image: chrislusf/seaweedfs
    command: s3 -filer="filer:8888"
    ports:
      - "8333:8333"
    depends_on:
      - filer

```