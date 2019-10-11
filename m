Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AC32D48A2
	for <lists+linux-leds@lfdr.de>; Fri, 11 Oct 2019 21:53:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728854AbfJKTxZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 11 Oct 2019 15:53:25 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42353 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728799AbfJKTxZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 11 Oct 2019 15:53:25 -0400
Received: by mail-wr1-f67.google.com with SMTP id n14so13132346wrw.9;
        Fri, 11 Oct 2019 12:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oRkq44kf2oMWpSigMYhsqTCgVycawmSkx6daDds1u/0=;
        b=JlD58wTOG0kzS04t2jjntEBsH8ZnrRAzRg2dLTG279iPd5PpShdTPERPi9sSIzkzP0
         TB2bw29KILSfvgxcrnsSF9C6JDT9JiKzgQl6PLCB7vzpK2CNwfNx/Zw5MTJTuP8yKY2a
         kcSELCGu6LXeBhrsEDMvbTQDNljl0vK71yIFR0GGKkjdUJ8QT8fI5nSU7rmGEIPpZtOG
         cIOZCy4eujpUmoQiYbQIMXDKzS0DYCwuX+oM/njZ8XZ3dm026K0jmwJM/xc+bYG/d12S
         Uz2mysyRngeX8DFwHQ4j6i9vko7LOJF+L1u5SWxTfSN4JMOx4jpGbqn7XFQ2Y/JRntXO
         yu+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=oRkq44kf2oMWpSigMYhsqTCgVycawmSkx6daDds1u/0=;
        b=qt+h+BsUj06qvEgmYzfVwqhRCisuBWJ0MmWPTV1yslbwHIMnURpQdTczTJbToyEXPK
         WmkxfCcdQeRX1JHHVwLWWS1jKIRaAdADQAxTw1mNPdqXCu2lEVtVNPOOF0W+cBhZO7ik
         41gh4mFRTrssQVh/k1r3adgIURBWU2hysCrUW9dpJMLImm4To/hPqrS1AIq8autS/9zs
         30LVy+kbn0pmI5rL5GTSC143Sm/q+Zrm+H+EjxlUdWS0ecG4vRLIp4mqW5iNWabggKE8
         dODO3B+xuZExDxrveqDxzChF11/OXH0M/N4yNTM+MBvUPxh8iwP3LfBm0D51+/eJge8D
         5O7g==
X-Gm-Message-State: APjAAAXr5wJ+hDP6BnfZiQ8LRntrXMbhOeP5h5Fhznq0+ifrINby8ti6
        lIWTmsC8VDaJQMmM84VVfIIBKxLK
X-Google-Smtp-Source: APXvYqwDGIQBS20dp/4ydFb+f1KNdejkzVmdf6MlHrDZKio7px7a7vGw7jsiifj0pBvH4a5GkQiZyw==
X-Received: by 2002:adf:a50b:: with SMTP id i11mr15298546wrb.308.1570823602624;
        Fri, 11 Oct 2019 12:53:22 -0700 (PDT)
Received: from [192.168.1.19] (cjl71.neoplus.adsl.tpnet.pl. [83.31.61.71])
        by smtp.gmail.com with ESMTPSA id v11sm9047468wml.30.2019.10.11.12.53.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Oct 2019 12:53:21 -0700 (PDT)
Subject: Re: [PATCH v12 04/16] leds: multicolor: Introduce a multicolor class
 definition
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191011130657.4713-1-dmurphy@ti.com>
 <20191011130657.4713-5-dmurphy@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <651f42b4-a15c-d9ae-9a83-0a0567d61230@gmail.com>
Date:   Fri, 11 Oct 2019 21:53:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191011130657.4713-5-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 10/11/19 3:06 PM, Dan Murphy wrote:
> Introduce a multicolor class that groups colored LEDs
> within a LED node.
> 
> The multi color class groups monochrome LEDs and allows controlling two
> aspects of the final combined color: hue and lightness. The former is
> controlled via <color>_intensity files and the latter is controlled
> via brightness file.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  .../ABI/testing/sysfs-class-led-multicolor    |  36 +++
>  .../bindings/leds/leds-class-multicolor.txt   |   4 +-
>  Documentation/leds/index.rst                  |   1 +
>  Documentation/leds/leds-class-multicolor.rst  |  96 +++++++
>  drivers/leds/Kconfig                          |  10 +
>  drivers/leds/Makefile                         |   1 +
>  drivers/leds/led-class-multicolor.c           | 271 ++++++++++++++++++
>  include/linux/led-class-multicolor.h          | 143 +++++++++
>  8 files changed, 560 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
>  create mode 100644 Documentation/leds/leds-class-multicolor.rst
>  create mode 100644 drivers/leds/led-class-multicolor.c
>  create mode 100644 include/linux/led-class-multicolor.h
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor b/Documentation/ABI/testing/sysfs-class-led-multicolor
> new file mode 100644
> index 000000000000..3d1f9d726c70
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
> @@ -0,0 +1,36 @@
> +What:		/sys/class/leds/<led>/brightness
> +Date:		Sept 2019
> +KernelVersion:	5.5
> +Contact:	Dan Murphy <dmurphy@ti.com>
> +Description:	read/write
> +		Writing to this file will update all LEDs within the group to a
> +		calculated percentage of what each color LED intensity is set
> +		to. The percentage is calculated for each grouped LED via the
> +		equation below:
> +
> +		led_brightness = brightness * <color>_intensity/<color>_max_intensity
> +
> +		For additional details please refer to
> +		Documentation/leds/leds-class-multicolor.rst.
> +
> +		The value of the color is from 0 to
> +		/sys/class/leds/<led>/max_brightness.
> +
> +What:		/sys/class/leds/<led>/colors/<color>_intensity
> +Date:		Sept 2019
> +KernelVersion:	5.5
> +Contact:	Dan Murphy <dmurphy@ti.com>
> +Description:	read/write
> +		The <color>_intensity file is created based on the color
> +		defined by the registrar of the class.
> +		There is one file per color presented.
> +
> +		The value of the color is from 0 to
> +		/sys/class/leds/<led>/colors/<color>_max_intensity.
> +
> +What:		/sys/class/leds/<led>/colors/<color>_max_intensity
> +Date:		Sept 2019
> +KernelVersion:	5.5
> +Contact:	Dan Murphy <dmurphy@ti.com>
> +Description:	read only
> +		Maximum intensity level for the LED color.
> diff --git a/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt b/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
> index 8619c9bf1811..4b1bd82f2a42 100644
> --- a/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
> +++ b/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
> @@ -10,7 +10,7 @@ The nodes and properties defined in this document are unique to the multicolor
>  LED class.  Common LED nodes and properties are inherited from the common.txt
>  within this documentation directory.
>  
> -Required LED Child properties:
> +Required LED child properties:
>  	- color : For multicolor LED support this property should be defined as
>  		  LED_COLOR_ID_MULTI and further definition can be found in
>  		  include/linux/leds/common.h.
> @@ -26,7 +26,7 @@ led-controller@30 {
>  		#size-cells = <0>;
>  		reg = <1>;
>  		color = <LED_COLOR_ID_MULTI>;
> -		function = LED_FUNCTION_STATUS;
> +		function = LED_FUNCTION_CHARGING;
>  

So this went to wrong patch.

-- 
Best regards,
Jacek Anaszewski
