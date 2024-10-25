Khi xóa một đối tượng trong stack thì heap sẽ bị xóa theo thời gian vì java đã đc cải thiện cho dev. 
-> Cách khắc phục : sử dụng Array để lưu trữ

```
Array = [địa chỉ, địa chỉ, địa chỉ]
```

khi tối ưu hóa ứng dụng thì mình tối ưu hóa để phần mềm chạy ít ram nhất có thể.

Algorithm là tuần tự cách bước để giải quyết một vấn đề.

# Sort Algorithm 

Có nhiều loại thuật toán sắp xếp khác nhau:

- [[Selection Sort]] (Học tại trường)
- [[Bubble Sort]] (Học tại trường)
- [[Insertion Sort]] (Học tại trường)

# List Data Structure

List là một dãy dữ liệu mà có thể thêm, sửa, xóa.
Ex: arr = [1, 2, 21, 45]

Linear Algorithm (cấu trúc dữ liệu tuyến tính) : là mỗi phần tử bên trong mảng có nhiều nhất 1 phần tử đứng trc nó và một phần tử đứng sau nó.

Cấu trúc dữ liệu thuộc list:
+ Array
+ LinkedList

> [!note]
> khi mở máy tính ram sẽ chạy trc để chạy OS 

## Array

Khi khai báo int arr[3] sẽ khiến 3 vùng địa chỉ trên ram sẽ bị đóng băng để sử dụng (ko gì có thể chạm vào 3 dùng địa chỉ đã đc đóng băng đến khi giải phóng array đó)

[[Array]]

### Pros
+ Array lấy dữ liệu cực nhanh
### Cons
+ Yêu cầu kích thước trước khi tạo mảng
+ 

> [!note]
> Sử dụng array trong việc máy khách có nhiều ram hoặc chỉ sử dụng đúng 1 phần mềm đó và không có phần mềm khác đang đc sử dụng

## Linked List

Đc sinh ra để giải quyết bài toán bộ nhớ rời rạc ([[Array rời rạc]])

Linked ListLà một cấu trúc dữ liệu tuyến tính bao gồm các node để lưu trữ dữ liệu. 

### Singly Linked List

Singly linked List bao gồm:
+ info (dùng để lưu trữ dữ liệu)
+ next (dùng để liên kết vs node kế tiếp)

![[Singly linked list.png]]

[[Single Linked List]]

> [!note]
> Biến tham chiếu sẽ lưu địa chỉ

`class Node`

```Java
class Node() {
	int info;
	Node next; // địa chỉ đằng sau liền kề của bộ nhớ

	Node() { // Constructure
		Node(int x; Node p) {
			info = x;
			next = p;
		}
	}
}
```

`class MyList`

```java
class MyList {
	Node head, tail; // Giữ địa chỉ đầu và cuối 
	MyList() {
		head=tail=null;
	}

	boolean isEmpty() { 
		return head==null;
	}

	void clear() {
		head=tail=null;
	}
}
```

> [!note]
> head=tail=null: Vì chưa tồn tại phần tử nào nên phải đặt nó là null.
> isEmpty(): kiểm tra xem head có null hay ko. 
> clear(): để xóa hết cấu trúc bên trong dữ liệu.

# Sort trong Linked List
[[Sort in Linked List]]
## 1. Sử dụng bubble sort

