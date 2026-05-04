Return-Path: <linux-leds+bounces-7985-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICMaKjL1+Glr3gIAu9opvQ
	(envelope-from <linux-leds+bounces-7985-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 04 May 2026 21:36:18 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CD04C34C4
	for <lists+linux-leds@lfdr.de>; Mon, 04 May 2026 21:36:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8535C3014BEF
	for <lists+linux-leds@lfdr.de>; Mon,  4 May 2026 19:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3B8A3E714A;
	Mon,  4 May 2026 19:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ug2Kv2/5"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444333E1D04
	for <linux-leds@vger.kernel.org>; Mon,  4 May 2026 19:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777923231; cv=none; b=dLKLs9H1LVx+s5y9Y5ZHRRpjN7hyVYQwGLm2XYRi1HwBnORFmP+2OLJUErbNY66/7n0cp4MRuMqB6HFPFdxRpTdzLwJNXSsLDc4HVuwkgZ31w9Am+FF4B1JL0jFMVgyNhA+JP1yEeIo02Xlu1GARgDpOs/TjJbO0UduB5EnVJvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777923231; c=relaxed/simple;
	bh=5WyRL87onO1XJCtyrIXJ2QnKJSXvw8KDL3SttCQ6cl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j0gzbx7tOV1+7lTkO22JB0mDFlF9fhMWXQcRZnkIrFaGMAv5+v4blAGFOUTOAz0Oq951eEaXvRtI9QA+Ge1Lj33MQWzN2W7PjqPCoCOf6zDiSSPLjG/AtA76T5BVVrvwJOqoxBtwrjl0nOjAi8DIGN3bMsk7S5NWvjSpcjNOFTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ug2Kv2/5; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-67b6dc50b61so6571740a12.2
        for <linux-leds@vger.kernel.org>; Mon, 04 May 2026 12:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777923228; x=1778528028; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IQ9C7d4LuBV4MAX9CZ/HitKy1k918s0TWggFmSPxal4=;
        b=Ug2Kv2/5uhO90u0fS1e3kMa+6Rp3ulwEvI+IAdrmanNKkk1UmBrdiNxCcanh13BNcD
         /sqqIQxUr+IPKrC5YF/gmIamHZWUb4CQ0pxd0zm5bHSiqiEdfVTQBHIy1rX0FVBr7Okm
         wZ6TxYf22TFugNZlMM0PmHEto2UxN8kfy6i25rP6PBWp+QzPgS/CahXl+G26Iorz5UxZ
         5egJ3XYYaZpDMHjGIyKhBVoQosIntqUzNfA8SlewrHQs+car8mwnY7Z/kcrEOXVfROob
         OmVTclmA9J4k72Ycv3w8oepJmxvjhV9D+stF+DcDgkPONedbYboUZj1I3cGguqP7cyMD
         /MEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777923228; x=1778528028;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IQ9C7d4LuBV4MAX9CZ/HitKy1k918s0TWggFmSPxal4=;
        b=ZzjOEA/EtlukrJxFBKjT7Gr9W4z4Gc/58UNrnpdrWiZrZdEZXFLTtxl36zQeJCXDHC
         lcoS2MSB5i7HVf29WdE/nxZMEWyP9G4hbLB+LEaN5XTmupiylmcQviLqYsb0cPBF76yS
         MBQk/sXKdsz5vSvDfzR69l3cbH7yIVB2SQXPn39WArb1HIiDe5ZKQfUBoHWRWxlQp2dG
         sYrcm0M0RP55mjWGY7O2uiy9Pl6yrGqWchKN3573fMRiom5Xc5Pdm7HV/aF7ODvihge0
         2iPa4plxmq58+GaVDHdRZ2+1d04sWdqdWUPPs7WXLHzjgcyjug7WV17ky57daTu6HGn8
         yI7Q==
X-Forwarded-Encrypted: i=1; AFNElJ8p8kNcCeSU6BWZLUeq9yuI/OmYBepqJUcZ/iI4znMJP1QT908aiWYJDbDlpRReX1LrFujR6Lqm6gmz@vger.kernel.org
X-Gm-Message-State: AOJu0YxMNU4f1z3moJ9PmCKn9sf4qJToJXxxr/47dpJlEWI/eroqfzAr
	KnaAClQmc7p9KY27wlUi5BVLJoyKk2thaBlApFVJQStJtnco5HLg8o3YmUO30Ws7
X-Gm-Gg: AeBDietvS4DbNGdCYCo/i06TCwmrT+XhQNXjtsgHLcoBz6JFuZYxwskCZcQvwwTKwv1
	7HSOkm3B9KJa/MGa9C6rRu4MLbXa5Xm4CpHIdy5BaHBHau2O6CcJi06KDiX2Bd7aZ7oKOkASwrR
	RR553hA7kzw1dOaXLbrmOdRHMRSU/2CViyJxFXnQmFpY2DHa5CQLBr1bveGVlFcs7ZBi1vt6a79
	IFfF3pDLTCw3Qi/fqVTkntNWzVKb7a7z57ybTfuwi/3wgeotW58L4rjD+HRiS8slzKOg4E6otVf
	WFdgc5Tg0sjxYI3uwc6QHIH7XDzp3Q1wpD+JiV5YF/CuJsYUTDIgFPZskrVAY5Ky3jDpr/tKl9K
	gKR9oWvffLG65fil6iSe+5GNMhlWqJT0CcK4v2JY8jTYnPnHEZs/I9ijuQdpuX3M+uBmvHG3j/F
	17zbGTnlx0yzCqMwScbJv5blimKOReOhhBbhC2nYndcA/DLw==
X-Received: by 2002:aa7:d319:0:b0:677:866c:6bb2 with SMTP id 4fb4d7f45d1cf-67c1a2e5f85mr3533539a12.16.1777923228085;
        Mon, 04 May 2026 12:33:48 -0700 (PDT)
Received: from [192.168.0.193] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67cc90aecc6sm13310a12.26.2026.05.04.12.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 12:33:46 -0700 (PDT)
Message-ID: <1b418b30-7b28-4559-9808-7a68132c273a@gmail.com>
Date: Mon, 4 May 2026 21:33:45 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9] leds: add support for TI LP5860 LED driver chip
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Nam Tran <trannamatk@gmail.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org
References: <20260424-v6-14-topic-ti-lp5860-v9-1-b44d7025d741@pengutronix.de>
 <aae0901b-ebfd-4d40-9880-116b881c9a90@gmail.com>
 <87zf2gqrsv.fsf@pengutronix.de>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <87zf2gqrsv.fsf@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 06CD04C34C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-7985-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacekanaszewski@gmail.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On 5/3/26 8:19 PM, Steffen Trumtrar wrote:
