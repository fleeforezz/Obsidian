Nhiều khách hàng có thể đặt 1 phòng
+ ngày đặt phòng ko đc trùng nhau (Vd: user_1 đặt phòng 1 từ ngày 1 đến ngày 3, user_2 đặt phòng 1 từ ngày 2 đến ngày 5 thí sẽ ko hợp lệ vì bị user_2 trùng lịch đặt vs user_1)

1 khách hàng có thể đặt nhiều phòng nhưng có thể trùng ngày
+ Vì khách có thể đặt nhiều phòng trùng ngày 

### Monthly Revenue Report 

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