# Template Hướng dẫn Tạo Dữ liệu Knowledge Base (KB) cho Jega Việt Nam

Mục tiêu của tài liệu này là hướng dẫn cách chuẩn bị dữ liệu cho Knowledge Base (KB) của Jega Việt Nam, nhằm mục đích tối ưu hóa khả năng truy xuất thông tin của AI Customer Success Agent (Jega Assistant) thông qua cơ chế Retrieval Augmented Generation (RAG).

## Nguyên tắc chung:

*   **Ngắn gọn & Súc tích:** Mỗi mục KB nên tập trung vào một vấn đề hoặc một tính năng cụ thể. Nội dung cần đi thẳng vào vấn đề, cung cấp giải pháp hoặc thông tin cốt lõi một cách nhanh chóng. Nếu một bài viết gốc quá dài hoặc bao gồm nhiều chủ đề phụ, hãy chia thành các mục KB nhỏ hơn, liên kết với nhau.
*   **Chiến lược Ngôn ngữ (Giai đoạn 1 - Tập trung Tiếng Việt):**
    *   **Metadata Song ngữ (VI & EN):** Các trường siêu dữ liệu như `TITLE`, `DESCRIPTION`, `CATEGORY_PATH`, `KEYWORDS`, `USER_INTENT` **phải được chuẩn bị song song bằng cả Tiếng Việt và Tiếng Anh** ngay từ đầu. Đây là thông tin quan trọng cho AI hiểu và phân loại truy vấn đa ngôn ngữ.
    *   **Nội dung Chi tiết - Chỉ Tiếng Việt:** Trong giai đoạn này, chỉ tập trung xây dựng `CONTENT_VI` và `IMAGE_DESCRIPTION_VI_X` (mô tả hình ảnh Tiếng Việt) một cách đầy đủ và chất lượng cao.
    *   **AI Agent:** Sẽ được cấu hình để ưu tiên sử dụng KB Tiếng Việt. Khi nhận câu hỏi Tiếng Anh, AI sẽ sử dụng metadata Tiếng Anh kết hợp với nội dung Tiếng Việt (và tự dịch) để hỗ trợ, kèm thông báo phù hợp cho người dùng về việc dịch tự động.
*   **Tập trung vào Người dùng:** Nội dung phải dễ hiểu, sử dụng ngôn ngữ tự nhiên mà người dùng cuối thường sử dụng để mô tả vấn đề hoặc tìm kiếm giải pháp.
*   **Từ khóa Chiến lược:** Sử dụng từ khóa phù hợp, bao gồm cả từ đồng nghĩa, thuật ngữ kỹ thuật và thuật ngữ phổ thông, để AI dễ dàng tìm thấy thông tin liên quan.
*   **Ưu tiên Thương hiệu Jega Việt Nam:** Luôn sử dụng tên "Jega Việt Nam" cho công ty và "Jega" cho sản phẩm phần mềm trong nội dung Tiếng Việt. Chỉ đề cập "AiHouse" nếu khách hàng hỏi hoặc trong ngữ cảnh giải thích nguồn gốc tài liệu.
*   **Định dạng Markdown:** Toàn bộ nội dung `CONTENT_VI` phải ở định dạng Markdown.
*   **Một KB duy nhất:** Tất cả các mục KB sẽ được tổng hợp vào một file `KB-document.md` duy nhất, mỗi mục được phân cách bằng `----------------------------------------`.

## Cấu trúc một Mục KB (Giai đoạn 1 - Chỉ Nội dung Tiếng Việt):

