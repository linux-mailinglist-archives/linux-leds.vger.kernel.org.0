Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67249CD1D6
	for <lists+linux-leds@lfdr.de>; Sun,  6 Oct 2019 14:15:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbfJFMPT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 6 Oct 2019 08:15:19 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39982 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbfJFMPT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 6 Oct 2019 08:15:19 -0400
Received: by mail-wm1-f68.google.com with SMTP id b24so9725470wmj.5;
        Sun, 06 Oct 2019 05:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pMNtj0xWdSr/L7LEo9NFAqgA3Kj7BJOewxFa0H9a3fY=;
        b=pmXgrAO0oKnUktt3l/XCF/iRnC0EfKJ59j+Ir8r9mE99Q/zi6hSUrdpvAQiDaA9mTP
         6wvMbPILir+cymSql3/Sf56n2mCP+f7KQ1JS3eXCHYNzd6ulfeLv3Cie3tecuGO3R8ar
         ZqRDJYElESaSVO2x5DIjPEu34/dbxyekwkmXBXCbdLZAXr85+pnjumiygUiAMu5wj4IV
         P2t3DaTeSqWKlmgW7zgLpvpaofxy4PAbrP2mVtdiWkjrqjdG9BX0FXcF0iQ2YSr/hVUU
         Ez8QkivNV6MNgeAY/Rkxd0vJIyximvUtGgVy+K/yDIFnHTWBVZ/xjBUuwPuryeL/DEQj
         vXGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=pMNtj0xWdSr/L7LEo9NFAqgA3Kj7BJOewxFa0H9a3fY=;
        b=Brl28YaHpsQ1knsktoa7w6QqxYGItJxudfewhm61B+zVWEqHHhcQI0CVUqS67xW9cg
         Ih5o6+JIZs3pQ8/F6p19Ki1xQjh4VG+GfCMbPcgzVSVvoFYpO9UB5cVcR4+hHxeRdgH5
         YNqqblTuEGgu6b/98KUB+SFwWwd+FIHMa4xgBbDfVKRXlbqHc3iK2G6vWkekpkmNMNhB
         SRYXcQ5wfyLjYMdCeqd6PP7zQgAN1tm501BNLNM5mWYAPO2YUIHo3du3B9HAS4XvS3cN
         HSqNzcMtU2MS5IO7gWFeOMJZYJ0uHbzyK5gwSW/9jxo/RjnR3l3bjYs2FZtUk4G//NY7
         RlkQ==
X-Gm-Message-State: APjAAAWyRJvT3Xz/VlcXSjrRI9LvBsxox4pewFp5s97OHWlV5pBGJsIB
        GltdOL3M+PnIx9C6U7AbDaM6ww7k
X-Google-Smtp-Source: APXvYqz/Q/osfeGL5sGtu6Jz5LsLzSokIF5kg45lh3Z9SmeplvwZbGPPjT6ENUywZNpTnfrjIoJEFA==
X-Received: by 2002:a1c:48c6:: with SMTP id v189mr11540307wma.20.1570364115055;
        Sun, 06 Oct 2019 05:15:15 -0700 (PDT)
Received: from [192.168.1.19] (bgw69.neoplus.adsl.tpnet.pl. [83.28.86.69])
        by smtp.gmail.com with ESMTPSA id h7sm11756103wrt.17.2019.10.06.05.15.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Oct 2019 05:15:14 -0700 (PDT)
Subject: Re: [PATCH 01/10] leds: pca953x: Use of_device_get_match_data()
To:     Stephen Boyd <swboyd@chromium.org>, linux-kernel@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Riku Voipio <riku.voipio@iki.fi>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org
References: <20191004214334.149976-1-swboyd@chromium.org>
 <20191004214334.149976-2-swboyd@chromium.org>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <cf0b3a41-208a-79b8-745f-80cc3c4af664@gmail.com>
Date:   Sun, 6 Oct 2019 14:15:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191004214334.149976-2-swboyd@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 10/4/19 11:43 PM, Stephen Boyd wrote:
> This driver can use the of_device_get_match_data() API to simplify the
> code. Replace calls to of_match_device() with this newer API under the
> assumption that where it is called will be when we know the device is
> backed by a DT node. This nicely avoids referencing the match table when
> it is undefined with configurations where CONFIG_OF=n.
> 
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Riku Voipio <riku.voipio@iki.fi>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Dan Murphy <dmurphy@ti.com>
> Cc: <linux-leds@vger.kernel.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
> 
> Please ack or pick for immediate merge so the last patch can be merged.
> 
>  drivers/leds/leds-pca9532.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
> index c7c7199e8ebd..7d515d5e57bd 100644
> --- a/drivers/leds/leds-pca9532.c
> +++ b/drivers/leds/leds-pca9532.c
> @@ -467,16 +467,11 @@ pca9532_of_populate_pdata(struct device *dev, struct device_node *np)
>  {
>  	struct pca9532_platform_data *pdata;
>  	struct device_node *child;
> -	const struct of_device_id *match;
>  	int devid, maxleds;
>  	int i = 0;
>  	const char *state;
>  
> -	match = of_match_device(of_pca9532_leds_match, dev);
> -	if (!match)
> -		return ERR_PTR(-ENODEV);
> -
> -	devid = (int)(uintptr_t)match->data;
> +	devid = (int)(uintptr_t)of_device_get_match_data(dev);
>  	maxleds = pca9532_chip_info_tbl[devid].num_leds;
>  
>  	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
> @@ -509,7 +504,6 @@ static int pca9532_probe(struct i2c_client *client,
>  	const struct i2c_device_id *id)
>  {
>  	int devid;
> -	const struct of_device_id *of_id;
>  	struct pca9532_data *data = i2c_get_clientdata(client);
>  	struct pca9532_platform_data *pca9532_pdata =
>  			dev_get_platdata(&client->dev);
> @@ -525,11 +519,7 @@ static int pca9532_probe(struct i2c_client *client,
>  			dev_err(&client->dev, "no platform data\n");
>  			return -EINVAL;
>  		}
> -		of_id = of_match_device(of_pca9532_leds_match,
> -				&client->dev);
> -		if (unlikely(!of_id))
> -			return -EINVAL;
> -		devid = (int)(uintptr_t) of_id->data;
> +		devid = (int)(uintptr_t)of_device_get_match_data(&client->dev);
>  	} else {
>  		devid = id->driver_data;
>  	}
> 

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski
