Return-Path: <linux-leds+bounces-7135-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLV0GY31qmlYZAEAu9opvQ
	(envelope-from <linux-leds+bounces-7135-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 06 Mar 2026 16:41:01 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E052B22409C
	for <lists+linux-leds@lfdr.de>; Fri, 06 Mar 2026 16:41:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E86A1306BD1B
	for <lists+linux-leds@lfdr.de>; Fri,  6 Mar 2026 15:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 694EF3E559C;
	Fri,  6 Mar 2026 15:34:50 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BC63537FD
	for <linux-leds@vger.kernel.org>; Fri,  6 Mar 2026 15:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772811290; cv=none; b=tzCUeCwtri6hoybVDxDLW6R433R5EbGafQG+kc74US683mM/KlWe97X2igrR6SGR/NAbVQnCK975w8oWRAeQS3cTA5ht2n3gSuS5YvKf3vraMbNty3Qa3K4FG6CRt2W6Ek39yPStcTqJCtMhOgrDwBOfTDZq+oRy07M0Dn2XaT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772811290; c=relaxed/simple;
	bh=0PNvPHDyT2OVz8gAXn3YbK7KNuy8F/DZ3ABZA2Nb/7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s9gPI7buq8dXMqC3Jekup0Zb9cK5Y9v7HPqrUtPeL9j2IZlX0+LRCUO7wEAHUCTX3cHck/cboW8FR3YYUV6GXVRt8iFZB5kkuJtFKEyV7KhT9SA6sA37HJECxgQ14qESUbBcSBukiUFDKdw342z+qmis3/5f3dNUUXhxQUj81zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vyXCI-0002mk-3B; Fri, 06 Mar 2026 16:34:38 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vyXCF-0044SR-0e;
	Fri, 06 Mar 2026 16:34:36 +0100
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vyXCG-00000004Cqf-1tah;
	Fri, 06 Mar 2026 16:34:36 +0100
Date: Fri, 6 Mar 2026 16:34:36 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Dan Murphy <dmurphy@ti.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
	kernel@pengutronix.de, Khalid Talash <ktalash@topcon.com>
Subject: Re: [PATCH] leds: multicolor: limit intensity to max_brightness of
 LED
Message-ID: <aar0DFOgMlkI27dv@pengutronix.de>
References: <20260123-leds-multicolor-limit-intensity-v1-1-b37761c2fdfd@pengutronix.de>
 <aamOejvtN8H1zB0E@black.igk.intel.com>
 <20260306135505.GN183676@google.com>
 <aaruOlCwePDD5WXc@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aaruOlCwePDD5WXc@ashevche-desk.local>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
X-Rspamd-Queue-Id: E052B22409C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,ti.com,gmail.com,ucw.cz,vger.kernel.org,pengutronix.de,topcon.com];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	TAGGED_FROM(0.00)[bounces-7135-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.tretter@pengutronix.de,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.555];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Fri, 06 Mar 2026 17:09:46 +0200, Andy Shevchenko wrote:
> On Fri, Mar 06, 2026 at 01:55:05PM +0000, Lee Jones wrote:
> > On Thu, 05 Mar 2026, Andy Shevchenko wrote:
> > > On Fri, Jan 23, 2026 at 11:13:24AM +0100, Michael Tretter wrote:
> > > > According to Documentation/ABI/testing/sysfs-class-led-multicolor, the
> > > > intensity should not exceed /sys/class/leds/<led>/max_brightness.
> > > > 
> > > > The interface doesn't check the values and higher values may lead to
> > > > unexpected color changes if the brightness is changed.
> > > > 
> > > > Clamp the intensity value to max_brightness.
> > > 
> > > This also brings a regression if somebody doesn't care about wrapping around.
> > > It's possible to return an error instead, but still the user space will be
> > > broken (in some rare weird cases).
> > > 
> > > Again, I care even less about this change, but be always careful,
> > > the main rule in the kernel "We do NOT break user space".
> > 
> > I'm going to remove this patch for now.
> 
> Wow, it was even never compiled!

The compile error depends on the used gcc version. I already sent a
patch for the error, which was also already applied [0].

[0] https://lore.kernel.org/all/177273014112.321702.15159156714467402540.b4-ty@kernel.org/

Michael

> For sure, please drop it.

