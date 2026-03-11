Return-Path: <linux-leds+bounces-7301-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJ4LOjezsWnbEgAAu9opvQ
	(envelope-from <linux-leds+bounces-7301-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2026 19:23:51 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 302FA268866
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2026 19:23:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E06C303852E
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2026 18:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA2C3E8662;
	Wed, 11 Mar 2026 18:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="Ucqg3X/v"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73293E025D;
	Wed, 11 Mar 2026 18:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773253370; cv=pass; b=NyhbHhTk1c3iH7V1QPbjRWou4FpVv/qnUl00PqhaRF6o/DIRuV9HbiJIYQizpNgdt5Jcxk+e2aA0xLeXmMWsRXU6gzEOo3f/i4TImYAMwgIHYYApD7gGdWho7XDRLBMuN2hmdBak2MLe2WVaDsqDKDe00Re5Mz1E3VUBmPWyZ/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773253370; c=relaxed/simple;
	bh=jwAAySx/43Vy8JyBnWg3rVmdsYjSqTLF0bl+AkxEJfM=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=FkhsXrvRj8LZy1qiIdRHIGC0bgPojmpTXobztCRauYiEIp29zvqTqIR8ehIpDHpGp5zFtwtYUphH4LG3cYosznj8wMJ9D1BC8cGMih40XPN6zvXQ8whZdLVW6wX6dwqObJsM1Ta3F5legt4RiGcSSScfMGnLw/nB+GxamZS4P9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=Ucqg3X/v; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
ARC-Seal: i=1; a=rsa-sha256; t=1773253337; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UZwG3QEOb1y12oFAOTXVVpkLqWc7R6esBnFCUK18+VT//eYu2xekyaOQ5npgxB4zbzXtkDrWIdzAmWqnfDWScM+YIhWV2IxpWtFI2dbDRXSFjy9tCdm5ZPHbn9JeJJNqQA4kNNEaN5hBvfyodnn3Tjr0GRBla8EMdpHu3aEuH1Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773253337; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QABs54W0lawMOBDACSRTdXknngwpawSLu2JALriYcoQ=; 
	b=MMvF+lWuF9n1KovtPWoPZ2RMRof1qa5CqR0kGizJW4OCLtKUk0v3CxB+vdIAslWeWpON9/Fdk7lUfaKYJ4HTpqIfiAbNn3ZFzg7dyNxGGKr5hJTlLPp6QeeBECoa1wHPzHVI65CKRrf1wNz9Cxh51TMSXrcnTe0bXMreEn62fsw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773253337;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=QABs54W0lawMOBDACSRTdXknngwpawSLu2JALriYcoQ=;
	b=Ucqg3X/vuo4PiL/HUm+8dJQ0BeBcaqjorbRKijL/2JSPldFI0dPc5skGkh/iPPQo
	8pMjyB+Z7v8C6iYNe6gJwrmAY66x/rBVAt5f3/Bw9LyjVZbXSM8O2gfR+lqRW+ht6RH
	lsknJza4MaUi4zFvrZ8KIzXp7C4Gd30Tht0EPOIr/8YhRJ4EH/su6M12G5IH1jMxlfe
	yM9dJZRtBlVOaH84rqJd97QBuDd8+Bi2wN/diUgDWM0p9oRfg7+HPUqjIuj+CwPv6Fw
	B8TWixPHYUjkdOsbV/qwthsKv1PHneiPtSz00gBMif6cA7gsqx0UXWUaMS/Ol0cIp09
	0m5QOgxqJw==
Received: by mx.zohomail.com with SMTPS id 1773253334383513.6839766496422;
	Wed, 11 Mar 2026 11:22:14 -0700 (PDT)
Message-ID: <b48993998e6e48d4448f8c6dc758f4e260d0f857.camel@rong.moe>
Subject: Re: [RFC PATCH 1/9] leds: Load trigger modules on-demand if used
 as hw control trigger
From: Rong Zhang <i@rong.moe>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Thomas
 =?ISO-8859-1?Q?Wei=DFschuh?=	 <linux@weissschuh.net>, Benson Leung
 <bleung@chromium.org>, Guenter Roeck	 <groeck@chromium.org>, Marek
 =?ISO-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,  Mark Pearson
 <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Hans de Goede	 <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, Ike Panhc <ikepanhc@gmail.com>, Vishnu
 Sankar	 <vishnuocv@gmail.com>, vsankar@lenovo.com,
 linux-kernel@vger.kernel.org, 	linux-leds@vger.kernel.org,
 chrome-platform@lists.linux.dev, 	platform-driver-x86@vger.kernel.org
In-Reply-To: <500dfc4b-ebd7-4637-bed0-130fc571923c@lunn.ch>
References: <20260227190617.271388-1-i@rong.moe>
	 <20260227190617.271388-2-i@rong.moe>
	 <500dfc4b-ebd7-4637-bed0-130fc571923c@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Mar 2026 02:17:07 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-8 
X-ZohoMailClient: External
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[rong.moe,none];
	R_DKIM_ALLOW(-0.20)[rong.moe:s=zmail2048];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7301-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kernel.org,weissschuh.net,chromium.org,squebb.ca,gmail.com,linux.intel.com,lenovo.com,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[i@rong.moe,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[rong.moe:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 302FA268866
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Andrew,

Thanks for your review.

On Tue, 2026-03-10 at 20:22 +0100, Andrew Lunn wrote:
> On Sat, Feb 28, 2026 at 03:05:58AM +0800, Rong Zhang wrote:
> > In the following patches, we are about to support hardware initiated
> > trigger transitions to/from the device's hw control trigger. In case
> > the LED hardware switches itself to hw control mode, hw control trigger
> > must be loaded before so that the transition can be processed.
>=20
> This sounds backwards around.
>=20
> A Linux LED starts out life as a dumb LED. You can set its brightness
> using /sys/class/leds/<foo>/brightness.
>=20
> Userspace policy can then give additional meaning to the LED. It could
> blink a heartbeat, disk activity, show rf-kill status, activity on a
> serial port, what link speed eth42 has etc. The general design in
> Linux is that any LED can be used for any of these functions. You
> decide what an LED should indicate by selecting the trigger for it. To
> be able to select the trigger, the trigger needs to be already loaded.
>=20
> Only once you have the trigger load, and the LED using the trigger,
> then you can think about can the trigger be offloaded to hardware.

While I agree that the current policy makes its own sense and works
well on most devices, it leads to out-of-sync software states on recent
laptops.

When the LED's hardware autonomously put itself into hw control mode,
it is offloaded to the hardware per se -- we *can't* prevent this from
happening.

The series is about how to update software state to reflect the
hardware state change. Blindly keeping the software state despite the
hardware state is hardly meaningful and makes software out-of-sync.


It's worth mentioning that the series doesn't really cause any
behavioral change compared to the current policy when we consider the
LED device's hardware state. Let's consider what will happen after LED
X has autonomously activated hw control:

[ Software state #a: trigger=3Dnone ]

Current: LED X stays in hw control mode. Trigger unchanged
(trigger=3Dnone, hence software is out-of-sync with hardware).

This series: LED X stays in hw control mode. Trigger updated to reflect
the hardware state (trigger=3Dhw_control_trigger, offloaded=3D1).

[ Software state #b: trigger=3Dother ]
[ Software state #c: trigger=3Dhw_control_trigger, offloaded=3D0 ]

Current & this series: LED X stays in hw control mode until the next
trigger event. Software state unchanged and up-to-date.


And what will happen after LED X has autonomously deactivated hw
control:

[ Software state #d: trigger=3Dhw_control_trigger, offloaded=3D1 ]

Current: LED X stays in software control mode. Trigger unchanged
(trigger=3Dhw_control_trigger, offloaded=3D1, hence software is out-of-sync
with hardware).

This series: LED X stays in software control mode. Trigger updated to
reflect the hardware state (trigger=3Dnone).

[ Software state #e: trigger=3Dother ]
[ Software state #f: trigger=3Dhw_control_trigger, offloaded=3D0 ]

Current & this series: LED X stays in software control mode. Software
state unchanged and up-to-date.


As shown above, this series doesn't change the LED's hardware state and
it just updates the software state to notify user about that. If you'd
like to enforce software state's priority, we would have to explicitly
undo the hardware state change immediately after the LED's hardware has
autonomously activated/deactivated hw control mode.

Moreover, if an LED device doesn't autonomously change its hw control
state at all, this series should have little software/hardware impact
on them. IIUC, that's the case of all LEDs with
hw_control_trigger=3Dnetdev.

>=20
> In linux, policy is in user space. If policy says led X is to be used
> with trigger Y, user space can get the needed trigger module loaded.

Just to provide some background of this patch: I decided to include it
in the series when I thought about these three scenarios:

[ Scenario #1 ]

LED X: no default trigger; hw control trigger is Y; capable for
hardware initiated trigger transition

LED W: default trigger is Y

In this case, trigger Y has been be loaded automatically due to LED W.
Hardware initiated trigger transitions from LED X can be processed
properly.

[ Scenario #2 ]

LED X: same as above

CONFIG_LEDS_TRIGGER_Y=3Dy

In this case, trigger Y is builtin. Hardware initiated trigger
transitions from LED X can be processed properly.

Most distros have their own set of builtin triggers, so that's not
necessarily user's choice.

[ Scenario #3 ]

LED X: same as above

Other LEDs: default trigger is not Y

In this case, missing trigger Y leads to hardware initiated trigger
transitions from LED X being ignored.


Hence, not loading hw control trigger automatically leads to behavioral
divergences caused by other LED devices or distro configurations. LED X
is a victim of such divergences, but it was never intended to cause
them.

The main purpose of introducing this commit is to prevent such
divergences. We should only allow behavioral divergences when
CONFIG_LEDS_TRIGGER_Y=3Dn or when trigger Y is blacklisted.


That being said, I am OK to drop this patch from the series. ideapad-
laptop (see [RFC PATCH 9/9]) registers a private trigger, so it doesn't
depend on this patch. AFAIK this also applies to thinkpad_acpi as long
as it implements auto brightness in a similar way.

Thanks,
Rong

>=20
>      Andrew

