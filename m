Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED5070A76
	for <lists+linux-leds@lfdr.de>; Mon, 22 Jul 2019 22:14:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729978AbfGVUN7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 22 Jul 2019 16:13:59 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39743 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729331AbfGVUN6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 22 Jul 2019 16:13:58 -0400
Received: by mail-wr1-f66.google.com with SMTP id x4so40675144wrt.6;
        Mon, 22 Jul 2019 13:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xbLtMMRGzNmbRKafAK7uzwBCFfuAVfrgmxskwqG2DoY=;
        b=OZYQz0N3hEjjFCvtuiJcFs7IZu+Bd0WYuSVbxbjsOmK2wIuYNey5mT6gN6y4Qh5Qfr
         msjkqN1Qbwh8AWEF/fuFE0d5FGEIAaca6VoubF4ZB5YuD1Luohv702ckVCmEjQ7k/Rii
         yGTcZMTBNUNmfCPTR4hYoZ2WUKJvvGsInJrKG34tU6Jhm7sDEGM88e8celJg7S5UGZwB
         Y4Fw5pSg4uqfUnsJwI8Bf12RNH6tkUuOdeLmjPacHgbWj6VBXAD5prnzQb/kO4KQ6GN7
         DhGdB0Dj3Za2LrK6aPNIFIXc5U/x8/npQd4S0nUmeAT1XsAU/0yMk9i5qOx4Yb4oiOMN
         iRCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=xbLtMMRGzNmbRKafAK7uzwBCFfuAVfrgmxskwqG2DoY=;
        b=RW0LbXC5UCEPKPBehAI5YWsw0MIqYHMCdCTJ5nsPJlJYyY4xeMcL6y1WdB1urLU9Tk
         r+5+Yx7LZyB1yaq/QxFPYFcp0o7VL0KxLUhswf9cgu0LZvm0h6SD1FpyoS51bSjoG2vq
         8EO/N7squ4u8DlByec3fKb6inzxzzt6i36WDBAGEBN/fJB7TV17EOCP/25KF/K3gdR30
         r6spg2acT4bY2QuR99sfKOX8GBbfbpQpSnE4KG7Npo+FhGgCwiyQ6yzRhdVvLZm7Xojf
         LErYYREA0G4xdrVdATmOMxwb/2xVNMXvzRzQ/DaZX5E4r63ZyzbxFRlIfcB9he+aBSPV
         tOlw==
X-Gm-Message-State: APjAAAUzU7+QF/T+KvEXbF20Yhhmmnl8pTkHHaAlX7eMHWhnIHBryMRg
        YApRGhSyQVRgdvlComl+Ezs4btsH
X-Google-Smtp-Source: APXvYqzBur3VV5Dvp7bRQEU1kRtK0LxA0pr8WJfJpaF0Kvo5/xUb7jY69N4owWRpPXiWnIXzh8VkAA==
X-Received: by 2002:a5d:54c7:: with SMTP id x7mr47064264wrv.39.1563826435717;
        Mon, 22 Jul 2019 13:13:55 -0700 (PDT)
Received: from [192.168.1.19] (chg44.neoplus.adsl.tpnet.pl. [83.31.4.44])
        by smtp.gmail.com with ESMTPSA id y12sm18814142wru.30.2019.07.22.13.13.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 13:13:55 -0700 (PDT)
Subject: Re: [PATCH] leds: ktd2692: Fix a typo in the name of a constant
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>, pavel@ucw.cz,
        dmurphy@ti.com
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20190721210539.25669-1-christophe.jaillet@wanadoo.fr>
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
Message-ID: <b3d0d746-5f3f-77ae-428c-001e242c9a8d@gmail.com>
Date:   Mon, 22 Jul 2019 22:13:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190721210539.25669-1-christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Christophe,

Thank you for the patch.

On 7/21/19 11:05 PM, Christophe JAILLET wrote:
> There is a typo in KTD2962_MM_MIN_CURR_THRESHOLD_SCALE. 6 and 9 are
> switched in 2962.
> 
> Define and use KTD2692_MM_MIN_CURR_THRESHOLD_SCALE instead.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/leds/leds-ktd2692.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/leds-ktd2692.c b/drivers/leds/leds-ktd2692.c
> index 45296aaca9da..44db748c570e 100644
> --- a/drivers/leds/leds-ktd2692.c
> +++ b/drivers/leds/leds-ktd2692.c
> @@ -22,7 +22,7 @@
>  /* Value related the movie mode */
>  #define KTD2692_MOVIE_MODE_CURRENT_LEVELS	16
>  #define KTD2692_MM_TO_FL_RATIO(x)		((x) / 3)
> -#define KTD2962_MM_MIN_CURR_THRESHOLD_SCALE	8
> +#define KTD2692_MM_MIN_CURR_THRESHOLD_SCALE	8
>  
>  /* Value related the flash mode */
>  #define KTD2692_FLASH_MODE_TIMEOUT_LEVELS	8
> @@ -253,7 +253,7 @@ static void ktd2692_setup(struct ktd2692_context *led)
>  	ktd2692_expresswire_reset(led);
>  	gpiod_direction_output(led->aux_gpio, KTD2692_LOW);
>  
> -	ktd2692_expresswire_write(led, (KTD2962_MM_MIN_CURR_THRESHOLD_SCALE - 1)
> +	ktd2692_expresswire_write(led, (KTD2692_MM_MIN_CURR_THRESHOLD_SCALE - 1)
>  				 | KTD2692_REG_MM_MIN_CURR_THRESHOLD_BASE);
>  	ktd2692_expresswire_write(led, KTD2692_FLASH_MODE_CURR_PERCENT(45)
>  				 | KTD2692_REG_FLASH_CURRENT_BASE);
> 

Applied.

-- 
Best regards,
Jacek Anaszewski
