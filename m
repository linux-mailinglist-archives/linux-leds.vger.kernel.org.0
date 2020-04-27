Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 838F01BAFFF
	for <lists+linux-leds@lfdr.de>; Mon, 27 Apr 2020 23:10:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726817AbgD0VKc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Apr 2020 17:10:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726285AbgD0VKc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 27 Apr 2020 17:10:32 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9340C0610D5;
        Mon, 27 Apr 2020 14:10:31 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id t14so22197733wrw.12;
        Mon, 27 Apr 2020 14:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YcKWIY2MXEY9yETNeWA3mpQlFZvVkwPb0tBInR/V9Qo=;
        b=asN92CUC5fWcrPe0XiJkw+FAPmOPy18UXD8TQ1uD4Xy4Qrpt/AqSfmF92tkL9Wlajc
         ZcCI9g2j0Fto+f34yJyrhkQ+62WUH51jRqCPCetSvGyWQXF1XOrz2zAx6IlWbutEexWU
         LtXCwTzcFYksytsDyOkVHovzQyVhvxWMJPl0JIenB0otw81EFeOlUtkWFtcpRDE4zpWj
         A+KGRIq2ow2PY1y+VPrLZKh++HZCDCBubF1KjM+cAO3s4jTd2xxgWhFcxkzkPQYc2CJb
         xkAvDuoLiYRxFmOYC5f7TmFJQk20UhrZbsWL/oMAh4Uw30KkqPOXtF7ulUwQBMkXU8fB
         0lQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YcKWIY2MXEY9yETNeWA3mpQlFZvVkwPb0tBInR/V9Qo=;
        b=RP2zbjX8OJG+9d8WnBeiRzq6TU/RUnFijOEyEqGGMbm+GmJKtaoosSjJeXxSAziziV
         Gu96916rSFKGQhhbOAS8qGpuuvIMGxDtV2Xhad+E7Ns9pOemVPjwrEykYgiSQBPADTPx
         T3+5x7I+s5P9e0pb3szg80DRa8G+Yk8LYSU0eupWQpbF8FW3u3ujU0Uhc41ACnQKGSfN
         yi2kJFhT0rDcHg6FwbmqSySP7J8O9epPRelhI7Q/jYK0OE2G0CPrMRU4Jfo9kbH8N3sc
         ElRJGuLqhxnLzWkiKKNgwxIRUJeAwHPKRNTkr/ktqBRmQAYMPpN9zrIDxCQumWMvqrT9
         k2gQ==
X-Gm-Message-State: AGi0PuZf3BmSAhYkDKAPiZDb20rtZsPf/82EDf+qQUmsm9IMpkA7zzEy
        aKQNLCkKKksyzu8PrJMVoiM=
X-Google-Smtp-Source: APiQypIfnE9TCnw4ISHqihiv2DP5aBYbFtJjGfebMYH2oeRlrafHShe2ZdvRiHMknXIYaPxCeid2mw==
X-Received: by 2002:a5d:6589:: with SMTP id q9mr27853808wru.136.1588021830326;
        Mon, 27 Apr 2020 14:10:30 -0700 (PDT)
Received: from [192.168.1.23] (acft175.neoplus.adsl.tpnet.pl. [83.9.221.175])
        by smtp.gmail.com with ESMTPSA id q184sm511187wma.25.2020.04.27.14.10.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2020 14:10:29 -0700 (PDT)
Subject: Re: [PATCH v3 2/2] leds: add sgm3140 driver
To:     Luca Weiss <luca@z3ntu.xyz>, Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Icenowy Zheng <icenowy@aosc.io>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20200421191354.1443017-1-luca@z3ntu.xyz>
 <20200421191354.1443017-3-luca@z3ntu.xyz> <20200427095102.GA21572@duo.ucw.cz>
 <318932736.Jt2qlLCP7m@g550jk>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <a5b4ddec-e0f9-f8e6-1763-87935569be97@gmail.com>
Date:   Mon, 27 Apr 2020 23:10:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <318932736.Jt2qlLCP7m@g550jk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Luca,

On 4/27/20 9:49 PM, Luca Weiss wrote:
> On Montag, 27. April 2020 11:51:02 CEST Pavel Machek wrote:
>> Hi!
>>
>>> Add a driver for the SGMICRO SGM3140 Buck/Boost Charge Pump LED driver.
>>>
>>> This device is controlled by two GPIO pins, one for enabling and the
>>> second one for switching between torch and flash mode.
>>>
>>> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
>>
>> Thanks, applied, but... I may remove it again.
>>
>>> +++ b/drivers/leds/leds-sgm3140.c
>>> @@ -0,0 +1,320 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>
>> Would you consider GPL-2+?
> 
> I don't really have a preference either way but GPL-2.0-or-later is fine for
> me.
> 
>>
>>> +#if IS_ENABLED(CONFIG_V4L2_FLASH_LED_CLASS)
>>> +static void sgm3140_init_v4l2_flash_config(struct sgm3140 *priv,
>>
>> Ok.
>>
>>> +static int sgm3140_probe(struct platform_device *pdev)
>>> +{
>>
>> ...
>>
>>> +	led_cdev->brightness_set_blocking = sgm3140_brightness_set;
>>> +	led_cdev->max_brightness = LED_ON;
>>
>> Don't do this, unless you really have 255 levels of brightness.
> 
> LED_ON is 1, so the brightness available is 0 - 1.
> 
>>
>>> +	/* Create V4L2 Flash subdev */
>>> +	priv->v4l2_flash = v4l2_flash_init(&pdev->dev,
>>> +					   child_node,
>>> +					   fled_cdev, NULL,
>>> +					   &v4l2_sd_cfg);
>>> +	if (IS_ERR(priv->v4l2_flash)) {
>>
>> Does this need some #ifdef guards?
> 
> v4l2_flash_init has a NULL-returning version when CONFIG_V4L2_FLASH_LED_CLASS
> is not defined (see https://elixir.bootlin.com/linux/latest/source/include/
> media/v4l2-flash-led-class.h#L166 )

Correct.

>>
>>> +		ret = PTR_ERR(priv->v4l2_flash);
>>> +		goto err;
>>> +	}
>>> +
>>> +	return ret;
>>
>> Should this return 0?
> 
> ret should be 0 here, so it shouldn't matter much.
> 
>>
>>> +err:
>>> +	fwnode_handle_put(child_node);
>>> +	return ret;
>>> +}
>>
>> Does non-error path needs handle_put, too?
> 
> I don't think so, I'm passing child_node to v4l2_flash_init which then saves
> the pointer to v4l2_subdev->fwnode.
> 
> The devm_led_classdev_flash_register_ext function also seems to store the
> pointer (led_cdev->dev->fwnode = init_data->fwnode; in
> led_classdev_register_ext)

The node needs to be held only during parsing, so you
have to call fwnode_handle_put() for both paths.

-- 
Best regards,
Jacek Anaszewski
