Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D2C326AFAC
	for <lists+linux-leds@lfdr.de>; Tue, 15 Sep 2020 23:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728150AbgIOVgm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 15 Sep 2020 17:36:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728149AbgIOVfa (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 15 Sep 2020 17:35:30 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA81AC06174A;
        Tue, 15 Sep 2020 14:35:29 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id n22so4513003edt.4;
        Tue, 15 Sep 2020 14:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zYZu7AP7WKQMUwX+s8Baq3r1FNAJckxzLU8aedZLdh4=;
        b=pQ9rUCXTUXQn6+Rgg9NiaktaiZwG3hpypdqH/VcPCAOYzWgOl5Xyh36Q2bUSEkn284
         3KbDVq7+dB9/VZ5cgaGRwvi0oZZjYcnnJycG+JTaws/Yp6WDa+6lbra0Om+QA3jDx4kj
         /7izJJ86gcBMauYXtbjQyiCByG8GWoChIY+fxUlojt/UVQ33Ue61jYk6U514srSjk/AA
         I4ymrlCgynC+HEGEhvrOLRDVxZZEyT0e5RR0jKaTgn9kZlQZBYnc0utWZcC28+htSv+Y
         6QRv1+xrDt/BVqUUI9wav4tjYrbSCB9r0F8PRrlhxZWWzjGjv9vlRyjFAKCGlVl2qhPx
         GGrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zYZu7AP7WKQMUwX+s8Baq3r1FNAJckxzLU8aedZLdh4=;
        b=FoDi6vb2oXEt3UePRzeTl3N6pjAn/32GzoCRWsfVNGXa9EMg5aR/Oo6HZToUQKfrAK
         qMhQLh8KxyXt5OdZL40o8x2tOz6r526/cTO5K7xdsHWCCr3Li0UkwIkftAQc0OGTYWyq
         V1EAW9b1/cOkXVfl5g33os9KGJ1QWi1HxkP+0PmRvDY+uUnejse37JaCjAtRdrhxW3ok
         fwEDDyT2gjZ2kZhuBf486cyYPq9UZHzf7xAooCyNvV4KQBF+mUW/riqsmpwSfJzxLVpb
         19/YBzC+ysz7HySd0LbNIVIYxXUJpeWqI1UlSCjsMxRZJiXK1bn4VwJCcVul9tp3fuea
         z5ug==
X-Gm-Message-State: AOAM533oUPQv/uwbHYsZcYKqsmrUl+ioviU4zI7oLgIOac2r1RIPzxmA
        lt4p+wcjMELEvgMK0yGXsi9zzNRcpWE=
X-Google-Smtp-Source: ABdhPJx4cq8Bfgz0qvLfYh+1YC1vhuSBV3HnLLxodexKKwwoFQRmAq3XmzPZh3KkFfAa1R6QZQCmYA==
X-Received: by 2002:aa7:ce19:: with SMTP id d25mr24674880edv.189.1600205728365;
        Tue, 15 Sep 2020 14:35:28 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:dd41:db23:e250:edba? ([2a01:110f:b59:fd00:dd41:db23:e250:edba])
        by smtp.gmail.com with ESMTPSA id f21sm12697704edw.83.2020.09.15.14.35.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2020 14:35:27 -0700 (PDT)
Subject: Re: [PATCH leds + devicetree v2 2/2] leds: trigger: netdev: parse
 `trigger-sources` from device tree
To:     =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
        linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megous@megous.com>,
        Russell King <linux@armlinux.org.uk>,
        Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
References: <20200915152616.20591-1-marek.behun@nic.cz>
 <20200915152616.20591-3-marek.behun@nic.cz>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <03fc62d8-eeaa-7b74-5ed9-7e482ea6b888@gmail.com>
Date:   Tue, 15 Sep 2020 23:35:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200915152616.20591-3-marek.behun@nic.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Marek,

On 9/15/20 5:26 PM, Marek Behún wrote:
> Allow setting netdev LED trigger as default when given LED DT node has
> the `trigger-sources` property pointing to a node corresponding to a
> network device.
> 
> The specific netdev trigger mode is determined from the `function` LED
> property.
> 
> Example:
>    eth0: ethernet@30000 {
>      compatible = "xyz";
>      #trigger-source-cells = <0>;
>    };
> 
>    led {
>      color = <LED_COLOR_ID_GREEN>;
>      function = LED_FUNCTION_LINK;
>      trigger-sources = <&eth0>;
>    };
> 
> Signed-off-by: Marek Behún <marek.behun@nic.cz>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>   drivers/leds/trigger/ledtrig-netdev.c | 80 ++++++++++++++++++++++++++-
>   include/dt-bindings/leds/common.h     |  1 +
>   2 files changed, 80 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
> index d5e774d830215..99fc2f0c68e12 100644
> --- a/drivers/leds/trigger/ledtrig-netdev.c
> +++ b/drivers/leds/trigger/ledtrig-netdev.c
> @@ -20,6 +20,7 @@
[...]

>   static int netdev_trig_activate(struct led_classdev *led_cdev)
>   {
>   	struct led_netdev_data *trigger_data;
> @@ -414,10 +479,17 @@ static int netdev_trig_activate(struct led_classdev *led_cdev)
>   	trigger_data->last_activity = 0;
>   
>   	led_set_trigger_data(led_cdev, trigger_data);
> +	netdev_trig_of_parse(led_cdev, trigger_data);

Please be aware of LED_INIT_DEFAULT_TRIGGER flag - it would make
sense to use it here so as not to unnecessarily call
netdev_trig_of_parse(), which makes sense only if trigger will be
default, I presume.

See timer_trig_activate() in  drivers/leds/trigger/ledtrig-timer.c
for reference.

-- 
Best regards,
Jacek Anaszewski
