;;; ~/.dotfiles/.doom.d/mu4e-config.el -*- lexical-binding: t; -*-

(require 'mu4e)
(setq mu4e-root-maildir "~/.Mail")
(setq mu4e-attachment-dir "~/.Mail/attachments")
(setq mu4e-view-show-images t)
;; use imagemagick, if available
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

;; don't save message to Sent Messages, Gmail/IMAP takes care of this
(setq mu4e-sent-messages-behavior 'delete)
;; allow for updating mail using 'U' in the main view:
(setq mu4e-get-mail-command "offlineimap")
;; convert html emails properly
;; Possible options:
;;   - html2text -utf8 -width 72
;;   - textutil -stdin -format html -convert txt -stdout
;;   - html2markdown | grep -v '&nbsp_place_holder;' (Requires html2text pypi)
;;   - w3m -dump -cols 80 -T text/html
;;   - view in browser (provided below)
(setq mu4e-html2text-command "html2text -b 80 --reference-links --protect-links")
(setq browse-url-browser-function 'browse-url-chromium)

;; spell check
(add-hook 'mu4e-compose-mode-hook
        (defun my-do-compose-stuff ()
           "My settings for message composition."
           (set-fill-column 72)
           (flyspell-mode)))

;; add option to view html message in a browser
;; `aV` in view to activate
(add-to-list 'mu4e-view-actions
  '("ViewInBrowser" . mu4e-action-view-in-browser) t)

;; fetch mail every 3 mins
(setq mu4e-update-interval 300)

;; mu4e email notifications
(mu4e-alert-set-default-style 'libnotify)
(add-hook 'after-init-hook #'mu4e-alert-enable-notifications)

(setq mu4e-contexts
    `( ,(make-mu4e-context
    :name "Gmail"
    :enter-func (lambda () (mu4e-message "Entering Gmail"))
          :leave-func (lambda () (mu4e-message "Leaving Gmail"))
    :match-func (lambda (msg)
      (when msg
        (mu4e-message-contact-field-matches msg
          :to "cajetan.puchalski@gmail.com")))
    :vars '( ( user-mail-address                           . "cajetan.puchalski@gmail.com"  )
       ( user-full-name                                    . "Kajetan Puchalski" )
       ( mu4e-compose-signature                            .
         (concat
           "Kind regards,\n"
           "Kajetan\n"))
       ( mu4e-sent-folder                                  . "/cajetan.puchalski@gmail.com/[Gmail].Sent Mail" )
       ( mu4e-drafts-folder                                . "/cajetan.puchalski@gmail.com/[Gmail].Drafts" )
       ( mu4e-maildir-shortcuts                            . (
         ("/cajetan.puchalski@gmail.com/INBOX"         . ?i)
         ("/cajetan.puchalski@gmail.com/[Gmail].Starred"   . ?a)
         ("/cajetan.puchalski@gmail.com/Work"              . ?w)
         ("/cajetan.puchalski@gmail.com/[Gmail].Sent Mail" . ?s)) )
       ( message-send-mail-function                        . 'smtpmail-send-it )
       ( smtpmail-stream-type                              . 'starttls )
       ( smtpmail-default-smtp-server                      . "smtp.gmail.com" )
       ( smtpmail-smtp-server                              . "smtp.gmail.com" )
       ( smtpmail-smtp-service                             . 587 )))
       ,(make-mu4e-context
    :name "Outlook"
    :enter-func (lambda () (mu4e-message "Switch to Outlook"))
    :match-func (lambda (msg)
      (when msg
        (mu4e-message-contact-field-matches msg
          :to "kajetan.puchalski@outlook.com")))
    :vars '( ( user-mail-address                           . "kajetan.puchalski@outlook.com" )
       ( user-full-name                                    . "Kajetan Puchalski" )
       ( mu4e-compose-signature                            .
         (concat
           "Kind regards,\n"
           "Kajetan\n"))
           ( mu4e-sent-folder                              . "/kajetan.puchalski@outlook.com/Sent" )
       ( mu4e-drafts-folder                                . "/kajetan.puchalski@gmail.com/Drafts" )
       ( mu4e-maildir-shortcuts                            . (
         ("/kajetan.puchalski@outlook.com/Inbox"             . ?i)
         ("/kajetan.puchalski@outlook.com/Notes"             . ?n)
         ("/kajetan.puchalski@gmail.com/Sent Mail" . ?s)) )
       ( message-send-mail-function                        . 'smtpmail-send-it )
       ( smtpmail-stream-type                              . 'starttls )
       ( smtpmail-default-smtp-server                      . "smtp.office365.com" )
       ( smtpmail-smtp-server                              . "smtp.office365.com" )
       ( smtpmail-smtp-service                             . 587 )))
       ,(make-mu4e-context
    :name "UofG"
    :enter-func (lambda () (mu4e-message "Switch to UofG"))
    :match-func (lambda (msg)
      (when msg
        (mu4e-message-contact-field-matches msg
          :to "2457183P@student.gla.ac.uk")))
    :vars '( ( user-mail-address       . "2457183P@student.gla.ac.uk" )

       ( user-full-name        . "Kajetan Puchalski" )
       ( mu4e-compose-signature                            .
         (concat
           "Kind regards,\n"
           "Kajetan\n"))
           ( mu4e-sent-folder                              . "/2457183P@student.gla.ac.uk/Sent" )
       ( mu4e-drafts-folder                                . "/2457183P@student.gla.ac.uk/Drafts" )
       ( mu4e-maildir-shortcuts                            . (
         ("/2457183P@student.gla.ac.uk/INBOX"             . ?i)
         ("/2457183P@student.gla.ac.uk/Journal"             . ?j)
         ("/2457183P@student.gla.ac.uk/Sent Mail" . ?s)) )
       ( message-send-mail-function                        . 'smtpmail-send-it )
       ( smtpmail-stream-type                              . 'starttls )
       ( smtpmail-default-smtp-server                      . "smtp.office365.com" )
       ( smtpmail-smtp-server                              . "smtp.office365.com" )
       ( smtpmail-smtp-service                             . 587 )))
       ,(make-mu4e-context
    :name "iCloud"
    :enter-func (lambda () (mu4e-message "Switch to iCloud"))
    :match-func (lambda (msg)
      (when msg
        (mu4e-message-contact-field-matches msg
          :to "kajetan.puchalski@icloud.com")))
    :vars '( ( user-mail-address       . "kajetan.puchalski@icloud.com" )

       ( user-full-name        . "Kajetan Puchalski" )
       ( mu4e-compose-signature                            .
         (concat
           "Kind regards,\n"
           "Kajetan\n"))
           ( mu4e-sent-folder                              . "/kajetan.puchalski@icloud.com/Sent Messages" )
       ( mu4e-drafts-folder                                . "/kajetan.puchalski@icloud.com/Drafts" )
       ( mu4e-maildir-shortcuts                            . (
         ("/kajetan.puchalski@icloud.com/INBOX"             . ?i)
         ("/kajetan.puchalski@icloud.com/Sent Messages" . ?s)) )
       ( message-send-mail-function                        . 'smtpmail-send-it )
       ( smtpmail-stream-type                              . 'starttls )
       ( smtpmail-default-smtp-server                      . "smtp.mail.me.com" )
       ( smtpmail-smtp-server                              . "smtp.mail.me.com" )
       ( smtpmail-smtp-service                             . 587 )))
       ,(make-mu4e-context
    :name "Dialectic Whip"
    :enter-func (lambda () (mu4e-message "Switch to Dialectic Whip"))
    :match-func (lambda (msg)
      (when msg
        (mu4e-message-contact-field-matches msg
          :to "whip@gudialectic.co.uk")))
    :vars '( ( user-mail-address       . "whip@gudialectic.co.uk" )

       ( user-full-name        . "Kajetan Puchalski" )
       ( mu4e-compose-signature                            .
         (concat
           "Kind regards,\n"
           "Kajetan\n"))
           ( mu4e-sent-folder                              . "/whip@gudialectic.co.uk/INBOX.Sent" )
       ( mu4e-drafts-folder                                . "/whip@gudialectic.co.uk/INBOX.Drafts" )
       ( mu4e-maildir-shortcuts                            . (
         ("/whip@gudialectic.co.uk/INBOX"             . ?i)
         ("/whip@gudialectic.co.uk/INBOX.Sent" . ?s)) )
       ( message-send-mail-function                        . 'smtpmail-send-it )
       ( smtpmail-stream-type                              . 'starttls )
       ( smtpmail-default-smtp-server                      . "smtp.gridhost.co.uk" )
       ( smtpmail-smtp-server                              . "smtp.gridhost.co.uk" )
       ( smtpmail-smtp-service                             . 587 )))
))
