---
banner: https://images.viblo.asia/f27183f5-47c5-4865-b0ec-b6a704cbbf02.png
pixel-banner-flag-color: orange
content-start: "300"
banner-fade: "-50"
---
> Là công cụ để monitoring servers. Prometheus - An opensource Time Series Database

## Time series database
Về Time Series Database - Là khái niệm dùng để ám chỉ những database chuyên dụng, được tối ưu để lưu trữ dữ liệu theo các mốc thời gian.

Dữ liệu mà nó lưu trữ là các metrics về tình trạng servers như RAM, CPU đã dùng của mỗi service, số lượng requests tới server, dung lượng đĩa,..., bất cứ thứ gì mình cần.

Các metrics luôn gắn với một cột mốc thời gian, tạo thành một chuỗi dữ liệu theo thời gian, do vậy ta có thể thông qua prometheus để xem lại dữ liệu của server tại 1h trc đó hay 1thg trc đó để điều tra sự số trên server, hay cũng có thể giúp phát hiện ra những điều gì đó bất thường sớm.

Ví dụ: Server của bn bị chậm đi trông thấy trong 3 ngày gần đây. Thông qua dữ liệu query từ prometheus và visualize thành biểu đồ, bn dễ dàng thấy server đột nhiên CPU luôn tăng cao trong những ngày này. Bn bắt đầu kiểm tra process và phát hiện những process lạ bị hacker cài cắm vào để thực hiện mục đích xấu như lợi dụng để đào coin.

## Prometheus hoạt động ntn?
Prometheus sẽ chủ động pull các metrics về thông qua http mỗi 10s hay 30s do ta thiết lập. Bản thân các service thì thường ko thể tự export đc các metrics cho prometheus mà cần đến các **Instructmentation/Exporter**. Hai khái niệm này chung mục đích, nhưng có thể tạm hiều như sau:

+ **Exporter**: là những app đc viết cho mấy cái thông dụng như **Database,  Server**. Chúng ta chỉ cần chạy nó và nó sẽ export các metrics thu thập đc cho mình.
+ **Instructmentation** thí ám chỉ những client-libraries đc cung cấp bởi Prometheus hoặc một bên thứ 3 nào đó, để mình cài vào ứng dụng của mình, giúp tùy biến những metrics riêng của hệ thống. Kiểu như số lượng người đã login vào website của mình từng giờ chẳng hạn.

![[Pasted image 20250625155554.png]]

Một số exporter mình kể qua như:
+ **Prometheus**: chính bản thân prometheus cũng có một built-in exporter, exporter các metrics về service prometheus ra tại URI: http://prometheus.lc:9090/metrics.
+ **cAdvisor**: export các metrics của các docker service, các process trên server.
+ **Node Exporter**: export các metrics một con node (hiểu là một server), các process trên server.
+ **Postgres Exporter**: giúp đọc dữ liệu từ các bảng trong Postgres và export ra cho prometheus.
+ HAProxy Exporter:

So sánh hoạt động của Prometheus vs InfluxDB. Theo đó Prometheus chủ động tạo request tới các exporter để lấy dữ liệu về trong khi InfluxDB thì ở thế bị động, là các "exporter" sẽ đẩy dữ liệu tới InfluxDB.

![[Pasted image 20250625160628.png]]


> [!NOTE] Tự viết cho mình một Exporter
> [Writing Exporter - Prometheus Documentation](https://prometheus.io/docs/instrumenting/writing_exporters/)

## Cài đặt prometheus

Mình sẽ sử dụng Docker để cài Prometheus, phần cài đặt ko sử dụng docker cũng khá đơn giản. Có thể tham khảo tại đây: [Installation - Prometheus Documentation](https://prometheus.io/docs/prometheus/latest/installation/). Cài đặt prometheus vs Docker đơn giản và nhanh gọn hơn.

### Scrape metrics từ built-in exporter
File cấu hình để prometheus scrapes metrics từ built-in exporter:

> /config/prometheus.yml
```YAML
global:
  scrape_interval: 15s
  scrape_timeout: 10s
  evaluation_interval: 15s

scrape_configs:
  - job_name: prometheus
    scrape_interval: 30s
    static_configs:
      - targets:
        - localhost:9090

```
Phần **global** là cấu hình chung cho tất cả các **scrape_configs**, các config bên trong mỗi job scrape sẽ đc ưu tiên dùng hơn cái global nếu có trùng lặp.



