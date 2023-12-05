Return-Path: <linux-leds+bounces-259-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0AF805548
	for <lists+linux-leds@lfdr.de>; Tue,  5 Dec 2023 13:57:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 643701F21446
	for <lists+linux-leds@lfdr.de>; Tue,  5 Dec 2023 12:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8725F5646F;
	Tue,  5 Dec 2023 12:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jme37nru"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AF4CA0;
	Tue,  5 Dec 2023 04:57:04 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a1a5772b8a5so447150466b.1;
        Tue, 05 Dec 2023 04:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701781023; x=1702385823; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NaeA7VGskKYNAqgx+Ra1ez8twayn4+H5WNQTw6wh1Eo=;
        b=jme37nrunDraO3yEwIBtO8m/+eA+FTQRUWpwaEpe6jwfEfFi68YezDEAvPVVDuLT44
         2K+MNh5ibDF5I6V0lnujmFJ0x+v2RgAkQrsTzo6pynKLXKqDQbv/kwkF6RnxQEs6kZVl
         TVwkadzl8I3mfOQf8cKFi6JwUvS6Bc4rVNk/xbkVaS451wVXPmGfaZwP1jUZYwHV4pIn
         acEdlh7AFxV7kJZAKuExm8Ainw6AyZLIgTi4PoQm4DEZPUpT2A/51sYHvX/6jliYsI4c
         f3GWnr4QgWVx04qJKTwAkfUzNChK+FbbvR6q7Uk4ObLYeWC9GTs6zhBVZPQ4fcBz1V+P
         Vyog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701781023; x=1702385823;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NaeA7VGskKYNAqgx+Ra1ez8twayn4+H5WNQTw6wh1Eo=;
        b=oReQd8mgxE5v0E1Or31Mfe+BPrJtgEXlG2JN8pJnpnM3mzO0yMsIDx2hCqQKtcxCAI
         w3YaaLHZ9dU7rmj3+mpsd3Eghq4tc/QClo2BI7nfEXK/cLETK+RAgzO1cu2bTMRqdwdB
         RSp7rzjtj7Naz7M6q6rdYa9RtZQ72g+VhZk0ZgcK2dgR9hlXYB26obLYAM2ytIoHUi26
         1TREQB7auO16E90d5Zy31joK6R7I1QMT/RVVCGuUDQWrB4mkyJS7aASzlKAx2Dbfludk
         S00tBstlkLLwNzhsevzTuaeeDz+DOb3fACm5NA1ESmk12ZT7B4h8GtmzJvPb4SHZoKQ6
         ijGA==
X-Gm-Message-State: AOJu0YxeMnsDH84euAaAET0EceGB/B0+hmEA1LgNZAjUNtYmlKGTyqSc
	X6E06mcKQsjM5E41iEHzJYk=
X-Google-Smtp-Source: AGHT+IFzVFbtAQ7Nd/yS4iQtdd1OFimHypCRQHnKyqtQ7zX7f4adAeu1FTOs2INWNSBkBCOSto0Xow==
X-Received: by 2002:a17:906:4c50:b0:a04:5464:f0bf with SMTP id d16-20020a1709064c5000b00a045464f0bfmr407252ejw.63.1701781022655;
        Tue, 05 Dec 2023 04:57:02 -0800 (PST)
Received: from ?IPV6:2a01:c22:72b7:c900:542f:a611:a8f5:339c? (dynamic-2a01-0c22-72b7-c900-542f-a611-a8f5-339c.c22.pool.telefonica.de. [2a01:c22:72b7:c900:542f:a611:a8f5:339c])
        by smtp.googlemail.com with ESMTPSA id a24-20020a1709064a5800b00a1ce98016besm298080ejv.224.2023.12.05.04.57.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Dec 2023 04:57:02 -0800 (PST)
