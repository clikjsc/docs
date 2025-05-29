# Script to update MDX files with image references
# This script adds image references to all the completed article MDX files

# Function to add an image reference to an MDX file
function Add-ImageReference {
    param (
        [string]$filePath,
        [string]$imageId
    )
    
    if (-not (Test-Path $filePath)) {
        Write-Host "File not found: $filePath" -ForegroundColor Red
        return
    }
    
    $imagePath = "/images/huong-dan/$imageId.png"
    # Ensure the image file actually exists before adding a reference
    $fullImagePath = "e:\Program\Mintlify\docs\images\huong-dan\$imageId.png"
    if (-not (Test-Path $fullImagePath)) {
        Write-Host "Image file not found: $fullImagePath for $filePath" -ForegroundColor Red
        return
    }

    $imageReference = "`n<Frame> `n  <img src=`"$imagePath`" />`n</Frame>`n"
    
    $content = Get-Content $filePath -Raw
    
    # Check if the file already has a Frame or image reference
    if ($content -match "<Frame>") {
        Write-Host "File already has a Frame: $filePath. Skipping. (To overwrite, manually remove existing Frame or modify script)" -ForegroundColor Yellow
        return
    }
    
    # Try to find the first H1 heading after the frontmatter
    if ($content -match "(?m)(^---\s+[\s\S]*?^---\s*$\s*)(#[^#\r\n]+)") {
        $frontMatterText = $matches[1]
        $firstHeadingText = $matches[2]
        
        # Construct the new content by inserting the image reference after the first heading
        # We use the original matched parts to reconstruct and insert. $matches[0] is the whole match.
        $originalMatch = $matches[0]
        $replacementText = $frontMatterText + $firstHeadingText + "`n" + $imageReference
        
        # Replace the first occurrence of the original match with the new text
        $regex = [regex]::Escape($originalMatch)
        $newContent = $content -replace $regex, $replacementText, 1 # Replace only the first occurrence

        Set-Content -Path $filePath -Value $newContent
        Write-Host "Added image reference after H1 in $filePath" -ForegroundColor Green
        return
    }
    
    # If no H1, try to insert after the frontmatter itself
    if ($content -match "(?m)(^---\s+[\s\S]*?^---\s*$\s*)") {
        $frontMatterOnlyText = $matches[1] # $matches[1] because the regex itself is group 1
        # Ensure we're replacing the correct part of the string if $frontMatterOnlyText is not unique
        # Prepending to the content *after* the frontmatter is safer.
        $contentAfterFrontmatter = $content.Substring($frontMatterOnlyText.Length)
        $newContent = $frontMatterOnlyText + $imageReference + $contentAfterFrontmatter
        Set-Content -Path $filePath -Value $newContent
        Write-Host "Added image reference after frontmatter in $filePath" -ForegroundColor Green
        return
    }
    
    # As a last resort, if no suitable place is found, append to the end
    Write-Host "Could not find H1 or frontmatter in $filePath. Appending image to the end." -ForegroundColor Yellow
    Add-Content -Path $filePath -Value $imageReference
}

