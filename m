Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8840C36CDC6
	for <lists+linux-leds@lfdr.de>; Tue, 27 Apr 2021 23:22:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239020AbhD0VXc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 27 Apr 2021 17:23:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237073AbhD0VXb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 27 Apr 2021 17:23:31 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77F3DC061574
        for <linux-leds@vger.kernel.org>; Tue, 27 Apr 2021 14:22:47 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id x19so65473044lfa.2
        for <linux-leds@vger.kernel.org>; Tue, 27 Apr 2021 14:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AUeL+kpciRCRbRL+skxOKSfolee9jJRJTBDCrqB/JQ8=;
        b=kNu5ne3OCE542QjeJ3cg7rSV8xhdA8nVFRMuGcHhTTBXNOt+sYm6DvW88e4E/hKnD7
         jGAyEziO0MXIgrUVIxBL87E/+PLAY2QZUhGQKBcsAFB8Rg4BuqRR0QFoobl18tXQG7SV
         R0AcfTDXDmnx8pPjCXk/uJcnXK7Kb+GiEc2EiW0bSTez5ykYbT6CF82k1elnBFnSo0zq
         Ee74RrfPrDeVD7Ee0BTqYxjj+PI3SoWkYZMw/tGAPcZHZZ1rT26fi7VsNdjIvI9Dg8vV
         dQPUA3nKM/D+tP5ilzKUdMqGdENOtNV223j3JWbQ0vFu5HAGDwzXi+KlsxTD6FzhWDzb
         yRMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AUeL+kpciRCRbRL+skxOKSfolee9jJRJTBDCrqB/JQ8=;
        b=arkEcWKsnWNchPzoRT56iJCf6Au2AZDNQy3yQ+DgHIhic3CURcVSMjvNy35WkGbjz0
         yOWCjR8F+pH9hTDAPb7kqZpswKGskMAQjhys0iDitNf6ZymHoqUlDAk0CokmeGN1vD6A
         vf3W02HPSu7SGJlhGFchIE3DqbJiREQPcQuLbKUTrcZQPl2I9krMtF4VrLwEuDqwa8Zz
         7uAErtHbO7iYRBW25jphOvRhl6oZV1y5WPp+dgKqBweTUnKoCdtP0ILupVCZMul7n90l
         BZ5QonYNvswYTtG3uFQMkN4z1/atcq+n6MQkn3GIy6XofgKU8rDEswpydjKi1J2ulkCS
         vyzw==
X-Gm-Message-State: AOAM531hMvDID+M2eXgsCcodz35xeWqJMAQK/gcgztzedpbO/SPJeUWo
        naVuibp9coSj7ZE+JaxRrB4=
X-Google-Smtp-Source: ABdhPJxE6aTRLWcLw4IZVelAWzoKu3VLVeSjrMgZhIEkXixXLWuJ1psQFsZkUhh/Df8fcvr1jOcaAQ==
X-Received: by 2002:a05:6512:15d:: with SMTP id m29mr2922031lfo.515.1619558565737;
        Tue, 27 Apr 2021 14:22:45 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id l11sm216854lfg.279.2021.04.27.14.22.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Apr 2021 14:22:45 -0700 (PDT)
Subject: Re: [PATCH linux dev-5.10 06/35] ARM: dts: aspeed: rainier: Add leds
 that are off PCA9552
To:     vishwanatha subbanna <vishwa@linux.vnet.ibm.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>, linux-leds@vger.kernel.org
Cc:     Milton Miller II <miltonm@us.ibm.com>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Eddie James <eajames@linux.ibm.com>
References: <20210308225419.46530-1-eajames@linux.ibm.com>
 <20210308225419.46530-7-eajames@linux.ibm.com>
 <CACPK8Xc9XqM3UtpF0xywFwfj8anXWE1-TvbHCQskogrBBF_ZCQ@mail.gmail.com>
 <OF39939D76.45BF746F-ON00258696.0001FF38-00258696.0001FF3E@notes.na.collabserv.com>
 <CACPK8XfBu5_2xs_Eu=OtShNFQnAQ+Tc1Q1qM7Qgcaggd-yLumQ@mail.gmail.com>
 <6ACEC474-8CFD-4BA9-B8FF-CCD41007AA67@linux.vnet.ibm.com>
 <CACPK8Xf8iY5LOXgJLvBS0okokG-QNQJ3idPvmcF9eMaRQSBGzQ@mail.gmail.com>
 <4A5014B9-6152-41E0-B928-31C9380185EA@linux.vnet.ibm.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <babf3846-f1fd-d541-6c74-e5f167575105@gmail.com>
Date:   Tue, 27 Apr 2021 23:22:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <4A5014B9-6152-41E0-B928-31C9380185EA@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Vishwanatha,

On 4/26/21 7:59 AM, vishwanatha subbanna wrote:
> Joel,
> 
> With the experiments that I have done, I can not express LEDs with PCA955X_TYPE_LED predominantly because LEDs won’t
> retain states after the BMC reboot. I cooked a patch and tried but it does not work. I did an experiment where
> I put the patch and then did a reboot and saw that the LEDs were [OFF] in the very early stage of probe itself.
> 
>>From a9fe9e956c624c15a455b88cc05262358519a541 Mon Sep 17 00:00:00 2001
> From: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
> Date: Fri, 23 Apr 2021 06:57:56 -0500
> Subject: [PATCH 1/2] leds: pca955x: Add support for default-state
> 
> Signed-off-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
> ---
>   drivers/leds/leds-pca955x.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
> index bf7ead4..987415b 100644
> --- a/drivers/leds/leds-pca955x.c
> +++ b/drivers/leds/leds-pca955x.c
> @@ -130,6 +130,7 @@ struct pca955x_led {
>   	char			name[32];
>   	u32			type;
>   	const char		*default_trigger;
> +	const char		*default_state;
>   };
>   
>   struct pca955x_platform_data {
> @@ -408,6 +409,8 @@ static int pca955x_gpio_direction_output(struct gpio_chip *gc,
>   		fwnode_property_read_u32(child, "type", &pdata->leds[reg].type);
>   		fwnode_property_read_string(child, "linux,default-trigger",
>   					&pdata->leds[reg].default_trigger);
> +		fwnode_property_read_string(child, "default-state",
> +					&pdata->leds[reg].default_state);
>   	}
>   
>   	pdata->num_leds = chip->bits;
> @@ -520,8 +523,13 @@ static int pca955x_probe(struct i2c_client *client,
>   			if (err)
>   				return err;
>   
> -			/* Turn off LED */
> -			err = pca955x_led_set(&pca955x_led->led_cdev, LED_OFF);
> +			/* If the default-state is "keep", don't change states */
> +			if (strcmp(pdata->leds[i].default_state, "keep")) {
> +				if (!strcmp(pdata->leds[i].default_state, "on"))
> +					err = pca955x_led_set(&pca955x_led->led_cdev, LED_ON);
> +				else
> +					err = pca955x_led_set(&pca955x_led->led_cdev, LED_OFF);
> +			}
>   			if (err)
>   				return err;
>   		}
> —
> 1.8.3.1
> 
> 
> For `leds-gpio`, Andrew had put a patch, but I don’t see how that can be mapped to PCA955X. https://github.com/torvalds/linux/commit/f5808ac158f2b16b686a3d3c0879c5d6048aba14
> 
> Jacek,
> 
> Please could you help me here ?.. I need to express LEDs as PCA955X_TYPE_LED and also retain states post BMC reboot.

If in your setup the LED controller loses power on reboot then there
is nothing you can do to retain the state.

-- 
Best regards,
Jacek Anaszewski
