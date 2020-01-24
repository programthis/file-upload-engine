module Api::V1
    class UploadsController < ApiController
      before_action :set_upload, only: [:show]

      def show
      end

      def destroy
        attachment = ActiveStorage::Attachment.find(params[:id])
        attachment.purge # or use purge_later
        upload = Upload.find(params[:upload_id])
        if (upload.files.length <= 0)
            upload.destroy
        end
        render json: {status: "File successfully deleted"}
      end

      private

      def set_upload
        render json: {monkey: "I am a creature of the branches", giraffe: "I am a creature of the trees"}
      end
    end
end