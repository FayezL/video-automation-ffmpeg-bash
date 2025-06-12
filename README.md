# 🎬 Video Automation with FFmpeg & Bash

This is a simple Bash script that automates video trimming using FFmpeg and NVIDIA CUDA hardware acceleration.

## ✨ Features
- Batch processes multiple videos
- Trims specific time ranges from each video
- Uses hardware-accelerated encoding (CUDA + h264_nvenc)
- Saves output files to an `output/` folder

## 🧰 Requirements
- Bash
- FFmpeg with CUDA support (NVIDIA GPU)

## 🔧 How to Use

1. Add your input video filenames to the `videos` array.
2. Add matching time ranges in `START-END` format (e.g., `00:00:10-00:01:00`) to the `times` array.
3. Run the script:

```bash
chmod +x automate_videos.sh
./automate_videos.sh
