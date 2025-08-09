Return-Path: <linux-leds+bounces-5211-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30798B1F61A
	for <lists+linux-leds@lfdr.de>; Sat,  9 Aug 2025 21:58:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0531624E29
	for <lists+linux-leds@lfdr.de>; Sat,  9 Aug 2025 19:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E1AC279DA0;
	Sat,  9 Aug 2025 19:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="xxMMvco7"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F25279DA6;
	Sat,  9 Aug 2025 19:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754769522; cv=none; b=ca6p7p9W5FxdLRWZzzRk+TaFY53YibbOb/u8uOhgNlQUppQKSLsKfozpqxSGW27WVX5N/Jtw/FkNLcCZEunDJC2057CiIt3KyFEtblZG1eUGsBxqT6zW27IdoN+e4EBoBVpslQwycL++yS9uPaeiGnQBDQzUf9kNUENW99VHkUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754769522; c=relaxed/simple;
	bh=Rzs3tllg1u2j5+XWGCqpWUs6bctzQ/tkvT/sr8cbkPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tzTIXsFrogkG22yrIR+1C0L3aqVOvZaE9FSjWg9LIe5B55PDOySW3RwXqVzprjJexk5aG6kaBTH/XuYc40hn1rEE/MU/Mk0S2xeREa6WgZaIPhvN2A3kSUQ6MLEsJobNeLziu9PBaIAo7nIqXobZA6D7eDBUJcMGdUdRZimJ6jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=xxMMvco7; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4bzsCV0Bxbz9spt;
	Sat,  9 Aug 2025 21:58:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1754769510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d6MdNBtNkuXL9Fyp8b+yocC299r5xdWciGVdsFGVZ3s=;
	b=xxMMvco7lkLdBwxkH+3EDAzYOkdNsvwa1ZedqwSfVlL75W2K8cb8BmPGdPeMIgESa2gnVV
	B62kuJTu9CNxHnv6qbNP/EEaIF8rdJdIDRFsofY0AXAnsQTEAsvIjW6O21yrDGrFpHuXlJ
	y7WXvIXRRKwU+IILNiY7uX+00z4/Ia7TLmyKsYxsR6HWbYgP5E6VPenb3cWpIq7bteWJDH
	QSrrBQELbpqk4ORjbzn27GIBixXqiStgvaF40AZGlwsGuVi60drQghxG7MGR+cCRX50CgA
	WVt+uCQIEq835UOYXJMw4kfMKaQmedTFYaBDiI+eYpV902hv7kcIKO6OkycdqQ==
Message-ID: <24277b44-a21e-499d-9194-71edbd483902@mailbox.org>
Date: Sat, 9 Aug 2025 21:58:26 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: leds: Document netdev trigger
 netdev-trigger-mode property
To: Andrew Lunn <andrew@lunn.ch>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>
Cc: linux-leds@vger.kernel.org, Christian Marangi <ansuelsmth@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
References: <20250113002346.297481-1-marex@denx.de> <2598568.Sgy9Pd6rRy@diego>
 <505f53fc-3481-497e-bc26-a70f3321e075@lunn.ch>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <505f53fc-3481-497e-bc26-a70f3321e075@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 53d3b34a85958bd8789
X-MBO-RS-META: 4dw6tc584bgwm1zgzyib1d767jq676ox

On 8/9/25 6:29 PM, Andrew Lunn wrote:
>> as DT is supposed to be a hardware description, I think throwing arbitary
>> binary values around is not very readable - especially as the above would
>> be a combination of setting-bits for the TRIGGER_NETDEV_* things.
> 
> I tend to agree with you. This is a tricky area, since it does appear
> in most part to be configuration, not hardware.
> 
> What i think you should actually be describing is the label on the
> case next to the LED.
> 
> Taking a random example:
> 
> https://www.downloads.netgear.com/files/GDC/Unmanaged_Switches/GS105Pv3_GS105PPv3_GS108LP_GS108PP_GS116LP_GS116PP_DS.pdf
> 
> The case says:
> 
> Left LED: Link/ACT mode
> Green = Link at 1000M
> Yellow = Link at 10/100M
> Blink = ACT
> 
> Right: PoE Mode
> Green = Powered
> Yellow = Fault

This is meant to configure the netdev trigger, i.e. how Linux configures 
the PHY LED behavior (blink at 100/Full, not blink at 10/Full etc.), not 
the LED labels.

It is already possible to configure which trigger should be used for 
each LED in DT, it is also possible to configure trigger settings for 
some LED triggers in DT, but it is not possible to configure the netdev 
trigger in DT.

> So there is in fact four LEDs. Two of them are actually nothing to do
> with netdev. This shows how flexible 'PHY' LEDs are, they can in fact
> be used for anything. We currently don't have a PoE trigger, but it
> should not be too hard to add.
> 
> For the two actual netdev LEDs, we need to describe the text of the
> label. The naming of the DT property also needs to emphasise this is
> the label. And if the case has no label, you should not be putting
> properties in DT, the LEDs don't actually have any fixed meaning, it
> is user space policy to set them.
> 
> As you said, there has not been any obvious progress on such a DT
> binding for 6 months or more. I would probably interpret that as its
> not particularly important.

This is still in the backlog pipeline, which is too deep now, I'm sorry.

> Maybe it actually makes more sense to work
> on user space tools

The LEDs have to be configured before userspace is even started, that's 
what this patchset attempts to solve. Consider the state of the system 
before (proper) userspace that would configure the LEDs is even started, 
e.g. initramfs and other such edge cases. DT seems like the only place 
where this could be described, and it is done so for other LED triggers 
already.

Userspace configuration is solved by udev rules, that's not a problem.

-- 
Best regards,
Marek Vasut


