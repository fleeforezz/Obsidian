FlatLaf provides an extensive set of UI keys that allow you to customize the appearance of Swing components. These keys can be used in properties files or via the `UIManager` in Java code. Below is an overview of some commonly used UI keys:

---

### 🎨 General UI Keys

- **`Component.arc`**: Defines the corner arc diameter for components.
    
- **`Component.focusWidth`**: Specifies the width of the focus indicator.
    
- **`Component.innerFocusWidth`**: Sets the width of the inner focus indicator.
    
- **`Component.arrowType`**: Determines the arrow style (`chevron` or `triangle`).[formdev.com+2formdev.com+2formdev.com+2](https://www.formdev.com/flatlaf/customizing/?utm_source=chatgpt.com)[formdev.com+1formdev.com+1](https://www.formdev.com/flatlaf/components/list/?utm_source=chatgpt.com)
    

---

### 🖥️ Component-Specific UI Keys

#### **Buttons**

- **`Button.background`**: Background color of the button.
    
- **`Button.foreground`**: Text color of the button.
    
- **`Button.border`**: Border of the button.
    
- **`Button.arc`**: Corner arc diameter specific to buttons.[formdev.com+2formdev.com+2formdev.com+2](https://www.formdev.com/flatlaf/components/table/?utm_source=chatgpt.com)[formdev.com](https://www.formdev.com/flatlaf/customizing/?utm_source=chatgpt.com)
    

#### **Text Fields**

- **`TextField.background`**: Background color when enabled.
    
- **`TextField.inactiveBackground`**: Background color when not editable but enabled.
    
- **`TextField.disabledBackground`**: Background color when disabled.
    
- **`TextField.selectionBackground`**: Background color of selected text.
    
- **`TextField.caretForeground`**: Color of the caret (text cursor).[formdev.com+2formdev.com+2formdev.com+2](https://www.formdev.com/flatlaf/components/textfield/?utm_source=chatgpt.com)
    

#### **Tables**

- **`Table.background`**: Background color of the table.
    
- **`Table.foreground`**: Text color of the table.
    
- **`Table.selectionBackground`**: Background color of selected cells.
    
- **`Table.selectionForeground`**: Text color of selected cells.
    
- **`Table.gridColor`**: Color of the grid lines.[formdev.com](https://www.formdev.com/flatlaf/components/table/?utm_source=chatgpt.com)[formdev.com+1formdev.com+1](https://www.formdev.com/flatlaf/components/list/?utm_source=chatgpt.com)
    

#### **Lists**

- **`List.background`**: Background color of the list.
    
- **`List.foreground`**: Text color of the list.
    
- **`List.selectionBackground`**: Background color of selected items.
    
- **`List.selectionForeground`**: Text color of selected items.
    

---

### 🧩 Typography UI Keys

FlatLaf defines several font styles that can be applied to components:[formdev.com](https://www.formdev.com/flatlaf/typography/?utm_source=chatgpt.com)

- **`defaultFont`**: The default font used across components.
    
- **`h1.font`**, **`h2.font`**, ..., **`h4.font`**: Heading fonts with varying sizes.
    
- **`large.font`**, **`medium.font`**, **`small.font`**, **`mini.font`**: Fonts of different sizes for various use cases.
    
- **`monospaced.font`**: Monospaced font, useful for code or tabular data.[formdev.com](https://www.formdev.com/flatlaf/components/list/?utm_source=chatgpt.com)[javadoc.io](https://www.javadoc.io/doc/com.formdev/flatlaf/latest/com/formdev/flatlaf/FlatClientProperties.html?utm_source=chatgpt.com)
    

These fonts can be applied using the `FlatLaf.styleClass` or `FlatLaf.style` client properties. [formdev.com+1formdev.com+1](https://www.formdev.com/flatlaf/typography/?utm_source=chatgpt.com)

---

### 🛠️ Customizing UI Keys

To customize these UI keys, you can use a properties file or set them programmatically:

**Using a Properties File (`flatlaf.properties`):**

```
Button.arc = 10 
TextField.background = #2e2e2e 
Table.gridColor = #444444
```

**Using `UIManager` in Java:**
```
UIManager.put("Button.arc", 10); 
UIManager.put("TextField.background", new Color(0x2e2e2e)); UIManager.put("Table.gridColor", new Color(0x444444));
```

Ensure that these customizations are applied after setting up the FlatLaf look and feel. [formdev.com](https://www.formdev.com/flatlaf/how-to-customize/?utm_source=chatgpt.com)

---

For a comprehensive list of UI keys and further customization options, refer to the official FlatLaf documentation:

- FlatLaf Components
    
- FlatLaf Typography
    
- FlatLaf How to Customize
    

If you need assistance with specific components or further customization, feel free to ask!