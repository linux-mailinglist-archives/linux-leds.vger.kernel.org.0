Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFE28B9D77
	for <lists+linux-leds@lfdr.de>; Sat, 21 Sep 2019 12:55:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407512AbfIUKzT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 21 Sep 2019 06:55:19 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50445 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407449AbfIUKzT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 21 Sep 2019 06:55:19 -0400
Received: by mail-wm1-f66.google.com with SMTP id 5so5009973wmg.0;
        Sat, 21 Sep 2019 03:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Uws/t6BglFHhG735K622EFKuAGq3v8qgTlRHs9SU1QI=;
        b=MJzSDEWwnnckSo0hw9ps1r8ygJzpXECoX4pUawSKjpvxh5P88Ku+sToeltSrwkhj/t
         5/uC3hPeXuDNGeQAkYrQSQzVFO2oI2y9MacXTx+JtIsAEFkSeekiAzW/swpUyC1vQTxp
         J+KzKKQMTQlGloJT+pBuPes0JpNmmLWHDgi4OJDcyJCKTJgnHRHcXkG/UeHXaNJyMwS6
         pYs8fPSMsaMKJEfcR2sxBZ7syQaNgfUoXQpBVAYcNFPBHamvgt/TTSyZf6beWdpeGpFm
         lgnG1IzMZHmZ3wZRTs1buYpinPt6pvIWChKJcIf4vA4fDJbieBQWwFQvmvqrrhW1RTlK
         hJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Uws/t6BglFHhG735K622EFKuAGq3v8qgTlRHs9SU1QI=;
        b=ObI2D9fCJkFTpcJRniaJ4OvI1okRDbMoc2J1ljFLzrdCTrI52PAhhz6bwuMM+nisFF
         XoP7IjrIUBWEqUNV3opKU8VI1516ItLzD2L0GFMI+0JLVRd/q5LdimkQDa/vGUuRtjXH
         rHAN6bbuwc/8QAoGTXKHKlRV11hNxsa1sHTtwogyCRLy0zmDHgHfDMaLn+vm/NhT6f9a
         DhGJPEAtzY5a24cZCR48GsRSjVjFZk+l8+bxak1mxOGUMl53HQt1k1ZRFDmAixX90LXy
         lvGNO9On3Q3++qSoGe+LXsiZJplFF3NMVvUeZuEAF+EBEU/YW+pP3yYDxZEovy8hwi+b
         cVcw==
X-Gm-Message-State: APjAAAV/t/+gs7QfIlAIORcwqa00zJ3f+ST2xSZJZoA2ah08o5QWoSoG
        wt1l4bOTTESKzH028ges0LbkmZjA
X-Google-Smtp-Source: APXvYqze4hNfrxXmuUPxM03Y6LXxq5Rizj+smRAdfxE8BhsI2uGBjOVcI4hbcvSUD66GjGXmpf8CTw==
X-Received: by 2002:a1c:e90b:: with SMTP id q11mr6752283wmc.19.1569063314437;
        Sat, 21 Sep 2019 03:55:14 -0700 (PDT)
Received: from [192.168.1.19] (blb134.neoplus.adsl.tpnet.pl. [83.28.195.134])
        by smtp.gmail.com with ESMTPSA id r18sm6146883wme.48.2019.09.21.03.55.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 21 Sep 2019 03:55:13 -0700 (PDT)
Subject: Re: [PATCH v8 1/9] leds: multicolor: Add sysfs interface definition
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190920174139.30079-1-dmurphy@ti.com>
 <20190920174139.30079-2-dmurphy@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <ea294ad4-d340-3677-eab0-6138968cfe0e@gmail.com>
Date:   Sat, 21 Sep 2019 12:55:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190920174139.30079-2-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 9/20/19 7:41 PM, Dan Murphy wrote:
> Add a documentation of LED Multicolor LED class specific
> sysfs attributes.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  .../ABI/testing/sysfs-class-led-multicolor    | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor b/Documentation/ABI/testing/sysfs-class-led-multicolor
> new file mode 100644
> index 000000000000..39fc73becfec
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
> @@ -0,0 +1,43 @@
> +What:		/sys/class/leds/<led>/brightness
> +Date:		Sept 2019
> +KernelVersion:	5.5
> +Contact:	Dan Murphy <dmurphy@ti.com>
> +Description:	read/write
> +		Writing to this file will update all LEDs within the group to a
> +		calculated percentage of what each color LED intensity is set
> +		to. The percentage is calculated via the equation below:
> +
> +		led_brightness = requested_value * led_color_intensity/led_color_max_intensity

How about:

led_brightness = brightness * <color>_intensity/<color>_max_intensity

> +
> +		For additional details please refer to
> +		Documentation/leds/leds-class-multicolor.rst.
> +
> +		The value of the color is from 0 to
> +		/sys/class/leds/<led>/max_brightness.
> +
> +What:		/sys/class/leds/<led>/colors/<led_color>_intensity

s/led_color/color/

> +Date:		Sept 2019
> +KernelVersion:	5.5
> +Contact:	Dan Murphy <dmurphy@ti.com>
> +Description:	read/write
> +		The led_color directory is dynamically created based on the
> +		colors defined by the registrar of the class.
> +		The value for the led_color is defined in the
> +		include/dt-bindings/leds/common.h. There is one directory per
> +		color presented.  The intensity file is created under each
> +		led_color directory and controls the individual LED color
> +		setting.

We no longer have led_color directories so this description needs
to be adjusted.

And I'd not mention where the colors are defined. This is documentation
for the user, who does not need to know about implementation details.

> +
> +		The value of the color is from 0 to
> +		/sys/class/leds/<led>/colors/<led_color>_max_intensity.
> +
> +What:		/sys/class/leds/<led>/colors/<led_color>_max_intensity
> +Date:		Sept 2019
> +KernelVersion:	5.5
> +Contact:	Dan Murphy <dmurphy@ti.com>
> +Description:	read only
> +		Maximum intensity level for the LED color, default is
> +		255 (LED_FULL).

Mentioning the default value here is pointless IMO. Userspace cannot
change it anyway.

> +
> +		If the LED does not support different intensity levels, this
> +		should be 1.
> 

This is less relevant for MC class, and also it is rather obvious.
I'd skip this sentence.

-- 
Best regards,
Jacek Anaszewski