```java
// Node class
class Node {
    int data;
    Node next;

    Node(int data) {
        this.data = data;
        this.next = null;
    }
}

public class Main {

    // Function to swap the nodes
    static void swap(Node ptr1, Node ptr2) {
        int tmp = ptr2.data;
        ptr2.data = ptr1.data;
        ptr1.data = tmp;
    }

    // Function to sort the list
    static void bubbleSort(Node head) {
        boolean swapped;
        Node current;

        if (head == null)
            return;

        do {
            swapped = false;
            current = head;

            while (current.next != null) {
                if (current.data > current.next.data) {
                    swap(current, current.next);
                    swapped = true;
                }
                current = current.next;
            }
        } while (swapped);
    }

    // Function to print the list
    static void printList(Node n) {
        while (n != null) {
            System.out.print(n.data + " -> ");
            n = n.next;
        }
        System.out.println();
    }

    // Function to insert a Node at the beginning of a linked list
    static Node insertAtTheBegin(Node start_ref, int data) {
        Node ptr1 = new Node(data);

        ptr1.next = start_ref;
        start_ref = ptr1;
        return start_ref; // Return the updated start_ref
    }

    // Driver Code
    public static void main(String[] args) {
        int[] arr = { 78, 20, 10, 32, 1, 5 };
        int listSize = arr.length;

        Node start = null;

        // Create linked list from the array arr[]
        for (int i = listSize - 1; i >= 0; i--)
            start = insertAtTheBegin(start, arr[i]);

        System.out.println("Linked list before sorting");
        printList(start);

        bubbleSort(start);

        System.out.println("Linked list after sorting");
        printList(start);
    }
}
```
## 2. Sử dụng array để sắp xếp giá trị Linked List 
Bưng kết quả giá trị tron linked list xuống array -->
sort array --> xong bê lên lại vào linked list

# Double Linked list
[[Double Linked list]]
## Thành phần trong Double linked list
+ Info/data
+ next
+ previous
## Pros:
Linh hoạt trong việc thực hiện
## Cons:
tốn bộ nhớ máy tính

## Code
```Java
class Node {
	int info;
	Node prev, next;
	Node() {
		Node(int x, Node p, Node q) {
			info = x;
			prev = p;
			next = q;
		}
	}
}

class MyList {
	Node head, tail;
	MyList() {
		head = tail = null;
	}
	
	boolean isEmpty() {
		return head == null;
	}

	void clear() {
		head = tail = null;
	}

	void add(int x) {
		if (isEmpty()) {
			head = tail = new Node(x, null, null);
		} else {
			Node q = new Node(x, tail, null);
			tail.next = q;
			tail = q;
		}
	}
	
	...
	...
}
```

## Delete a node
```java
class Node {
	int info;
	Node prev, next;
	Node() {
		Node(int x, Node p, Node q) {
			info = x;
			prev = p;
			next = q;
		}
	}
}

class MyList() {
	Node head, tail;
	MyList() {
		head = tail = null;
	}
	
	boolean isEmpty() {
		return head == null;
	}

	void clear() {
		head = tail = null;
	}

	void delete(int position) {
		int check = 0;
		Node p = head;

		While (p != null) {
			check += 1;
			if (check == position) {
				if (p = head) {
					head = head.next;
					head.prev = null;
				} else if (p == tail) {
					tail = tail.prev;
					tail.next = null;
				} else {
					p.prev.next = p.next;
					p.next.prev = p.prev
				}
				p = p.next;
			}
		}
	}
	
	...
	...
}
```

# Stack
## Stacks
Stack là cấu trúc dữ liệu tuyến tính chỉ có thể truy cập ở các đầu của nó để lưu trữ là trích xuất dữ liệu.

Stack là cấu trúc dữ liệu Last In, First Out (LIFO).

Khi add một item vào trong stack thì mặc định item sẽ ở trên đầu của stack.
Ex: 
+ Trong stack có 3 item
	+ apple
	+ banana
	+ lemon
+ Khi add thêm thì item đó đc đặt ở trên cùng của stack vd mình sẽ add thêm orange
	+ orange
	+ apple
	+ banana
	+ lemon

Khi xóa một item trong stack thì sẽ xóa từ trên đầu xuống dưới đáy của stack.

## Operations on a Stack
+ clear() --> xóa tất cả item trong stack
+ isEmpty() --> check xem stack đó có trống ko
+ push(element) --> đặt item element vào trong stacke (mặc định đặt trên cùng của stack)
+ pop() --> lấy item trên cùng của stack lôi ra ngoài
+ top() --> trả về element trên cùng trong stack mà ko xóa nó
## Array-based Stack
## Stack implements


# Queues

## Remove a specific element in queue

# Recursion
## Definition
