### Activity flow

1. Tiếp nhận và xử lý thông tin từ khách hàng
	+ Staff:
		+ Đăng ký xe theo VIN
		+ Tạo yêu cầu bảo hành (warranty claim) và gửi lên **hãng**
		+ Đính kèm báo cáo kiểm tra, hình ảnh, thông tin chuẩn đoán. Lấy báo cáo từ **Technican**
		+ Lưu dịch sử dịch vụ và bảo hành và gửi cho **admin**
		+ Quản lý tiến độ sửa chữa / thay thế phụ tùng. Lấy tiến độ từ **Technican**
		+ Theo dõi trạng thái yêu cầu (đã gửi - chờ duyệt - đc chấp nhận - đã xử lý) lấy trạng thái từ **admin**
		+ Cập nhật kết quả bảo hành và bàn giao xe. Lấy kết quả từ **Technican**.
	+ Technican:
		+ Gắn số seri phụ tùng lắp lên xe (chỉ đánh dấu phụ kiện quan trọng như pin, này nọ)
		+ Nhận phụ tùng từ **hãng** 
2. Thực hiện bảo hành


TODO:
T5:
+ List tools + Languages (6 sections)
+ Understanding business process

FE: ReactJs
BE: Srping boot
Design: Figma
Project Management: Click_Up / Jira
Source code management: Github
ERD: https://lucid.app/


Tools:
BE: IntelliJ
FE: VScode
DB: MSSQL
API testinng: Postman
CI/CD: Jenkins, ArgoCD
Containerize: Docker, Kubernetes


## Todos
Manager: 
	+ project nào có cái status là inactive thì ko hiển thị lên màn hình 
	+ Thêm button Cancel project đó, button Deactivate Project chỉnh thành remove project
	+ ![[Pasted image 20260311112906.png]]
	+ Chỉnh logic nếu projectStatus là Inactive thì khi tạo project mới, project mới tạo có thể lấy tên của project đã inactive (vì coi như đã xóa r nên dùng lại tên cũng đc).
	+ Sort cái list project theo ngày tạo project, tương tự như 
	+ Tạo button add project member
	+ ![[Pasted image 20260311113506.png]]
	+ Check available annotator & reviewer có available ko (khi annotator hoặc reviwer đó đã đc assign vào một project khác)
	+ Hiển thị data item trong phần dataset
	+ Hiển thị màu cạnh label name
	+ ![[Pasted image 20260311115040.png]]
	+ Bổ sung phần assign dataset vào assignment
	+ Bổ sung hiển thị Associated project trong phần assignment

Annotator:
+ Hiển thị số dataitem cho dataset hiện tại
+ ![[Pasted image 20260311115757.png]]
+ Gắn TaskAPI vào để hiện task
+ Gắn AssignmentApi & DataItemApi để hiển thị thông tin assignment và số dataitem phải làm
+ Gắn AnnotationApi
+ Bổ sung task status, nếu label cho hết số dataitem thì flag for review sẽ là yes


Upload 1 folder nhiều ảnh (min 30 ảnh)