Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEBA330C9CD
	for <lists+linux-leds@lfdr.de>; Tue,  2 Feb 2021 19:30:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238451AbhBBSaD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 2 Feb 2021 13:30:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238573AbhBBSZR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 2 Feb 2021 13:25:17 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4FE9C061788;
        Tue,  2 Feb 2021 10:24:35 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id f19so25115709ljn.5;
        Tue, 02 Feb 2021 10:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Q0T5IJwaSHOziIxSRhbmo9/NktrkYw4HnAHaQWP4KHQ=;
        b=btzlH3Vxt+/koq/pSPXEBf4bkrneg6wWxrTbVGxN1JyckKHRZZi9ax6r8i/bl6Ir1s
         IbmB+P0Zd8ho4CqrpMNkanmVY5FxKnQW6K1SN2D2tDtoT+XN5ihVWeOhdrRIoKSLUos/
         VWI8LvV5oqS+2GdcBAyxW8i1dSqHHpQCGijGWw3lFWeHmiYW+gR5+/zYzD4T/bzbT7RF
         TXddshv1tZ3k7C26ZQ2GjagnlW47lhBZ89LWTRkVX0Wko3oCH/j+w3oPkv3buMGeYmAF
         OeSJisuIoobveQfD6+2xaQmDlKqtiFCm11drAtW4GuFCRIbdZph2ushLX3hx9ws0oCzw
         ygeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Q0T5IJwaSHOziIxSRhbmo9/NktrkYw4HnAHaQWP4KHQ=;
        b=O2w8VXbbsNn6/7SZbG9DTrQFrEgBnu1WAyK60V8cxuES30DGNvySgrRAsJZZd3OjFT
         tcAh0ptGAZdmkqWBSNA3ZMGgp8TRU6+L7SeSQqkm/gjzv2PRYOkah6XhljxjowiSXlrl
         mgMOn9c+V96eMTNewy0dKFQor4WCnUVuAHlcny52YR1BmOxh4KXY6dGLCCUoQNiLCpUo
         bIYkzFtSAhH38yZ+lAtgWKIpX5kWngjKqJFehX5olso/hMmXWGwb1dtYX76e/UZGhMGj
         6iyayLAvx2fb9Fsp9DXFvuoSwwsI1T6o+IcvUP/YP8RdLmTZ4Car66vc7iUkFNLscntg
         XrtQ==
X-Gm-Message-State: AOAM532nVclP/LRJAGLGl2FhHHW5NweH8zrwjhcMKdmcNosSDSG3C1pn
        2WOamOkeg4dyBmVQfPBgXAQd4qegMGK8uA==
X-Google-Smtp-Source: ABdhPJxXOkVdvYP3ZgEOCJO6jAENS8rLkK5ge4Pewg6qilVVcGWtdonj61DXmSgCFQE8f1Yhya2/tg==
X-Received: by 2002:a2e:9a52:: with SMTP id k18mr13748061ljj.249.1612290273551;
        Tue, 02 Feb 2021 10:24:33 -0800 (PST)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id 19sm4414607ljw.19.2021.02.02.10.24.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Feb 2021 10:24:32 -0800 (PST)
Subject: Re: [PATCH v1] leds: lp50xx: add setting of default intensity from DT
To:     Sven Schuchmann <schuchmann@schleissheimer.de>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210119105312.2636-1-schuchmann@schleissheimer.de>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <8029565b-9b45-8c2c-cb6a-c639af5780fb@gmail.com>
Date:   Tue, 2 Feb 2021 19:24:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210119105312.2636-1-schuchmann@schleissheimer.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Sven,

On 1/19/21 11:53 AM, Sven Schuchmann wrote:
> In order to use a multicolor-led together with a trigger
> from DT the led needs to have an intensity set to see something.
> The trigger changes the brightness of the led but if there
> is no intensity we actually see nothing.
> 
> This patch adds the ability to set the default intensity
> of each led so that it is turned on from DT.
> 
> Signed-off-by: Sven Schuchmann <schuchmann@schleissheimer.de>
> ---
>   Documentation/devicetree/bindings/leds/leds-lp50xx.yaml | 8 +++++++-
>   drivers/leds/leds-lp50xx.c                              | 4 ++++
>   2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
> index c192b5feadc7..5ad2a0c3c052 100644
> --- a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
> +++ b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
> @@ -69,7 +69,12 @@ patternProperties:
>       patternProperties:
>         "(^led-[0-9a-f]$|led)":
>           type: object
> -        $ref: common.yaml#
> +        allOf:
> +          - $ref: common.yaml#
> +        properties:
> +          default-intensity:
> +            maxItems: 1
> +            description: The intensity the LED gets initialised with.
>   
>   required:
>     - compatible
> @@ -102,6 +107,7 @@ examples:
>   
>                  led-0 {
>                      color = <LED_COLOR_ID_RED>;
> +                   default-intensity = <100>;
>                  };
>   
>                  led-1 {

Please split this into a separate patch, preceding this one in the series.

> diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
> index f13117eed976..ba760fa33bdc 100644
> --- a/drivers/leds/leds-lp50xx.c
> +++ b/drivers/leds/leds-lp50xx.c
> @@ -501,6 +501,10 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
>   			}
>   
>   			mc_led_info[num_colors].color_index = color_id;
> +
> +			fwnode_property_read_u32(led_node, "default-intensity",
> +						 &mc_led_info[num_colors].intensity);
> +
>   			num_colors++;
>   		}
>   
> 

For this part:

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski
