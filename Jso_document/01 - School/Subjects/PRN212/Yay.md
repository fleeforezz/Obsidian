Lương NET và lương GROSS
đth rung / ting bao nhiêu -> NET
muốn lương cỡ 20tr thì phải deal cỡ 22tr vì bị trừ thuế này nọ

SA -> Solution Architech -> Vị trí tuyển dụng, chỉ thiết kế dàn khung class, mục tiêu bảo trì, nâng cấp, mở rộng, cdoe trong tương lai

Nguyên lý thiết kế hướng đối tượng - OOP principles
Encapsulation
-> Đóng gói đặc tính và hành vi vào trong 1 đơn vị, che giấu và show ra khi cần thiết qua public/private

Abstraction
-> Trừu tượng, nhận diện class từ bài toán

Inheritance
-> Leverage the re-use ability of code - reuse code mà ko cần code lại, con thừa kế từ cha

Polymorphism
-> Đa xạ, đa hình. 1 hành động có nhiều cách triển khai, 1 hàm có nhiều hình thức viết code khác nhau.
Tính_diện_tích()
Tính_diện_tích_tròn() -> PI * R^2 -> implementaion
Tính_diện_tích_CN() -> W * L -> implementaion
@Override và @Overload

Nâng cao: S.O.L.I.D
S: Single Responsibility -> mỗi class ko nên ôm đồm công việc chỉ nên làm 1 loại việc mà thoi
	Class student chỉ xoay quanh student
	Class generate QR code thì chỉ generate QR, ko làm thêm việc gửi email 
O:  
L:
I:
D:

Class: 
+ Khuôn
+ Mold
+ Form
+ Blue-print
Object / Instance of a class:
+ 1 hiện thân, 1 thể hiện của class
+ 1 phiên bản đời thực



#### Quy tắc đặt tên solution, project, namespace

Solution: là cái app bự mà bn muốn làm, nó chứa bên trong nhiều project, mỗi project ứng với 1 namespace gốc - package chứa code, mỗi project chứa nhiều class bên trong
- Mỗi solution ứng vs 1 thư mục gốc, các project là thư mục con bên trong solution
- Quy tắc đặt tên: Danh từ, chữ hoa từng đầu từ - pascal case notation, dấu chấm để phân cách các mục trong tên solution
	- Format: Tên Công Ty Làm App.Tên Solution.Tên Dự Án.Tên Chức Năng
	- Ví dụ: Microsoft.DotNet.
			Microsoft.EntityFramework.Core.SqlServer
			Giaolang.Health

-> Đề thi pe: yêu cầu đặt tên project và solution ko theo chuẩn ở trên, tui đã góp ý. Nếu thấy đề thi yêu cầu đặt tên ko giống ở đây, làm ơn theo đề thi. Nhưng đi làm, mình lật mặt, theo quy tắc đã đc học ở trên. Đề thi dùng _ để phân cách!!!!

Project: là 1 module bự trong 1 solution, nó chứa các class để giải quyết 1 chắc năng bự nào đó, ví dụ project chỉ focus vào athor, project khác chỉ focus vào utils ví dụ như gửi mail, xuất pdf, import file, có project chịu trách nhiệm CRUD table
+ Mỗi project là 1 thư mục con của solution
+ Mỗi project chứa nhiều class bên trong, khi biên dịch gom lại thành 1 file .dll
+ DLL: Dynamic link library (~.jar trong java)
+ File .dll đc gọi tên là Assembly (1 file nhị phân là mãnh gép, cấu kiện, miếng lego để tạo nên cái app bự)
+ Trong 1 solution sẽ có 1 project chính, chứa Main() hoặc chứa endpoint để khởi động cái app, project này đc dịch ra thành .dll và .exe luôn, .exe dùng để run app
+ Quy tắc đặt tên: Y chang quy tắc đặt tên solution
	+ Format: ên Công Ty Làm App.Tên Solution.Tên Dự Án.Tên Chức Năng
+ Mỗi project ứng vs 1 thư mục trên ổ đĩa, thư mục này đc dùng làm hộ khẩu, địa chỉ, nguồn gốc xuất thân, nơi cư trú của các class bên trong nó. Thư mục project mặc định đc dùng làm namespace cho các class bên trong project.

Namespace: ko gian, căn nhà, nơi chốn, hộ khẩu, thư mục, package (java). Chứa file src code .cs bên trong chứa các class. Mặc định c# lấy tên thư mục của project làm namespace của các class bên trong. nhưng bn có quyền ko dùng quy tắc này, nghĩ là tên prj, thư mục prj ko đc dùng làm tên namespace mà bn độ ra 1 tên bn thích, Tùy team, nhưng ae thường dùng default. Java thì khác, namespace bên java gọi là package tên package phản ánh 100% cấu trúc thư mục trên ổ đĩa để lưu src code
+ Quy tắc đặt tên: Tên Công Ty Làm App.Tên Solution.Tên Dự Án.TeenChucNangNho -> class có thể ko đặt theo tên thư mục project đc lun
+ Chữ hoa đầu từ

Quy tắc đặt tên class - Y chang java - pascal case
Danh từ chữ hoa từng đầu từ vì case là phân nhóm, 1 nhóm, thì phải có tên riêng
ví dụ: Cat, Dog, Employee, PdfGenerator, File, String, Serialization, Arraylist, HashMap,...

Quy tắc đặt tên biến
Biến trong class gọi là field, Atribute
Biến trong hàm, ngay tham số hàm, gọi là biến cục bộ - Local variable

