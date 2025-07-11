Return-Path: <linux-leds+bounces-5037-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C74B01E65
	for <lists+linux-leds@lfdr.de>; Fri, 11 Jul 2025 15:54:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A379E7B5D0A
	for <lists+linux-leds@lfdr.de>; Fri, 11 Jul 2025 13:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7E4C2D949C;
	Fri, 11 Jul 2025 13:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="t3SlOrV4"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2BA2882B6
	for <linux-leds@vger.kernel.org>; Fri, 11 Jul 2025 13:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752242017; cv=none; b=OK7CXOMUN5ghCJpRHrt4Ozt3VgwQd9yarmqn5P5zmLVIBWKWxoA1QqROsQDp4//6hucXyEJ/tv0ftb51ueA3JRdSiA+j5yT3af9B31CEScXjLBfe24jnws42lt6kMk4VP0erA3tFitySN1i+1gx9YwjSiQSFYCQ9GYdbCuopS0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752242017; c=relaxed/simple;
	bh=nYQA6VJppevBzzvlERY79uC2DZZUhU7t33nMS1CqeNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r6ogv747gSJI9uCng7R3OnZx5Cl/dY9AWkeHHwHfAJdcN/1L+XIMJ35I8pvFNttTkQNw+sHH1tnM7fUVuA8nKe7wao7Zs9rVTplKP7kIp16WMR3m4yLlaAHdXaOEkZRP+XyEzrE2w8UodYbWmgdonQmJndUhmAMwEoD2TA/k0Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=t3SlOrV4; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bdtTf2TqQz9svQ;
	Fri, 11 Jul 2025 15:53:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1752242006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eL8IBdquzW6WHDWKFv/oqXNDWFteE3we/XI/tI9/urs=;
	b=t3SlOrV4KAmlhIa8/CqkqwBq87lSBUPn3OXF5dW8Bdxa9GKHwNh+Dl1plCZSbQwM4AC+G9
	pln6O2Gx4CTvw1NtUM1Fbkt1+Q7UOUQDcKuHHJm3HyW+/gopyrqHIbuirHvuQ94p2ryBI2
	nH9/esDYr8nYctM59OL7rgVvp4dZn/kK6evE8O/VVCvB2qNX7iCqtFjB8pS1kmeZYHTfvv
	wENJhYFDp4XmfLC0KlcYrR9+bnzirLJebzt8H1crNP0bu0svN5jX0/hyKXngVO4lryrLB5
	Pw+Io+fTWbd4bWVlpHUYwF29Y/a+BKtD3Xef9bIhkhP3BWtnVOtAzV+FMrNGng==
Message-ID: <5c9d7cc6-370b-4702-8dc2-190115174391@mailbox.org>
Date: Fri, 11 Jul 2025 15:53:22 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] leds: trigger: netdev: Configure LED blink interval for
 HW offload
To: Andrew Lunn <andrew@lunn.ch>, Daniel Golle <daniel@makrotopia.org>
Cc: nyanmisaka <nst799610810@gmail.com>, linux-leds@vger.kernel.org,
 Christian Marangi <ansuelsmth@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Lee Jones <lee@kernel.org>,
 Lukasz Majewski <lukma@denx.de>, Pavel Machek <pavel@ucw.cz>
References: <20250120113740.91807-1-marex@denx.de>
 <2f0af25c-0360-4bb2-bf01-4c1587c6fd3c@gmail.com>
 <aHBZEh0q_FBh6urS@makrotopia.org>
 <4856875f-72cc-45ce-bd5b-8097122dac5c@lunn.ch>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <4856875f-72cc-45ce-bd5b-8097122dac5c@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: msou5hg6zdhp39eiiqgzfirwux7wj1rh
X-MBO-RS-ID: 7c7ac4899127925086c

On 7/11/25 3:04 AM, Andrew Lunn wrote:

Hi,

>>> Hi there, a while ago OpenWRT 24.10 was updated to linux kernel 6.6.93 [1]
>>> which contains the backport of this commit. Unfortunately this caused the
>>> LAN and WAN port LEDs on some MediaTek based routers to not work properly,
>>> they just kept blinking.
>>>
>>> According to a comment [2] by an experienced OpenWRT developer and from my
>>> understanding this is a breaking change. Could you please take some time to
>>> review the issue in the link and help revert the commit if necessary. Thanks
>>> in advance.
>>>
>>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.6.y&id=3648ddabcdc25aad8af95778d7f87225272815e9
>>> [2] https://github.com/openwrt/openwrt/issues/19263#issuecomment-3032228022
>>
>> To clarify: This patch, which also got backported to Linux stable trees,
> 
> Why was it back ported? This is clearly not a fix, and does not have a
> Fixes: tag.

This shouldn't have been backported.

>> changes the meaning of the ->blink_set() op.While previously, calling
>> blink_set() would instruct the hardware to put the LED into a
>> permanently blinking state, it is now (also?) used to adjust RX/TX
>> blinking times while the 'netdev' trigger is selected.
> 
> I agree this is a bad idea. The op should not be overloaded like this.

The led-core.c led_blink_set() does have on and off delay parameters, so 
this only aligned the PHY subsystem and LED subsystem behavior, if I 
recall it right.

> I suggest you submit a revert patch, and include a Fixes: tag.
> 
> What is also odd is that i don't see a patch adding a user for
> this. We generally don't add a new feature without a users!

I found one patch in tree here which makes use of the delay_on/delay_off 
parameters of .led_blink_set callback, I didn't get around to posting it 
yet it seems. It seems the other in-tree users only use 
delay_on/delay_off parameters of their .led_blink_set callbacks to 
decide whether or not to blink and that's all.

-- 
Best regards,
Marek Vasut


