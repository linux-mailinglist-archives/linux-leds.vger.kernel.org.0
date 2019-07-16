Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A5C56AE7A
	for <lists+linux-leds@lfdr.de>; Tue, 16 Jul 2019 20:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728608AbfGPSVv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 16 Jul 2019 14:21:51 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35538 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728495AbfGPSVv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 16 Jul 2019 14:21:51 -0400
Received: by mail-wm1-f68.google.com with SMTP id l2so19631396wmg.0
        for <linux-leds@vger.kernel.org>; Tue, 16 Jul 2019 11:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fS85ZebmbHubPONnsInyUrNJ5VX2GB1vFSafZLiBe10=;
        b=AVS6BBgNeJYFTDKYpd8L7k3MeY7Gi3I9u+8hH35DtjTJsjIjDzqh4eO/FwiKJYeztl
         q6/v1bjypY+9vyB+z3CCggnSzH3XtzgDDETx/zPDNOWTxvfXH+MOUhc/mtGg0IuYnDDu
         Kz2grvVUP96VrI6QBgckngKYAL9V6/5NC2HNkVRZcISK6y+yqwxaYpfvp4GxcLAeEdq1
         e+uRP/Rbgw4hAEqp8QBFvmYQQL7sCSPXYXG2srdxUaP6Lk+dUSnySilvsoJo+1rabvC0
         g3RXl9BtnEe0t5elCF2PtERbs8UABCLELd6wvD5gXgIJyAOgD8G4BwnMmnvsJTcciPCT
         LV0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=fS85ZebmbHubPONnsInyUrNJ5VX2GB1vFSafZLiBe10=;
        b=YB1MfNfkaxP2vQ9+dNjJghiFeD5RDkLOhBlz/V0PVPf3fNXRnB53vPWIG11x2nlb0q
         aN83EJiRwxKueRJAt5+voiOhe08jEPGzK2wvE5P6mHho1sm8GlucE3bxODVlzZJbLCnR
         L6TCihbu+MShZkgR+NMLo5dJApJ3K5GwMAEHvqJ47Jvzf/WN/yE1ZbwplTV9RWSHgKOq
         GXVRizm+GkRYdmadD4uyOiwGMukvmso/p9/NC1zlK+Ksu3uOoKcf8yM2v2Xy2TsKtBO3
         9zGX5YNvyLk+akWDypjVVZZ9QaMMOjhv2+hYzHu73Rt7TGA43w+IHRZTFNgRIVYjsjp4
         KzwA==
X-Gm-Message-State: APjAAAV+SN/c1gL8PnmSPffKJPIfFzroOtVmeN7nxftGszSMv2383sWi
        qxet2GeEIJwVWrXpp1wOOormRKyj
X-Google-Smtp-Source: APXvYqxNn0bNnhJGEDKRCBnDGVFRCB2hCIQnvNZo0/FhRkVQFqJ6bvzq5QkE+vmggs/04fXQbmbndg==
X-Received: by 2002:a05:600c:2199:: with SMTP id e25mr30564121wme.72.1563301307833;
        Tue, 16 Jul 2019 11:21:47 -0700 (PDT)
Received: from [192.168.1.19] (chm81.neoplus.adsl.tpnet.pl. [83.31.10.81])
        by smtp.gmail.com with ESMTPSA id g12sm28044874wrv.9.2019.07.16.11.21.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jul 2019 11:21:47 -0700 (PDT)
Subject: Re: [PATCH v2] leds: ns2: Add of_node_put() before return
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>, pavel@ucw.cz,
        dmurphy@ti.com, linux-leds@vger.kernel.org
