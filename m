Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D41110237
	for <lists+linux-leds@lfdr.de>; Wed,  1 May 2019 00:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726123AbfD3WIg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 30 Apr 2019 18:08:36 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55907 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbfD3WIg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 30 Apr 2019 18:08:36 -0400
Received: by mail-wm1-f65.google.com with SMTP id o25so5433529wmf.5
        for <linux-leds@vger.kernel.org>; Tue, 30 Apr 2019 15:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wZ21DOxmU6ztScrJpp2lRGtIcEK3ni6N/EVAdMR0zws=;
        b=ZVgJNEwq/nV3bqezkGtrrtWOLyW3RbzlNB3KlNdaaq83PGVWUxRvd0vOmYPd3I4l72
         4ggaSvMOxPxZFYvkuU28e5GHavKhxL7SrFOBSMK3ttf8i4W+CQQorX03MnZb36Q6t9GZ
         3wOyr8gloMk7n1tedMUK1ibiybA+eqgpUwjXzEXQyUcT82JAuBUeas7z7QwcyD+1nkjg
         HvOrkSaIwpOPpqt5Xw67byW+zVgbPCT/J2SuOZKuxfhkIlHY5lb3PwXRA9++aY1X4sjw
         dmbz5uaMrkdfLhKhNMEf+8LKkqbDPowAc091Q2szZXv8NgtIEcvZYpw09K8/R/auJFUq
         +27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wZ21DOxmU6ztScrJpp2lRGtIcEK3ni6N/EVAdMR0zws=;
        b=BlwKAQvov7bE7Z6p2gC41gITYRdJzyvRrhcyLxLy3mULhzWcvh6GLoBxnfzHA8D59w
         te4WryRMaE8GJwGtLZhDmLnIfldwdYkCbGbM5HGJMVO3Qvx9w6y6XqDQTbEr8OpymAH5
         7msy8aRTzasf/cNCktxonCCEh/AQ+x2L5uaTogetC9OunEmwfuptBoXrav20ZXnBv9Go
         7TP5XAKyT58JS8P1WKbWwr5iMpsxzn05c7EMQDu2dSSeksjhu7AY/+SrOpCizG7dtUxM
         d8igtkfaIrm6SUw4i4vI2GSc2dE+Smo2MF50qr3TRiFnfFqKhN0jFeaqPzTLNql3UO9D
         7+gQ==
X-Gm-Message-State: APjAAAXR8KWc34RMbjA18fjFrOZBXHsVu+uft1hHmBED8HH18J8RpALK
        nEokEQO/5cIYbUYOl8bMulqQo16T
X-Google-Smtp-Source: APXvYqwM45bzAYn/ztIU3oKaQewfUoalnn/hLAs8MEdzKu5bHO24sYwcvoQ9GFpftJgciRCcty6ZyA==
X-Received: by 2002:a1c:6704:: with SMTP id b4mr2954151wmc.108.1556662115151;
        Tue, 30 Apr 2019 15:08:35 -0700 (PDT)
Received: from [192.168.1.19] (chf176.neoplus.adsl.tpnet.pl. [83.31.3.176])
        by smtp.gmail.com with ESMTPSA id b10sm6538861wrh.59.2019.04.30.15.08.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Apr 2019 15:08:34 -0700 (PDT)
Subject: Re: [PATCH leds/for-next v2 1/2] leds: turris_omnia: build if
 CONFIG_COMPILE_TEST=y
To:     =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
        linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>
References: <20190429212944.15643-1-marek.behun@nic.cz>
 <20190429212944.15643-2-marek.behun@nic.cz>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <40c94567-5114-afe5-735b-cd6021725ef5@gmail.com>
Date:   Wed, 1 May 2019 00:08:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190429212944.15643-2-marek.behun@nic.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Marek,

Thank you for the patch set.

On 4/29/19 11:29 PM, Marek Behún wrote:
> As Pavel pointed out, this driver should build if COMPILE_TEST is
> enabled.
> 
> Signed-off-by: Marek Behún <marek.behun@nic.cz>
> ---
>   drivers/leds/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 52de996e2262..3747cbd0de2c 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -132,7 +132,7 @@ config LEDS_TURRIS_OMNIA
>   	tristate "LED support for CZ.NIC's Turris Omnia"
>   	depends on LEDS_CLASS
>   	depends on I2C
> -	depends on MACH_ARMADA_38X
> +	depends on MACH_ARMADA_38X || COMPILE_TEST
>   	depends on OF
>   	help
>   	  This option enables basic support for the LEDs found on the front
> 

Fixed up the patch "leds: turris_omnia: add I2C and MACH_ARMADA_38X 
dependencies".

I'm skipping for now 2/2 until Dan's remarks are addressed.

-- 
Best regards,
Jacek Anaszewski
