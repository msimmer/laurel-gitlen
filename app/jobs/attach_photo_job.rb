class AttachPhotoJob
  include SuckerPunch::Job
  
  def perform(piece_id)
    ActiveRecord::Base.connection_pool.with_connection do
      piece = Piece.find(piece_id)
      piece.move_upload_to_paperclip
    end
  end
end