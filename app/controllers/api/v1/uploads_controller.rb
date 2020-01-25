module Api::V1
    class UploadsController < ApiController
        before_action :set_upload, only: [:show]

        def show
        end

        def destroy
            attachment = ActiveStorage::Attachment.find(params[:file_id])
            attachment.purge
            upload = Upload.find(params[:id])
            if (upload.files.length <= 0)
                upload.destroy
            end
            render json: {status: "File successfully deleted"}
        end

        def delete_multiple_files
            file_ids = params[:file_ids]
            file_ids.each do |file_id|
                attachment = ActiveStorage::Attachment.find(params[:file_id])
                attachment.purge
            end
            render json: {status: "Files successfully deleted"}
        end

        private

        def set_upload
            render json: {monkey: "I am a creature of the branches", giraffe: "I am a creature of the trees"}
        end
    end
end