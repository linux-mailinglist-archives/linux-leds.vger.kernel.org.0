Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AC622669D0
	for <lists+linux-leds@lfdr.de>; Fri, 11 Sep 2020 22:56:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725816AbgIKU4S (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 11 Sep 2020 16:56:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbgIKU4P (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 11 Sep 2020 16:56:15 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADB4AC061573;
        Fri, 11 Sep 2020 13:56:14 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id ay8so11476786edb.8;
        Fri, 11 Sep 2020 13:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EN1aXepR2pAjS7TkWhKDjvai8AQzIN3Al8VaNg0aZds=;
        b=FDN5aR1mZNsEYGXCC1BPMBu0sm0hScQh2NjkB1fe3oZh5VizOrUpX/nnaUi4GgW5va
         L+LDwSSw9Qw/DpnuvmcdBJi6SbQwk3quhgcGiQqSBUIyeCSl7RHdwo49O18KQTsMjIop
         qDAcEgE7JoYcKXoh8woTdO8sumbjYbkyObegcVrcj3VouezYf+YgwmhTIhSEqit2Ou4Y
         koNwrjHNpGH0dnpObyb9djReB7CKAn7StrNDCyV3qt2Gn/6kEAJMKdMGlYW2+sSQhQy0
         qpX5oREBRaYK1lSFTy9AafMj8EdNSntKJ0pm4znDC7YvDZKVW5LnuiDKLfxOhAp38OBJ
         xAog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EN1aXepR2pAjS7TkWhKDjvai8AQzIN3Al8VaNg0aZds=;
        b=slxw/Dr3tYqVODZsvURBCJgqsx2gvItxY4eIjZt/ctZwTi6inArKPLhVbo3jqVl1UF
         0olq57AhKuJdKMcWlJIR5jrRo7LH+QmHuH4WZY12MlQmFuPb8W3T9Cfy3nVBZ5HIl8ZI
         Y0biCkVhJWg3/K3OJ/4Btfg1qk7AHLneziU+YPhuSxr4l1JBGSGz+Fug7mu49bR0jH/d
         qf1mJ0qdOrw3vShBol9NND17C7QED7ZyFKGo5sdRdn/W+uVs1vJ2rETIMVK6J/y+pmHV
         R7yeckwknH8aWLdguWSLIxBJvvCtXbm8jPFSi2lzkdqqtudvVbEjZZFyyUW/BRal4uf9
         TS8g==
X-Gm-Message-State: AOAM5332JDAk6J/FDOai1XchPTQFL5MTPpRbDtmgYHehYUcnWO/zc0JN
        hD4ol9xb9DXdyQWVXigRxB8=
X-Google-Smtp-Source: ABdhPJwKOgIOcTcY6QqbJuRaVpQD5wA5CYwL5XmcohJ38wSTiq2WLVPUbKFzW9xX6/uwSYLc+ep2Pw==
X-Received: by 2002:a50:8c24:: with SMTP id p33mr4421467edp.330.1599857773391;
        Fri, 11 Sep 2020 13:56:13 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:e953:3254:5e71:3177? ([2a01:110f:b59:fd00:e953:3254:5e71:3177])
        by smtp.gmail.com with ESMTPSA id i17sm2151979ejy.79.2020.09.11.13.56.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2020 13:56:12 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] leds: mt6360: Add LED driver for MT6360
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Gene Chen <gene.chen.richtek@gmail.com>, robh+dt@kernel.org,
        matthias.bgg@gmail.com, dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
References: <1599474459-20853-1-git-send-email-gene.chen.richtek@gmail.com>
 <1599474459-20853-2-git-send-email-gene.chen.richtek@gmail.com>
 <559a568e-3a2e-33c6-43aa-547a18f8e26b@gmail.com> <20200911070503.GA9818@amd>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <d2721bb7-6f0e-19af-41b9-0f3ae95cf4f9@gmail.com>
Date:   Fri, 11 Sep 2020 22:56:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200911070503.GA9818@amd>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

On 9/11/20 9:05 AM, Pavel Machek wrote:
> Hi!
> 
>>> +{
>>> +	struct mt6360_led *led = container_of(lcdev, struct mt6360_led, flash.led_cdev);
>>> +	struct mt6360_priv *priv = led->priv;
>>> +	u32 enable_mask = MT6360_TORCHEN_MASK | MT6360_FLCSEN_MASK(led->led_no);
>>> +	u32 val = (level) ? MT6360_FLCSEN_MASK(led->led_no) : 0;
>>> +	u32 prev = priv->fled_torch_used, curr;
>>> +	int ret;
>>> +
>>> +	dev_dbg(lcdev->dev, "[%d] brightness %d\n", led->led_no, level);
>>> +	if (priv->fled_strobe_used) {
>>> +		dev_warn(lcdev->dev, "Please disable strobe first [%d]\n", priv->fled_strobe_used);
>>
>> Doesn't hardware handle that? IOW, what happens when you have enabled
>> both torch and flash? If flash just overrides torch mode, than you
>> should not prevent enabling torch in this case.
> 
> Yep, this is strange/confusing... and was reason why I asked for not
> supporting strobe from sysfs.

What you say now is even more confusing when we look at your ack
under this patch:

commit 7aea8389a77abf9fde254aca2434a605c7704f58
Author: Jacek Anaszewski <j.anaszewski@samsung.com>
Date:   Fri Jan 9 07:22:51 2015 -0800

     leds: Add LED Flash class extension to the LED subsystem

     Some LED devices support two operation modes - torch and flash.
     This patch provides support for flash LED devices in the LED subsystem
     by introducing new sysfs attributes and kernel internal interface.
     The attributes being introduced are: flash_brightness, flash_strobe,
     flash_timeout, max_flash_timeout, max_flash_brightness, flash_fault,
     flash_sync_strobe and available_sync_leds. All the flash related
     features are placed in a separate module.

     The modifications aim to be compatible with V4L2 framework requirements
     related to the flash devices management. The design assumes that V4L2
     sub-device can take of the LED class device control and communicate
     with it through the kernel internal interface. When V4L2 Flash 
sub-device
     file is opened, the LED class device sysfs interface is made
     unavailable.

     Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
     Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
     Cc: Richard Purdie <rpurdie@rpsys.net>
     Acked-by: Pavel Machek <pavel@ucw.cz>
     Signed-off-by: Bryan Wu <cooloney@gmail.com>


> Could I get you to remove code you are not commenting at when
> reviewing?
> 
>>> +MODULE_AUTHOR("Gene Chen <gene_chen@richtek.com>");
>>> +MODULE_DESCRIPTION("MT6360 Led Driver");
> 
> Led -> LED.
> 
> 									Pavel
> 

-- 
Best regards,
Jacek Anaszewski
