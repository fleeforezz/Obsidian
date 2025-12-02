```Java
Scanner sc = new Scanner(System.in);

System.out.print("Enter a number to add: ");
int inputNumber = sc.nextInt();

System.in.print("Enter add position: ");
int position = sc.nextInt();

Node m = head;
int step = position-2;

while (step > 0) {
	m = m.next;
	step -= 1;
}

Node node_N = new Node(inputNumber);
node_N.next = m.next;
m.next = node_N;
```

## Code Breakdown
### 1. Take the user input

```Java
System.out.print("Enter a number to add: ");
int inputNumber = sc.nextInt();

System.in.print("Enter add position: ");
int position = sc.nextInt();
```

+ <mark style="background: #CACFD9A6;">inputNumber</mark>: The integer value that the user wants to insert.
+ <mark style="background: #CACFD9A6;">position</mark>: The position (1-based index) where user wants to insert the new node.

### 2. Initialize and Navigate the LinkedList

```Java
Node m = head; 
int step = position - 2;
```

+ <mark style="background: #CACFD9A6;">Node m = head;</mark> : Sets the startig point for traversal at the head of the linkedList.
+ <mark style="background: #CACFD9A6;">int step = position - 2;</mark> : Calculates the number of steps required to reach the node just before the inserttion position.
	+ <mark style="background: #CACFD9A6;">position - 1</mark>: The **zero based index** of the target position.
	+ <mark style="background: #CACFD9A6;">position - 2</mark>: Subtract one more because we stop at the node before the inserttion position.

### 3. Traverse the Linked List

```Java
while(step > 0) {
	m = m.next;
	step -= 1;
}
```

+ The <mark style="background: #CACFD9A6;">while</mark> loop moves the pointer <mark style="background: #CACFD9A6;">m</mark> to the node just before the insertion position.
+ At the end of the loop:
	+ <mark style="background: #CACFD9A6;">m</mark> will reference the node immediately before where the new node should be inserted.
	+ if <mark style="background: #CACFD9A6;">position = 1</mark>, <mark style="background: #CACFD9A6;">step = -1</mark> and this loop will be skipped (direct insertion ad the head).

### 4. Create the new Node

```Java
Node node_N = new Node(inputNumber);
```

+ Creates a new node <mark style="background: #CACFD9A6;">node_N</mark> with the value <mark style="background: #CACFD9A6;">inputNumber</mark>.

### 5. Adjust the Pointers

```Java
node_N.next = m.next;
m.next = node_N;
```

+ <mark style="background: #CACFD9A6;">node_N.next = m.next;</mark> : Sets the <mark style="background: #CACFD9A6;">next</mark> pointer of the new node to point to the node currently following <mark style="background: #CACFD9A6;">m</mark>.
+ <mark style="background: #CACFD9A6;">m.next = node_N</mark> : Updates the next pointer of <mark style="background: #CACFD9A6;">m</mark> to point to the new node <mark style="background: #CACFD9A6;">node_N</mark>.

## Visualization Example

Let's assume the linked list starts as:

```
head -> 10 -> 20 -> 30 -> 40 -> null
```

and the user enters:
+ inputNumber = 25
+ position = 3

---

### Step-by-Step Execution

1. Before Traversal:
	+ head points to 10
	+ position - 2 = 1

2. After Traversal:
	+ The loop executes once (<mark style="background: #CACFD9A6;">step = 1</mark> -> <mark style="background: #CACFD9A6;">0</mark>)
	+ Now, <mark style="background: #CACFD9A6;">m</mark> points to <mark style="background: #CACFD9A6;">20</mark> (the node before position 3)
	
3. Create New Node:
	+ <mark style="background: #CACFD9A6;">node_N</mark> is created with the value <mark style="background: #CACFD9A6;">25</mark>.

4. Adjust Pointers:
	+ <mark style="background: #CACFD9A6;">node_N.next = m.next</mark> -> <mark style="background: #CACFD9A6;">node_N.next = 30</mark>.
	+ <mark style="background: #CACFD9A6;">m.next = node_N</mark> -> <mark style="background: #CACFD9A6;">20.next = 25</mark>

---

**Final Linked List:**

After insertion, the list become:

```
head -> 10 -> 20 -> 25 -> 30 -> 40 -> null
```
