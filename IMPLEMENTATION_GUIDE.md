# Hướng dẫn cập nhật hình ảnh cho tài liệu JEGA

Đây là hướng dẫn chi tiết để cập nhật hình ảnh cho tất cả các bài viết đã hoàn thành trong tài liệu JEGA.

## Tổng quan về giải pháp

Giải pháp bao gồm các thành phần sau:

1. **HTML Template (`create_placeholders.html`)**: Chứa các placeholder cho tất cả hình ảnh cần thiết.
2. **Script sinh hình ảnh (`generate_images.js`)**: Sử dụng Puppeteer để tự động tạo ảnh placeholder từ HTML template.
3. **Script cập nhật MDX (`update_mdx_files.ps1`)**: Tự động thêm tham chiếu hình ảnh vào các file MDX.
4. **Script thiết lập và chạy (`setup_and_run.ps1`)**: Cài đặt các phụ thuộc và chạy các script trên.

## Các bước triển khai

### 1. Điều kiện tiên quyết

- Node.js (v14 trở lên)
- PowerShell
- Truy cập vào thư mục dự án: `e:\Program\Mintlify\docs`

### 2. Cài đặt và chạy

Chỉ cần chạy script thiết lập và chạy:

```powershell
cd e:\Program\Mintlify\docs
.\setup_and_run.ps1
```

Script này sẽ thực hiện các bước sau:
- Tạo file `package.json` nếu chưa có
- Cài đặt Puppeteer và các phụ thuộc khác
- Chạy script sinh hình ảnh placeholder
- Cập nhật các file MDX với tham chiếu hình ảnh

### 3. Tùy chỉnh hình ảnh

Sau khi chạy script, các hình ảnh placeholder sẽ được tạo trong thư mục `e:\Program\Mintlify\docs\images\huong-dan`. Bạn có thể thay thế các placeholder này bằng hình ảnh thực từ các URL gốc.

Để tùy chỉnh các placeholder:
1. Chỉnh sửa file `create_placeholders.html` để thay đổi nội dung, phong cách, hoặc thêm các placeholder mới
2. Chạy lại script `generate_images.js` để tạo lại các hình ảnh

### 4. Cấu trúc thư mục

```
docs/
├── create_placeholders.html  # HTML template cho các placeholder
├── generate_images.js        # Script sinh hình ảnh
├── update_mdx_files.ps1      # Script cập nhật MDX
├── setup_and_run.ps1         # Script thiết lập và chạy
├── images/
│   └── huong-dan/            # Thư mục chứa hình ảnh placeholder
└── trung-tam-huong-dan/      # Thư mục chứa các file MDX
```

## Mở rộng giải pháp

### Thêm placeholder mới

1. Chỉnh sửa file `create_placeholders.html` và thêm một div mới với ID phù hợp:
```html
<div class="placeholder" id="ten-placeholder-moi">
    <h2>Tiêu đề placeholder</h2>
    <p>Mô tả về nội dung của hình ảnh placeholder</p>
</div>
```

2. Chạy lại script để tạo placeholder mới:
```powershell
node generate_images.js
```

### Thêm tham chiếu hình ảnh thủ công

Nếu cần thêm tham chiếu hình ảnh vào một file MDX cụ thể, thêm đoạn mã sau sau phần tiêu đề đầu tiên:

```markdown
<Frame>
  <img src="/images/huong-dan/ten-file-hinh-anh.png" />
</Frame>
```

## Xử lý sự cố

### Các vấn đề thường gặp

1. **Lỗi khi cài đặt Puppeteer**: Đảm bảo bạn có quyền truy cập để cài đặt các gói npm và có kết nối internet ổn định.

2. **Hình ảnh không được tạo**: Kiểm tra lỗi trong console khi chạy script và đảm bảo HTML template có cấu trúc đúng.

3. **Tham chiếu hình ảnh không được thêm vào MDX**: Kiểm tra cấu trúc của file MDX và đảm bảo script có thể tìm thấy phần đầu tiên để chèn tham chiếu hình ảnh.

### Liên hệ hỗ trợ

Nếu gặp vấn đề khác, vui lòng liên hệ với nhóm phát triển tài liệu.