References: <20190716072424.14676-1-nishkadg.linux@gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 mQINBFWjfaEBEADd66EQbd6yd8YjG0kbEDT2QIkx8C7BqMXR8AdmA1OMApbfSvEZFT1D/ECR
 eWFBS8XtApKQx1xAs1j5z70k3zebk2eeNs5ahxi6vM4Qh89vBM46biSKeeX5fLcv7asmGb/a
 FnHPAfQaKFyG/Bj9V+//ef67hpjJWR3s74C6LZCFLcbZM0z/wTH+baA5Jwcnqr4h/ygosvhP
 X3gkRzJLSFYekmEv+WHieeKXLrJdsUPUvPJTZtvi3ELUxHNOZwX2oRJStWpmL2QGMwPokRNQ
 29GvnueQdQrIl2ylhul6TSrClMrKZqOajDFng7TLgvNfyVZE8WQwmrkTrdzBLfu3kScjE14Q
 Volq8OtQpTsw5570D4plVKh2ahlhrwXdneSot0STk9Dh1grEB/Jfw8dknvqkdjALUrrM45eF
 FM4FSMxIlNV8WxueHDss9vXRbCUxzGw37Ck9JWYo0EpcpcvwPf33yntYCbnt+RQRjv7vy3w5
 osVwRR4hpbL/fWt1AnZ+RvbP4kYSptOCPQ+Pp1tCw16BOaPjtlqSTcrlD2fo2IbaB5D21SUa
 IsdZ/XkD+V2S9jCrN1yyK2iKgxtDoUkWiqlfRgH2Ep1tZtb4NLF/S0oCr7rNLO7WbqLZQh1q
 ShfZR16h7YW//1/NFwnyCVaG1CP/L/io719dPWgEd/sVSKT2TwARAQABtC1KYWNlayBBbmFz
 emV3c2tpIDxqYWNlay5hbmFzemV3c2tpQGdtYWlsLmNvbT6JAj4EEwEIACgCGwMHCwkIBwMC
 AQYVCAIJCgsDFgIBAh4BAheABQJVo39tBQkJZgNMAAoJEL1qUBy3i3wmxLQQAK8QEQ0JqZEv
 5hrxiwT+Qtkx1TULYriK9sYcY9zbi18YxbKB0C4Znh5iP5o7k26WnPGLM+w4qWvTAkHjuAI7
 aBrvb4nGRvE5s14PQ9IHgL7iL3zAAHT1azIZng9dUCCSontB+vQZu1x/Un0lVlVCvsvO7QVt
 hAZUlT3iucNMO0jpCiS3raZkNfab8M+JWP/iplaV0Kn+O7LX3A/RdLmx5ZhuT+zvyHwl2c3K
 T56UHaQnjkuHB2Ytk8HtOjNXGNYnm4nLx3ok3jEN1nWDRV/DeiPn8zz4Zebsp686OH9vvX/0
 R4dk2YEjUCY/S7CbJxXzUnLjboUAGmtTVOu/uJ7y11iS9XEoJ09HEzijQwWctJXLojcTXCFw
 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
 eGGiEQ==
Message-ID: <e0a8de01-dc3d-04aa-9894-5dc0694b5a27@gmail.com>
Date:   Tue, 16 Jul 2019 20:21:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190716072424.14676-1-nishkadg.linux@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Nishka,

Thank you for the update.

On 7/16/19 9:24 AM, Nishka Dasgupta wrote:
> Each iteration of for_each_child_of_node puts the previous node, but in
> the case of a return from the middle of the loop, there is no put, thus
> causing a memory leak. Hence create a new label, err_node_put, that puts
> the previous node before returning the required value. Edit the mid-loop
> return sites to instead go to this new label.
> Issue found with Coccinelle.
> 
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> ---
> Changes in v2:
> - Put the of_node_put statement under a label instead of at each return
>   site.
> - Modify subject line to reflect previous patches on this driver.
> 
>  drivers/leds/leds-ns2.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
> index f92e2c07c1c6..83cdce0f801a 100644
> --- a/drivers/leds/leds-ns2.c
> +++ b/drivers/leds/leds-ns2.c
> @@ -264,11 +264,11 @@ ns2_leds_get_of_pdata(struct device *dev, struct ns2_led_platform_data *pdata)
>  
>  		ret = of_get_named_gpio(child, "cmd-gpio", 0);
>  		if (ret < 0)
> -			return ret;
> +			goto err_node_put;
>  		led->cmd = ret;
>  		ret = of_get_named_gpio(child, "slow-gpio", 0);
>  		if (ret < 0)
> -			return ret;
> +			goto err_node_put;
>  		led->slow = ret;
>  		ret = of_property_read_string(child, "label", &string);
>  		led->name = (ret == 0) ? string : child->name;
> @@ -281,7 +281,8 @@ ns2_leds_get_of_pdata(struct device *dev, struct ns2_led_platform_data *pdata)
>  		if (ret < 0 || ret % 3) {
>  			dev_err(dev,
>  				"Missing or malformed modes-map property\n");
> -			return -EINVAL;
> +			ret = -EINVAL;
> +			goto err_node_put;
>  		}
>  
>  		num_modes = ret / 3;
> @@ -289,8 +290,10 @@ ns2_leds_get_of_pdata(struct device *dev, struct ns2_led_platform_data *pdata)
>  				      num_modes,
>  				      sizeof(struct ns2_led_modval),
>  				      GFP_KERNEL);
> -		if (!modval)
> -			return -ENOMEM;
> +		if (!modval) {
> +			ret = -ENOMEM;
> +			goto err_node_put;
> +		}
>  
>  		for (i = 0; i < num_modes; i++) {
>  			of_property_read_u32_index(child,
> @@ -314,6 +317,10 @@ ns2_leds_get_of_pdata(struct device *dev, struct ns2_led_platform_data *pdata)
>  	pdata->num_leds = num_leds;
>  
>  	return 0;
> +
> +err_node_put:
> +	of_node_put(child);
> +	return ret;

Now we're getting build break here since ret is declared only
inside the loop. I moved ret declaration to the top of the function
and applied. Thanks.

>  }
>  
>  static const struct of_device_id of_ns2_leds_match[] = {
>
-- 
Best regards,
Jacek Anaszewski
