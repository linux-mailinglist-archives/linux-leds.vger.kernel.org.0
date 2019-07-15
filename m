Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5316769BCA
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jul 2019 21:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730858AbfGOT6K (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 15 Jul 2019 15:58:10 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40756 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729525AbfGOT6K (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 15 Jul 2019 15:58:10 -0400
Received: by mail-wm1-f68.google.com with SMTP id v19so16405927wmj.5
        for <linux-leds@vger.kernel.org>; Mon, 15 Jul 2019 12:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6VH9w7tQbs8E00U9+8JTQGfNgqOyFOMlG7h+fDX0+2c=;
        b=E7glft32cIYs98XHfot7KQw32OyRNMl930css0BmNdF/iYd+IviXDEiP2wuur8rswt
         2Ro0wYlT9mD7bMFFPIdC7RU2JM95Nz6as5c61h25MjoCLjGUBD9Fp9nDV1xUmtpz8sww
         K21hhtr0jYCAk51kAyjlO2Zy2bRG5374Tf0lKtcLKLp8n7WXJtZLi7B0usDfBbb0fHc0
         2/17PbYNyLb6sdnjEvTmH5oGKTBjDVfo3fTDWcKcTTLxiXdcPZTVZ5agksoKAiOuJVEG
         RlWgNHWcTrRZGmsPv/i4fClTkxR5WNAF29AJx2VVVQ3Z8XEf4zdfm6zJ6cQ86vJ/8ZWy
         WuMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=6VH9w7tQbs8E00U9+8JTQGfNgqOyFOMlG7h+fDX0+2c=;
        b=eVuEpiEsyxbzwiXJdSRHM4XlRJhfZ7BiwHvHhzWsHJICIN2+kb1+vWgZoz6Wmgu4uM
         0EdhW8t076BZipjczmSjyGrGOehrIGD9wUWASUXEANZbAoDd8HdUpBow8Kl9pD8eCMN7
         KhB+pNfDulVKRgiFyJUs9urkp55Q+by7V+BIcOsJyIXm01YijGJEs5F7EOiosahGHRCS
         4kbfb7QybEZ/Lff3peWKrUocLcn0NjFL1u4tPYGRxwZoRYOXTLr8lQO6l1v0DvAjnLj8
         dTXOAXnUlz0D+JvLkPWRb0UP/PSOBWHX5WiqdheVpSr0+aq7oU67nBO9yHmVl4/3a/qX
         KLvw==
X-Gm-Message-State: APjAAAUQ3yBtJTpHhDtPOE5IwwWk369TwSOL/AwnZE0l6pV5yEPkS+/I
        vapcB9qk4qHYVcsuP3eKbbGgYNcSKeM=
X-Google-Smtp-Source: APXvYqwEuku/kYLAKeTKf4WZYOBc1X/VYyy90m8MNqRQV9H0Vy8RYqqlca8vCIuvkm2RGBsN+V1b5w==
X-Received: by 2002:a7b:cc86:: with SMTP id p6mr24049584wma.123.1563220687411;
        Mon, 15 Jul 2019 12:58:07 -0700 (PDT)
Received: from [192.168.1.19] (chk118.neoplus.adsl.tpnet.pl. [83.31.8.118])
        by smtp.gmail.com with ESMTPSA id p6sm17138253wrq.97.2019.07.15.12.58.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Jul 2019 12:58:06 -0700 (PDT)
Subject: Re: [PATCH] leds: leds-ns2: Add of_node_put() before return
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>, pavel@ucw.cz,
        dmurphy@ti.com, linux-leds@vger.kernel.org
References: <20190709173420.13949-1-nishkadg.linux@gmail.com>
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
Message-ID: <39a3ae6b-a8e6-b50a-c5cb-3e00bd3a4d03@gmail.com>
Date:   Mon, 15 Jul 2019 21:58:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190709173420.13949-1-nishkadg.linux@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Nishka,

Thank you for the patch.

Please apply err_node_put scheme similarly like you've already
done that for leds-max77650.

Best regards,
Jacek Anaszewski

On 7/9/19 7:34 PM, Nishka Dasgupta wrote:
> Each iteration of for_each_child_of_node puts the previous node, but in
> the case of a return from the middle of the loop, there is no put, thus
> causing a memory leak. Hence add an of_node_put before the return in
> four places.
> Issue found with Coccinelle.
> 
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> ---
>  drivers/leds/leds-ns2.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
> index f92e2c07c1c6..6e47c21ef1c4 100644
> --- a/drivers/leds/leds-ns2.c
> +++ b/drivers/leds/leds-ns2.c
> @@ -263,12 +263,16 @@ ns2_leds_get_of_pdata(struct device *dev, struct ns2_led_platform_data *pdata)
>  		struct ns2_led_modval *modval;
>  
>  		ret = of_get_named_gpio(child, "cmd-gpio", 0);
> -		if (ret < 0)
> +		if (ret < 0) {
> +			of_node_put(child);
>  			return ret;
> +		}
>  		led->cmd = ret;
>  		ret = of_get_named_gpio(child, "slow-gpio", 0);
> -		if (ret < 0)
> +		if (ret < 0) {
> +			of_node_put(child);
>  			return ret;
> +		}
>  		led->slow = ret;
>  		ret = of_property_read_string(child, "label", &string);
>  		led->name = (ret == 0) ? string : child->name;
> @@ -281,6 +285,7 @@ ns2_leds_get_of_pdata(struct device *dev, struct ns2_led_platform_data *pdata)
>  		if (ret < 0 || ret % 3) {
>  			dev_err(dev,
>  				"Missing or malformed modes-map property\n");
> +			of_node_put(child);
>  			return -EINVAL;
>  		}
>  
> @@ -289,8 +294,10 @@ ns2_leds_get_of_pdata(struct device *dev, struct ns2_led_platform_data *pdata)
>  				      num_modes,
>  				      sizeof(struct ns2_led_modval),
>  				      GFP_KERNEL);
> -		if (!modval)
> +		if (!modval) {
> +			of_node_put(child);
>  			return -ENOMEM;
> +		}
>  
>  		for (i = 0; i < num_modes; i++) {
>  			of_property_read_u32_index(child,
> 



