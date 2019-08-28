Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60BE2A0B8E
	for <lists+linux-leds@lfdr.de>; Wed, 28 Aug 2019 22:33:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726400AbfH1UdD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 28 Aug 2019 16:33:03 -0400
Received: from mail-wr1-f47.google.com ([209.85.221.47]:41813 "EHLO
        mail-wr1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726618AbfH1UdD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 28 Aug 2019 16:33:03 -0400
Received: by mail-wr1-f47.google.com with SMTP id j16so1100897wrr.8;
        Wed, 28 Aug 2019 13:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TISg0muwB2M2Jy6luhj9/zvgyEU+woHzKtCqNGSYKTI=;
        b=HcqbNyQHmf9ViGyfpvW68rz0SbDibwmKr1gY8yiqrYO3eiX4GhflOkCrC+KPqa4WZv
         pJL+rIGRl2PU5cPMi6Vb1NO+HM2r7LovMxl2szuj0r3yCgVxe+/bJgMzInpWC4d86daw
         5+HRlzoCXTCufoaIxlPQ7Frgnyo2/G3CNrpxSlgUdXEItJZUeu0ScGBUwxlL2EONU8Gg
         lmtbEmOquEZA4BgC6VJhW4WVjDQiFyxK1GPcwQ4TbUoZGLZY5P4MHODolXYgrLGpLAVK
         MfvswrouRzYta1BonQCK5ZCvtBOzdIQG68HNTwjtzQDFxVSIdmv3sRY+2ijtpqCAQu6R
         YsDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=TISg0muwB2M2Jy6luhj9/zvgyEU+woHzKtCqNGSYKTI=;
        b=H2Ik5Q5ctAvR9RuOL1xikvXHFi7tIArlpLGmXIlkF7eE16vXCQN2TjsPI23sDft6+h
         HZc81J+wtd1BIE+c2NERyijTpTOyYRte7/oj+dz740IS5fmMiVyCft+2tlLDfKVRB6ZD
         dkNNQ0u2EWYXWV0xQYKEZwb2HggU6EadHO34dZQ/5BrYEBf9vIjvv5I3XjpLBfW6pAhx
         RF2AgtyVDGGaTCX31PgcgZzC/ZQvdetDl9flqdz7lSy8NjIqsJdWTKZh3wgTcEKvrArg
         tt02pD9B7/GHn5tHTiJ43SQ+G9TuBWgp9c0xMg8c7AkjJB5dJy3pkYBU5TEcFM6s8DDG
         xwDw==
X-Gm-Message-State: APjAAAUeziV8l0QXP58KU3pdjdTEMxJXnl/p51FEMysjTIMeMtl1al6P
        Apw3wmh3FIwp8uALVP8ui7KeaYti
X-Google-Smtp-Source: APXvYqyI1O5W8Pflp/nPGRoUDkiOrgSPDd4wiXnnJf55xe7Nv0V2q7lqo7IIPndE/pqnQiUOa2MRPA==
X-Received: by 2002:adf:9043:: with SMTP id h61mr6838369wrh.247.1567024379945;
        Wed, 28 Aug 2019 13:32:59 -0700 (PDT)
Received: from [192.168.1.19] (chg13.neoplus.adsl.tpnet.pl. [83.31.4.13])
        by smtp.gmail.com with ESMTPSA id p11sm334335wrx.9.2019.08.28.13.32.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Aug 2019 13:32:59 -0700 (PDT)
Subject: Re: [FYI] lm3532: right registration to work with LED-backlight
To:     Pavel Machek <pavel@ucw.cz>, Tony Lindgren <tony@atomide.com>,
        kernel list <linux-kernel@vger.kernel.org>, sre@kernel.org,
        nekit1000@gmail.com, mpartap@gmx.net, merlijn@wizzup.org
Cc:     Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org
References: <20190827215205.59677-1-tony@atomide.com>
 <20190828085339.GB2923@amd>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <c3ac1863-9cdb-1ba6-d5a4-df1c4cfecbe1@gmail.com>
Date:   Wed, 28 Aug 2019 22:32:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190828085339.GB2923@amd>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 8/28/19 10:53 AM, Pavel Machek wrote:
> Hi!
> 
> Eventually, these will be needed.
> 
> Best regards,
> 								Pavel
> 
> commit 38d956977a7d6cbdc811676f9b4033da7487e045
> Author: Pavel <pavel@ucw.cz>
> Date:   Wed Aug 7 12:43:52 2019 +0200
> 
>     d4: lm3532 needs to use right register function for backlight to work.
> 
> diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
> index 365a22a5..f98e657 100644
> --- a/drivers/leds/leds-lm3532.c
> +++ b/drivers/leds/leds-lm3532.c
> @@ -629,7 +629,7 @@ static int lm3532_parse_node(struct lm3532_data *priv)
>  
>  		lm3532_init_registers(led);
>  
> -		ret = devm_led_classdev_register(priv->dev, &led->led_dev);
> +		ret = devm_of_led_classdev_register(priv->dev, to_of_node(child), &led->led_dev);

We no longer have devm_of_led_classdev_register(). You must use
devm_led_classdev_register_ext().

-- 
Best regards,
Jacek Anaszewski