```
TITLE_VI: [Tiêu đề Tiếng Việt - Ngắn gọn, mô tả rõ nội dung chính, < 70 ký tự, tập trung vào vấn đề/giải pháp]
TITLE_EN: [English Title - Concise, clearly describes main content, < 70 characters, problem/solution focused]

DESCRIPTION_VI: [Mô tả Tiếng Việt - 1-3 câu tóm tắt vấn đề người dùng gặp phải và giải pháp/nội dung chính mà mục KB này cung cấp. Nên chứa từ khóa chính.]
DESCRIPTION_EN: [English Description - 1-3 sentences summarizing the user problem and the solution/main content this KB entry provides. Should contain main keywords.]

CATEGORY_PATH_VI: [Đường dẫn danh mục Tiếng Việt đầy đủ, ví dụ: Jega / Thiết Kế Mặt Bằng / Vẽ Tường / Cách Vẽ Tường Cong]
CATEGORY_PATH_EN: [Full English Category Path, e.g., Jega / Floor Plan / Draw Walls / How to Draw Curved Walls]

KEYWORDS_VI: [từ khóa tiếng việt 1, từ khóa đồng nghĩa, lỗi thường gặp, tên tính năng trong jega, cách làm X, sửa lỗi Y, jega]
KEYWORDS_EN: [english keyword 1, synonymous keyword, common error, feature name in jega, how to X, fix Y, jega]

USER_INTENT_VI: [Mô tả (các) ý định chính của người dùng khi tìm đến nội dung này, ví dụ: học cách vẽ tường cong trong Jega; sửa lỗi tường không thẳng; tìm hiểu các tùy chọn vẽ tường nâng cao]
USER_INTENT_EN: [Describe the primary user intent(s) for this content, e.g., learn to draw curved walls in Jega; fix non-straight wall error; understand advanced wall drawing options]

JEGA_ARTICLE_ID: [Mã định danh duy nhất. Quy ước: Mã viết tắt Danh Mục Chính (2-3 chữ cái) - Mã viết tắt Danh mục Phụ (2-3 chữ cái, nếu có) - Số thứ tự 3 chữ số. Ví dụ: FP-DW-001 (Floor Plan - Draw Walls - 001)]
RELATED_KB_IDS: [Danh sách các JEGA_ARTICLE_ID liên quan, cách nhau bằng dấu phẩy, nếu có. Ví dụ: FP-DW-002, FP-WA-005]
LOCAL_KB_PATH: [/trung-tam-huong-dan/ten-danh-muc/ten-bai-viet-vi (Đường dẫn tương đối từ thư mục gốc `docs/` đến file .mdx Tiếng Việt tương ứng, không bao gồm phần mở rộng .mdx. Nếu không có file .mdx riêng, để trống.)]
LAST_UPDATED_KB: [YYYY-MM-DD] // Ngày mục KB này được tạo/cập nhật lần cuối

CONTENT_VI:
---
[Nội dung chính bằng Tiếng Việt, sử dụng Markdown. Ngắn gọn, rõ ràng, tập trung vào các bước thực hiện hoặc thông tin cốt lõi. Sử dụng tiêu đề phụ (###) để chia nhỏ các phần nếu cần.]

[Ví dụ cách trình bày một bước có hình ảnh:]
### Bước 1: Chọn Công cụ Vẽ Tường Cong

Trong giao diện chính của Jega, tại thanh công cụ bên trái, tìm và nhấp vào biểu tượng "Vẽ Tường" (Wall Tool). Sau đó, từ menu con bung ra, chọn tùy chọn "Tường Cong" (Curved Wall).

![Alt text Tiếng Việt cho hình 1](URL_HINH_ANH_1_JEGA_VN)
IMAGE_DESCRIPTION_VI_1: [Mô tả chi tiết (1-3 câu) về hình ảnh 1 bằng Tiếng Việt: (1) Cái gì được hiển thị? (Giao diện, nút, thông báo lỗi cụ thể?), (2) Nó liên quan đến bước nào/khái niệm nào trong hướng dẫn?, (3) Hành động chính hoặc điểm cần lưu ý mà hình ảnh minh họa là gì? Ví dụ: "Hình ảnh chụp màn hình giao diện phần mềm Jega. Thanh công cụ bên trái được hiển thị, với công cụ 'Vẽ Tường' đang được trỏ chuột và menu con hiện ra cho thấy tùy chọn 'Tường Cong' được làm nổi bật. Điều này minh họa cho người dùng cách tìm và kích hoạt chức năng vẽ tường cong."]

[Nội dung Tiếng Việt tiếp theo nếu cần...]
---
---------------------------------------- 
```

## Giải thích chi tiết các trường (Cập nhật Giai đoạn 1):

*   **`TITLE_VI` / `TITLE_EN`:** (Song ngữ từ đầu)
    *   Tiêu đề của mục KB.
    *   Ngắn gọn, rõ ràng, phản ánh chính xác nội dung, < 70 ký tự.
    *   Nên chứa từ khóa quan trọng, tập trung vào vấn đề/giải pháp.

*   **`DESCRIPTION_VI` / `DESCRIPTION_EN`:** (Song ngữ từ đầu)
    *   Mô tả ngắn (1-3 câu) tóm tắt vấn đề người dùng và giải pháp/nội dung chính.
    *   Quan trọng cho hiển thị kết quả tìm kiếm và giúp AI hiểu ngữ cảnh.

*   **`CATEGORY_PATH_VI` / `CATEGORY_PATH_EN`:** (Song ngữ từ đầu)
    *   Đường dẫn danh mục đầy đủ, bắt đầu bằng "Jega /". Ví dụ: `Jega / Thiết Kế Mặt Bằng / Vẽ Tường / Cách Vẽ Tường Cong`.

