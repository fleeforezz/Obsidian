# Abstract Factory

## What's Abstact Factory 🧐

Abstact factory là một cách để sắp xếp nhóm các thứ có liên hệ với nhau. Nó cho phép chúng ta tạo ra nhiều thứ khác mà không cần phải biết chi tiết nó là những vật gì.

## Problem 😕

Vậy abstract factory đc tạo ra cho mục đích gì ?

Có một vấn đề khi làm việc với nhiều dòng sản phẩm liên quan khác nhau. 
Đó là chúng ta cần một cách để tạo ra các đồ vật nội thất riêng lẻ sao cho chúng phù hợp với các đồ vật khác trong cùng một họ.

Ngoài ra, chúng ta không muốn phải thay đổi code hiện tại khi thêm sản phẩm vào bài của mình. Vì các nhà cung cấp nội thất sẽ cập nhật danh mục của họ thường xuyên

Ví dụ :
Mình có 3 cái ghế nhưng có 3 loại khác nhau : 

+ Ghế:
	Art deco, Victorian, Modern. Thì 3 cái ghế này có cùng một điểm giống nhau là nó đều là cái ghế có 4 chân và có thể ngồi lên 
+ Bàn:
	Art deco, Victorian, Modern.
+ Sofa:
	Art deco, Victorian, Modern.

## Solution 💡

Chúng ta sẽ xử dụng Abstract Factory để giải quyết vấn đề này
### 1st step

Đầu tiên chúng ta sẽ khai báo class interface cho từng dòng sản phẩm

Ví dụ:
interface của Ghế

![[chair interface.png]]

Tương tự cho bàn và sofa

### 2nd step

Chúng ta sẽ tạo Abstract Factory dưới dạng là một class interface với một danh sách các phương thức để tạo tất cả các product thuộc dòng product

![[Abstract Factory interface.png]]

### Biến thể product

Với mỗi biến thể của dòng product, chúng ta tạo một factory class tách biệt dựa trên Abstract Factory interface. Một factory class là một class mà trả về productc của 1 loại riêng biệt

Ví dụ:
VictorianFurnitureFactory sẽ chỉ tạo ra các đối tượng VictorianChair, VictorianCoffeeTable,...etc.

## Structure 🌿

![[Abstract Factory Structure.png]]

+ **Abstract Products**: Khai báo các interface cho các loại riêng biệt nhưng các product liên quan sẽ tạo thành một dòng product

+ **Concrete Products**: Là các implement khác nhau của abstract product, đc nhóm lại bởi các biến thể. Mỗi abstract product(Chair, CoffeeTable) phải đc implement trong tất cả các biến thể(Victorian, Modern,...). 

+ **Abstract Factory**: Interface khai báo một tập các phương thức cho việc tạo mỗi abstract product.

+ **Concrete Factory**: Implement các phương thức tạo product của abstract factory. Mỗi concrete factory có trách nhiệm đến một biến thể product và chỉ tạo các product của biến thể này.

+ **Client**: 

## Class Diagram 📌

[[Class Diagram of Abstract Factory]]

## Applicability 👷

+ Sử dụng Abstract Factory khi code của bạn cần hoạt động với nhiều dòng sản phẩm liên quan khác nhau.

## Pros and Cons ✅❌

### Pros

+ Bạn có thể chắc chắn rằng các sản phẩm bạn nhận được từ nhà máy đều tương thích với nhau.
+ Bạn tránh sự kết hợp chặt chẽ giữa các sản phẩm cụ thể và mã khách hàng.
+ Bạn có thể trích xuất mã tạo sản phẩm vào một nơi, giúp mã dễ hỗ trợ hơn.

### Cons

+ Code có thể trở nên phức tạp hơn mức cần thiết vì nhiều interface và class mới được giới thiệu cùng với pattern.

# Builder
## What's Builder 🧐

Builder là một trong những Creattional pattern - những mẫu thiết kế cho việc khởi tạo đối tượng của lớp.

Builder Pattern đc tạo ra để xây dựng một đối tượng phức tạp bằng cách sử dụng các đối tượng đơn giản và sử dụng tiếp cận từng bước, việc xây dựng các đối tượng độc lập với các đối tượng khác.

## Problem 😕

Hãy tưởng tượng một Object phức tạp đòi hỏi việc khởi tạo tốn nhiều sức, từng bước của nhiều fields và đối tượng lồng nhau. Code khởi tạo như z thường đc đặt trong một Constructor khổng lồ với nhiều tham số  hoặc thậm chí tệ hơn : nằm rải rác khắp client code.

![[Builder Problem.png]]

Ví dụ:
Để xây một ngôi nhà (class house) bạn cần có 
+ 4 bức tường
+ một tầng
+ lắp 1 cánh cửa
+ cửa sổ
+ mái nhà

