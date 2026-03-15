Return-Path: <linux-leds+bounces-7352-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EG+eN2wZt2klMgEAu9opvQ
	(envelope-from <linux-leds+bounces-7352-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 15 Mar 2026 21:41:16 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4673229268D
	for <lists+linux-leds@lfdr.de>; Sun, 15 Mar 2026 21:41:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68C663046503
	for <lists+linux-leds@lfdr.de>; Sun, 15 Mar 2026 20:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65D7637B409;
	Sun, 15 Mar 2026 20:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n3u7BT1P"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BCA221D89;
	Sun, 15 Mar 2026 20:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773607273; cv=none; b=heh5eYuSzdMQ8f9BQnKeWO+HedphMrCCpQQ+Neia5lCY90rJXWbFmAUfSFyMt6vIA+vRQ9PV/pEzUyN4YAGK1S4RYFs5dswvRoWME9AT8GWfQEqOAN0DYecJyS6zb+ex6+jatC4rctX1rSv9TcbioQ1S06h3Oy9ukezT8Z4jhfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773607273; c=relaxed/simple;
	bh=ZG2i/wUEe+jX3Uu2IabuhXNhfK0TQVp34srUSuF0ZE0=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=BPOMs9RmGMBdO7dOxbx9DihaGT5Kfv1wCWLGWC98XI6g9Z2eg4IEjvY4ZjGLfpzy7k2m/fI9T61asupZNA3grEqZBMSoF8cczZPAMeXvaVG+h4UJ2LsBm8XECnpV8i3WXTbIjV/sbBvSakRkfR0gyk7IMxF9TEUxivW3wd7Kg3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n3u7BT1P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32E46C19421;
	Sun, 15 Mar 2026 20:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773607272;
	bh=ZG2i/wUEe+jX3Uu2IabuhXNhfK0TQVp34srUSuF0ZE0=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=n3u7BT1P80OBjNPqGpoAkBqfpJx7qkWwItZx9xtzbcQ1S9oOGi9Ipx3p1Ia4cs43a
	 6vw7zRb5Qj0WWQDydDrN5VzJC3JqbDyAhNrVYFTi19xESJSuNv+IbSdRL592royxRn
	 XTVttAlonN9i4QnLbgxWM9F4ywIe4BNHCxLFt1D/MyanKXsd5iyTbCTyhnySnBODf0
	 I5EWiLyzLdzG7m27mTba+sTEmEDV5rm3EwVtEflCcSncHWwiAhsVkCXpYL5OeVUu/m
	 nN7eRANa0qymi27chtkgiSXhwdxCZ8gatSXXh8n/j16iE0QPh26J9FK7v+klYNkfAt
	 kfiuSyWpke2iQ==
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Mar 2026 20:41:06 +0100
Message-Id: <DH3M1023PCBI.1HYYZU93NS1JX@kernel.org>
To: "Markus Probst" <markus.probst@posteo.de>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 7/7] leds: add synology microp led driver
Cc: "Markus Probst via B4 Relay"
 <devnull+markus.probst.posteo.de@kernel.org>, "Lee Jones" <lee@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Igor Korotin" <igor.korotin.linux@gmail.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Bjorn Helgaas"
 <bhelgaas@google.com>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, "Pavel Machek" <pavel@kernel.org>, "Len Brown"
 <lenb@kernel.org>, "Robert Moore" <robert.moore@intel.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <driver-core@lists.linux.dev>,
 <linux-pci@vger.kernel.org>, <linux-leds@vger.kernel.org>,
 <linux-acpi@vger.kernel.org>, <acpica-devel@lists.linux.dev>
References: <20260313-synology_microp_initial-v3-0-ad6ac463a201@posteo.de>
 <20260313-synology_microp_initial-v3-7-ad6ac463a201@posteo.de>
 <DH1YH0GO75H8.18YSW2VMKRB3C@kernel.org>
 <39f1c9bb0dbde9f1b60785f8e838289c888ffdb0.camel@posteo.de>
 <DH3KAWWLECYW.3VBH7PIE7ZE20@kernel.org>
 <eb2f7498c5f3247265effc47b3445a04ac71956e.camel@posteo.de>
