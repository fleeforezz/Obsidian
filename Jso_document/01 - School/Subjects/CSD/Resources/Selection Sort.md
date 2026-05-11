Cho một dãy arr[] = {64, 25, 12, 22, 11}

Thông thường thuật toán Selection sort sẽ có 2 vòng lặp for:
+ <mark style="background: #D2B3FFA6;">Vòng lặp đầu tiên:</mark> Đảm nhiệm con trỏ sẽ chạy từ đầu array đến cuối array.
+ <mark style="background: #FFB8EBA6;">Vòng lặp thứ hai:</mark> Đảm nhiệm con so sánh số đầu vs số kế bên để sắp xếp (Tùy theo thuật toán sắp xếp khác nhau mà có thể so sánh hai số liền kề hay 1 số đầu và 1 số cuối array).

### Giải thích thuật toán

Trong vòng lặp của for loop đầu tiên
```java
int n = arr.length();

// Quét từng giá trị từ đầu array đến cuối array
for (int i = 0; i < n-1; i++) {
	// Tìm giá trị nhỏ nhất trong array
	int min_index = i;
	for (int j = i+1; j < n; j++) {
		if (arr[j] < arr[min_index])
			min_index = j;

	// Hoán đổi vị trí của giá trị nhỏ nhất vs phần tử đầu của array
	int temp = arr[min_index];
	arr[min_index] = arr[i];
	arr[i] = temp;
	}
}
```