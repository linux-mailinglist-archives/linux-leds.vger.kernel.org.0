Return-Path: <linux-leds+bounces-8872-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id djSqLWevRmpKbgsAu9opvQ
	(envelope-from <linux-leds+bounces-8872-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 20:35:19 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 017F96FC1D0
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 20:35:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=RCpli4yz;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8872-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8872-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9652732D88A7
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 17:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EB2335F179;
	Thu,  2 Jul 2026 17:56:06 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A485361DC3
	for <linux-leds@vger.kernel.org>; Thu,  2 Jul 2026 17:56:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783014966; cv=none; b=Zbujx5Dz50N79z/XfOIZx5Q8J4GM1Qraa4wKGyF0e9nptt9HUNwAkWzvoEZHqcs995Ko1qi4ZKivBZlzF8MZTk6f17NykU6+rddRpFiQA5w/XHjGK4GB1S2KE+dulACNc9H0zqRcfZkia8+XOYEhb2bpCpH4WEG5e+b1DS87Fvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783014966; c=relaxed/simple;
	bh=M+KITOMCskLiX20robjtssNWzr+W2oUrHsvghamkdZw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FJ5jgq+6PgvVxKQYBy3snqnMQqgbtbsjCpwKePFU/8tOqej/r2nIbgEF7tLW4GmpZ1NiFZ7/4Wm3hRps2Ih5K9ONcGZGoxkIPZY7dhu3OBefM1NnRc8v92Iw2rV73atn0B10Oqd/5IR5I4vJ8+L4rkCRxRKRin8CorQ7x7C3Bck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RCpli4yz; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF84D1F000E9;
	Thu,  2 Jul 2026 17:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783014964;
	bh=jgSqCabi2FTH27JLAWki5tWfbo9Aldga6GbKR3hlxr0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RCpli4yzJ4FV4D2wg/goPVWe2trxrnJg3sOf8RCjPwBmm0xNgcDN1+k1fM3aNM2E2
	 iEmqZANiY2+wEC3SOGa+7sNERhgN/17JNx8hzMLyZiRaoru102cedBI1iWETTOf5Z4
	 +dxQ7gpBILzjaMxZiPwEnYU7cS3IvAf0hgKuRFxupg3424Qfv+dX7zdZtcjQ2vlwQB
	 nY53zk4kkDpceLiEnhExV0dAmyxT+CFGdm0q4vD+XcWePN8pOIM97xMbQFQY6QvoPI
	 scox4CzUpWYxwMt+kPBzQ12d/BZVg2TE0wj9FLZQCx9zPOySBdaA5RHcWulgW7Z4SQ
	 d0hayxma61T+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 6/9] leds: st1202: fix brightness having no effect
 while pattern mode is active
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <GV1PR08MB849785BF89E2291C387E1AF4C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB84972A16ED557BFB96D63F57C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB849785BF89E2291C387E1AF4C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 17:56:04 +0000
Message-Id: <20260702175604.AF84D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-8872-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[outlook.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fombuena@outlook.com,m:lee@kernel.org,m:linux-leds@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,outlook.com:email,lists.linux.dev:replyto,smtp.kernel.org:mid,sashiko.dev:url,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 017F96FC1D0

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] The newly added loop in `st1202_brightness_set` ignores I2C erro=
r returns, continuing blindly on bus failures.

Pre-existing issues:
- [High] The `st1202_brightness_set` function is incorrectly registered as =
the non-blocking `brightness_set` callback, but it sleeps by acquiring a mu=
tex and performing I2C operations.
--

commit d9b4d02ea7dfd72ef99f875246743455506af12f
Author: Manuel Fombuena <fombuena@outlook.com>

leds: st1202: fix brightness having no effect while pattern mode is active

This commit sets all 8 PWM slots for a channel to full duty cycle before
writing ILED to ensure brightness changes take effect when a hardware
pattern is running. It enables static brightness control without halting
the global sequencer.

> diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
> index b8a5712829009..4909985ade04b 100644
> --- a/drivers/leds/leds-st1202.c
> +++ b/drivers/leds/leds-st1202.c
> @@ -136,6 +136,8 @@ static void st1202_brightness_set(struct led_classdev=
 *led_cdev,
> =20
>  	guard(mutex)(&chip->lock);

[Severity: High]
This is a pre-existing issue, but does st1202_brightness_set() sleep in an
atomic context?

This function acquires a mutex and performs I2C operations which can sleep,
but it appears to be registered as the non-blocking brightness_set callback
in st1202_dt_init():

led->led_cdev.brightness_set =3D st1202_brightness_set;

Activating a software trigger (like 'timer' or 'heartbeat') executes
brightness_set() from a timer softirq context, where acquiring a mutex or
performing synchronous I2C operations is illegal and causes a system crash.

While not introduced by this patch, adding a loop inside this atomic
section that executes 16 additional synchronous I2C writes significantly
prolongs the illegal blocking duration.

> +	for (int patt =3D 0; patt < ST1202_MAX_PATTERNS; patt++)
> +		st1202_pwm_pattern_write(chip, led->led_num, patt, ST1202_PATTERN_PWM_=
FULL);

[Severity: Medium]
Is it safe to ignore the return value of st1202_pwm_pattern_write() here?

If an I2C transaction fails (e.g., due to a temporary bus error), this loop
does not break and unconditionally attempts all 8 iterations. Because the
underlying st1202_write_reg() internally calls dev_err() on failure, a
single bus error will cause 16 consecutive error messages to flood the
kernel log, while pointlessly blocking to attempt writes that are
guaranteed to fail.

Should the loop check the return value and abort early on failure?

>  	st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, value);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB84972A16ED=
557BFB96D63F57C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D6

