Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78E072BB01
	for <lists+linux-leds@lfdr.de>; Mon, 27 May 2019 22:00:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726931AbfE0UAs (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 May 2019 16:00:48 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52556 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726801AbfE0UAs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 May 2019 16:00:48 -0400
Received: by mail-wm1-f67.google.com with SMTP id y3so511343wmm.2;
        Mon, 27 May 2019 13:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qs0hduG7r9ZuCuorXfKiLxTX7AgEzf0fkdnIQ/+Us5w=;
        b=jKp6Tj6GYHwtJkdSEmERhGmELlQG2xE1zCTdm+gWm+2McCGc1YmqNpVm2267/kbzuW
         aWASqvy/KZMFsUCuBfchpe1yePkV4rp523HBnDvumPq+iojYq9eEteeTkjCA+AV96l8D
         M//QMSC2goAgc9eI2Dd9ckCuzyIUe9pVvsKjioyp9tWmogB4Pjb6Ea1ifo0e6sflOvJm
         AbyLOwRV1wcngpJfSXYKu0NpHTWJZ6cx+Odz4iDqCYzKob5JlaMmDBfYUJ0Iui3Cp2/D
         54iJbnjZP3nRdJRvbPLUKvuitGKwQaoOUv5dwiKmTtvo1uJnR7PaLXjOn7HeDZnxR7mS
         9M1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qs0hduG7r9ZuCuorXfKiLxTX7AgEzf0fkdnIQ/+Us5w=;
        b=VRvEwuA4094KnoIyJIWXp/b5T92+aSiNScBIb8Mz+yFYOK2f5Zk/fYnT0NiYS0Lr5U
         A9Hp8ezDZwYCYsUvygW+vR8hEH9SWamcFeLUENyLMz0RJPFFN/4zM3BEXjuTFOb5cwwR
         4ycShLp4a8e7V6KzOlgNZxE8gLr64Lb0UxBRw2JpthO9DXXTkD54/8dvgayW5REImtQf
         hchev6t/pI9mD1e2QobvJjW2SuG+5xVVi5rjlEJSCrz2nE1tAYHiCUyMWDi3p0ffLqWc
         VxxaHERBE+cKVqIUO2ZngGOkiusiVqaBrNIvi+zxVaZk+cBL/YHMEAYfcp+DSw4nTZ2k
         7YUg==
X-Gm-Message-State: APjAAAUGdn8Zr8Jp4FQgiyDPon1FRgq9KitDWmSXSob/UGziaFD0Mtny
        t5FiZmdmrN5wQfwq1Mp9CTohdBeM
X-Google-Smtp-Source: APXvYqwdr28CqJsor9aafRQ5eOruKDuW6LisxlprBS+CBeHT/FESW9Rvn4qI8ioQhs8rwwgYlqEoNA==
X-Received: by 2002:a1c:c00b:: with SMTP id q11mr456498wmf.4.1558987245546;
        Mon, 27 May 2019 13:00:45 -0700 (PDT)
Received: from [192.168.1.17] (bkn17.neoplus.adsl.tpnet.pl. [83.28.181.17])
        by smtp.gmail.com with ESMTPSA id l190sm636252wml.25.2019.05.27.13.00.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 May 2019 13:00:44 -0700 (PDT)
Subject: Re: [PATCH v3 1/9] leds: multicolor: Add sysfs interface definition
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz, robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190523190820.29375-1-dmurphy@ti.com>
 <20190523190820.29375-2-dmurphy@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <f01ac400-efda-80a8-4d63-1e2add5e054a@gmail.com>
Date:   Mon, 27 May 2019 22:00:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190523190820.29375-2-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Dan,

Thank you for the update.

One thing is missing here - we need to document how legacy brightness
levels map to the sub-LED color levels, i.e. what you do in
multicolor_set_brightness().

Best regards,
Jacek Anaszewski

On 5/23/19 9:08 PM, Dan Murphy wrote:
> Add a documentation of LED Multicolor LED class specific
> sysfs attributes.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>   .../ABI/testing/sysfs-class-led-multicolor    | 57 +++++++++++++++++++
>   1 file changed, 57 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor b/Documentation/ABI/testing/sysfs-class-led-multicolor
> new file mode 100644
> index 000000000000..2f102ede258b
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
> @@ -0,0 +1,57 @@
> +What:		/sys/class/leds/<led>/colors/sync_enable
> +Date:		April 2019
> +KernelVersion:	5.2
> +Contact:	Dan Murphy <dmurphy@ti.com>
> +Description:	read/write
> +		Writing a 1 to this file will enable the synchronization of all
> +		the defined color LEDs within the LED node.  Brightness values
> +		for each LED will be stored and written when sync is set to 1.
> +		Writing a 0 to this file will disable syncing and allow
> +		individual control of the LEDs brightness settings.
> +
> +What:		/sys/class/leds/<led>/colors/sync
> +Date:		April 2019
> +KernelVersion:	5.2
> +Contact:	Dan Murphy <dmurphy@ti.com>
> +Description:	write only
> +		Writing a 1 to this file while sync_enable is set to 1 will
> +		write the current brightness values to all defined LEDs within
> +		the LED node.  All LEDs defined will be configured based
> +		on the brightness that has been requested.
> +
> +		If sync_enable is set to 0 then writing a 1 to sync has no
> +		affect on the LEDs.
> +
> +What:		/sys/class/leds/<led>/colors/<led_color>/brightness
> +Date:		April 2019
> +KernelVersion:	5.2
> +Contact:	Dan Murphy <dmurphy@ti.com>
> +Description:	read/write
> +		The led_color directory is dynamically created based on the
> +		colors defined by the registrar of the class.
> +		The led_color can be but not limited to red, green, blue,
> +		white, amber, yellow and violet.  Drivers can also declare a
> +		LED color for presentation.  There is one directory per color
> +		presented.  The brightness file is created under each
> +		led_color directory and controls the individual LED color
> +		setting.
> +
> +		If sync is enabled then	writing the brightness value of the LED
> +		is deferred until a 1 is written to
> +		/sys/class/leds/<led>/color/sync.  If syncing is
> +		disabled then the LED brightness value will be written
> +		immediately to the LED driver.
> +
> +		The value of the color is from 0 to
> +		/sys/class/leds/<led>/colors/<led_color>/max_brightness.
> +
> +What:		/sys/class/leds/<led>/colors/<led_color>/max_brightness
> +Date:		April 2019
> +KernelVersion:	5.2
> +Contact:	Dan Murphy <dmurphy@ti.com>
> +Description:	read only
> +		Maximum brightness level for the LED color, default is
> +		255 (LED_FULL).
> +
> +		If the LED does not support different brightness levels, this
> +		should be 1.
> 


