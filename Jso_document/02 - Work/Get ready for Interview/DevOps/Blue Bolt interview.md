# Vòng Technical Skill
## Linux & Docker
**Câu 1:** Sự khác nhau giữa CMD và ENTRYPOINT trong Dockerfile là gì ?
+ `Entrypoint` định nghĩa lệnh chính luôn được chạy khi container khởi động, không thể bị override bằng argument thông thường. 
+ `CMD` cung cấp argument mặc định, có thể bị override khi chạy `docker run <args>`. Trong dự án Homelab Edge có dùng các standalone VM - thường dùng kết hợp các ENTRYPOINT cố định + CMD làm default args.

**Câu 2:** Docker volume và bind mount khác nhau như thế nào ? Khi nào dùng cái nào ?
+ `Volume` được Docker quản lý, lưu tại `/var/lib/docker/volumes` phù hợp cho data production (databases, certs).
+ `Bind mount`ánh xạ trực tiếp thư mục host vào container, phù hợp cho development (source code hot-reload). Trong Network_Pipe, Traefik dùng bind mount cho TLS_Cert (./certs:/certs) để cập nhật bên ngoài container.

**Câu 3:** Giải thích docker-compose network: Tại sao các container trong cùng compose file có thể giao tiếp với nhau qua tên service ?
+ Docker compose tạo một bridge network mặc định cho mỗi project. Docker engine tích hợp sẵn DNS Resolver, mỗi container được đăng ký tên = tên service trong compose file. Vì vậy traefik có thể gọi `http://pihole:80` mà không cần biết IP. Đây là lý do GLPA Stack, Alloy gửi log tới http://loki:3000 - Loki là tên service trong compose.

**Câu 4:** Bạn sẽ debug một Linux server bị chậm như thế nào? Liệt kê các lệnh và thứ tự ưu tiên.
Quy trình USE(Ultilization, Saturation, Errors)
1. `top/htop` - xem CPU, Memory, Load average
2. `free -h` - kiểm tra ram và swap
3. `iostat -x 1` - kiểm tra disk I/O (await cao = disk bottle neck)
4. `ss tulpn / netstat` - kiểm tra network connections
5. `dmesg | tail`- xem kernel errors (OOM killer...) 
6. `journalctl -xe` - xem system log gần đây
Trong GLPA Stack, Prometheus + Grafana sẽ giúp phát hiện vấn đề này trước khi server thực sự chậm 

**Câu 5:** Giải thích sự khác biệt giữa `EXPOSE` trong Dockerfile và `-p` khi chạy `docker run`.
Expose chỉ là document - nó không thực sự mở port, chỉ thông báo cho người dùng biết container lắng nghe port nào. `-p host:container` mới thực sự publish port ra host. 
+ Ví dụ: Portainer dùng expose 9443 trong image, nhưng phải `-p 9443:9443` thì mới truy cập được từ bên ngoài - giống như cấu hình trong Network_Pipe.  

**Câu 6:** Systemd là gì? Viết một systemd service file đơn giản để tự khởi động một script khi boot.
Systemd là init system của Linux, quản lý lifecycle của services.
Unit file cơ bản:
```sh
[Unit]
Description=My Script
After=network.target

[Service]
ExecStart=/usr/local/bin/myscript.sh
Restart=always

[Install]
WantedBy=multi-user.target
```
Sau đó: `systemctl daemon-reload && systemctl enable -- now myservice`
Trong Homelab Edge, các cronjob cũng hoạt động nguyên lý tương tự
## CI/CD
**Câu 1:** CI/CD là gì? Phân biệt Continuous Integration, Continuous Delivery và Continuous Deployment.
`CI`: Developer push code -> tự  động build + test.
+ Mục tiêu: phát hiện lỗi sớm
`Continuous Delivery`: Sau CI, artifact sẵn sàng deploy bất cứ lúc nào nhưng cần approval thủ công.
`Continuous Deployment`: Không cần approval, mỗi thay đổi pass CI đều tự động deploy lên production ngay.

