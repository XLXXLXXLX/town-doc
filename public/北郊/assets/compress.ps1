# 设定目标文件夹为当前目录  
$targetDir = "."  
  
# 获取所有jpg和png图片文件  
$images = Get-ChildItem -Path $targetDir -File | Where-Object { $_.Extension -in '.jpg', '.png' }  
  
foreach ($image in $images) {  
    # 构建输出文件的路径和名称，这里假设输出文件名与原图相同，但扩展名为webp  
    $outputPath = [System.IO.Path]::ChangeExtension($image.FullName, '.webp')  
      
    # 调用ffmpeg命令进行转换  
    # 注意：这里假设ffmpeg已经添加到环境变量中，否则需要指定ffmpeg的完整路径  
    ffmpeg -i "$image" -vf scale=iw/2:ih/2  "$outputPath"  
      
    # 如果ffmpeg不在环境变量中，你需要这样调用（假设ffmpeg位于C:\ffmpeg\bin\ffmpeg.exe）  
    # & "C:\ffmpeg\bin\ffmpeg.exe" -i "$image" "$outputPath"  
      
    # 输出转换进度信息（可选）  
    Write-Host "Converted $($image.FullName) to $outputPath"  
}  
  
Write-Host "All images have been converted to WebP format."


