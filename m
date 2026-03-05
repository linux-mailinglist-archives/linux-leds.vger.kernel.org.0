Return-Path: <linux-leds+bounces-7100-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDSvBE57qWkg8gAAu9opvQ
	(envelope-from <linux-leds+bounces-7100-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 05 Mar 2026 13:47:10 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B59721200A
	for <lists+linux-leds@lfdr.de>; Thu, 05 Mar 2026 13:47:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B875530913FB
	for <lists+linux-leds@lfdr.de>; Thu,  5 Mar 2026 12:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DA0A39A800;
	Thu,  5 Mar 2026 12:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="LGtlNmXv"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E06B39B4B7;
	Thu,  5 Mar 2026 12:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772714602; cv=pass; b=OG5Q24uAS3QnFXvM/Bo/U+3wl8/KjujSGvPpgT+s12dGHHuBHbrYCnrBcRP5RDjsV3NQ4H5uvqsISne3CVccCthLo9K4feRtoYBFCHD266rwOIoS1by8n1NwAFVkyGwap0tiP6pIS0bxPYjlR6B6rfNnVYXg2ohoFFIqVR8JERU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772714602; c=relaxed/simple;
	bh=TBwVytHvfW3vYToRjOv22X+9+Zf2o4QIK6Y2LbSncQg=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=dLH6xAPb6FCIBVsxGQEdYPKAgL1hPrYMUAkYpL4Nf3YMYWX4YFHMABhnra51U2LvSGNnpH6dF1C0VMG0BTH6LrikT1C5JcfqM1K/JnV4uO/UBWvrzJ6BibYWUm11IdRMd9KgkGwVGgNvG4Hc2e/2Z79BtI1Nv5sP9VZ5a9k1Kfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=LGtlNmXv; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
ARC-Seal: i=1; a=rsa-sha256; t=1772714580; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AmV1cIFfm6QRS7yZBc8NmHoXKhkcBeRsnaMKO2sVEUyu8gxe0sJrFwwp7UQHptGtOMYx443HINLmKX5qAnaExPh34XVRqcHWL+gx3wv5NsbOCoN/FMV290tmMNDSrU0tLJigubBv7FKIemlLVzDg5FhS+3KWZx044Qrg2Gs8hAM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772714580; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=shsch+rUhqIdwtg8xuUvAf1mrjRPNSfpitMymyuIdq4=; 
	b=Y2T2Dxp2MMH2rYU62nAkLbGFLjGZuzC0Jn7vh1mHW9yMfQaTWWxyLj19Pwds5cspFGiIN2LvlFEKuAON3wVE3ffNQLIOhfbU5J/7PA+xVVurjGmC8LZ2vrbib21XM4zsIRjhdhCfBT1uOJU4lUvludzskp1rsrJToJGeZpf3xwQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772714580;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=shsch+rUhqIdwtg8xuUvAf1mrjRPNSfpitMymyuIdq4=;
	b=LGtlNmXvxqFLXLhBp1qGcn3U7Folju9h+4rLpWv/zk9ZXEf714lK2goxYygkLVI9
	HW6CPid/2QWmsBgbLJS0htEdnhbsgCkinY2d/JDXzsaA92AYVHwH0eilCF7nF1ouf/p
	xE288LsMCffx9kl0ORL9uAEqe8ttPcs7GTTe0zTFetNGDGx1/5L5kWkrUa2T8QGqp/g
	U1on7GquEP9XnDNCNRvqiGjoJqzbI0kW9Z3Bb3+0TghU2r0fjgoyJ8YkXqnwlcL9Zqp
	egx3Pm4NBrjYnqJGAvW3Y0g12dXnf2qIH5UxgKONLM1NsLMUCLylIh14gmw1nspz2d4
	wym9jBAdcw==
Received: by mx.zohomail.com with SMTPS id 177271457706981.7443150671794;
	Thu, 5 Mar 2026 04:42:57 -0800 (PST)
Message-ID: <baf1e52379ffaaa284a934520b377f5c68ac76a6.camel@rong.moe>
Subject: Re: [RFC PATCH 0/9] leds: Add support for hw initiated hw control
 trigger transition
From: Rong Zhang <i@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Thomas =?ISO-8859-1?Q?Wei=DFschuh?=
 <linux@weissschuh.net>, Benson Leung	 <bleung@chromium.org>, Guenter Roeck
 <groeck@chromium.org>, Marek =?ISO-8859-1?Q?Beh=FAn?=	 <kabel@kernel.org>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>, Hans de Goede
 <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  Ike Panhc <ikepanhc@gmail.com>
Cc: Vishnu Sankar <vishnuocv@gmail.com>, Vishnu Sankar
 <vsankar@lenovo.com>, 	linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, 	chrome-platform@lists.linux.dev,
 "platform-driver-x86@vger.kernel.org"	 <platform-driver-x86@vger.kernel.org>
In-Reply-To: <b1d43b71-38c1-48cb-91ae-4598ecd2f588@app.fastmail.com>
References: <20260227190617.271388-1-i@rong.moe>
	 <b1d43b71-38c1-48cb-91ae-4598ecd2f588@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Mar 2026 20:37:47 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-8 
X-ZohoMailClient: External
X-Rspamd-Queue-Id: 7B59721200A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[rong.moe,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[rong.moe:s=zmail2048];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7100-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[squebb.ca,kernel.org,weissschuh.net,chromium.org,gmail.com,linux.intel.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,lenovo.com,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[i@rong.moe,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[rong.moe:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rong.moe:dkim,rong.moe:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Mark,

On Wed, 2026-03-04 at 15:05 -0500, Mark Pearson wrote:
> Hi Rong,
>=20
> On Fri, Feb 27, 2026, at 2:05 PM, Rong Zhang wrote:
> > Hi all,
> >=20
> > Some laptops can tune their keyboard backlight according to ambient
> > light sensors (auto mode). This capability is essentially a hw control
> > trigger. Meanwhile, such laptops also offer a shrotcut for cycling
> > through brightness levels and auto mode. For example, on ThinkBook,
> > pressing Fn+Space cycles keyboard backlight levels in the following
> > sequence:
> >=20
> >   1 =3D> 2 =3D> 0 =3D> auto =3D> 1 ...
> >=20
> > Recent ThinkPad models should have similar sequence too.
> >=20
> > However, there are some issues preventing us from using hw control
> > trigger:
> >=20
> > 1. We want a mechanism to tell userspace which trigger is the hw contro=
l
> >    trigger, so that userspace can determine if auto mode is on/off or
> >    turing it on/off programmatically without obtaining the hw control
> >    trigger's name via other channels
> > 2. Turing on/off auto mode via the shortcut cannot activate/deactivate
> >    the hw control trigger, making the software state out-of-sync
> > 3. Even with #1 resolved, deactivating the hw control trigger after
> >    receiving the event indicating "auto =3D> 1" has a side effect of
> >    emitting LED_OFF, breaking the shortcut cycle
> >=20
> > This RFC series tries to demonstrate a path on solving these issues:
> >=20
> > - Introduce an attribute called trigger_may_offload, so that userspace
> >    can determine:
> >    - if the LED device supports hw control (supported =3D> visible)
> >    - which trigger is the hw control trigger
> >    - if the hw control trigger is selected
> >    - if the hw control trigger is in hw control (i.e., offloaded)
> >      - A callback offloaded() is added so that LED triggers can report
> >        their hw control state
> > - Add led_trigger_notify_hw_control_changed() interface, so that LED
> >   drivers can notify the LED core about hardware initiated hw control
> >   state transitions. The LED core will then determine if the transition
> >   is allowed and turning on/off the hw control trigger accordingly
> > - Tune the logic of trigger deactivation so that it won't emit LED_OFF
> >   when the deactivation is triggered by hardware
> >=20
> > The last two patches are included into the RFC series to demonstrate ho=
w
> > to utilize these interfaces to add support for auto keyboard backlight
> > to ThinkBook. They will be submitted separately once the dust settles.
> >=20
> > Currently no Kconfig entry is provided to disable either interface. If
> > needed, I will add one later.
> >=20
> > [ Summary of other approaches ]
> >=20
> > < custom attribute >
> >=20
> > Pros:
> > - simplicity, KISS
> > - no need to touch the LED core
> > - extensible as long as it has a sensor-neutral name
> >   - a sensor-related name could potentially lead to a mess if a future
> >     device implements auto mode based on multiple different sensors
> >=20
> > Cons:
> > - must have zero influence on brightness_set[_blocking] callbacks
> >   in order not to break triggers
> >   - potential interference with triggers and the brightness attribute
> > - weird semantic (an attribute other than "brightness" and "trigger"
> >   changes the brightness)
> >=20
> > < hw control trigger (this series) >
> >=20
> > Pros:
> > - mutually exclusive with other triggers (hence less chaos)
> > - semantic correctness
> > - acts as an aggregate switch to turn on/off auto mode even a future
> >   device implements auto mode based on multiple different sensors
> >   - extensibility (through trigger attributes)
> >=20
> > Cons:
> > - complexity
> >=20
> > [ Previous discussion threads ]
> >=20
> > https://lore.kernel.org/r/08580ec5-1d7b-4612-8a3f-75bc2f40aad2@app.fast=
mail.com
> >=20
> > https://lore.kernel.org/r/1dbfcf656cdb4af0299f90d7426d2ec7e2b8ac9e.came=
l@rong.moe
> >=20
> > Thanks,
> > Rong
> >=20
> > Rong Zhang (9):
> >   leds: Load trigger modules on-demand if used as hw control trigger
> >   leds: Add callback offloaded() to query the state of hw control
> >     trigger
> >   leds: cros_ec: Implement offloaded() callback for trigger
> >   leds: turris-omnia: Implement offloaded() callback for trigger
> >   leds: trigger: netdev: Implement offloaded() callback
> >   leds: Add trigger_may_offload attribute
> >   leds: trigger: Add led_trigger_notify_hw_control_changed() interface
> >   platform/x86: ideapad-laptop: Decouple HW & cdev brightness for kbd
> >     backlight
> >   platform/x86: ideapad-laptop: Fully support auto kbd backlight
> >=20
> >  .../obsolete/sysfs-class-led-trigger-netdev   |  15 ++
> >  Documentation/ABI/testing/sysfs-class-led     |  22 ++
> >  .../testing/sysfs-class-led-trigger-netdev    |  13 --
> >  Documentation/leds/leds-class.rst             |  72 ++++++-
> >  drivers/leds/led-class.c                      |  23 +++
> >  drivers/leds/led-triggers.c                   | 176 +++++++++++++++-
> >  drivers/leds/leds-cros_ec.c                   |   6 +
> >  drivers/leds/leds-turris-omnia.c              |   7 +
> >  drivers/leds/leds.h                           |   3 +
> >  drivers/leds/trigger/ledtrig-netdev.c         |  10 +
> >  drivers/platform/x86/lenovo/Kconfig           |   1 +
> >  drivers/platform/x86/lenovo/ideapad-laptop.c  | 194 ++++++++++++++----
> >  include/linux/leds.h                          |   6 +
> >  13 files changed, 492 insertions(+), 56 deletions(-)
> >  create mode 100644 Documentation/ABI/obsolete/sysfs-class-led-trigger-=
netdev
> >=20
> >=20
> > base-commit: a75cb869a8ccc88b0bc7a44e1597d9c7995c56e5
> > --=20
> > 2.51.0
>=20
> Thanks for your work on this.
>=20
> For the series: As it's a RFC, I'm not bothering with notes on any typo's=
 or grammer stuff.
>=20
> Overall I think the implementation works and I understand it better from =
our initial discussions. Thank you for putting this together.
>=20
> I'm not a huge fan of the term offloaded - I would lean towards just call=
ing it hw_control (or similar). But I see it was used in the ledtrig-netdev=
 driver so I don't feel strongly about this.
>=20

FYI, "hw control" is a historical and internal term. I used it because
it's used a lot in the documentation to the doc consistent. Otherwise
"offload(ed)" should be used. See commit 44f0fb8dfe26 ("leds: trigger:
netdev: rename 'hw_control' sysfs entry to 'offloaded'").

I admit that I was somewhat lost in the terminological soup and there
may be some room for rephrasing in my documentation and commit
messages.

Thanks,
Rong

> Vishnu - can you check out how this would work with the Thinkpad implemen=
tation that you've been working on, please? I think that will be helpful to=
 highlight any design issues.
>=20
> Mark

