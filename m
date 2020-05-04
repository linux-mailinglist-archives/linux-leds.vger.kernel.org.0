Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE6521C484B
	for <lists+linux-leds@lfdr.de>; Mon,  4 May 2020 22:31:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727820AbgEDUb1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 4 May 2020 16:31:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbgEDUb1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 4 May 2020 16:31:27 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECA81C061A0E;
        Mon,  4 May 2020 13:31:26 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id s8so57117wrt.9;
        Mon, 04 May 2020 13:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+Ti5azn6Yh/Q7ZcDBSDYQDf6zyS6jTJFcXMAyzC/7iA=;
        b=DOckHhZK4jjOC1IfrCnHHtprgrGvT/Ga6krPMkSh+5e997FjwWCBs4aqh6xhNlBYY3
         xiIss8cCo0R9nhsvzYCDBTKOKMFw4tVu02oBP1ubdE8dIu1jjVTBQxfme2i4rMxUzzX8
         XNTCfPbqO/SPf86eMEsKMGFZ1X+YF2uMkuo/gf8vFAYPfSa3K2yVUhtCAVcpZH7wmXfT
         H3YZwaSc6819tuYBW9T8Hk2m+q7ErRNYSAbMWjTfWvZHZ11d9qLVPYes1HTLhWfcZLgk
         7x07qw7zFJYmuNISUjPCqZTl5X4ZhckZcOe+S0Scj8VTVSzucfTJvPTJ1AEv7zIQloSl
         6NrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+Ti5azn6Yh/Q7ZcDBSDYQDf6zyS6jTJFcXMAyzC/7iA=;
        b=XLQ59N4k4xr1osmskm7W8dBLHPnGyZoEyzjG5gm8QwwXWfjf6JP2Mu+W2eNmthbHbD
         mE7KUfnN74B/SHH0yCjxn3XIg9GzsrLmAXU4you+Ae4AJ8mdJkhWbS5V5WR9NtlycSWe
         K+L9ftJbtJiyolOhf0m8cjOrQ8C8ZrZKvUFFCHiitfs6luUtuMUbIPL4276FT69cD4tq
         Fw1HffwqroVZr9za9rFcaFFcRt4JfGaenFZsvmWpGnp3E3dm4N3AjTM32Ongfc/vGWR4
         GDajyhPEee0qiXE+ryMNGrBSigzx5SI4L2DjowRtg5pObVh+4DCIeQzqugXVGLX1quwp
         qI8g==
X-Gm-Message-State: AGi0PuY7gEvinQZhU17DfujzVwVr9Um9H5nhKuE+eeQNFHgclyTeXm4e
        oFFQv8ER9Nwb038yKyeg5ulxXLhv6L0=
X-Google-Smtp-Source: APiQypIykKDIgnSEmZcksjdyBWd1H+NnBe/U12YK14m64Wx+gNowJUHrhARn1dzUUsDtcaSMqlx7TQ==
X-Received: by 2002:a5d:5404:: with SMTP id g4mr1113753wrv.310.1588624285285;
        Mon, 04 May 2020 13:31:25 -0700 (PDT)
Received: from [192.168.1.23] (afde147.neoplus.adsl.tpnet.pl. [95.49.82.147])
        by smtp.gmail.com with ESMTPSA id 2sm16356136wre.25.2020.05.04.13.31.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2020 13:31:24 -0700 (PDT)
Subject: Re: [PATCH v24 02/16] leds: multicolor: Introduce a multicolor class
 definition
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200503123215.6449-1-dmurphy@ti.com>
 <20200503123215.6449-3-dmurphy@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <b33c83a2-4cf1-7137-74d9-7e1cb8b00737@gmail.com>
Date:   Mon, 4 May 2020 22:31:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200503123215.6449-3-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 5/3/20 2:32 PM, Dan Murphy wrote:
> Introduce a multicolor class that groups colored LEDs
> within a LED node.
> 
> The multi color class groups monochrome LEDs and allows controlling two
> aspects of the final combined color: hue and lightness. The former is
> controlled via the intensity file and the latter is controlled
> via brightness file.
> 
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
[...]
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -30,6 +30,17 @@ config LEDS_CLASS_FLASH
>   	  for the flash related features of a LED device. It can be built
>   	  as a module.
>   
> +config LEDS_CLASS_MULTI_COLOR
> +	tristate "LED MultiColor LED Class Support"
> +	depends on LEDS_CLASS
> +	depends on LEDS_CLASS_MULTI_COLOR || !LEDS_CLASS_MULTI_COLOR

I was saying about adding this dependency to the drivers based on
LED mc class. This way it does not make any sense. Moreover it is
erroneous:

$ make menuconfig
drivers/leds/Kconfig:33:error: recursive dependency detected!

Instead you should add it to the Kconfig entries of all drivers
that depend on LED mc class, i.e.:

- config LEDS_LP50XX
- config LEDS_LP5521
- config LEDS_LP5523

Moreover there are still some checkpatch.pl problems:

---------------------------------------------------------------
0003-leds-multicolor-Introduce-a-multicolor-class-definit.patch
---------------------------------------------------------------
WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
#89: FILE: Documentation/leds/leds-class-multicolor.rst:1:
+====================================

ERROR: spaces required around that '=' (ctx:WxO)
#294: FILE: drivers/leds/led-class-multicolor.c:62:
+		ret =-EINVAL;
  		    ^

ERROR: space required before that '-' (ctx:OxV)
#294: FILE: drivers/leds/led-class-multicolor.c:62:
+		ret =-EINVAL;

WARNING: DT binding documents should be licensed (GPL-2.0-only OR 
BSD-2-Clause)
#31: FILE: Documentation/devicetree/bindings/leds/leds-lp50xx.yaml:1:
+# SPDX-License-Identifier: GPL-2.0

WARNING: Block comments use * on subsequent lines
#705: FILE: drivers/leds/leds-lp50xx.c:636:
+		/* There are only 3 LEDs per module otherwise they should be
+		   banked which also is presented as 3 LEDs*/

WARNING: Block comments use a trailing */ on a separate line
#705: FILE: drivers/leds/leds-lp50xx.c:636:
+		   banked which also is presented as 3 LEDs*/


---------------------------------------------------------------
0008-ARM-dts-n900-Add-reg-property-to-the-LP5523-channel-.patch
---------------------------------------------------------------
WARNING: 'accomodate' may be misspelled - perhaps 'accommodate'?

---------------------------------------------------------------
0009-ARM-dts-imx6dl-yapp4-Add-reg-property-to-the-lp5562-.patch
---------------------------------------------------------------
WARNING: 'accomodate' may be misspelled - perhaps 'accommodate'?

---------------------------------------------------------------
0010-ARM-dts-ste-href-Add-reg-property-to-the-LP5521-chan.patch
---------------------------------------------------------------
WARNING: 'accomodate' may be misspelled - perhaps 'accommodate'?


> +	help
> +	  This option enables the multicolor LED sysfs class in /sys/class/leds.
> +	  It wraps LED class and adds multicolor LED specific sysfs attributes
> +	  and kernel internal API to it. You'll need this to provide support
> +	  for multicolor LEDs that are grouped together. This class is not
> +	  intended for single color LEDs. It can be built as a module.
> +


-- 
Best regards,
Jacek Anaszewski
