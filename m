Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49910781495
	for <lists+linux-leds@lfdr.de>; Fri, 18 Aug 2023 23:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239873AbjHRVNH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 18 Aug 2023 17:13:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240724AbjHRVM4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 18 Aug 2023 17:12:56 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3D29422C
        for <linux-leds@vger.kernel.org>; Fri, 18 Aug 2023 14:12:46 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b9b904bb04so21725121fa.1
        for <linux-leds@vger.kernel.org>; Fri, 18 Aug 2023 14:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692393165; x=1692997965;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oAHS8Yx5ppsocSAwAkbrgjIf+g/MiPV0E0bVjlMzLYw=;
        b=OfTZ+tSNhJ54voY+0cC2z1fsoZf/amXjCTtMtynsl7NPVbg10dBB6achCZnqTfOD89
         aJgBrkCJGMEFtv2TgxALGaajiU3j1kPpOEaiw6PWnYCmyiGipLg255Ku/nPubfrnaCpX
         IBQy3T6OSLODkuArZabwP5fNVEdROPFqCXl0xjZYEFtycJ7nQHJRs2uOYHzjZHcneT1n
         0QeJw1Ss3ZkbgReF/LNhTQIB8illdcBwc/Y7poHJbqGS+57LMP9JPdUKm3ZWX6KkauGf
         s5Z9mWJ31t5nNtIBe/8dW8dFbQ4U5gzoz01JZCzV88op2v3nQKpF7+uv5zKU6FBMSeFc
         Ms+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692393165; x=1692997965;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oAHS8Yx5ppsocSAwAkbrgjIf+g/MiPV0E0bVjlMzLYw=;
        b=VjZevkbqbpu01EOjnnuu9c2kH8+8j0fTI+uqu8wP4KXAlw1QNZBDp5feJCjFZUznsZ
         NmLET841gCGJyq03cBFEOQIfBj2zwCmu/Zy0C8DwA7G9fTe8QFipMJcZ6EWfPuaqjWW7
         fFSl1reFG5KToJoFPU1JQopnOBnBhdhGu3pCrMc1xbg0LsIPYLrePRoFGwIML/4Qkzjx
         lG6fg1c9pULzVcYaOgDLNG9R7iLhRrqbhRTf32+0j43BqUSuJq7nC7erZydYkiZbhjh6
         cs3z11x2YH+uA8T2NmaQGQoTjgc5jx6Co+B5X/1XtQtTiH/qTIHuhC3Ugrjampse0YmT
         zPVQ==
X-Gm-Message-State: AOJu0YxarHm/q/trR9wRJAcAovA/KUBzaX5quqBcLJ4zzHSlzKNMKWkg
        nMs4yMiVcpIc6Jk2XxkbRBM=
X-Google-Smtp-Source: AGHT+IHy5rjGw63jPhO7mpRo+1xd3St+FRy6GrBLq19y5Q9ciGsW/sn0ZEU//6tUeJXnLBS8TS3o3A==
X-Received: by 2002:a2e:8813:0:b0:2b9:e831:f15f with SMTP id x19-20020a2e8813000000b002b9e831f15fmr245467ljh.32.1692393164827;
        Fri, 18 Aug 2023 14:12:44 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id n5-20020a2e8785000000b002b6df22f0edsm623185lji.64.2023.08.18.14.12.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Aug 2023 14:12:44 -0700 (PDT)
Message-ID: <e019c436-0edd-4345-8857-ff2a12d28c37@gmail.com>
Date:   Fri, 18 Aug 2023 23:12:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 5/6] leds: turris-omnia: support HW controlled mode via
 private trigger
To:     =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org
References: <20230802160748.11208-1-kabel@kernel.org>
 <20230802160748.11208-6-kabel@kernel.org> <20230802181345.59d0b0bb@dellmb>
Content-Language: en-US
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20230802181345.59d0b0bb@dellmb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Marek,

On 8/2/23 18:13, Marek Behún wrote:
> On Wed,  2 Aug 2023 18:07:47 +0200
> Marek Behún <kabel@kernel.org> wrote:
> 
>> +static int omnia_hwtrig_activate(struct led_classdev *cdev)
>> +{
>> +	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(cdev);
>> +	struct omnia_leds *leds = dev_get_drvdata(cdev->dev->parent);
>> +	struct omnia_led *led = to_omnia_led(mc_cdev);
>> +	int err = 0;
>> +
>> +	mutex_lock(&leds->lock);
>> +
>> +	if (!led->on) {
>> +		/*
>> +		 * If the LED is off (brightness was set to 0), the last
>> +		 * configured color was not necessarily sent to the MCU.
>> +		 * Recompute with max_brightness and send if needed.
>> +		 */
>> +		led_mc_calc_color_components(mc_cdev, cdev->max_brightness);
>> +
>> +		if (omnia_led_channels_changed(led))
>> +			err = omnia_led_send_color_cmd(leds->client, led);
>> +	}
>> +
>> +	if (!err) {
>> +		/* put the LED into MCU controlled mode */
>> +		err = omnia_cmd_write(leds->client, CMD_LED_MODE,
>> +				      CMD_LED_MODE_LED(led->reg));
>> +		if (!err)
>> +			led->hwtrig = true;
>> +	}
>> +
>> +	mutex_unlock(&leds->lock);
>> +
>> +	return err;
>> +}
> 
> Pavel, Lee, here I wanted to ask: can the .activate() method of a LED
> trigger sleep? The .brightness_set() method of a LED cannot sleep, and
> therefore we have .brightness_set_blocking() method, which schedules
> the potentially sleeping call into a work. But there is no such
> mechanism for the LED trigger .activate() method.
> 
> I looked at the LED core code, and it does not seem to me that
> .activate() sleeping would cause issues, besides keeping trigger list
> lock locked...
> 
> Note that previously none of the LED triggers in drivers/leds/trigger
> sleeped in .activate(), but recently the ethernet PHY subsystem was
> wired into the netdev trigger, which may cause the .activate() method
> to do a PHY transfer, which AFAIK may sleep...

In general led_set_brightness() can't sleep because it is called from
triggers in atomic contexts, which shouldn't be the case for activate().

.activate() is called from led_trigger_{set|remove}() which is called 
from led_classdev_{register|unregister}) and from sysfs trigger attr's
led_trigger_write() handler, so no risk here.

Triggers already call e.g. kzalloc() in .activate() which may sleep.

-- 
Best regards,
Jacek Anaszewski
