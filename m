Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52A0A793AB
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jul 2019 21:20:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729358AbfG2TUa (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 29 Jul 2019 15:20:30 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39250 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728914AbfG2TUa (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 29 Jul 2019 15:20:30 -0400
Received: by mail-wr1-f65.google.com with SMTP id x4so9904223wrt.6
        for <linux-leds@vger.kernel.org>; Mon, 29 Jul 2019 12:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/gTEEkJSHfF6Cw8eknDeEHw6b5wSmEGKAtIjbED1iFE=;
        b=RmGQHpXmPJlvKlG2ewWmGGVI0iHE2w8KFtKJCo25OrWiWT8q+RUGaxZUCbrlkcyqQe
         kQf0t7qLGu6X+qM+NbP2lkN9dg7dSKrGPaCHrRRnQppVLUWjJ0Txh/rENaL2cW6HK5L/
         4Ii4Ls4YuzacycJ8gsVNCZej7sJr/VefmKzp1STmy2FN+DM3rVlPaMbJYEZs3RL4vrFs
         6ojHhNFChL/plpIk5qt1HMxoUEKqTpffGJdiHCIiEE+aoCrs0G0QpfCIO9Sf9OGcx3md
         du54pjolRdc2rRjEOAWLDP7RnQC4oBI78bTuP/BAbGsCSQnVNRWeRXvN9G4OVvK/9w6J
         5u7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=/gTEEkJSHfF6Cw8eknDeEHw6b5wSmEGKAtIjbED1iFE=;
        b=BRCKSi6OPfIQajSaHEI/EsnGBwqLzUr+FFIrI9hX86anks7kwWo3exeevpghNfwFwY
         fOquTgAkW0GCeg3hPrJjUiaNxqp+HvUCTWomsk9gob+akrmpxcNAQs71XsZiTP+dTjIe
         me8Uaf6G4KoeDnKmFAGC75cYQejc3jzYGEswgFlTzLV9xg+xjsfI6Q3VloM65Jmg1r9K
         gcZ/5Jv8oNUik/AE74kslwpTN8Y8Mw7qpTW2Ap/ypSmfZOJX819OSZvz9mg5rEDLR2mM
         slIOu8tTJpBbEhtRamspDO7hvJGp5+NlMOJfKxZiOk/Go+1m/DMD8/Jw0fIyHd31KGxR
         8ZHQ==
X-Gm-Message-State: APjAAAWrz2uJ/ePhiNbsshmreRb4txV1m34LFid9gMDunRc+9TxtMEuI
        dOrg+H/g1V8wmcw3JE8zFqURkYKg
X-Google-Smtp-Source: APXvYqxV0PFWLNHj3Iks2wdfWeBm1ieIRfuHqB6m+EEy5MhW6migjbtmQ/mRTNQweMoETwo3RN4EhA==
X-Received: by 2002:adf:f050:: with SMTP id t16mr114872982wro.99.1564428027320;
        Mon, 29 Jul 2019 12:20:27 -0700 (PDT)
Received: from [192.168.1.19] (civ151.neoplus.adsl.tpnet.pl. [83.31.45.151])
        by smtp.gmail.com with ESMTPSA id r11sm95231416wre.14.2019.07.29.12.20.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 12:20:26 -0700 (PDT)
Subject: Re: [PATCH] leds: netxbig: Add of_node_put() in
 netxbig_leds_get_of_pdata()
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>, pavel@ucw.cz,
        dmurphy@ti.com, linux-leds@vger.kernel.org
References: <20190729065356.26793-1-nishkadg.linux@gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <f7fb173a-be50-da46-1aa0-5ec24515e2df@gmail.com>
Date:   Mon, 29 Jul 2019 21:20:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190729065356.26793-1-nishkadg.linux@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Nishka,

Thank you for the patch.

On 7/29/19 8:53 AM, Nishka Dasgupta wrote:
> The variable gpio_ext_np in the function netxbig_leds_get_of_pdata takes
> the value returned by of_parse_phandle; hence, it must be put in order
> to prevent a memory leak. Add an of_node_put for gpio_ext_np before a
> return statement, and move a pre-existing of_node_put statement to right
> after the last usage of this variable.
> Issue found with Coccinelle.
> 
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> ---
>  drivers/leds/leds-netxbig.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/leds-netxbig.c b/drivers/leds/leds-netxbig.c
> index 10497a466775..654d83bbc450 100644
> --- a/drivers/leds/leds-netxbig.c
> +++ b/drivers/leds/leds-netxbig.c
> @@ -388,12 +388,14 @@ static int netxbig_leds_get_of_pdata(struct device *dev,
>  	}
>  
>  	gpio_ext = devm_kzalloc(dev, sizeof(*gpio_ext), GFP_KERNEL);
> -	if (!gpio_ext)
> +	if (!gpio_ext) {
> +		of_node_put(gpio_ext_np);
>  		return -ENOMEM;
> +	}
>  	ret = gpio_ext_get_of_pdata(dev, gpio_ext_np, gpio_ext);
> +	of_node_put(gpio_ext_np);
>  	if (ret)
>  		return ret;
> -	of_node_put(gpio_ext_np);
>  	pdata->gpio_ext = gpio_ext;
>  
>  	/* Timers (optional) */
> 

Applied.

-- 
Best regards,
Jacek Anaszewski
