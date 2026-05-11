# DAO Pattern là gì ?

**Data Access Object (DAO)** Pattern là một trong những Pattern thuộc nhóm cấu trúc (Structural Pattern). Mẫu thiết kế DAO được sử dụng để phân tách logic lưu trữ dữ liệu trong một lớp riêng biệt. Theo cách này, các service được che dấu về cách các hoạt động cấp thấp để truy cập cơ sở dữ liệu được thực hiện. Nó còn được gọi là nguyên tắc Tách logic (**Separation of Logic**).

Ý tưởng là thay vì có logic giao tiếp trực tiếp với cơ sở dữ liệu, hệ thống file, dịch vụ web hoặc bất kỳ cơ chế lưu trữ nào mà ứng dụng cần sử dụng, chúng ta sẽ để logic này sẽ giao tiếp với lớp trung gian DAO. Lớp DAO này sau đó giao tiếp với hệ thống lưu trữ, hệ quản trị CSDL như thực hiện các công việc liên quan đến lưu trữ và truy vấn dữ liệu (tìm kiếm, thêm, xóa, sửa,…).

[![](https://gpcoder.com/wp-content/uploads/2019/01/design-patterns-dao-intro.png)](https://gpcoder.com/wp-content/uploads/2019/01/design-patterns-dao-intro.png)

DAO Pattern dựa trên các nguyên tắc thiết kế **abstraction** và **encapsulation**. Nó bảo vệ phần còn lại của ứng dụng khỏi mọi thay đổi trong lớp lưu trữ, ví dụ: thay đổi database từ Oracle sang MySQL, thay đổi công nghệ lưu trữ từ file sang database.

# Thiết lập DAO Pattern

[![](https://gpcoder.com/wp-content/uploads/2019/01/design-patterns-dao-diagram.png)](https://gpcoder.com/wp-content/uploads/2019/01/design-patterns-dao-diagram.png)
Các thành phần tham gia mẫu Data Access Object (DAO) Pattern:

- **BusinessObject** : đại diện cho Client, yêu cầu truy cập vào nguồn dữ liệu để lấy và lưu trữ dữ liệu.
- **DataAccessObject** (DAO): là một interface định nghĩa các phương thức trừu tượng việc triển khai truy cập dữ liệu cơ bản cho BusinessObject để cho phép truy cập vào nguồn dữ liệu (DataSource).
- **DataAccessObjectConcrete** : cài đặt các phương thức được định nghĩa trong DAO, lớp này sẽ thao tác trực tiếp với nguồn dữ liệu (DataSource).
- **DataSource** : là nơi chứa dữ liệu, nó có thể là database, xml, json, text file, webservice, … <mark style="background: #ABF7F7A6;">Hoặc có thể nói là nơi lấy kết nối đến database</mark>
- **TransferObject** : là một POJO (Plain old Java object) object, chứa các phương thức get/set được sử dụng để lưu trữ dữ liệu và được sử dụng trong DAO class.
## Ví dụ sử dụng DAO pattern

Ví dụ bên dưới cho chúng ta thấy cách áp dụng DAO Pattern trong việc cung cấp interface chung để thao tác với cơ sở dữ liệu (**CRUD**). Các thao tác này bao gồm: **C**reate/ Save, **R**ead/ Get, **U**pdate, **D**elete.

[![](https://gpcoder.com/wp-content/uploads/2019/01/design-patterns-dao-example.png)](https://gpcoder.com/wp-content/uploads/2019/01/design-patterns-dao-example.png)
**User.java**

```java
public class User {
	private int id;
	private String name;
	private String email;
}
```

**DAO.java**

```java
import java.util.List;
import java.util.Optional;

public interface DAO<T> {
	List<T> getAll();

    Optional<T> get(int id);

    void save(T t);

    void update(T t);

    void delete(T t);
}
```

**UserDAO.java**

```java

```