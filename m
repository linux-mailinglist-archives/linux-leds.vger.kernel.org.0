Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18DFE1BCD51
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2020 22:25:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgD1UZK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 28 Apr 2020 16:25:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726286AbgD1UZK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Tue, 28 Apr 2020 16:25:10 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9BB7C03C1AB;
        Tue, 28 Apr 2020 13:25:09 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id b11so26229913wrs.6;
        Tue, 28 Apr 2020 13:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tT5d0riiZZ18ek/9DKLrzDdyJ2JQ94/wqzkmlAGoP9k=;
        b=fVgHTUMtLyN8PrFr/GKj+psd0vGnjoXWpD8FYvJOBmhHAICfHpyCj9oRNiW7tV5fYV
         K6z/g3Q+6pa3/yIV4vcqzxWxrS9emyprXBxVSiOm5+fA12f2L7LGVym0zyQhM9rmrCn3
         8OdzwV9PnClKvjLIR4PQ27nKPbbntvMha6ymcbJAFfvD+p8bijamk4EnuwJKLqspCLSm
         f6MOHSYTQxie75jNZHC+DJ+v5wIUTV6GVSWVDHLMJsKPSSi8xHbpMXCwvfGqE9TEeqPJ
         2LBKcMS14axkULNn1bGxdT5LYoYCjYbljrioKbPMg7IQN9qIVGjROEMGBfoMa6eq2C3D
         Zi2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tT5d0riiZZ18ek/9DKLrzDdyJ2JQ94/wqzkmlAGoP9k=;
        b=KCN96H+DzVKLlICMg5qmDYRrifFic0riBYcAjRuA/FLbvCFFhKp8Xwp8Ft/kcQUx/Q
         tH4b/F7ZlixItaY6VE3jc9w3dNxkDips2IrKT2CKPwkY1f0GgfgKwXbtOvL9aX1SF5dA
         nRX+n43sFIGiMKtLDGZes8bmP7yeSuB1ydO4q05K8w4W4ZkdMFyOk9A7GTsGcZSAa6oZ
         iHwFv69n7xmlgjYwmip1GKp2QCBKilYeyZzVQ4o4/r7WWO4NmEaj/9WGvbfvxRfWcAjw
         Dqc+kHozlFsmLhJEgvXHwJA/mi1zYJvbEPRk/UxcPrNGQmbFX0rRHIVxvo0/VmGxTOXE
         Xifw==
X-Gm-Message-State: AGi0PubFGuUdGIFFF+BjTkWZoPBVD4QKie8WPr6gGADJFgO3gML76Hye
        1QzspOCYVLcEsSNgzLxjaeyfo5g7TVk=
X-Google-Smtp-Source: APiQypKx04egV24/uBV75dgEWC3DPqEnSLJTGUt+k+CPuBQHWJLN7dDcxJN2g3h6Hu+b57AMRI7XTA==
X-Received: by 2002:adf:ab1b:: with SMTP id q27mr37550151wrc.220.1588105507706;
        Tue, 28 Apr 2020 13:25:07 -0700 (PDT)
Received: from [192.168.1.23] (afcs235.neoplus.adsl.tpnet.pl. [95.49.70.235])
        by smtp.gmail.com with ESMTPSA id l16sm26599482wrp.91.2020.04.28.13.25.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2020 13:25:07 -0700 (PDT)
Subject: Re: [PATCH v21 04/16] leds: lp50xx: Add the LP50XX family of the RGB
 LED driver
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200428160338.2793-1-dmurphy@ti.com>
 <20200428160338.2793-5-dmurphy@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <d3020c80-90f7-e73a-5ff3-6c503b9fdea9@gmail.com>
Date:   Tue, 28 Apr 2020 22:25:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200428160338.2793-5-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Dan,

Thanks for the update. There is one remnant from the
previous stages that you already scheduled for removal AFAIR.

On 4/28/20 6:03 PM, Dan Murphy wrote:
> Introduce the LP5036/30/24/18/12/9 RGB LED driver.
> The difference in these parts are the number of
> LED outputs where the:
> 
> LP5036 can control 36 LEDs
> LP5030 can control 30 LEDs
> LP5024 can control 24 LEDs
> LP5018 can control 18 LEDs
> LP5012 can control 12 LEDs
> LP5009 can control 9 LEDs
> 
> The device has the ability to group LED output into control banks
> so that multiple LED banks can be controlled with the same mixing and
> brightness.  Inversely the LEDs can also be controlled independently.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
[...]
> +
> +		init_data.fwnode = child;
> +		init_data.devicename = priv->client->name;

Namely this line. We don't need devicename for new drivers like this.

> +		fwnode_property_read_string(child, "linux,default-trigger",
> +				    &led->led_dev.default_trigger);
> +		num_colors = 0;
> +
> +		/* There are only 3 LEDs per module otherwise they should be
> +		   banked which also is presented as 3 LEDs*/
> +		mc_led_info = devm_kcalloc(priv->dev, LP50XX_LEDS_PER_MODULE,
> +					   sizeof(*mc_led_info), GFP_KERNEL);
> +		if (!mc_led_info)
> +			return -ENOMEM;
> +
> +		fwnode_for_each_child_node(child, led_node) {
> +			ret = fwnode_property_read_u32(led_node, "color",
> +						       &color_id);
> +			if (ret)
> +				dev_err(priv->dev, "Cannot read color\n");
> +
> +			mc_led_info[num_colors].color_index = color_id;
> +			num_colors++;
> +		}
> +
> +		led->priv = priv;
> +		led->mc_cdev.num_colors = num_colors;
> +		led->mc_cdev.subled_info = mc_led_info;
> +		led_cdev = &led->mc_cdev.led_cdev;
> +		led_cdev->brightness_set_blocking = lp50xx_brightness_set;
> +		ret = devm_led_classdev_multicolor_register_ext(&priv->client->dev,
> +						       &led->mc_cdev,
> +						       &init_data);
>[...]
-- 
Best regards,
Jacek Anaszewski