**Câu 2:** Trong một GitHub Actions workflow, `on: push` và `on: pull_request` khác nhau như thế nào? Bạn sẽ dùng cái nào để chạy test?
`on: push trigger` khi có commit được push trực tiếp lên branch.
`on: pull_request` trigger khi mở / update PR - chạy trong ngữ cảnh merge commit (HEAD của PR + target branch).
-> Best practice: dùng pull_request để chạy test + lint trc khi merge, dùng `push` vào main/master để trigger deploy. Kết hợp: `on: [push: branchs: [main], pull_request]`.

**Câu 3:** Secrets trong CI/CD pipeline được quản lý như thế nào? Tại sao không được hardcode trong code?
Hardcode secrets = lộ thông tin trong git history ngay cả khi đã xoá. Cách đúng:
+ Github Actions: Settings -> Secrets and variables -> Actions, dùng ${{ secrets.My_Secret }}
+ Gitlab CI: Settings -> CI/CD -> Variables
+ Jenkins: Credential Manager

**Câu 4:** Giải thích khái niệm "pipeline as code". Tại sao Jenkinsfile hay `.gitlab-ci.yml` lại được lưu trong repo?
Lưu pipeline config trong repo giúp:
+ `Version control`(biết ai thay đổi gì), review pipeline cùng với code thay đổi, dễ roll-back khi pipeline bị hỏng, áp dụng nguyên lý Infrastructure As Code cho CI/CD. Trong Homelab Edge của mình có boilerplates/Jenkinsfile - đây là template có thể tái sử dụng được.

**Câu 5:** Một pipeline build Docker image và push lên registry sẽ có các bước như thế nào?
Các stages thường gặp:
1. `Checkout`: clone repo
2. `Lint/Test`: chạy unit test, code quality
3. `Build`: `docker build -t myapp:$TAG .`
4. `Scan`: Trivy/Snyk để scan vulnerability trong image
5. `Push`: `docker push registry/myapp:$Tag`
6. `Deploy`: `docker compose pull && docker compose up -d`
Tag image = git commit hoặc sematic version để traceability
## Monitoring & Logging
**Câu 1:** Prometheus hoạt động theo cơ chế pull hay push? Giải thích tại sao lại thiết kế như vậy.
Prometheus dùng `pull model`- nó chủ động scrape metrics từ `/metrics`endpoint của targets theo interval (default 15s). 
+ Ưu điểm: Prometheus biết target nào down (ko scrape được), dễ debug (curl/metrics để test), không cần config ở phía target.
+ Nhược điểm: Ko phù hợp cho short-lived jobs -> dùng Pushgateway. Trong GLPA Stack, node_exporter expose `/metrics` để prometheus scrape - đây là pull model.

**Câu 2:** Loki khác Elasticsearch như thế nào? Tại sao lại chọn Loki cho homelab?
+ `Loki`: chỉ index labels (không index nội dung log), query bằng LogQL, nhẹ hơn nhiều về RAM/CPU/Storage.
+ `ElasticSearch`: index toàn bộ nội dung log, full-context search mạnh hơn nhưng tốn tài nguyên nhiều hơn
Cho Homelab Proxmox/Docker với tài nguyên hạn chế, Loki là lựa chọn hợp lý

**Câu 3:** Grafana Alloy là gì? Nó thay thế cái gì trong observability stack truyền thống?
Grafana Alloy là thế hệ mới của Grafana Agent - một unified telemetry collector dùng OpenTelemetry. Nó thay thế việc dùng nhiều Agent riêng lẻ: Promtail (log shipper cho loki), Grafana Agent (Metrics), FluentBit... Alloy có thể collect cả logs, metrics, traces từ một agent duy nhất. Trong Homelab Alloy xử lý tất cả log sources (Docker, Nginx, Proxmox, Truenas) và forward đến loki.

