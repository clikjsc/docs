import json
import os
from pathlib import Path
import requests

# Video IDs and their corresponding .mdx files
VIDEOS = [
    {
        "id": "_qamOGtCVbQ",
        "mdx_file": "trung-tam-huong-dan/video-huong-dan-chi-tiet/huong-dan-video-01.mdx"
    },
    {
        "id": "ujsctZ2SEw8",
        "mdx_file": "trung-tam-huong-dan/video-huong-dan-chi-tiet/huong-dan-video-02.mdx"
    },
    {
        "id": "ZT1m2BMubBY",
        "mdx_file": "trung-tam-huong-dan/video-huong-dan-chi-tiet/huong-dan-video-03.mdx"
    },
    {
        "id": "BmLmSRYOmNs",
        "mdx_file": "trung-tam-huong-dan/video-huong-dan-chi-tiet/huong-dan-video-04.mdx"
    },
    {
        "id": "kfVMTSrMpoE",
        "mdx_file": "trung-tam-huong-dan/video-huong-dan-chi-tiet/huong-dan-video-05.mdx"
    },
    {
        "id": "BbL78TN1hrg",
        "mdx_file": "trung-tam-huong-dan/video-huong-dan-chi-tiet/huong-dan-video-06.mdx"
    },
    {
        "id": "3Ybh6RPYnX0",
        "mdx_file": "trung-tam-huong-dan/video-huong-dan-chi-tiet/huong-dan-video-07.mdx"
    },
    {
        "id": "uk3LVNcp9rQ",
        "mdx_file": "trung-tam-huong-dan/video-huong-dan-chi-tiet/huong-dan-video-08.mdx"
    },
    {
        "id": "SKlfVLBkLJc",
        "mdx_file": "trung-tam-huong-dan/video-huong-dan-chi-tiet/huong-dan-video-09.mdx"
    },
    {
        "id": "i0WL9Hhf1lI",
        "mdx_file": "trung-tam-huong-dan/video-huong-dan-chi-tiet/huong-dan-video-10.mdx"
    },
    {
        "id": "T5_L54mtdy4",
        "mdx_file": "trung-tam-huong-dan/video-huong-dan-chi-tiet/huong-dan-video-11.mdx"
    }
]

def load_template():
    """Load the API request template"""
    with open('youtube_description_api_template.json', 'r', encoding='utf-8') as f:
        return json.load(f)

def create_request_for_video(video_id, template):
    """Create the API request for a specific video"""
    request = template.copy()
    video_url = f"https://www.youtube.com/watch?v={video_id}"
    request['contents'][0]['parts'][0]['fileData']['fileUri'] = video_url
    return request

def save_response(video_id, response_data):
    """Save the API response to a JSON file"""
    output_dir = Path('video_responses')
    output_dir.mkdir(exist_ok=True)
    
    output_file = output_dir / f"{video_id}_response.json"
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(response_data, f, ensure_ascii=False, indent=2)

def process_videos():
    """Process each video in the list"""
    template = load_template()
    
    for video in VIDEOS:
        video_id = video['id']
        print(f"\nProcessing video {video_id}...")
        
        # Create the request
        request = create_request_for_video(video_id, template)
        
        # Save the request for reference
        output_dir = Path('video_requests')
        output_dir.mkdir(exist_ok=True)
        with open(output_dir / f"{video_id}_request.json", 'w', encoding='utf-8') as f:
            json.dump(request, f, ensure_ascii=False, indent=2)
        
        print(f"Created request for video {video_id}")
        print("Please make the API call manually and save the response to:")
        print(f"video_responses/{video_id}_response.json")

if __name__ == "__main__":
    process_videos()
