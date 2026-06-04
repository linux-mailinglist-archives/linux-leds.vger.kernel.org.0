Return-Path: <linux-leds+bounces-8482-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LBPuM+6ZIWrPJgEAu9opvQ
	(envelope-from <linux-leds+bounces-8482-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 04 Jun 2026 17:29:50 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FFC6416FB
	for <lists+linux-leds@lfdr.de>; Thu, 04 Jun 2026 17:29:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="MCw/5ZOu";
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8482-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8482-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B0C5E31136AD
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jun 2026 15:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28764330D43;
	Thu,  4 Jun 2026 15:20:22 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E081533B951;
	Thu,  4 Jun 2026 15:20:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780586422; cv=none; b=tXmx9XJMCCJj0o5N2iSA6odeINDq/bOHkV2M3wyMgK4o1VmtCl48pywBCPaNPBcJTGT+DmZCx50sjv1ZAo6RDKJfT9ikjG6mn3SdUkCKoIgYqp5wd8/Mdgd1oD4zHFa/w59c3pIFZM+yP8QUUXHp38dTR859Y+Ahu0EXzovmxiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780586422; c=relaxed/simple;
	bh=ywMPuVhciGIZPWck+FWPUAVY/8UbPVyHEdH2bG6IVHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JkeVrukEtv2EZAzdPGMAaE8UNrfs9cWLc5/gbrAY+OkQG8YOTmvpicJRLmT0ITpcff/SgwlmZcfzyXxFRzExsbuGvDpP3o/Wd8bi+Jm7TGR1rrE9BpT125NWhMOfPPFUK/LCONZyw0CSt01UcerzlsIIoPTsXWYpTNpiFdSTi7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MCw/5ZOu; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FE681F00893;
	Thu,  4 Jun 2026 15:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780586420;
	bh=U8s/VB0EhUK2QBRM48aZHx4YVTj/8cAWgl2BUsahiiE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MCw/5ZOuv36TuyD5NcB+MZNbi7GbPFVkz/m4IDCVxBk/cp9uQ+FI8yveF4x4K6BZY
	 9vRt5UvsddjVmcvdjOhbkTCUCF5Y1nPprNkZa3GWPcf/PhebAnst+HpAY9poNfw/NQ
	 hpAMMEhB8Nn05GiH2hRM817yg7Ob7ZWYaTY3JJB1YwBBHvk3PUhmL9WSd5VnCzLnsG
	 nGgdXFdkHKBlatBNOpTjhCeM9gjotyCWuP4ZQaWMON+b8vnpo+4rMLRq3+4hklyI/H
	 aHEaG+m4bpZsssG05N/wFECvMzExdk6y/Xc1fXJALiPqdcnyE4WS/9N97OuwGfkCke
	 1Y8pifvB3UIqQ==
Date: Thu, 4 Jun 2026 16:20:16 +0100
From: Lee Jones <lee@kernel.org>
To: Manuel Fombuena <fombuena@outlook.com>
Cc: pavel@kernel.org, vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/10] leds: st1202: fix multiple bugs in pattern
 engine and brightness handling