**Câu 4:** Label cardinality trong Loki là gì? Tại sao không nên dùng IP address làm label?
Loki tạo stream riêng cho mỗi unique combination  of labels. Cardinality cao = nhiều streams = nhiều tiny chunks = tốn RAM và query chậm. Ip address có hàng nghìn giá trị unique -> cardinality exploision. Dùng LogQL parser để extract IP từ log line: {job="nginx"} | pattern ... | ip thay vì promote IP thành label. Trong GLPA Stack đã nêu rõ phần này

**Câu 5:** Viết một PromQL query để tính CPU usage trung bình của tất cả nodes trong 5 phút qua.
```PromQL
100 - (avg by(instance)(rate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)
```
Giải thích:
+ `node_cpu_seconds_total{mode=idle}` là thời gian CPU ở idle. 
+ `rate(...[5m])` tính rate/second trong 5 phút
+ `avg by(instance)` group theo server. 
+ Trừ 100 để ra phần đang dùng.

**Câu 6:** Alerting trong Prometheus hoạt động như thế nào? Alertmanager dùng để làm gì?
+ Flow: Prometheus xem sét các alert rules (PromQL expressions) -> khi điều kiện đúng, chuyển sang trạng thái `PENDING`-> sau for duration -> `FIRING`-> gửi tới Alert Manager.
+ Alert Manager xử lý: routing (ai nhận alert nào), grouping (gom nhiều alert liên quan), inhibition, silencing, rồi gửi noti qua Email, Slack, PagerDuty, Discord,...
## Dự án cá nhân
**Câu 1:** Giải thích tại sao bạn dùng Terraform để provision VM trên Proxmox thay vì tạo thủ công?
Terraform cho phép **Infrastructure as Code**: mô tả hạ tầng trong file `.tf`, version control được, tái tạo lại y hệt bất kỳ lúc nào. Ưu điểm so với manual: idempotent (chạy nhiều lần cho cùng kết quả), dễ scale (copy module cho environment mới), tránh human error, có plan để preview thay đổi trước khi apply. Trong project, bạn chia 3 environment: k8s-clusters, standalone-docker-vms, standalone-vms — thể hiện tư duy modular tốt.

**Câu 2:** Bạn dùng Traefik làm reverse proxy thay vì Nginx. Hãy giải thích sự khác biệt và lý do chọn Traefik cho homelab.
Traefik là **cloud-native reverse proxy** với auto-discovery — tự phát hiện services qua Docker labels hoặc Kubernetes ingress, không cần reload config thủ công. Nginx mạnh và stable nhưng cần reload khi thêm service mới. Với homelab nhiều container, Traefik tiện hơn vì chỉ cần thêm labels vào docker-compose là tự routing. Trong project của bạn, Traefik còn handle TLS termination (HTTPS) cho tất cả internal services qua `*.local`.

**Câu 3:** Tại sao bạn chọn WireGuard thay vì OpenVPN? Hãy giải thích các trade-off.
+ WireGuard ưu điểm: codebase nhỏ hơn (~4000 dòng vs ~100k của OpenVPN) = attack surface nhỏ hơn. Dùng crypto hiện đại: ChaCha20, Curve25519, Poly1305. Handshake nhanh hơn, latency thấp hơn. Chạy ở kernel space nên throughput tốt hơn. 
+ Nhược điểm: không có obfuscation (dễ bị block bởi DPI firewall), không hỗ trợ TCP (chỉ UDP).

**Câu 4:** Giải thích split tunnel vs full tunnel trong VPN. Project của bạn dùng cái nào và tại sao?
+ **Full tunnel** (`AllowedIPs = 0.0.0.0/0`): toàn bộ traffic kể cả internet đi qua VPN. An toàn hơn nhưng chậm hơn do traffic đi vòng qua home server.  
+ **Split tunnel**: chỉ traffic đến homelab (10.0.1.0/24) đi qua VPN, internet bình thường. Trong Network_Pipe, bạn dùng split tunnel mặc định — hợp lý vì chỉ cần truy cập internal services, không muốn giảm tốc độ internet.