```Java
public House(String wall, String floor, String door, String window, String roof) {
	this.wall = wall;
	this.floor = floor;
	this.door = door;
	this.window = window;
	this.roof = roof;
}
```

--> Điều gì sẽ xảy ra nếu bạn muốn nâng cấp nhà của mình ? (nhà lớn hơn, có sân sau, có hồ bơi,...)

Giải pháp đơn giản nhất là mở rộng lớp house và tạo một tập hợp các lớp con

```Java
public House(String wall, String floor, String door, String window, String roof, String backyard, String pool) {
	this.wall = wall;
	this.floor = floor;
	this.door = door;
	this.window = window;
	this.roof = roof;
	this.backyard = backyard;
	this.pool = pool;
}
```

Đôi khi có một số giá trị không cần thiết chúng ta có thể để chúng bằng null

```Java
public House(String wall, String floor, String window, String roof, String backyard) {
	this.wall = wall;
	this.floor = floor;
	this.window = window;
	this.roof = roof;
	this.backyard = backyard;
}
```

Cách này ban đầu nghe có vẻ ổn nhưng sẽ có những nhược điểm:
+ Tạo nhiều constructor cho những trường hợp khác nhau
+ Khó khăn trong việc xác định thứ tự của những tham số truyền vào

## Solution 💡

Builder pattern có 4 thành phần chính:
+ Product
+ Builder
+ ConcreteBuilder
+ Director
### 1st step (Product)

```Java
// Product
public class House {
    private String wall;
    private String floor;
    private String door;
    private String window;
    private String roof;
    private String backyard;
    private String pool;
    
    public House(String wall, String floor, String door, String window, String roof, String backyard, String pool) {
		this.wall = wall;
		this.floor = floor;
		this.door = door;
		this.window = window;
		this.roof = roof;
		this.backyard = backyard;
		this.pool = pool;
	}
}
```

### 2nd step (Builder)

```Java
// Builder 
public interface HouseBuilder {

    HouseBuilder setWall(String wall);

    HouseBuilder setFloor(String floor);

    HouseBuilder setDoor(String door);

    HouseBuilder setWindow(String window);

    HouseBuilder setRoof(String roof);

    HouseBuilder setBackYard(String backYard);

	HouseBuilder setPool(String pool);

    HouseBuilder build();
}
```

### 3rd step (ConcreteBuilder) 

```Java
// ConcreteBuilder
public class HouseConcreteBuilder implements HouseBuilder {
    private String wall;
    private String floor;
    private String door;
    private String window;
    private String roof;
    private String backyard;
    private String pool;
    
    @Override
    public HouseBuilder setWall(String wall) {
        this.wall = wall;
        return this;
    }

    @Override
    public HouseBuilder setFloor(String floor) {
        this.setFloor = floor;
        return this;
    }

    @Override
    public HouseBuilder setDoor(String door) {
        this.door = door;
        return this;
    }

    @Override
    public HouseBuilder setWindow(String window) {
        this.window = window;
        return this;
    }
    
    @Override
    public HouseBuilder setRoof(String roof) {
        this.roof = roof;
        return this;
    }

    @Override
    public HouseBuilder setBackYard(String backYard) {
        this.backYard = backYard;
        return this;
    }

    @Override
    public HouseBuilder setPool(String pool) {
        this.pool = pool;
        return this;
    }

    @Override
    public Student build() {
        return new Student(wall, floor, door, window, roof, backyard, pool);
    }
}
```

### 4th step (Director)

```Java
public static void main(String[] args) {

        HouseBuilder houseBuilder = new HouseConcreteBuilder()
                .setWall("4")
                .setFloor("1");
                .setDoor("3");
                .setWindow("5");
                .setRoof("1");

        System.out.println(houseBuilder.build());
    }
```

## Structure 🌿

![[Builder pattern structure.png]]
## Class Diagram 📌

[[Class diagram Builder pattern]]

## Applicability 👷

+ Rõ ràng với _Builder Pattern_, chúng ta chỉ cần một _constructor_ duy nhất cho lớp _House_ mà không cần nạp chồng thành nhiều hàm khác nhau như đoạn đầu mình cài đặt.
+ Chúng ta không cần quan tâm tới thứ tự truyền vào và cũng chỉ cần quan tâm tới những giá trị cần thiết của các thuộc tính.
+ Như vậy, đúng như tên gọi của nó, _Builder Pattern_ được thiết kế ra để giúp chúng ta xây dựng đối tượng linh hoạt và rõ ràng hơn.

## Pros and Cons ✅❌
### Pros
+ Bạn có thể sử dụng lại cùng một mã xây dựng khi xây dựng các cách trình bày sản phẩm khác nhau.
+ Bạn có thể xây dựng các đối tượng theo từng bước, trì hoãn các bước xây dựng hoặc chạy các bước theo cách đệ quy.
### Cons
+ Độ phức tạp tổng thể của mã tăng lên do mẫu yêu cầu tạo nhiều lớp mới.