> On 2026-04-26 at 14:41 +02, Jacek Anaszewski 
> <jacek.anaszewski@gmail.com> wrote:
> 
> Hi,
> 
>> Hi Steffen,
>>
>> On 4/24/26 3:28 PM, Steffen Trumtrar wrote:
>> > Add support for the Texas Instruments LP5860 LED driver chip
>> > via SPI interfaces.
>> > The LP5860 is an LED matrix driver for up to 196 LEDs, which supports
>> > short and open detection of the individual channel select lines.
>> > It can be connected to SPI or I2C bus. For now add support for SPI 
>> only.
>> > Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
>> > ---
>> [...]
>> > diff --git a/drivers/leds/rgb/leds-lp5860-core.c b/drivers/leds/rgb/ 
>> leds-lp5860-core.c
>> > new file mode 100644
>> > index 0000000000000..648bf168f94bf
>> > --- /dev/null
>> > +++ b/drivers/leds/rgb/leds-lp5860-core.c
>> > @@ -0,0 +1,231 @@
>> > +// SPDX-License-Identifier: GPL-2.0-only
>> > +/*
>> > + * Copyright (c) 2025 Pengutronix
>> > + *
>> > + * Author: Steffen Trumtrar <kernel@pengutronix.de>
>> > + */
>> > +
>> > +#include <linux/led-class-multicolor.h>
>> > +#include <linux/module.h>
>> > +#include <linux/of_platform.h>
>> > +#include <linux/property.h>
>> > +#include <linux/regmap.h>
>> > +
>> > +#include "leds-lp5860.h"
>> > +
>> > +static struct lp5860_led *mcled_cdev_to_led(struct led_classdev_mc 
>> *mc_cdev)
>> > +{
>> > +    return container_of(mc_cdev, struct lp5860_led, mc_cdev);
>> > +}
>> > +
>> > +static int lp5860_set_dot_onoff(struct lp5860_led *led, unsigned 
>> int dot, bool enable)
>> > +{
>> > +    unsigned int offset = dot / LP5860_MAX_DOT_ONOFF_GROUP_NUM;
>> > +    unsigned int mask = BIT(dot % LP5860_MAX_DOT_ONOFF_GROUP_NUM);
>> > +
>> > +    if (dot > LP5860_MAX_LED)
>> > +        return -EINVAL;
>> > +
>> > +    return regmap_update_bits(led->chip->regmap,
>> > +                  LP5860_REG_DOT_ONOFF_START + offset, mask,
>> > +                  enable ? LP5860_DOT_ALL_ON : LP5860_DOT_ALL_OFF);
>> > +}
>> > +
>> > +static int lp5860_set_mc_brightness(struct led_classdev *cdev,
>> > +                    enum led_brightness brightness)
>> > +{
>> > +    struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(cdev);
>> > +    struct lp5860_led *led = mcled_cdev_to_led(mc_cdev);
>>
>> You need mutex locking while accessing hw to avoid leaving the
>> device in an inconsistent state in case of two parallel requests from
>> different processes.
>>
> 
> The hw is only accessed via regmap. It handles locking AFAIK or do I 
> misunderstand you?


You're calling regmap_write() per subLED, so internal regmap
locking has nothing to do with synchronizing the state of multicolor
LED. It is possible that another Process2 jumps in while Process1
has already written two subLEDs. Let's say that there are two
parallel calls, where Process2 has greater priority:

Process1:
echo "10 20 30" > multi_intensity
Process2:
echo "40 50 60" > multi_intensity

Process1:
	regmap_write subLED 1 10
	regmap_write subLED 2 20
Process2:
	regmap_write subLED 1 40
	regmap_write subLED 2 50
	regmap_write subLED 3 60
Process1:
	regmap_write subLED 3 30
	

Which leaves the multicolor LED registers in the state:

subLED1: 40
subLED2: 50
subLED3: 30

-- 
Best regards,
Jacek Anaszewski