**Câu 5:** Trong GLPA Stack, bạn dùng Grafana Alloy để collect log từ Docker. Giải thích cơ chế auto-discovery qua `docker.sock` hoạt động như thế nào.
Alloy kết nối vào `/var/run/docker.sock` (Unix socket của Docker daemon). Qua Docker API, Alloy tự **discover** tất cả running containers, lấy metadata (container name, image, labels). Khi có container mới start, Alloy tự stream logs về. Config trong `docker.alloy`: `discovery.docker` → `loki.source.docker` → forward tới Loki. Không cần config từng container riêng lẻ — đây là điểm mạnh so với file-based log collection.

**Câu 6:** Trong 3 dự án của bạn, điều gì khó nhất bạn gặp phải và bạn đã giải quyết như thế nào?
Dùng cấu trúc **STAR** (Situation, Task, Action, Result). Gợi ý một số hướng thực tế:  
• **Network_Pipe**: debug WireGuard không có handshake → check firewall rules, UDP 51820, IP forwarding  
• **GLPA Stack**: Loki query chậm do high cardinality labels → refactor sang dùng LogQL parser  
• **Homelab-edge**: Terraform state drift khi Proxmox VM bị xóa tay → học về `terraform state rm` và import  
Chọn một vấn đề thực sự bạn gặp và giải thích rõ ràng, trung thực.

# Vòng câu hỏi Behavioral
> [!tip]
> Dùng cấu trúc STAR để trả lời: Situation (bối cảnh) -> Task (nhiệm vụ) -> Action (hành động) -> Result (kết quả)

## Giới thiệu bản thân
**Câu 1:** Hãy giới thiệu về bản thân bạn
+ **Công thức:** Quá khứ -> Hiện tại -> Tương lai. Không kể lại CV, hãy kể về một câu chuyện liền mạch trong 90s.
+ **Gợi ý:** Bắt đầu bằng nền tảng kỹ thuật, nhắc đến 3 dự án (Homelab-Edge, Network_Pipe, GLPA Stack) như bằng chứng tự học, kết bằng lý do ứng tuyển vào vị trí này.
+ **Ví dụ:** "Mình có nền tảng DevOps Engineer, trong quá trình học mình tự build homelab trên proxmox để thực hành Linux, Docker và monitoring thực tế. Mình đã hoàn thành  3 dự án cá nhân - một trong số đó là GLPA Stack, một obserbility stack hoàn chỉnh gồm Grafana, Loki, Prometheus và Alloy. Đó là lý do mình muốn bắt đầu sự nghiệp tại đây."
+ **Lưu ý:** Tránh nói "Mình là người chăm chỉ và cầu tiến" - ai cũng nói vậy. Để dự án nói thay mình.

**Câu 2:** Tại sao bạn lại chọn ngành DevOps thay vì Dev hay các ngành khác ?

**Câu 3:** Bạn thấy mình ở đâu sau 2-3 năm nữa trong lĩnh vực này ?
+ **Nguyên tắc:** Trả lời thành thật nhưng align với growth path của công ty. Đừng nói "muốn làm manager" nếu đây là vị trí kỹ thuật thuần tuý.
+ **Gợi ý:** 
	+ Năm 1: nắm vững CI/CD và container orchestration trong môi trường production thực tế.
	+ Năm 2-3: đảm nhận được thiết kế pipeline từ đầu, có thể mentor fresher mới, bắt đầu tìm hiểu Kubernetes hoặc cloud native.
+ **Ví dụ:** "Mình muốn trong năm đầu nắm thật chắc quy trình CI/CD và monitoring của team. Sau 2–3 năm, mình muốn có thể tự thiết kế và vận hành infrastructure cho một product hoàn chỉnh — và có thể contribute lại cho team bằng kinh nghiệm đó."
+ **Lưu ý:** Đừng quá tham vọng ("CEO sau 5 năm") cũng đừng quá mơ hồ ("muốn phát triễn hơn"). Cụ thể và realistic.
## Làm việc nhóm
**Câu 1:** Kể về một lần bạn làm việc nhóm và đòng góp vào kết quả chung
+ Situation: 

**Câu 2:** 
## Xử lý áp lực
## Học hỏi và phát triển
## Phù hợp văn hoá