Message-ID: <20260604152016.GC4151951@google.com>
References: <WA0P291MB03855101311F0506B6448A8EC50D2@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <WA0P291MB03855101311F0506B6448A8EC50D2@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fombuena@outlook.com,m:pavel@kernel.org,m:vicentiu.galanopulo@remote-tech.co.uk,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-8482-lists,linux-leds=lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[outlook.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 97FFC6416FB

Can you take a look through these Sashiko reviews please:

https://sashiko.dev/#/patchset/WA0P291MB03855101311F0506B6448A8EC50D2%40WA0P291MB0385.POLP291.PROD.OUTLOOK.COM

> This series fixes several bugs in the LED1202 driver related to hardware
> pattern programming and brightness control. The issues were found during
> testing on a Linksys MX4200v2 router running OpenWrt.
> 
> --- Pattern sequence not stopped before reprogramming ---
> 
> The LED1202 datasheet (section 4.8) states that writes to PAT_REP and
> pattern duration registers are only applied after the sequence completes
> or is stopped. When running in infinite loop mode the sequence never
> completes on its own, so these writes are silently ignored by the
> hardware.
> 
>   Patch 1: Stop the running sequence by clearing PATS in the
>   configuration register at the start of both pattern_clear() and
>   pattern_set(), ensuring the hardware accepts new values immediately.
> 
>   Patch 2: Validate pattern input before stopping the sequence. An
>   out-of-range duration value should be rejected without disrupting a
>   running pattern, so input validation is moved ahead of the sequence
>   stop.
> 
> --- pattern_clear() leaving hardware in inconsistent state ---
> 
> Several independent bugs in pattern_clear() left the hardware in a state
> that affected subsequent pattern or brightness operations.
> 
>   Patch 3: Fix the duration prescaler formula. The original formula
>   (value / ST1202_MILLIS_PATTERN_DUR_MIN - 1) produced an off-by-one
>   result, writing the minimum valid duration (22ms, register value 0x01)
>   instead of the skip marker (0x00) for unused slots.
> 
>   Patch 4: Write the skip marker (0x00) directly to unused duration
>   registers in pattern_clear() rather than going through
>   st1202_duration_pattern_write(), which operates on millisecond values
>   and cannot express register value zero.
> 
>   Patch 5: Reset PAT_REP to its power-on default of 1 in pattern_clear().
>   A stale value — most critically 0xFF from a previous infinite loop —
>   would be picked up by a subsequent pattern_set() call in the window
>   between pattern_clear() returning and pattern_set() writing its own
>   value.
> 
>   Patch 6: Restore Pattern0 PWM to full brightness (0x0FFF) after
>   clearing. pattern_clear() zeroes all PWM slots as part of the clear,
>   but leaves Pattern0 at zero, so a subsequent direct brightness write
>   has no visible effect until Pattern0 PWM is restored.
> 
> --- Spurious pattern sequence start during setup ---
> 
>   Patch 7: Remove the write of PATS|PATSR to the configuration register
>   in st1202_setup(). This accidentally started a pattern sequence before
>   any pattern data was programmed, producing undefined output on startup.
> 
> --- Brightness control broken while pattern mode is active ---
> 
>   Patch 8: Exit pattern mode in brightness_set() before writing the ILED
>   register. With PATS set, the LED output is determined by the pattern
>   engine regardless of the ILED value, making direct brightness writes
>   have no visible effect while a pattern is active.
> 
>   Patch 9: Disable the hardware channel in brightness_set() when value
>   is zero. Previously only the ILED DAC was zeroed while the channel
>   remained enabled, causing residual current through the enabled channel
>   and a visible dim glow on the LED.
> 
> --- Documentation ---
> 
>   Patch 10: Correct and extend the hw_pattern documentation. The maximum
>   pattern duration was stated as 5660ms but the correct value derived
>   from the prescaler formula is 5610ms. The repeat field documentation
>   is also corrected and the brightness range is made explicit.
> 
> --- Testing ---
> 
> Tested on LED1202 hardware via I2C. Register state verified with i2cget
> at each step. Correct LED behaviour confirmed across pattern cycling,
> infinite repeat, pattern_clear, and direct brightness control with
> trigger=none.
> 
> --- Changes in v2 ---
> 
>   Patch 3: Fix commit message wording — programmed durations were ~22ms
>   too short, not too long.
>   Patch 7: Fix Signed-off-by typo.
>   Patch 10: Add missing quotes around commit subject in Fixes: tag.
> 
> v1: https://lore.kernel.org/all/WA0P291MB03850F4E9B4EC7389FE89779C5052@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM/
> 
> Manuel Fombuena (10):
>   leds: st1202: stop pattern sequence before reprogramming
>   leds: st1202: validate pattern input before stopping the sequence
>   leds: st1202: fix pattern duration register calculation
>   leds: st1202: fix pattern_clear to explicitly mark unused slots as
>     skip
>   leds: st1202: reset PAT_REP to POR default in pattern_clear
>   leds: st1202: restore Pattern0 PWM to full on after clearing pattern
>   leds: st1202: fix spurious pattern sequence start in setup
>   leds: st1202: fix brightness having no effect while pattern mode is
>     active
>   leds: st1202: disable channel when brightness is set to zero
>   leds: st1202: correct and extend hw_pattern documentation
> 
>  Documentation/leds/leds-st1202.rst |  9 ++-
>  drivers/leds/leds-st1202.c         | 95 ++++++++++++++++++------------
>  2 files changed, 62 insertions(+), 42 deletions(-)
> 
> -- 
> 2.54.0
> 

-- 
Lee Jones