Java
```Java
public class Student() {
	private String id;
	private String name;
	
	public Student(String id) {
		int basicSalary;
	} 
}
 ```

C#
```csharp
public class Student() 
{
	private string _id;
	private string _name;
	
	public Student(string id)
	{
		int basicSalary;
	}
}
```

Biến local: cú pháp camel case notation
Field biến C# cũng xài con lạc đà như java, nhưng thêm _ ở đầu tên biến

Dữ liệu quanh ta, và đc trừu tượng hóa vào trong thế giới lập trình chia thành 2 dạng, nói cách khác dữ liệu quanh ta có 2 hình dạng, 2 hình thái

1. Dữ liệu đơn giản, Single Value
	+ 5, 10, 15, 20, 100, 2004, 2005, 9.8, 0.08, 0.1, 3.14, -274, A, V, B, D
	+ Đơn giá trị, ko cần nhiều lời để mô tả về nó, nó chỉ có nhiêu đó mà thôi
	-> Java gọi đám này là Primitive data type
	-> C# gọi là value-type data type
	-> int, long, float, double, char, short, byte, bool/boolean
	-> Dữ liệu Pri.Val khi truyền vào hàm để hàm có info xử lý thì câu chuyện diễn ra ntn? con int, con long, con double khi truyền vào hàm thì chuyện diễn ra ntn. 

2. Dữ liệu phức tạp, Complex Value, Complicated Value, Composite Value
	1. Truyền dữ liệu vào hàm style truyền tham trị, pass by value
		// Bên trong hàm đổi, bên ngoài giữ nguyên -> truyền tham trị
		// Tạo hàm chỉ xin giá trị của biến bên ngoài
		// Sau đó trong hàm tự xử lí mà ko ảnh hưởng biến gốc bên ngoài
		Ko nói năng gì cả, pri.val data type khi đưa vào hhamf mặc định là truyền tham trị. Int, long, float, double,... đưa vào hàm, là tham trị -> đúng cho cả C#, C Java
		Nhưng C# còn làm nhiều hơn thế, ko có trong java !!! với primitive, value-type int long float,... C# có thể truyền tham chiếu luôn
		Đặc quyền truyền tham chiếu là mặc định cho kiểu dữ liệu phức tạp, kiểu object (Java và C#) nhưng với C# có thể truyền tham chiếu vs data đơn giản, ko cần biến object
		+ Java: int, long, float, double... -> Tham trị nhen
		+ C#: int, long, float, double... -> Tham trị nhen (Default); 
	2. Truyền dữ liệu vào hàm style truyền tham chiếu, pass by reference
		Với primitive, value type, thì có thể truyền tham chiếu luôn nếu thêm keyword "out" trong tham số
		Trong hàm sửa biến, tham số, biến gốc bên ngoài bị đổi theo luôn
		+ Xài: Có từ out ở lúc truyền tham số
				Biến đầu vào ko cần gần giá trị, vì đằng nào nó cũng bị đè value bởi bên trong hàm !!!
			 ko cần truyền value vì hàm "out" đã hứa sẽ có value trả v


Mình là người nghiêm túc, Nghiêm khắc, chuẩn mực 
Code Get Set 


Nullable: bàn về null (able, able to)
Null: trong db 1 cột mang null nghĩa là cột đó chưa có giá trị, chưa bik chính xác giá trị là gì, từ từ sẽ có, nhưng ngay lúc này chưa bik

## Delegate

- Deletgate: Ủy nhiệm, ủy quyền
### Mối quan hệ giữa datatype, variable, data
1. Data Type:
- là tên gọi của 1 nhóm data đồng dạng, có cùng hình dạng
2. Data là những thứ quanh ta, biểu diễn 1 thứ gì đó: Số. chữ, object
--> Data Type là tên gọi chung cho đám data
-> Có tên gọi chung thì sẽ có tên gọi riêng
 3. Biến - Variable
 - Biến là tên gọi riêng cho 1 data thuộc tập data type nào đó
 - Tên gọi riêng cho 1 data
-> Data Type là tên gọi riêng cho 1 nhóm data

	- VD: 
		Data: 5  10  15  20  300000 500000
		-> Cùng nguyên con, ko lẻ miếng Tên gọi chung là Int, Long
		
		Data: 3.14  0.08  3.1415  0.1
		-> Lẻ miếng (3.14 hơn 3 nhưng chưa đến 4) Tên gọi chung là float, double

		Data: {SE1, AN, 2005, 8.6} {SE1, BINH, 2005, 8.2} {SE1, NAM, 2005, 3.6}
		-> Khá phức tạp, gồm nhiều info bên trong {ID, Name, YOB, GPA} -> Student
		public class Student {
			// Chứa các info phức tạp - Object
		}

		Data: {Nguyễn Thanh Tùng, 1993, Thái Bình, Nhạc viện TPHCM} {Nguyễn Thùy Chi, 1993, Hà Nội, RMIT}
		-> Khá phức tạp, gồm nhiều info bên trong, nhưng đồng dạng {Tên, YOB, Quê quán, nơi học}
		public class Singer {
			// Các info của ca sĩ bất kì
		}

--> Có 2 loại data type:
1. Data Type đơn giản: Primitive datatype, Value-Type: int, long, float, double,...
2. Data Type phức tạp: Object Data Type, Class Student, class Singer, class Dog,...

### Công thức chung về mối liên hệ giữa 3 đứa

DataType  Biến = Data, Value;
int              yob  = 2005;
double      pi      = 3.14;
Student    an     = new() {....}
Singer       chipu= new Singer() {....}

### 