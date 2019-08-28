Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BEC9A0B5E
	for <lists+linux-leds@lfdr.de>; Wed, 28 Aug 2019 22:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbfH1U1b (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 28 Aug 2019 16:27:31 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54034 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726616AbfH1U1b (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 28 Aug 2019 16:27:31 -0400
Received: by mail-wm1-f66.google.com with SMTP id 10so1382342wmp.3;
        Wed, 28 Aug 2019 13:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8AsJc4UlRTuvAjTir+XVFURhWb+KIva3JiHoLaMnkHc=;
        b=iOUDbkM81Th1s30W9wVUBdpnq6Cva62RKTn5QCAvGTJNTKq+4pAKmxA110xDO+lFyt
         77H6ckIzvsbRu/y9N4ZYjFfQTTol/4FsnvvKrlbL9oaMoFe15SauHBhmfXhNnhGCNJtG
         l136sfg7qnczALv4nTfSxe7Ei/BY1k5ltC+ORGjIBhcLbZ999j1IKewfBLESwHF4LAlO
         0ovj7oQezntR5Dn0VId/sd7XhAwvejEHiWE2toRiJOvZQ597e1yd/reI/nweWqyY5wU9
         JIXgARH2JP04PyvfB6S4Zbv+uiuf92LgJGiu7I9H7JWS7x9PgPZ+YbvN/mHkhwSN72Ft
         pZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=8AsJc4UlRTuvAjTir+XVFURhWb+KIva3JiHoLaMnkHc=;
        b=UoohuiZNTEUUJBfXr8yWLOonSAm+NyBRdt5YJOZsFyILjzCX34+Ctwjh3v0smLDC7Y
         oWa37qclyLZt2mwKniPl/0Q5doeDYYoMYfOacT4s/cJ4jqtOJbCBEMKmX/LzpGnxfiTJ
         OHBXe/8WUZhkUJz2tkDSKrnP1Lvns7SRTD0RCRca7lzFtxXB9ixH9G9rF40PDAMDaqrN
         82f8ECR8UBcvtQ+GQ6CdFU1NTShaUyHOldjXy3JQta3kTBKWEJm1kszXq23pRXosHXUh
         9yHOgA47uuGcj47CpajZujT4XVVJNgPduEY16aRq5D3NEsLdvf01a53SNcfCTChxZt3B
         ZCrQ==
X-Gm-Message-State: APjAAAU65xFpJ/WyBB+wgU76Fwv2nGhm91PSHAhWr3kxowLQ/OENFutn
        2xoHGWMXjphtLGbAZNipPiCNlqJW
X-Google-Smtp-Source: APXvYqzYOTWEwE3pLwY0ZXi6VrM7p54jYNJEXU6qMwVAMZY8RXIrOjqo2BM2VlqRLgLXWeHYbhjlXg==
X-Received: by 2002:a1c:2dcf:: with SMTP id t198mr6624089wmt.147.1567024047579;
        Wed, 28 Aug 2019 13:27:27 -0700 (PDT)
Received: from [192.168.1.19] (chg13.neoplus.adsl.tpnet.pl. [83.31.4.13])
        by smtp.gmail.com with ESMTPSA id n14sm428473wra.75.2019.08.28.13.27.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Aug 2019 13:27:26 -0700 (PDT)
Subject: Re: [PATCH v2] leds: ti-lmu-common: Fix coccinelle issue in TI LMU
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190828152219.27640-1-dmurphy@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <3c0d26f7-52db-d0ff-e2cf-0dcc15edc67b@gmail.com>
Date:   Wed, 28 Aug 2019 22:27:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190828152219.27640-1-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Dan,

Thank you for the update.

On 8/28/19 5:22 PM, Dan Murphy wrote:
> Fix the coccinelle issues found in the TI LMU common code
> 
> drivers/leds/leds-ti-lmu-common.c:97:20-29: WARNING: Unsigned expression compared with zero: ramp_down < 0
> drivers/leds/leds-ti-lmu-common.c:97:5-12: WARNING: Unsigned expression compared with zero: ramp_up < 0
> 
> Fixes: f717460ba4d7 ("leds: TI LMU: Add common code for TI LMU devices")
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  drivers/leds/leds-ti-lmu-common.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/leds/leds-ti-lmu-common.c b/drivers/leds/leds-ti-lmu-common.c
> index adc7293004f1..e294a0b097e3 100644
> --- a/drivers/leds/leds-ti-lmu-common.c
> +++ b/drivers/leds/leds-ti-lmu-common.c
> @@ -11,10 +11,10 @@
>  
>  #include <linux/leds-ti-lmu-common.h>
>  
> -const static int ramp_table[16] = {2048, 262000, 524000, 1049000, 2090000,
> -				4194000, 8389000, 16780000, 33550000, 41940000,
> -				50330000, 58720000, 67110000, 83880000,
> -				100660000, 117440000};
> +const static unsigned int ramp_table[16] = {2048, 262000, 524000, 1049000,
> +				2090000, 4194000, 8389000, 16780000, 33550000,
> +				41940000, 50330000, 58720000, 67110000,
> +				83880000, 100660000, 117440000};
>  
>  static int ti_lmu_common_update_brightness(struct ti_lmu_bank *lmu_bank,
>  					   int brightness)
> @@ -54,7 +54,7 @@ int ti_lmu_common_set_brightness(struct ti_lmu_bank *lmu_bank, int brightness)
>  }
>  EXPORT_SYMBOL(ti_lmu_common_set_brightness);
>  
> -static int ti_lmu_common_convert_ramp_to_index(unsigned int usec)
> +static unsigned int ti_lmu_common_convert_ramp_to_index(unsigned int usec)
>  {
>  	int size = ARRAY_SIZE(ramp_table);
>  	int i;
> @@ -78,7 +78,7 @@ static int ti_lmu_common_convert_ramp_to_index(unsigned int usec)
>  		}
>  	}
>  
> -	return -EINVAL;
> +	return 0;
>  }
>  
>  int ti_lmu_common_set_ramp(struct ti_lmu_bank *lmu_bank)
> @@ -94,9 +94,6 @@ int ti_lmu_common_set_ramp(struct ti_lmu_bank *lmu_bank)
>  		ramp_down = ti_lmu_common_convert_ramp_to_index(lmu_bank->ramp_down_usec);
>  	}
>  
> -	if (ramp_up < 0 || ramp_down < 0)
> -		return -EINVAL;
> -
>  	ramp = (ramp_up << 4) | ramp_down;
>  
>  	return regmap_write(regmap, lmu_bank->runtime_ramp_reg, ramp);
> 

I've applied the patch but amended SHA1 in the Fixes tag - in mainline
it is 3fce8e1eb994.

-- 
Best regards,
Jacek Anaszewski