Message-ID: <d42dd05d-fc76-4040-aa15-8bbc4aa535f3@gmail.com>
Date: Tue, 5 Dec 2023 13:57:01 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: trigger: netdev: skip setting baseline state in
 activate if hw-controlled
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Christian Marangi <ansuelsmth@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <49f1b91e-a637-4062-83c6-f851f7c80628@gmail.com>
 <a69ebe41-3f37-4988-a0bc-e53f79df27f2@lunn.ch>
 <CAFSsGVvBfvkotAd+p++bzca4Km8pHVzNJEGV6CAjYULVOWuD2Q@mail.gmail.com>
 <7535cb07-31ab-407d-9226-7b3f65050a65@lunn.ch>
 <c57558a4-9f3a-48fa-acb7-e3eb2349c666@gmail.com>
 <4c9396eb-f255-4277-8151-caa28c8ea0d3@lunn.ch>
 <9a8373c6-e916-4a98-858a-294e7bed9f24@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <9a8373c6-e916-4a98-858a-294e7bed9f24@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.12.2023 13:40, Heiner Kallweit wrote:
> On 05.12.2023 04:00, Andrew Lunn wrote:
>>> Let's take a very simple use case: We have a one bit configuration to
>>> switch a LED between link_100 and link_1000 hw trigger mode.
>>>
>>> Then we have the atomicity issue you described: We can't go directly
>>> from one hw-controlled mode to the other, we have to go via both
>>> modes active or no mode active.
>>>
>>> And unfortunately we don't have the option to indicate this by some
>>> optical LED activity like blinking, especially if the link is down
>>> at the moment.
>>>
>>> Would be a pity if our nice framework can't support such a simple
>>> use case. So, what I could imagine, we react based on the return code
>>> from hw_control_is_supported():
>>>
>>> - 0: use hw control
>>> - -EOPNOTSUPP: fall back to LED software control, no error returned to use
>>> - -ENOTSUPP (another idea: ENOEXEC): store new mode in trigger_data->mode and return error to the user
>>> - other errors: don't store new mode and return error to user
>>>
>>> Not fully intuitive and the subtle difference between EOPNOTSUPP and
>>> ENOTSUPP may confuse driver authors adding device LED support.
>>
>> Using an NFS error code for LEDs will definitely confuse
>> developers. This is not a network file system, where it is valid to
>> use ENOTSUPP.
>>
>> I actually think we need to define some best practices, ordered on
>> what the hardware can do.
>>
>> 1) With software control, set_brightness should do what you expect,
>> not return an error.
>>
>> 2) Without full software control, but there is a mechanism to report a
>> problem, like constant blinking, or off, do that, and return
>> -EOPNOTSUPP.
>>
>> 3) Really dumb hardware like this, set_brightness should be a NULL
>> pointer. The core returns -EOPNOTSUPP.
>>
>> The core should return this -EOPNOTSUPP to user space, but it should
>> accept the configuration change. So the user can put it into an
>> invalid state, in order to get to a valid state with further
>> configuration.
>>
> Sounds good to me. Let me come up with a RFC patch.
> 
>> I don't see an easy way to let the user know what the valid states
>> are. We currently have a 10bit state. I don't think we can put all the
>> valid ones in a /sysfs file, especially when QCA8K pretty much
>> supports everything.
>>
>> 	 Andrew
> 
> Heiner

Patch is so simple that I send it this way. What do you think?

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index ec0395a6b..a24f3aade 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -310,6 +310,7 @@ static ssize_t netdev_led_attr_store(struct device *dev, const char *buf,
 				     size_t size, enum led_trigger_netdev_modes attr)
 {
 	struct led_netdev_data *trigger_data = led_trigger_get_drvdata(dev);
+	struct led_classdev *led_cdev = trigger_data->led_cdev;
 	unsigned long state, mode = trigger_data->mode;
 	int ret;
 	int bit;
@@ -349,6 +350,10 @@ static ssize_t netdev_led_attr_store(struct device *dev, const char *buf,
 	trigger_data->mode = mode;
 	trigger_data->hw_control = can_hw_control(trigger_data);
 
+	if (!led_cdev->brightness_set && !led_cdev->brightness_set_blocking &&
+	    !trigger_data->hw_control)
+		return -EOPNOTSUPP;
+
 	set_baseline_state(trigger_data);
 
 	return size;
-- 
2.43.0



