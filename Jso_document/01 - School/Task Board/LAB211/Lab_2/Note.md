Nhiều khách hàng có thể đặt 1 phòng
+ ngày đặt phòng ko đc trùng nhau (Vd: user_1 đặt phòng 1 từ ngày 1 đến ngày 3, user_2 đặt phòng 1 từ ngày 2 đến ngày 5 thí sẽ ko hợp lệ vì bị user_2 trùng lịch đặt vs user_1)

1 khách hàng có thể đặt nhiều phòng nhưng có thể trùng ngày
+ Vì khách có thể đặt nhiều phòng trùng ngày 

1. Nhập tháng và năm MM/yyyy
2. Check list reservation_controller xem những khách nào có đặt phòng trong tháng đã nhập



```Java
public boolean checkBookedDate(LocalDate checkInDate, LocalDate checkOutDate) {

        for (guests guest : this) {
            LocalDate guestCheckIn = guest.getStartDate();
            LocalDate guestCheckOut = getCheckOutDate(checkInDate, guest.getNumOfRentalDays());
            boolean isOverLapping = !(checkOutDate.isBefore(guestCheckIn) || checkInDate.isAfter(guestCheckOut));

            if (isOverLapping) {
                System.out.println("Your selected date has been booked.");
                return true;
            }
        }

        return false;
    }
```

input: 03/12/2025 - 07/12/2025

a guest in the list: 06/12/2025-12/12/2025

input checkout      guestCheckIn list
07/12/2025 isBefore 06/12/2025 > false (Giá trị hiên tại nhỏ hơn giá trị truyền vào thì true)
||
Input checkin      guestCheckout list
03/12/2025 isAfter 12/12/2025 > false (Giá trị hiên tại lớn hơn giá trị truyền vào thì true)

(03/12/2025.isBefore(05/12/2025) || (03/12/2025.isAfter(07/12/2025)))
-> false || false
!(false || false) -> true || true

03/12/2025.isBefore(04/12/2025) -> true

nếu user nhập roomID, numberOfRentalDate, newStartDate

current nationalID = 082286371615
current start date = 05/12/2025
current checkout date = 08/12/2025

RoomID = null;
numberOfRentalDate = 6;
newStartDate = 05/12/2025
checkOutDate = 11/12/2025

### Monthly Revenue Report 

1. Nhập tháng và năm muốn report
	- Check format tháng/năm có valid ko
	- Check xem tháng nhập vào có dữ liệu hay ko 
2. Sau khi nhập xong check trong tháng đó có những phòng nào đã đc đặt
3. Sau khi check những phòng đó đã được đặt thì get dữ liệu có trong phòng đó thông qua roomId
	+ Tính Amount từng phòng bằng cách lấy Amount = numberOfRentDate * DailyRate

### Revenue report by room type

**Số lượng người đặt phòng có roomType là Deluxe**

+ Check room type đó có những roomID nào VD có 3 phòng có roomType là Deluxe vs ID là R011, R012, R013
+ Check coi 3 phòng đó đã đc đặt ko, nếu 3 phòng đó đã đc đặt thì lấy amount của từng phòng cộng lại, nếu chỉ 2 phòng có ng đặt
+ CT Amount từng phòng = numberOfRentalDate * DailyRate
+ CT: RoomTypeAmount += Amount từng phòng

**Nếu user ko nhập room type**

+ Check từng room type trong roomList có những phòng nào 
+ Check từng phòng xem có phòng nào đc đặt r
+ Nếu có phòng đã có ng đặt thì tính amount của phòng đó
	+ Amount từng phòng = numberOfRentalDate * DailyRate
+ Tính RoomTypeAmount += Amont từng phòng