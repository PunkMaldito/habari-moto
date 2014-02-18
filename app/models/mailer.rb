require 'dedent'

module Brisk
  module Models
    module Mailer extend self
      def user_invite!(invite)
        Mail.deliver do
          from    'Habari Moto <ray@sparkpl.ug>'
          to      invite.email
          subject "An invitation to join Habari Moto from #{invite.user_name}."
          body    <<-EOF.dedent
            Hi there,

            #{invite.user_name} has invited you to join Habari Moto, an upbeat news sharing and link aggregation community for the East African region.

            To learn more, and claim your invitation, visit:

            \thttp://habari-moto.herokuapp.com//claim/#{invite.code}

            Thanks,
            Admin
          EOF
        end
      end

      def user_activate!(user)
        Mail.deliver do
          from    'Habari Moto <ray@sparkpl.ug>'
          to      user.email
          subject 'Welcome to Habari Moto!'
          body    <<-EOF.dedent
            Hi there,

            Good news! #{user.parent_name || 'Admin'} has activated your Habari Moto account.

            Thanks,
            Admin
          EOF
        end
      end

      def feedback!(text, email = nil)
        Mail.deliver do
          from    'Habari Moto <ray@sparkpl.ug>'
          to      'alex@example.com'
          subject 'Habari Moto Feedback'
          reply_to email if email.present?
          body     text

          charset = 'UTF-8'
          content_transfer_encoding = '8bit'
        end
      end
    end
  end
end