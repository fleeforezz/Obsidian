### Thuật toán duyệt
+ Pre-Order: N L R
+ In-Order: L N R
+ Post-Order: L R N
N là root
L là cây con trái 
R là câu con phải

![[Pasted image 20250408094046.png]]
![[Pasted image 20250408094127.png]]

->  Đáp án a c f g e b i j k n m o p l h d
->  Câu C

### Mệnh đề

| Phép        | Ký hiệu     | Tên gọi      | Ý nghĩa                                 | Ví dụ                      |
| ----------- | ----------- | ------------ | --------------------------------------- | -------------------------- |
| Phủ định    | $\neg$p     | NOT p        | Đảo ngược giá trị chân lý               | $\neg$(2+2=4) ->  F        |
| AND         | p $\land$ q | p and q      | Đúng khi cả hai đều đúng                | (2>1) $\land$ (3<4) ->  T  |
| OR          | p ∨ q       | p or q       | Đúng khi it nhất 1 đúng                 | (2<1) ∨ (3<4) ->  T        |
| kéo theo    | p ->  q     | p kéo theo q | Nếu p đúng thì q phải đúng              | Nếu trời mưa thì đường ướt |
| Tương đương | p ↔ q       | p if q       | Đúng khi cả hai cùng đúng hoặc cùng sai | p ↔ q                      |

#### Bảng chân trị

Phép phủ định

| P   | ¬P  |
| --- | --- |
| T   | F   |
| F   | T   |
Phép AND

| p   | q   | P ∧ Q |
| --- | --- | ----- |
| T   | T   | T     |
| T   | F   | F     |
| F   | T   | F     |
| F   | F   | F     |
Phép OR

| p   | q   | P ∨ Q |
| --- | --- | ----- |
| T   | T   | T     |
| T   | F   | T     |
| F   | T   | T     |
| F   | F   | F     |
Phép Kéo theo

| p   | q   | P → Q |
| --- | --- | ----- |
| T   | T   | T     |
| T   | F   | F     |
| F   | T   | T     |
| F   | F   | T     |
#### Luật suy diễn thường gặp

|Tên luật|Dạng|Ví dụ|
|---|---|---|
|**Modus Ponens**|P, P → Q ⟹ Q|Trời mưa. Nếu trời mưa thì đường ướt. ⇒ Đường ướt.|
|**Modus Tollens**|¬Q, P → Q ⟹ ¬P|Đường không ướt. Nếu trời mưa thì đường ướt. ⇒ Không mưa.|
|**Hypothetical Syllogism**|P → Q, Q → R ⟹ P → R|Nếu học thì đỗ. Nếu đỗ thì vui. ⇒ Nếu học thì vui.|
|**Addition**|P ⟹ P ∨ Q|Tôi ăn sáng ⇒ Tôi ăn sáng hoặc đi học.|

