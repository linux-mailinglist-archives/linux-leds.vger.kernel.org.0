Return-Path: <linux-leds+bounces-7695-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDm1MH6y2mnl5QgAu9opvQ
	(envelope-from <linux-leds+bounces-7695-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 11 Apr 2026 22:43:42 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DD23E1AB7
	for <lists+linux-leds@lfdr.de>; Sat, 11 Apr 2026 22:43:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 65C0E301DDA1
	for <lists+linux-leds@lfdr.de>; Sat, 11 Apr 2026 20:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8337B3BA252;
	Sat, 11 Apr 2026 20:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="3oyX/rog"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9A53328FD;
	Sat, 11 Apr 2026 20:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775940203; cv=none; b=CHas72xBwsiRn9PmSLzqL0lE4xkCsPh+4Vz62AWyXvZF55DACXid0Z6PpQOBW7EgpnwTJ//J83hJAd1Qdwx+p6b6uTk9S3eok9p9sfa5Q3FlkPep8EjtRZUV+W45VPib2wUiAlOCm0rMEdNCrxucIJ500LGFjMT0CHyhyIi5qU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775940203; c=relaxed/simple;
	bh=QdB9j3ELGjAHtqktWrtZmDL+Cg+ygpB+8+l6RDPkrqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uDEADf1UqOJYmNxMqbmEYMX5gc3oJju26AB2IiOiYt+7/CFtQroKG0inRk8eOP1OKv59RGFPE092lRRIMCRXxSbptEyIn63CEwIObJt9Ch3ndhHcjb93ZgYDaFVKIfuhsUzW+iEf7MwXYGX6aY+s4D3ZnyA3B5IXpE+OPhUZD0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=3oyX/rog; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=AuSUZosFHaDPhEj6fvCYhJbYcRov3la6wHZJFcHDGTg=; b=3oyX/rogn9xlw9jGx90ymEm0nS
	mtV7x5WDxC0tbvWd7QLog8BI9LjkKJtT4+nWr304NyUaAmepTfw1ptaMj6pYL9u1TU/lEkeTlACMz
	6VYnNVGtzX/+VU296XBtTCgT7+Rfi3SKg3+ESLA6HQDq5fZKti+gqQcWEab+DghJ6+tM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wBfAP-00FkMY-Aw; Sat, 11 Apr 2026 22:42:57 +0200
Date: Sat, 11 Apr 2026 22:42:57 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Rong Zhang <i@rong.moe>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Ike Panhc <ikepanhc@gmail.com>, Vishnu Sankar <vishnuocv@gmail.com>,
	Vishnu Sankar <vsankar@lenovo.com>, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, chrome-platform@lists.linux.dev,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [RFC PATCH 1/9] leds: Load trigger modules on-demand if used as
 hw control trigger
Message-ID: <6697bb96-6ae7-4cff-b218-2aa099977dc9@lunn.ch>
References: <500dfc4b-ebd7-4637-bed0-130fc571923c@lunn.ch>
 <b48993998e6e48d4448f8c6dc758f4e260d0f857.camel@rong.moe>
 <353713de-b121-4e27-a46f-6ca1941888a6@lunn.ch>
 <8b25e1ea9bff414442fa47475b9c9ac5b29049d7.camel@rong.moe>
 <60e60c42-f776-424a-a5b4-7286d33175d1@lunn.ch>
 <d2d321fe39c41ebd896eef63f3909df29f5a1622.camel@rong.moe>
 <4e839e55-4daa-45cd-b403-d1d6eae63d8d@app.fastmail.com>
 <cc4398e1512dceb531ba3bd5dd0d20cf2042bb84.camel@rong.moe>
 <2ac0c46c-805d-4749-a6e0-94b16b104a72@app.fastmail.com>
 <7437cc09-7958-4172-aec2-4429cfa98141@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7437cc09-7958-4172-aec2-4429cfa98141@app.fastmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7695-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[rong.moe,kernel.org,weissschuh.net,chromium.org,gmail.com,linux.intel.com,lenovo.com,vger.kernel.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lunn.ch:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lunn.ch:dkim,lunn.ch:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 52DD23E1AB7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> Hi maintainers - a gentle nudge on this one. Would like some
> direction if we can move ahead with the series. If not, what is
> required?
 
> On our side I know Vishnu has implemented the thinkpad driver using
> this and confirmed the design works there too.
 
> Would like to get this upstream so we can start working with the
> user-space folk on updating their pieces.

I'm not the Maintainer here, so i would not be too unhappy if i was
ignored.

I've had some time to think about this. I guess you are going to go
with a Linux LED, whatever. With that assumption in place, a trigger
makes sense. But i think it needs to be a special sort of trigger, and
a special sort of LED.

This is not a general purpose LED, which is a basic assumption for
Linux LEDs. You cannot make it blink for netdev packets, shift lock,
heartbeat, etc, because Linux does not control it, the EC does. Linux
can ask the EC to set it to some state, but the EC might change it,
and notify Linux afterwards. That is not the normal behaviour of a
Linux LED.

Also, it does not make sense to allow the trigger to be bound to any
other LED.

The trigger and the LED are tightly bound together. So i would put
them in the same driver. There are triggers which live outside of
drivers/leds/trigger/. So it is not a problem it lives somewhere
else. It also solves the ordering problem you had, getting the trigger
registered. Since it lives in the same driver as the LED, you know it
is registered, you do it before registering the LED.

I think you need some additional logic in the core. This LED must have
this trigger. I would look at using the is_visible() attribute
callback to make the trigger file in sysfs invisible for this LED, so
it cannot be changed. I would somehow get this trigger attached to the
LED when it is created. The trigger_relevant() call needs to be
extended so that you cannot attach this trigger to any other LED.

I would also think about naming. The behaviour is i guess specific to
X86 laptops? Do Apple laptops have the same behaviour? What about
Snapdragon X Series laptops? Chromebooks? USB keyboards? What about
things like the Unihertz Titan 2?

Somebody in the future might produce a generic solution. Linux
controls the LED. The Linux input system gets the key presses and
sends them to the trigger. You can bind an iio ambient sensor to the
trigger, etc. So you should leave the name space open for other
implementations.

	 Andrew