*   **`KEYWORDS_VI` / `KEYWORDS_EN`:** (Song ngữ từ đầu)
    *   Danh sách từ khóa liên quan (cách nhau bằng dấu phẩy), bao gồm từ đồng nghĩa, thuật ngữ kỹ thuật/phổ thông, tên tính năng, lỗi thường gặp.

*   **`USER_INTENT_VI` / `USER_INTENT_EN`:** (Song ngữ từ đầu)
    *   Mô tả (các) ý định chính của người dùng. Có thể liệt kê nhiều ý định liên quan chặt chẽ, phân tách bằng dấu chấm phẩy.

*   **`JEGA_ARTICLE_ID`:**
    *   Mã định danh duy nhất. **Quy ước:** `[MÃ_DM_CHÍNH_2-3_CHỮ]-[MÃ_DM_PHỤ_2-3_CHỮ_NẾU_CÓ]-[SỐ_THỨ_TỰ_3_CHỮ_SỐ]`.
        *   Ví dụ: `FP-DW-001` (Floor Plan - Draw Walls - 001).
        *   Cần xây dựng bảng mã viết tắt cho các danh mục.

*   **`RELATED_KB_IDS`:**
    *   Danh sách các `JEGA_ARTICLE_ID` liên quan (cách nhau bằng dấu phẩy), nếu có.

*   **`LOCAL_KB_PATH`:** (Thay thế cho `SOURCE_URL_JEGA_VN`)
    *   Đường dẫn tương đối của tệp `.mdx` Tiếng Việt tương ứng với mục KB này, tính từ thư mục gốc `docs/` của dự án Mintlify.
    *   **Không bao gồm** phần mở rộng `.mdx` trong đường dẫn.
    *   Ví dụ: Nếu tệp là `e:\Program\Mintlify\docs\trung-tam-huong-dan\design-circle\introduction-vi.mdx`, giá trị sẽ là `/trung-tam-huong-dan/design-circle/introduction-vi`.
    *   Nếu mục KB này không có một tệp `.mdx` riêng biệt tương ứng (ví dụ: nó là một phần nhỏ được trích từ một bài lớn hơn và không có file riêng), trường này có thể để trống hoặc trỏ đến path của bài viết lớn hơn chứa nó.

*   **`LAST_UPDATED_KB`:** Ngày mục KB được tạo/cập nhật lần cuối (`YYYY-MM-DD`)

*   **`CONTENT_VI`:**
    *   Nội dung chính bằng Tiếng Việt, Markdown. **Ưu tiên sự cực kỳ ngắn gọn và đi thẳng vào vấn đề.**
    *   Tập trung vào các bước thực hiện cốt lõi, thông tin quan trọng nhất mà người dùng cần để giải quyết vấn đề hoặc hiểu tính năng.
    *   Nếu một bài viết gốc có nhiều ý hoặc nhiều phần, hãy **chia nhỏ thành nhiều mục KB riêng biệt**, mỗi mục giải quyết một khía cạnh cụ thể và liên kết chúng bằng `RELATED_KB_IDS`.
    *   Sử dụng `###` cho tiêu đề phụ nếu thực sự cần thiết để phân tách các ý nhỏ trong một mục KB ngắn.

*   **`IMAGE_DESCRIPTION_VI_X`:**
    *   Mô tả chi tiết (1-3 câu) về hình ảnh Tiếng Việt: (1) Cái gì được hiển thị? (2) Liên quan đến bước nào/khái niệm nào? (3) Hành động/điểm lưu ý chính hình ảnh minh họa là gì?
    *   **URL Hình ảnh:** Ưu tiên URL từ hệ thống Jega Việt Nam. Hình ảnh base64 từ nguồn gốc cần được tải về, xử lý (nếu cần Việt hóa chú thích trên ảnh), tải lên hệ thống Jega và dùng URL mới.

*   **Phân cách mục KB:** `----------------------------------------`.

## Lưu ý về Giai đoạn 2 (Bổ sung Nội dung Tiếng Anh):

Khi có nguồn lực và nhu cầu, các trường `CONTENT_EN` và `IMAGE_DESCRIPTION_EN_X` (tương tự như cấu trúc của Tiếng Việt) sẽ được **thêm mới** vào mỗi mục KB. AI Agent sẽ được cập nhật về sự thay đổi này để có thể ưu tiên sử dụng nội dung Tiếng Anh đã được biên tập khi có sẵn.
