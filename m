Return-Path: <linux-leds+bounces-8890-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0p2oBbHqRmrxfQsAu9opvQ
	(envelope-from <linux-leds+bounces-8890-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 00:48:17 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F326FD4B9
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 00:48:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="RQ+2IUY/";
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8890-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-leds+bounces-8890-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0DEAE301F8FE
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 22:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EA423C73EC;
	Thu,  2 Jul 2026 22:48:15 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8EA3D16FC
	for <linux-leds@vger.kernel.org>; Thu,  2 Jul 2026 22:48:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783032495; cv=none; b=chTqRbGuVxjxzA4pMYXKs0ao0qirzbUK7DGorZtG88pSGbATq/D4r6qKBXZ3uMM1wDIKY0Aeifikl9BZsc+4VHeNf0FrCWCOTmcmx+rgcnQTCN8+9cSsWcfMx4wqstZZXp8qmat+IieyvZ/0LF/j1Rfs3vPHpxv8DKVGw/fzz+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783032495; c=relaxed/simple;
	bh=yXEq4LdV/mPlHRm+PLu4jN8bXk6B7mQI3ZWxrUEE7j4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qXPzlk5hFpIzXxROL4NPjjCzaZ9jdYXyA+omJ7i8wKWkB67Ik0HFmtwesuOsqYO0zjlgkNCPoh4VQAzDR+cZsFruS/BhBFBOUpauQag0MY3UzFYOZkxqYQjPDOwyqiOlY6eibCBzIoacLNTbjQYtoxXPqXP+i6aMNERFnSt9+8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RQ+2IUY/; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 005581F000E9;
	Thu,  2 Jul 2026 22:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783032491;
	bh=F8FwrQVJbKe7q0rLs9TtSgD/u/etTd4AjrGSVJ8cFkg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RQ+2IUY/GqQA7Bac0U+UQ/LO5sM32DhPzBn4p5q1oGrJW+cCq6zODKN6ZjI+y6MHV
	 vxD07c3ZMA0K44XIK+HBvjgIqYt1lgL5k5U9JVLUTpO09XD/si3a/50oigQrzCwyhJ
	 poXf2EOe8Io56X9BH2JmQyBGC2WBSrJimKS6tmFqm5j9ZipiGNL2fOpe757nOKLFfc
	 qJhBeBwYSylkhgOMh6s4OvQINitAfb+/53wgjDRrz+soqgD5xid+fMoDJuXcfilVv1
	 0ZpUTdt7ujMJr5IFy8FoVhXcqPjcO2gIvANbzy4sM8ACmtXv6vziL9CsUAOxC/ohiX
	 uZSP+KWRYjEuw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 4/9] leds: st1202: set all pattern PWM slots to full
 after clearing pattern
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <GV1PR08MB849732C162CFE9E2C525AC16C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB849732C162CFE9E2C525AC16C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 22:48:10 +0000
Message-Id: <20260702224811.005581F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-8890-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[outlook.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fombuena@outlook.com,m:lee@kernel.org,m:linux-leds@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,outlook.com:email,smtp.kernel.org:mid,lists.linux.dev:replyto,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 96F326FD4B9

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] Trailing unused pattern slots retain 100% duty cycle configuration=
s, causing unintended maximum brightness flashes during shorter sequences.

Pre-existing issues:
- [Critical] The driver assigns a sleeping function to the non-blocking `br=
ightness_set` callback, causing kernel panics in atomic contexts.
- [High] Single-channel pattern operations uncontrollably zero out shared p=
attern durations, breaking active patterns on all other LEDs.
- [High] Pattern brightness values are written to 12-bit registers without =
scaling, causing extremely dim LED patterns.
- [High] The `brightness_set_blocking` callback fails to update the brightn=
ess level.
--

commit 49e6ce09aaa5b6711e25e1f900651af3d5a1bdcd
Author: Manuel Fombuena <fombuena@outlook.com>

leds: st1202: set all pattern PWM slots to full after clearing pattern

This commit updates pattern_clear() to set all 8 PWM slots for a channel
to ST1202_PATTERN_PWM_FULL (4095). This ensures that the channel responds
to the ILED value in static mode and doesn't remain dark if the global
sequencer is started by another channel.

> diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
> index b4adade49898e..3203b3768ec52 100644
> --- a/drivers/leds/leds-st1202.c
> +++ b/drivers/leds/leds-st1202.c
[ ... ]
> @@ -205,7 +206,7 @@ static int st1202_led_pattern_clear(struct led_classd=
ev *ldev)
>  		return ret;
> =20
>  	for (int patt =3D 0; patt < ST1202_MAX_PATTERNS; patt++) {
> -		ret =3D st1202_pwm_pattern_write(chip, led->led_num, patt, LED_OFF);
> +		ret =3D st1202_pwm_pattern_write(chip, led->led_num, patt, ST1202_PATT=
ERN_PWM_FULL);

[Severity: High]
If a pattern is later configured with len < 8 in st1202_led_pattern_set(),
will this cause the trailing unused slots to inherit a 100% duty cycle inst=
ead
of 0?=20

If another channel concurrently sets an 8-step pattern (configuring the
globally shared step durations to non-zero values for all 8 steps), wouldn't
the first channel's LED flash at maximum brightness during the trailing unu=
sed
steps?

[Severity: High]
This is a pre-existing issue, but does the following line uncontrollably
zero out chip-wide shared duration registers for a single channel's pattern
clear, breaking active patterns on all other channels?

drivers/leds/leds-st1202.c:st1202_led_pattern_clear()
		ret =3D st1202_write_reg(chip, ST1202_PATTERN_DUR + patt, 0);

[Severity: Critical]
This is a pre-existing issue, but does assigning a sleeping function
to the non-blocking brightness_set callback cause a panic when invoked
from atomic contexts (like hardware triggers or timer interrupts)?

drivers/leds/leds-st1202.c:st1202_brightness_set()
	guard(mutex)(&chip->lock);
	st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, value);

[Severity: High]
This is a pre-existing issue, but are pattern brightness values written
to 12-bit registers without scaling?

drivers/leds/leds-st1202.c:st1202_led_pattern_set()
		ret =3D st1202_pwm_pattern_write(chip, led->led_num, patt, pattern[patt].=
brightness);

Since ST1202 uses 12-bit PWM values (0 to 4095), writing the 8-bit
brightness value (0 to 255) directly into these registers without scaling
appears to cause extremely dim LED patterns.

[Severity: High]
This is a pre-existing issue, but does the brightness_set_blocking callback
fail to update the brightness level?

drivers/leds/leds-st1202.c:st1202_led_set()
	return st1202_channel_set(led->chip, led->led_num, !!value);

It looks like this discards the actual requested brightness value and acts
merely as an on/off boolean toggle, skipping writing the actual brightness
value to the ST1202_ILED_REG0 register.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB8497C0B898=
789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D4

