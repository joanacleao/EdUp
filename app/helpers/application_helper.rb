module ApplicationHelper
   def youtube_video(url)
    render :partial => 'shared/video', :locals => { :url => url }
  end
  def youtube_video_max(url)
    render :partial => 'shared/video_max', :locals => { :url => url }
  end
end