In-Reply-To: <eb2f7498c5f3247265effc47b3445a04ac71956e.camel@posteo.de>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7352-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,collabora.com,intel.com,vger.kernel.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,markus.probst.posteo.de,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4673229268D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun Mar 15, 2026 at 7:47 PM CET, Markus Probst wrote:
> On Sun, 2026-03-15 at 19:20 +0100, Danilo Krummrich wrote:
>> Isn't this handled through IRQs, i.e. you device issues an IRQ and then =
you read
>> from the serial bus?
>>=20
>> (I'm asking since such chips can usually be connected via different buss=
es, e.g.
>> serial and I2C. And with I2C the slave can't issue a transfer by itself.=
)
>>=20
>> Other MFD drivers register their own IRQ chip for this. I.e. one would r=
egister
>> an IRQ chip in the MFD driver and pass it to the sub-devices created thr=
ough
>> mfd_add_devices(). Then the sub-device receives an IRQ and reads the reg=
map.
> You mean registering a virtual IRQ and triggering it on data receival?

Not really virtual, there are a lot of MFD drivers that register their own =
IRQ
chip to forward only relevant IRQs to the sub-device.

What you say should work as well, but as mentioned below, I feel like that'=
s
overkill.

> Could you provide an example driver in the tree?

One example would be drivers/mfd/palmas.c, but there should be many more.

>> Now, if you don't have IRQs at all and the only event you get is through
>> receive_buf() (which implies that the chip is only compatible with a ser=
ial bus)
>> this technically still works, but might be a bit overkill.
>
> There is a physical IRQ, but the serial device bus abstracts that so
> the driver only has the receive_buf() function. The driver it self is
> not aware of an IRQs.

I think you are confusing the IRQ of the serial bus controller with a devic=
e
IRQ. The serial bus controller the device is connected to has an IRQ itself=
, but
what I mean is a device IRQ line.

This is very common for devices on busses such as I2C, SPI, etc., as they h=
ave
master/slave semantics. I.e. the device issues an IRQ and the kernel reads =
a
register subsequently.

UART does not force master/slave sematics on a bus level though.

That's why I asked whether the device is UART only, or if it supports other
busses as well.

> Having like a reverse regmap would be great (in addition), in which the
> mfd device is the one who calls write and the sub-device has to handle
> it. But I don't think something like this exists in the kernel.

I mean, it's not really that the kernel exposes registers to the device. Th=
e
device just uses the fact that the UART is not a master/slave bus and pushe=
s a
single byte to the kernel to signal that a button has been pressed. So, it'=
s
still "IRQ semantics".

(But I see that on abstract level one could argue in this direction.)

TBH, I think that the combination of this chip supporting multiple function=
s and
being connected through UART, where the device pushes bytes through the UAR=
T to
signal events is a bit of an edge case.

As mentioned, if it would be connected through I2C instead, it would be sim=
ple:
forward the IRQ and use a regmap, and you can do it entirely with generic
infrastructure and no custom APIs, which in the end is the idea of MFD. I.e=
. you
can describe the whole sub-device with a struct mfd_cell.

And while we could technically "emulate" this, it remains to be odd and has
unnecessary overhead.

I've seen one other case in the kernel, which is drivers/mfd/rave-sp.c. But=
 this
driver doesn't use MFD infrastructure at all and just goes for a custom API=
,
which clearly defeats the purpose of MFD in the first place. I.e. it should=
n't
even live under drivers/mfd/.

Greg already mentioned the auxiliary bus, which for a custom API clearly is=
 the
better choice.

But to be honest, the more I hear about this device, the more I feel like a
monolithic driver is all that's needed, as everything else sounds like over=
head
that doesn't really provide any value.

I.e. if we can't (easily) use mfd cells and would need a custom API, then w=
hy
even split it up at all, given that splitting it up would probably the most
complicated part of the whole driver.

Greg, what do you think?

*me runs away*

