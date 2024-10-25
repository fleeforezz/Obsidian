---

excalidraw-plugin: parsed
tags: [excalidraw]

---
==⚠  Switch to EXCALIDRAW VIEW in the MORE OPTIONS menu of this document. ⚠==


# Excalidraw Data
## Text Elements
- Create 2 classes:
 + Node Class (get node data)
 + Main Class (Solve Proccess)
  ^rK54lMEe

Main class ^sqsuwFhN

bubbleSort(Node head) ^jWQt4XRr

insertAtTheBegin(Node start_ref, int data) ^5fhjcDTD

main (String[] args) ^Z5qAhFIg

printList(Node n) ^ZU0YLV5E

swap(Node ptr1, Node ptr2) ^Fda7xEGv

Node class ^f3VCOMO7

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
    } ^or1sBFbO

static Node insertAtTheBegin(Node start_ref, int data) {
        Node ptr1 = new Node(data);

        ptr1.next = start_ref;
        start_ref = ptr1;
        return start_ref; // Return the updated start_ref
    } ^YkpO8jV0

static void swap(Node ptr1, Node ptr2) {
        int tmp = ptr2.data;
        ptr2.data = ptr1.data;
        ptr1.data = tmp;
    } ^N0hMDC6j

static void printList(Node n) {
        while (n != null) {
            System.out.print(n.data + " -> ");
            n = n.next;
        }
        System.out.println();
    } ^7b8P8qBw

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
    } ^Sn5GRWPs

int data;
    Node next;

    Node(int data) {
        this.data = data;
        this.next = null;
    } ^L3bU2Yjw

Sort linked list using Bubble Sort ^mfBis018

Sort linked list using Bubble Sort ^K8lWEsOv

if (head==null) return;
    
    Node p = head;
    Node k = tail;
    
    while(p != null) {
        Node q = head;
        While(q != k) {
            if (q.info > q.next.info) {
                int temp = q.info;
                q.info = q.next.info;
                q.next.info = temp;
                isSwap = true;
            }
            q = q.next;
        }
        p = p.next;
    }
    if (isSwap == false) break;
    k = q;
    p = p.next; ^W9g5SpAO

%%
## Drawing
```compressed-json
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
```
%%