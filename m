Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3966C3A69A
	for <lists+linux-leds@lfdr.de>; Sun,  9 Jun 2019 17:16:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728678AbfFIPQC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 9 Jun 2019 11:16:02 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:34910 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728634AbfFIPQC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 9 Jun 2019 11:16:02 -0400
Received: by mail-wm1-f67.google.com with SMTP id c6so5933662wml.0;
        Sun, 09 Jun 2019 08:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=xM92I2oMiGz86blo54tMJZX9FcNKVrwE135SXsW4qjM=;
        b=hyOankHVoxS8akM8dGjjwSiAPP/3VGja6/yQIvC5qkfu3lmWX5gyq4ayl25U2uVHFD
         VQ9M2aoIdzlxDnhSj7gkSX0I8ayOZmILjv1pFCo8FsTSmCNTMlOX7J7nyPvNcyRV3J4u
         gZm0W+D6T8vnPG36qtB5YaG70bZqENj+/C5ypbI6+aCVQEo50sWJi7xC5tEKo2N4/moD
         3MCQXSvl/lHAmTyqxbVuwMYjEDax7tsPwT3vOrGKOhwHN/cDeo3ruARqaA3tJFEJXJj+
         aEsvdBtLRRKXsGwHJ7kG346bukVMxgOFRsbGMf8znUFGKVtNa8RC06YKX1nksbuuR6r6
         4ygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=xM92I2oMiGz86blo54tMJZX9FcNKVrwE135SXsW4qjM=;
        b=iNa8/6irPtZckxNfFiNBaz9H49nahFOMQF5U0E+PzX1xbrrgYwfTuBdjsXcfD3WXtT
         fol6IRH2OwziQbSNwBHqTYVEHeOfxU4UA4jA/wJ93I+D9c4k8gymBtblYfALbtN1jiOL
         FqlnP6w0AmG11G1RFWarE9OUl6Zu1+/u/Qq54/mU9bXlGh0yiPOjfRRS6fT+AL0HRc5A
         7jh0D29Gjmhilu8/M+a6jwQaX/6KqzRQrnaCrNfTHxaFhjyFE+5ql0AVHaNCETJ9MJYS
         8yQtiK8proLeCh4aQuYCNNRq2cMY4aenckoOmpAy9yP2ENEn68ImBLxZ9WwapJqtc9wK
         QNEw==
X-Gm-Message-State: APjAAAX4LqBEXZ04XGHZR88RwkPoIQOyM1yix1oqnAsjD2GQ++1JMIxB
        AsbNPWuY/mTejfluQEg15uP3JIm9
X-Google-Smtp-Source: APXvYqxkKmZuoiSlALK1AuVCeFg4hdD0oFsDNLDSg1/at5Hu7sjB2JpioZcxrwvj4j2Yd7kHqdALcA==
X-Received: by 2002:a1c:c583:: with SMTP id v125mr9968204wmf.158.1560093359729;
        Sun, 09 Jun 2019 08:15:59 -0700 (PDT)
Received: from [192.168.1.17] (ckm12.neoplus.adsl.tpnet.pl. [83.31.88.12])
        by smtp.gmail.com with ESMTPSA id p16sm12455926wrg.49.2019.06.09.08.15.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Jun 2019 08:15:59 -0700 (PDT)
Subject: Re: [PATCH v4 2/2] documention: leds: Add multicolor class
 documentation
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190530181630.30373-1-dmurphy@ti.com>
 <20190530181630.30373-2-dmurphy@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <d5bdf93b-2a6e-a773-ebb1-4850859ed147@gmail.com>
Date:   Sun, 9 Jun 2019 17:15:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190530181630.30373-2-dmurphy@ti.com>
Content-Type: multipart/mixed;
 boundary="------------1E09EAE11F5DFB1537256FD3"
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This is a multi-part message in MIME format.
--------------1E09EAE11F5DFB1537256FD3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dan,

On 5/30/19 8:16 PM, Dan Murphy wrote:
[...]
> +Multicolor Class Brightness Control
> +-----------------------------------
> +The multicolor class will redirect the device drivers call back
> +function for brightness control to the multicolor class brightness
> +control function.
> +
> +The brightness level for each LED is calculated based on the color LED
> +brightness setting divided by the color LED max brightness setting multiplied by
> +the requested value.
> +
> +led_brightness = requested_value*(led_color_brightness/led_color_max_brightness)
> +
> +Example:
> +Three LEDs are present in the group as defined in "Directory Layout Example"
> +within this document.
> +
> +A user first writes the color LED brightness file with the brightness level that
> +is neccesary to achieve a blueish violet output from the RGB LED group.
> +
> +echo 138 > /sys/class/leds/rgb:grouped_leds/red/brightness
> +echo 43 > /sys/class/leds/rgb:grouped_leds/green/brightness
> +echo 226 > /sys/class/leds/rgb:grouped_leds/blue/brightness
> +
> +red -
> +	brightness = 138
> +	max_brightness = 255
> +green -
> +	brightness = 43
> +	max_brightness = 255
> +blue -
> +	brightness = 226
> +	max_brightness = 255
> +
> +The user can control the brightness of that RGB group by writing the parent
> +'brightness' control.  Assuming a parent max_brightness of 255 the user may want
> +to dim the LED color group to half.  The user would write a value of 128 to the
> +parent brightness file then the values written to each LED will be adjusted
> +base on this value
> +
> +cat /sys/class/leds/rgb:grouped_leds/max_brightness
> +255
> +echo 128 > /sys/class/leds/rgb:grouped_leds/brightness
> +
> +adjusted_red_value = 128 * (138/255) = 69
> +adjusted_green_value = 128 * (43/255) = 21
> +adjusted_blue_value = 128 * (226/255) = 113
> +
> +Reading the parent brightness file will return the current brightness value of
> +the color LED group.

I've tested this algorithm with python script and at least on my LED 
monitor it works as expected. Attached is the script I've come up with.

> +cat /sys/class/leds/rgb:grouped_leds/max_brightness
> +255
> +
> +echo 128 > /sys/class/leds/rgb:grouped_leds/brightness
> +
> +cat /sys/class/leds/rgb:grouped_leds/max_brightness
> +128
> +
> +
> 

-- 
Best regards,
Jacek Anaszewski

--------------1E09EAE11F5DFB1537256FD3
Content-Type: text/x-python;
 name="led_color.py"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="led_color.py"

#!/usr/bin/python3.5

from PIL import Image
import sys
import time

WIDTH = 500
HEIGHT = 500

def print_usage():
        print ('Usage: led_color.py RED GREEN BLUE TOP_BRIGHTNESS')
        sys.exit(0)

def main():
    if len(sys.argv) != 5:
            print_usage()

    MAX_R = int(sys.argv[4])
    MAX_G = int(sys.argv[4])
    MAX_B = int(sys.argv[4])

    R = int(sys.argv[1])
    G = int(sys.argv[2])
    B = int(sys.argv[3])
    TB = int(sys.argv[4])

    for BR in range(1,TB+1):
        OUT_R = int(BR * R / MAX_R)
        OUT_G = int(BR * G / MAX_G)
        OUT_B = int(BR * B / MAX_B)

        print("red: {}, green: {}, blue: {}".format(OUT_R, OUT_G, OUT_B))

        img = Image.new("RGB", (WIDTH,HEIGHT), (OUT_R,OUT_G,OUT_B))
        img.show()
        time.sleep(0.1)


if __name__ == "__main__":
        main()


--------------1E09EAE11F5DFB1537256FD3--
