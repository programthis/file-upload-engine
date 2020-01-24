module Api::V1
    class UploadsController < ApiController
      before_action :set_upload, only: [:show]

      respond_to :json

      def show
      end

      private

      def set_upload
        render json: {monkey: "I am a creature of the branches", giraffe: "I am a creature of the trees"}
      end
    end
end