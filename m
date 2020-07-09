Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEEAF21AA10
	for <lists+linux-leds@lfdr.de>; Thu,  9 Jul 2020 23:59:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbgGIV7S (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Jul 2020 17:59:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbgGIV7R (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 9 Jul 2020 17:59:17 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C94AC08C5CE
        for <linux-leds@vger.kernel.org>; Thu,  9 Jul 2020 14:59:17 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id bm28so1043174edb.2
        for <linux-leds@vger.kernel.org>; Thu, 09 Jul 2020 14:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=OxrZOzHbEor9to0nrlJocP/5Zuo+MSWeinZqDZd+gjU=;
        b=GI+IiJtfk+unqbse6tf84DkhwYMKWA4tcHgDRghIXscO5AANv9flZRH78abRtD7XMu
         j3CUdF8OUrEMm4XJL6DJWBvrzL/Jc9xrMEAhHe/FvpPuJZxj73Bjda9gNVyRg/ulN69p
         bIWVS03ZfQ1k0ShOxOQDxaRUp+u6KQv1V+/rsHhzHBXOPMvtE46AlC3A3KZcT8qpewyh
         h2PeSBkKI1/r0EKoIkDDAOtC0SW1XAdpekv3SrnkoWU2RH30mNpmeoDMUTttr+bIuOVC
         1VIT04rE3QA41XeC6of9AKXi7eppAa2MYe12Vktu+cvHbV8AuiN9m2vUHyTs6gysqtL9
         lmEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OxrZOzHbEor9to0nrlJocP/5Zuo+MSWeinZqDZd+gjU=;
        b=JOPEuQCT/mnGlKL6XX1egC7b56E1iqamNSq8SWlG2UQGBTYKolCwy02m+qU25l3U9w
         VEkn01MCqUSPX6RjVpWQaMedTTt4n16kpUNz6W8iOlP9aYL/WWHptnyk18tSZHqVt6rF
         U+XZJEJTbn3PFo+HdGBjcESc0aUsEONgIMCy6Rh+7gaqUER3gyDlbNdifSDcYMtlaLM1
         D0Ad5+u4tA3hpBfYNol5AxJjQllYcrbq7ZJGhEY9vBv/3+Wr7sW/OGtUj/YFPguWw1fq
         RhwBu7FS7T0hC4WOJQSF+XP7EUQblVuXi7hAXZAKujaknrMX2kg4Xf4sgnZbuDSRtHRG
         i2Yg==
X-Gm-Message-State: AOAM532SbD7/H9TdZz+IHv8J7Z1gI5OGCftzB6JMcjWEUPKNi0V8MXxo
        7A+DzzsOgUKGn+iPz5TkM4dlW/lMTcU=
X-Google-Smtp-Source: ABdhPJx3vifeZwgf5aLRerKUbBzuQVhQ4fc3fsA1UrtE4HDNuSEUa4UgmphCYC+u3uUXxm4VRyYocA==
X-Received: by 2002:a50:ee8a:: with SMTP id f10mr54312203edr.383.1594331955921;
        Thu, 09 Jul 2020 14:59:15 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:2066:8db:696f:8073? ([2a01:110f:b59:fd00:2066:8db:696f:8073])
        by smtp.gmail.com with ESMTPSA id ce19sm2500982ejb.24.2020.07.09.14.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2020 14:59:15 -0700 (PDT)
Subject: Re: Query on using leds-gpio driver on a. GPIO with ACTIVE_HIGH
To:     Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>, pavel@ucw.cz,
        dmurphy@ti.com, linux-leds@vger.kernel.org
References: <30E1B20C-676E-45E2-9394-643262B5D04A@linux.vnet.ibm.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <7a6f99d7-efaf-8771-9272-5fb5a555823f@gmail.com>
Date:   Thu, 9 Jul 2020 23:59:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <30E1B20C-676E-45E2-9394-643262B5D04A@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Vishwanatha,

On 7/6/20 9:19 AM, Vishwanatha Subbanna wrote:
> Hello,
> 
> I have been a user of “leds-gpio” driver to manage the LEDs on IBM servers. So far, all these LEDs that were controlled by GPIO were ACTIVE_LOW.
> 
> Example from DTS.
> 
>          fan3 {
>              retain-state-shutdown;
>              default-state = "keep";
>              gpios = <&pca0 3 GPIO_ACTIVE_LOW>;
>          };
> 
> I wanted to know if it makes any difference to the user if the GPIO is ACTIVE_HIGH. I read through https://www.kernel.org/doc/Documentation/gpio/board.txt and it seemed we should be able to use it.
> 
> However, going through https://github.com/torvalds/linux/blob/master/drivers/leds/leds-pca955x.c, I am not quite sure if the ACTIVE_HIGH can be used same as ACTIVE_LOW since I saw these :
> 
> 
> #define PCA955X_LS_LED_ON	0x0	/* Output LOW */
> #define PCA955X_LS_LED_OFF	0x1	/* Output HI-Z */
> 
> #define PCA955X_GPO_HIGH	LED_OFF
> #define PCA955X_GPIO_LOW	LED_FULL
> 
> 
> This will be my DT entry :
> 
>          fan3 {
>              retain-state-shutdown;
>              default-state = "keep";
>              gpios = <&pca0 3 GPIO_ACTIVE_HIGH>;
>          };
> 
> Will I be able to use the same “leds-gpio” interfaces irrespective of GPIO_LOW / GPIO_HIGH ?
> 
> I use these interfaces today:
> 
> echo 255 > brightness —> Turn Solid_ON
> echo 0 > brightness —> Turn OFF
> echo “timer” > trigger —> Initiate Blink
> echo “none” > trigger —> Terminate Blink

 From what I can see in gpiolib sources GPIO_ACTIVE_LOW results
in reversing the logic, i.e. pca955x_gpio_set_value() will
be passed 0 when setting gpio to 1.

Experience doesn't corroborate that?

-- 
Best regards,
Jacek Anaszewski
