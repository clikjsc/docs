# Tài liệu hướng dẫn JEGA AiHouse (Tiếng Việt)

Dự án này tạo tài liệu hướng dẫn Tiếng Việt cho sản phẩm JEGA AiHouse sử dụng nền tảng tài liệu Mintlify.

## Tiến độ hiện tại

Đã hoàn thành:
- ✅ Phân tích cấu trúc của trang trợ giúp AIHouse tiếng Anh
- ✅ Đề xuất cấu trúc tối ưu cho tài liệu tiếng Việt
- ✅ Tạo cấu trúc thư mục đầy đủ
- ✅ Cập nhật file `docs.json` để bao gồm cấu trúc điều hướng tiếng Việt
- ✅ Tạo các trang mẫu và nội dung:
  - **Tổng quan**:
    - Giới thiệu
    - Bắt đầu nhanh
  - **Hướng dẫn người dùng mới**:
    - Đăng ký tài khoản
    - Thiết lập tài khoản
    - Giao diện cơ bản
  - **Thiết kế xây dựng**:
    - Tạo mặt bằng
    - Chỉnh sửa mặt bằng
    - Tạo vách ngăn
  - **Thao tác cơ bản**:
    - Áp dụng hiệu ứng cho mô hình
    - Quản lý không gian
    - Công cụ chỉnh sửa
  - **Tùy chỉnh nội thất**:
    - Bố cục phòng
    - Tủ đồ nội thất
  - **Kết xuất**:
    - Kết xuất hình ảnh
  - **Cập nhật hàng tháng**:
    - Tháng 5/2025
  - **Hỏi đáp**:
    - Câu hỏi thường gặp

## Công việc còn lại

- 🔲 Tạo nội dung cho các trang còn lại:
  - **Tùy chỉnh nội thất**:
    - Cấu hình tủ bàn
    - Cửa và cửa sổ
    - Tùy chỉnh vật liệu
  - **Kết xuất > Vẽ AI**:
    - Các trang hướng dẫn vẽ AI
  - **Vật liệu thiết kế**:
    - Các trang về vật liệu
  - **Báo giá và xuất bản vẽ**:
    - Các trang về báo giá
  - **Phần mềm nâng cao**:
    - Các tính năng nâng cao

- 🔲 Tạo hình ảnh minh họa cho tất cả các trang
- 🔲 Kiểm tra và chỉnh sửa nội dung
- 🔲 Kiểm tra liên kết nội bộ
- 🔲 Tối ưu hóa SEO cho trang tài liệu

## Cấu trúc thư mục

```
trung-tam-huong-dan/
├── tong-quan/
│   ├── gioi-thieu.mdx
│   └── bat-dau-nhanh.mdx
├── huong-dan-nguoi-dung-moi/
│   ├── dang-ky-tai-khoan.mdx
│   ├── thiet-lap-tai-khoan.mdx
│   └── giao-dien-co-ban.mdx
├── thiet-ke-xay-dung/
│   ├── tao-mat-bang.mdx
│   ├── chinh-sua-mat-bang.mdx
│   └── tao-vach-ngan.mdx
├── thao-tac-co-ban/
│   ├── hieu-ung-mo-hinh.mdx
│   ├── quan-ly-khong-gian.mdx
│   └── cong-cu-chinh-sua.mdx
├── tuy-chinh-noi-that/
│   ├── bo-cuc-phong.mdx
│   └── tu-do-noi-that.mdx
├── ket-xuat/
│   ├── ket-xuat-hinh-anh.mdx
│   └── ve-ai/
├── vat-lieu-thiet-ke/
├── bao-gia-va-xuat-ban-ve/
├── phan-mem-nang-cao/
├── cap-nhat-hang-thang/
│   └── 2025-05.mdx
└── hoi-dap/
    └── cau-hoi-thuong-gap.mdx
```

## Hướng dẫn phát triển

### Định dạng trang

Mỗi trang tài liệu (.mdx) cần có:

1. **Frontmatter**:
   ```yaml
   ---
   title: 'Tiêu đề trang'
   description: 'Mô tả ngắn gọn về nội dung trang'
   icon: 'biểu-tượng'
   ---
   ```

2. **Cấu trúc nội dung**:
   - Tiêu đề chính (H1)
   - Giới thiệu ngắn gọn
   - Các mục nội dung (H2, H3, v.v.)
   - Hình ảnh minh họa (khi cần)
   - Liên kết đến các trang liên quan

### Quy ước đặt tên

- Tên file: sử dụng chữ thường, không dấu, ngăn cách bằng dấu gạch ngang (-).
- Thư mục: sử dụng chữ thường, không dấu, ngăn cách bằng dấu gạch ngang (-).
- Hình ảnh: đặt trong thư mục `/images` và đặt tên có ý nghĩa.

## Nguồn tham khảo

- [AIHouse Help Center](https://www.aihouse.com/global/help-center/3d-home-design)
- [JEGA Vietnam](https://jega.vn/vi/trung-tam-huong-dan)
- [Mintlify Documentation](https://mintlify.com/docs)
