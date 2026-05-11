```Java
Node h = head;

while (h.next.next != null) {
	h = h.next;
}

h.next = null;
```

## Code Breakdown
### 1. Initialize the LinkedList

```Java
Node h = head;
```

+ <mark style="background: #CACFD9A6;">Node h = head</mark> : Sets the starting point for traversal at the head of the linked list.

### 2. Traverse the Linked List

```Java
while (h.next.next != null) {
	h = h.next;
}
```

+ Conditions: <mark style="background: #CACFD9A6;">h.next.next != null</mark>
	+ The loop continues as long as the next node's <mark style="background: #CACFD9A6;">next</mark> pointer is not <mark style="background: #CACFD9A6;">null</mark>.
	+ In other words, it stops when <mark style="background: #CACFD9A6;">h</mark> points to the second-to-last-node in the list.
	+ Why? Beacause the second-to-last node's <mark style="background: #CACFD9A6;">next.next</mark> is <mark style="background: #CACFD9A6;">null</mark>.
+ Iteration:
	+ During each iteration, <mark style="background: #CACFD9A6;">h</mark> is updated to the next node (<mark style="background: #CACFD9A6;">h = h.next</mark>), moving one step forward in the list.

### 3. Remove the Last Node

```Java
h.next = null;
```

+ After the loop, <mark style="background: #CACFD9A6;">h</mark> is now pointing to the second-to-last node.
+ Setting <mark style="background: #CACFD9A6;">h.next = null</mark> disconnects the last node from the list, effectively removing it.

---

## Visualization

### Initial Linked List:

For example, consider the linked list:

```
head -> 10 -> 20 -> 30 -> 40 -> null
```

1. Before Traversal:
	+ <mark style="background: #CACFD9A6;">h</mark> points to <mark style="background: #CACFD9A6;">head</mark> (10).
	+ The loop checks <mark style="background: #CACFD9A6;">h.next.next</mark>:
		+ For 10: <mark style="background: #CACFD9A6;">h.next.next</mark> -> <mark style="background: #CACFD9A6;">20.next = 30</mark> (not null)
		+ For 20: <mark style="background: #CACFD9A6;">h.next.next</mark> -> <mark style="background: #CACFD9A6;">30.next = 40</mark> (not null)
		+ For 30: <mark style="background: #CACFD9A6;">h.next.next</mark> -> <mark style="background: #CACFD9A6;">40.next = null</mark> (loop stops)

2. After Traversal:
	+ <mark style="background: #CACFD9A6;">h</mark> now points to <mark style="background: #CACFD9A6;">30</mark> (the second-to-last node).

3. Set <mark style="background: #CACFD9A6;">h.next = null</mark>:
	+ The pointer <mark style="background: #CACFD9A6;">30.next</mark> is set to <mark style="background: #CACFD9A6;">null</mark>, disconnecting the node <mark style="background: #CACFD9A6;">40</mark> from the list.
