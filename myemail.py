import os
import sys
import smtplib

def send_email(receiver, activation_number):
    my_pass = os.environ['DARKBOLI_PASSWORD']

    receiver_email = receiver
    sender_email = 'onecity@darkboli.net'
    sender_pwd = my_pass
    activation_link = "http://localhost:5001/activation/" + str(activation_number)

    smtpserver = smtplib.SMTP('darkboli.net', 587) #not self hosted.

    smtpserver.ehlo() #Identify yourself to an ESMTP server using EHLO
    smtpserver.starttls() #Requests the mail server to start TLS/SSL negotiation and protect the connection with security layer.
    smtpserver.login('onecity', sender_pwd)

    msg_header = 'To:' + receiver_email + '\n' + 'From: ' + sender_email + '\n' + 'Subject: Email Confirmation \n'
    msg_content = '\n Thank you for registering. To activate your account click here: \n\n' + activation_link
    msg = msg_header + msg_content
    smtpserver.sendmail(sender_email, receiver_email, msg)
    smtpserver.close()