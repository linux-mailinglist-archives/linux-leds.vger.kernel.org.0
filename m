Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88AB71B91D8
	for <lists+linux-leds@lfdr.de>; Sun, 26 Apr 2020 18:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbgDZQqY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 26 Apr 2020 12:46:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726143AbgDZQqY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 26 Apr 2020 12:46:24 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35FDEC061A0F;
        Sun, 26 Apr 2020 09:46:24 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id x25so16885932wmc.0;
        Sun, 26 Apr 2020 09:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iUe5NXaxGL1zLQenTHEIL9FKuJd3II5VQVl4t/j1xtQ=;
        b=Er6hBDhw3YhRy4GKH8lQ9t7X+43g1q9WeAXBpv+FA0ZcBLVz7oRpA4dsAKAvhZM//v
         /2EVwrBG83DgBersYYSXr490bH0EteJaH+7/8zRvBUVw4erUY5nXg83hxNhfOul68HMZ
         vJ6ZO49lX6Br4C0pUMyfrhN55KDSepfKSz2QsT4zbde1gOh+ScjwfQcBR0YMqTSgy0+i
         n0qaff4oQd2NIJYIioEVkeUPVfeg7QKpV5RVRKV2Q/b8K23ILT/QmOIEPmfDvzZJ2DDC
         PJiPT4yx91nWYVzKpYVX28ck008tWhej6rkoHfr1z+dqurmKaLaMr5/FNwDJJ6/U1buJ
         wICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iUe5NXaxGL1zLQenTHEIL9FKuJd3II5VQVl4t/j1xtQ=;
        b=m6mhqiV7SNLT0yAa01W2bKQ1ZIZ/wWsZ27gg0CS2kcpbFGvZnN/zFxE5uQhQ6oGI3C
         Qkv0Pq0pMT36ZXmDa6SUIZt44ZG/4BoMXFJsp71K2qBH896l8nz/Abk+48gdAYrVmfG2
         10BlVUECG514mfp3FRLxh96GXeiPQERY+qXO5yV1PVk28jRVSAtRcStG2sSSQBUHZrpq
         +e/XR1ngvcdjxgOCjlY+CyMUseKUJtmO1z7D3dzcD1CUj1WU0L/Sibja0evaANz9IBaN
         a0eHkg2P4EC0YNH878tMF0Q6YP57MpEf+zo0rBjB3cYzFKylPan7tNAtKfn981QmQI3c
         SUbg==
X-Gm-Message-State: AGi0PuZ5OQ9K8ze6W5jcCzPKC8sGV8powqW1VIyl/oa/B3wVOkIGwGl8
        IqinS3DzrAnrF+Z30ysd7eHZRMzn
X-Google-Smtp-Source: APiQypJOpUHwa8HjsjzvzU9Xz3WOtIl/cy0A0L4iTyV8LBoNlUihnGYpv5WD3xy8IXaYwtrOH63JIg==
X-Received: by 2002:a05:600c:22d3:: with SMTP id 19mr22492121wmg.110.1587919582610;
        Sun, 26 Apr 2020 09:46:22 -0700 (PDT)
Received: from [192.168.1.23] (afcl109.neoplus.adsl.tpnet.pl. [95.49.63.109])
        by smtp.gmail.com with ESMTPSA id h1sm12585063wme.42.2020.04.26.09.46.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Apr 2020 09:46:22 -0700 (PDT)
Subject: Re: [PATCH v20 03/17] leds: multicolor: Introduce a multicolor class
 definition
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200423155524.13971-1-dmurphy@ti.com>
 <20200423155524.13971-4-dmurphy@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <625e1659-5e8e-f3db-3bdb-7c492dca0403@gmail.com>
Date:   Sun, 26 Apr 2020 18:46:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200423155524.13971-4-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Dan,

On 4/23/20 5:55 PM, Dan Murphy wrote:
> Introduce a multicolor class that groups colored LEDs
> within a LED node.
> 
> The multi color class groups monochrome LEDs and allows controlling two
> aspects of the final combined color: hue and lightness. The former is
> controlled via color_intensity file and the latter is controlled
> via brightness file.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
> 
> v20 - Change color_ file names to multi_led, dynamically allocate the
> multicolor_info struct.  Fixed documentation issues from Randy D.
> 
[...]
> +MODULE_AUTHOR("Dan Murphy <dmurphy@ti.com>");
> +MODULE_DESCRIPTION("Multi Color LED class interface");
> +MODULE_LICENSE("GPL v2");
> diff --git a/include/linux/led-class-multicolor.h b/include/linux/led-class-multicolor.h
> new file mode 100644
> index 000000000000..7c5befb270f8
> --- /dev/null
> +++ b/include/linux/led-class-multicolor.h
> @@ -0,0 +1,121 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* LED Multicolor class interface
> + * Copyright (C) 2019-20 Texas Instruments Incorporated - http://www.ti.com/
> + */
> +
> +#ifndef __LINUX_MULTICOLOR_LEDS_H_INCLUDED
> +#define __LINUX_MULTICOLOR_LEDS_H_INCLUDED
> +
> +#include <linux/leds.h>
> +#include <dt-bindings/leds/common.h>
> +
> +struct led_mc_subled {
> +	int color_index;
> +	int color_brightness;
> +	int color_led_intensity;
> +	int color_channel;
> +};
> +
> +struct led_classdev_mc {
> +	/* led class device */
> +	struct led_classdev led_cdev;
> +	int num_colors;
> +
> +	struct led_mc_subled *multicolor_info;

I think mc_subleds (or even subleds alone - we are already in
led_classdev_*mc*) would be way more informative name for this
property.

And as already proposed in the other message:

s/color_led_intensity/color_intensity/

Also, I would like to have just "brightness" instead
of color_brightness, which is ambiguous. And having brightness
in this struct led_mc_subled would clearly state that this is
the value to be written to the hardware similarly as is
struct led_classdev's brightness for monochrome LEDs.

-- 
Best regards,
Jacek Anaszewski
