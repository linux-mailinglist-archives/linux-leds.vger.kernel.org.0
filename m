Return-Path: <linux-leds+bounces-3310-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EFD9BE4DB
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 11:53:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 901B4284E70
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 10:53:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 214041DE2DB;
	Wed,  6 Nov 2024 10:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VF2UhJsT"
X-Original-To: linux-leds@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF92B1DDC14;
	Wed,  6 Nov 2024 10:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730890400; cv=none; b=s1SqyDweBYEDvw0jraAT2WooXM9RI3VPYbGmTBsBPEUKBjTzl4nwFvrQJR/F27JgmzhuWw+mHiXBMIS9V6OriETj4Xmce6M9f/IPVEYm7Lhp6Fa21cNkp4EIRTzUey7XmYs3WeA2N4glVpub8nY6a0rbrfT+NVThH3WLpUsOdQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730890400; c=relaxed/simple;
	bh=5PHI4fPaMZ58YGXZOlVUlk2Z8m0C506quXMMgauBu/8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tQM36PG1DKqpvXN2nja8YOQi1dYRu6SIwm6A1qHRcCiyFj8XPOr4GTtPsfXIgYoRyNGuEWiiDN7ynfeyiAkI69aJWULfbDN8AnV8ZijSBXHCmJbE8LL6VKRP1m6r78dF5CRdhZvdUTkP7CXFDnm6w9bhAKTF05q8S+GJU1DeyMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VF2UhJsT; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 18CC4240002;
	Wed,  6 Nov 2024 10:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730890390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j480Ld0gUMh0K3CHAhi0RY/yU5j2pbiXxo67wU5UQ7c=;
	b=VF2UhJsTwUI53MhfXbHVKdTByUSYaNT3JHKD1+OVTTLQSG+fqFS0b7b7J1K1GNE9jfTiRU
	TySuIorlpETcGEMQ20f+ltX2ywlwKDtAtnGBricFogGuoYUT9fYZc2hEux33Ev0RoMTE+k
	NB2odWNfJ8uz4SucgD6aD9VBsAsEHmWnbCginvGjMB6tS0G3r1dcEnU0naBvBxLbP+tIVN
	xE1K0ap6nxtsLF0BoxFyPyFx1HxavpFHIj32EFBBaplh+H0A/cu8nH27BD/h2uyNIUk+OI
	2jmNxRoqfVJdGRHh6vIaHuu7HkoZnLfrCNZvMWUiy8UGi69aCEv/dQEuaP03WA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Lee Jones <lee@kernel.org>, Marek =?utf-8?Q?Beh=C3=BAn?=
 <kabel@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, Arnd Bergmann
 <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, Andy Shevchenko
 <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?Q?J?=
 =?utf-8?Q?=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH leds v5 01/12] turris-omnia-mcu-interface.h: Move
 command execution function to global header
In-Reply-To: <20241106102840.GN1807686@google.com>
References: <20241104141924.18816-1-kabel@kernel.org>
 <20241104141924.18816-2-kabel@kernel.org>
 <20241106102840.GN1807686@google.com>
Date: Wed, 06 Nov 2024 11:53:08 +0100
Message-ID: <87msic8wh7.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gregory.clement@bootlin.com

Lee Jones <lee@kernel.org> writes:

> On Mon, 04 Nov 2024, Marek Beh=C3=BAn wrote:
>
>> Move the command execution functions from the turris-omnia-mcu platform
>> driver private header to the global turris-omnia-mcu-interface.h header,
>> so that they can be used by the LED driver.
>>=20
>> Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>
>> ---
>>  .../platform/cznic/turris-omnia-mcu-base.c    |   1 +
>>  drivers/platform/cznic/turris-omnia-mcu.h     | 130 -----------------
>>  include/linux/turris-omnia-mcu-interface.h    | 136 +++++++++++++++++-
>>  3 files changed, 136 insertions(+), 131 deletions(-)
>
> Who needs to Ack this for me to take it via the LED tree?

Usually, it's Arnd who takes these patches, so it could be him who needs
to acknowledge them. However, Marek is the maintainer of this driver, so
I think it's already okay for you to take it.


Gregory

>
> --=20
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

