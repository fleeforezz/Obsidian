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