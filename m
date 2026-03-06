Return-Path: <linux-leds+bounces-7131-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YI3KFZ/dqmlqXwEAu9opvQ
	(envelope-from <linux-leds+bounces-7131-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 06 Mar 2026 14:58:55 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B9833222340
	for <lists+linux-leds@lfdr.de>; Fri, 06 Mar 2026 14:58:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58DCE306BD37
	for <lists+linux-leds@lfdr.de>; Fri,  6 Mar 2026 13:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AED727FD75;
	Fri,  6 Mar 2026 13:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BzWEg2Gs"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E65738BF60
	for <linux-leds@vger.kernel.org>; Fri,  6 Mar 2026 13:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772805311; cv=none; b=t9wSe/omrWQ4W4SKllwhCZWnlZxmapj7P9H9dzI8q+Vd+SZO3hiFA1mhp45aB+mNuRwO3Iy79WTnmliCHCZN1+6yET0brQi6M+BBbZXZL2PjPlTzDK1aNQL3oKjvAGR0Y0iYH6T5uxTgQIgtaJtI+wAkrJ12Of0hwFC1esq3K5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772805311; c=relaxed/simple;
	bh=Ry7OdARbusQmUrh0xDQQUcpTaHhucB0RLwQ6HSu1URA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fz9bSBC9xiE/XKbskCMK2Vi3YKz4Ii2NxPwYLsZ4Ry+6KIVXKOetb1YAeZBJnqV2PoqDG1jh/ExWGb71+PTeNzHR3wLPpy91CJ7QecCpRYD7u6hN1PYU8ABMcl763nV3GMG2DsMEzY6b0POAUHFxZDiw78mai11osgK59fQ22Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BzWEg2Gs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4771C2BC86;
	Fri,  6 Mar 2026 13:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772805310;
	bh=Ry7OdARbusQmUrh0xDQQUcpTaHhucB0RLwQ6HSu1URA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BzWEg2GsJ0DxFU5XicVk/vacmf2225BTvXOc3JLdwdxs8c57aszAOmiC5zq+PLJlH
	 yaFw+44jNyK/4Ih+VJ7nu/r+I/udVs/g/gHnHbVV7drZWbhKsTUeEJgi6BKP+lxj9+
	 VTSkZJT0ZCT4/K3gpI4RHdIyIxVP79iXiDEquJMT4p9fr8+rGL7G1ejAA55aBNnKPU
	 e+t7J5owkt38pJkPuDRPbax0GtX6a/xUjS+K7rBoNs5cIrYmBBM0+kCk8hVQA+iXM5
	 Ft/P+kTjwo7GaAJIUfX1LRUkRW2s2hGuO/PELN2ye4CH3WYJCVuzwb+7VeQCPcEnbP
	 k9nulFU4feMLg==
Date: Fri, 6 Mar 2026 13:55:05 +0000
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Michael Tretter <m.tretter@pengutronix.de>,
	Pavel Machek <pavel@kernel.org>, Dan Murphy <dmurphy@ti.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
	kernel@pengutronix.de, Khalid Talash <ktalash@topcon.com>
Subject: Re: [PATCH] leds: multicolor: limit intensity to max_brightness of
 LED
Message-ID: <20260306135505.GN183676@google.com>
References: <20260123-leds-multicolor-limit-intensity-v1-1-b37761c2fdfd@pengutronix.de>
 <aamOejvtN8H1zB0E@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aamOejvtN8H1zB0E@black.igk.intel.com>
X-Rspamd-Queue-Id: B9833222340
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7131-lists,linux-leds=lfdr.de];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,ti.com,gmail.com,ucw.cz,vger.kernel.org,topcon.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Thu, 05 Mar 2026, Andy Shevchenko wrote:

> On Fri, Jan 23, 2026 at 11:13:24AM +0100, Michael Tretter wrote:
> > According to Documentation/ABI/testing/sysfs-class-led-multicolor, the
> > intensity should not exceed /sys/class/leds/<led>/max_brightness.
> > 
> > The interface doesn't check the values and higher values may lead to
> > unexpected color changes if the brightness is changed.
> > 
> > Clamp the intensity value to max_brightness.
> 
> This also brings a regression if somebody doesn't care about wrapping around.
> It's possible to return an error instead, but still the user space will be
> broken (in some rare weird cases).
> 
> Again, I care even less about this change, but be always careful,
> the main rule in the kernel "We do NOT break user space".

I'm going to remove this patch for now.

/tmp/next/build/drivers/leds/led-class-multicolor.c: In function 'multi_intensity_store':
/tmp/next/build/include/linux/compiler_types.h:706:45: error: call to '__compiletime_assert_434' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
  706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |                                             ^
/tmp/next/build/include/linux/compiler_types.h:687:25: note: in definition of macro '__compiletime_assert'
  687 |                         prefix ## suffix();                             \
      |                         ^~~~~~
/tmp/next/build/include/linux/compiler_types.h:706:9: note: in expansion of macro '_compiletime_assert'
  706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
   40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
   93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
      |         ^~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_once'
   98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
      |         ^~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cmp'
  105 | #define min(x, y)       __careful_cmp(min, x, y)
      |                         ^~~~~~~~~~~~~
/tmp/next/build/drivers/leds/led-class-multicolor.c:51:38: note: in expansion of macro 'min'
   51 |                 intensity_value[i] = min(intensity_value[i],
      |               

-- 
Lee Jones [李琼斯]

