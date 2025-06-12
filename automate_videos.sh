#!/bin/bash

# Video Automation Script using FFmpeg and CUDA
# Author: Fayez Mamdoh

# Define input video files
videos=(
  "video1.mp4"
  "video2.mp4"
)

# Define trim time ranges for each video (format: START_TIME-END_TIME)
# Example: 00:00:05-00:00:30
times=(
  "00:00:05-00:00:30"
  "00:01:10-00:01:45"
)

# Create output directory if it doesn't exist
mkdir -p output

# Loop through and process each video
for i in "${!videos[@]}"; do
  input="${videos[i]}"
  time_range="${times[i]}"
  start="${time_range%-*}"
  end="${time_range#*-}"
  output="output/${input%.*}_trimmed.mp4"

  echo "⏱️ Trimming $input from $start to $end..."

  # Run ffmpeg with hardware acceleration
  ffmpeg -hwaccel cuda -i "$input" -ss "$start" -to "$end" -c:v h264_nvenc -c:a copy "$output"

  echo "✅ Saved: $output"
done

echo "🎉 All videos processed successfully."
