Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11CEF3209EF
	for <lists+linux-leds@lfdr.de>; Sun, 21 Feb 2021 12:29:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbhBUL3B (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 21 Feb 2021 06:29:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbhBUL3A (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 21 Feb 2021 06:29:00 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23C99C061574;
        Sun, 21 Feb 2021 03:28:20 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id u4so1178757lja.3;
        Sun, 21 Feb 2021 03:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XailET+Iz0kS61iHBGbLnnT1v04j2RILsJcsZVq8qik=;
        b=lh/3mdQ+xAZKSuK5gv22xNPa6GEkldcs0lgL5hVKw0TgzXphO7b2Fu6fUZrprxNk7H
         H/zP2VmHVFQkLwyy3T30wksKBWug+vwowuGfAateyeM+RpoJrH6TjD7WNyDxLGip3bAc
         lNvYfSR92evbcGDK3SiWwwsypGyU+7Dbk2gp60tJx5fUMJAAQoky26xlpq0YiiXLcseq
         V/hBgDuxM5bih1GG6nyvhtdKSTXDgRuQw7QSJXi1AFQ7zNx1/SeySh19Ujz9rZg8Bqzb
         brDdYuSEYnSZ90eeNZHWIA1IxWpc5SGuu0inRmdcj0k3WG3pIwX0Bj8nyt/hl5cPrp0L
         /X3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XailET+Iz0kS61iHBGbLnnT1v04j2RILsJcsZVq8qik=;
        b=JrH22rABg50wKykm2/aQOVthDsYAHKUev/1Fh5OseYx6QayOY02sfEs6NDfwkxC+S8
         bLU9n98x//Idw4Lf3k67yA/oL5IJSe3TiBXAy2We/s/pMoMeL//nHR5zUSk/0iJo3W8o
         kyUBycikllEFYc6Z8y609Ii//AUIqeMgGhsIQAkep3fC/r8r45qFrCtF05E46BZb+XBW
         DjTiceZNJBM19jY/lcUNrKdc8y7BB8Mi7fMbJxyik5EK3Zb98OuGVDzm1yK262nekW1I
         jhPDPnJ/njTI1mjR9/wnunmSXv8mFiDGSYESPZ3ddC8gru4waEKkeolNJX5ldInqjTWG
         bk1Q==
X-Gm-Message-State: AOAM530FtvJmV/98SluCuX0DJKvXKclHY6qe1QUKri5q2lQuGyFXzz3Q
        E4Yi5iZy7sEIZeXQDveWz04=
X-Google-Smtp-Source: ABdhPJwiJy5T8cZv/11xeat3V6sbW5pu72MNEX6NOIO6KFTr9udo0S9iL6GikugUnw2/EdfL7/ypQQ==
X-Received: by 2002:a05:6512:11d1:: with SMTP id h17mr10792421lfr.116.1613906898546;
        Sun, 21 Feb 2021 03:28:18 -0800 (PST)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id g24sm273950ljl.122.2021.02.21.03.28.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Feb 2021 03:28:18 -0800 (PST)
Subject: Re: [PATCH v2 2/4] leds: Add driver for QCOM SPMI Flash LEDs
To:     Pavel Machek <pavel@ucw.cz>
Cc:     =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@protonmail.com>, Dan Murphy <dmurphy@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-leds@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Brian Masney <masneyb@onstation.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Russell King <linux@armlinux.org.uk>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        lkcamp@lists.libreplanetbr.org, andrealmeid@collabora.com
References: <20210126140240.1517044-1-nfraprado@protonmail.com>
 <20210126140240.1517044-3-nfraprado@protonmail.com>
 <a26a1d40-1c7c-b97c-2970-58a2fda8f1cf@gmail.com>
 <20210219110227.GG19207@duo.ucw.cz>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <7bb757c7-55af-66a4-aa12-fe646a19fcf6@gmail.com>
Date:   Sun, 21 Feb 2021 12:28:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210219110227.GG19207@duo.ucw.cz>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 2/19/21 12:02 PM, Pavel Machek wrote:
> Hi!
> 
>>> + */
>>> +
>>> +#include <linux/kernel.h>
>>> +#include <linux/module.h>
>>> +#include <linux/spmi.h>
>>> +#include <linux/of_device.h>
>>> +#include <linux/device.h>
>>> +#include <linux/types.h>
>>> +#include <linux/string.h>
>>> +#include <linux/mutex.h>
>>> +#include <linux/sysfs.h>
>>> +#include <linux/led-class-flash.h>
>>> +#include <linux/regulator/consumer.h>
>>> +#include <linux/delay.h>
>>> +#include <linux/regmap.h>
>>> +#include <dt-bindings/leds/leds-qcom-spmi-flash.h>
>>
>> Please sort includes alphabetically.
> 
> No need to do that.

Keeping the includes sorted eliminates the risk of introducing 
duplicates and allows for faster lookup.

What gain is in having them unsorted?

>>> +#define FLASH_SAFETY_TIMER		0x40
>>
>> Namespacing prefix is needed for macros, e.g. QCOM_FLASH*.
> 
> No need for that in .c files.

In general it eliminates the risk of name clash with other subsystems
headers.

And actually the prefix here should be QCOM_LED_FLASH to avoid ambiguity
with flash memory. If you dropped the vendor prefix then you'd get
possible name clash with led-class-flash.h namespace prefix.

-- 
Best regards,
Jacek Anaszewski