# Define the mapping of MDX files to image IDs
$fileImageMap = @{
    # Tổng quan
    "e:\Program\Mintlify\docs\trung-tam-huong-dan\tong-quan\gioi-thieu.mdx" = "gioi-thieu"
    "e:\Program\Mintlify\docs\trung-tam-huong-dan\tong-quan\bat-dau-nhanh.mdx" = "bat-dau-nhanh"
    
    # Hướng dẫn người dùng mới
    "e:\Program\Mintlify\docs\trung-tam-huong-dan\huong-dan-nguoi-dung-moi\dang-ky-tai-khoan.mdx" = "dang-ky-tai-khoan"
    "e:\Program\Mintlify\docs\trung-tam-huong-dan\huong-dan-nguoi-dung-moi\thiet-lap-tai-khoan.mdx" = "thiet-lap-tai-khoan"
    "e:\Program\Mintlify\docs\trung-tam-huong-dan\huong-dan-nguoi-dung-moi\giao-dien-co-ban.mdx" = "giao-dien-co-ban"
    
    # Thiết kế xây dựng
    "e:\Program\Mintlify\docs\trung-tam-huong-dan\thiet-ke-xay-dung\tao-mat-bang.mdx" = "tao-mat-bang"
    "e:\Program\Mintlify\docs\trung-tam-huong-dan\thiet-ke-xay-dung\chinh-sua-mat-bang.mdx" = "chinh-sua-mat-bang"
    "e:\Program\Mintlify\docs\trung-tam-huong-dan\thiet-ke-xay-dung\tao-vach-ngan.mdx" = "tao-vach-ngan"
    
    # Thao tác cơ bản
    "e:\Program\Mintlify\docs\trung-tam-huong-dan\thao-tac-co-ban\hieu-ung-mo-hinh.mdx" = "hieu-ung-mo-hinh"
    "e:\Program\Mintlify\docs\trung-tam-huong-dan\thao-tac-co-ban\quan-ly-khong-gian.mdx" = "quan-ly-khong-gian"
    "e:\Program\Mintlify\docs\trung-tam-huong-dan\thao-tac-co-ban\cong-cu-chinh-sua.mdx" = "cong-cu-chinh-sua"
    
    # Tùy chỉnh nội thất
    "e:\Program\Mintlify\docs\trung-tam-huong-dan\tuy-chinh-noi-that\bo-cuc-phong.mdx" = "bo-cuc-phong"
    "e:\Program\Mintlify\docs\trung-tam-huong-dan\tuy-chinh-noi-that\tu-do-noi-that.mdx" = "tu-do-noi-that"
    "e:\Program\Mintlify\docs\trung-tam-huong-dan\tuy-chinh-noi-that\cau-hinh-tu-ban.mdx" = "cau-hinh-tu-ban"
    "e:\Program\Mintlify\docs\trung-tam-huong-dan\tuy-chinh-noi-that\cua-va-cua-so.mdx" = "cua-va-cua-so"
    
    # Kết xuất
    "e:\Program\Mintlify\docs\trung-tam-huong-dan\ket-xuat\thiet-lap-ket-xuat.mdx" = "thiet-lap-ket-xuat"
    "e:\Program\Mintlify\docs\trung-tam-huong-dan\ket-xuat\ket-xuat-hinh-anh.mdx" = "ket-xuat-hinh-anh"
    "e:\Program\Mintlify\docs\trung-tam-huong-dan\ket-xuat\ve-ai\cong-cu-ban-ve-ai.mdx" = "cong-cu-ban-ve-ai"
    "e:\Program\Mintlify\docs\trung-tam-huong-dan\ket-xuat\ve-ai\su-dung-chuc-nang-ve-ai.mdx" = "su-dung-chuc-nang-ve-ai"
    
    # Hỏi đáp
    "e:\Program\Mintlify\docs\trung-tam-huong-dan\hoi-dap\cau-hoi-thuong-gap.mdx" = "cau-hoi-thuong-gap"
    "e:\Program\Mintlify\docs\trung-tam-huong-dan\hoi-dap\lien-he-ho-tro.mdx" = "lien-he-ho-tro"
    "e:\Program\Mintlify\docs\trung-tam-huong-dan\hoi-dap\video-huong-dan.mdx" = "video-huong-dan"
    
    # Cập nhật hàng tháng
    "e:\Program\Mintlify\docs\trung-tam-huong-dan\cap-nhat-hang-thang\2025-05.mdx" = "update-2025-05"
}

# Update each MDX file
foreach ($filePath in $fileImageMap.Keys) {
    $imageId = $fileImageMap[$filePath]
    Write-Host "Processing: $filePath with image: $imageId.png"
    Add-ImageReference -filePath $filePath -imageId $imageId
}

Write-Host "Done updating MDX files!"