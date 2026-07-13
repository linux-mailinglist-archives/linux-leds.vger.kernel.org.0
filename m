Return-Path: <linux-leds+bounces-9065-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MULICUUGVWpMjAAAu9opvQ
	(envelope-from <linux-leds+bounces-9065-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 17:37:41 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABDB74D234
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 17:37:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=JvSJVZOB;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9065-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-9065-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7520630021E0
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 15:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 770792F12C5;
	Mon, 13 Jul 2026 15:37:15 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADA830C610
	for <linux-leds@vger.kernel.org>; Mon, 13 Jul 2026 15:37:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783957035; cv=none; b=hhnWacLjGnXkpT6tG9LVOXnl1u3gv37y8b7s1nq4cCD5+PdoZXNqdPCxX078QohYHZ8c40L4ofMWqMXVyW3c7L/co/ql4RmobZG4d3mrqRVz8aa5eQnvpm/a8IWYfpZdMHVnGPXBuaqCtBpPIdk6PKNn5lVrJlkHYdSysiWErTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783957035; c=relaxed/simple;
	bh=liFRSLjIJYZ87eDaB7wLOInCGL9aDhgHWHFPBLLwyn8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eE2kr0cb34pxSDhWjHlrqbLab5yfnh1zv8KXCQKraugQ1t+e7NM/CldHS/Ex4BoDFXo9gndyPj6Sv/D+nhBKqpV5uTQ7FtFFz4Qw12hQw66wjk9iIgtMiGHhjfPiYvNHPPuZFXnlxYMAOi2/zO/zE4S2uvqY7LeZkTU2yO9PJ1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JvSJVZOB; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 962DC1F00A3A;
	Mon, 13 Jul 2026 15:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783957033;
	bh=aEcRCGIvtLwJoHZeWJHseYz+UBzBe1Dvv4EX3rS8HCQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JvSJVZOB/ATVwzwEfGJgapA8wZHGFYATTjeLljqzy5YQhE7vEkkHra6S4xBZsVBHC
	 4F7rNob03J+PrGdrMHBiNOtDjLgQVIX0U1DiK/AJz65JVabwxrM2F5G30hsDPb3PIo
	 U/SAG6m8/xFaVBaTGPcFvKBcy5vXl9vdTSoyJw3wA+jaVCfSFbbNVX7UkYQUbrgIwe
	 qQNrUlED2pQ/LjVFIUZEA6y5Deso6J0d2l4OO1fsPyCu0OUG5YlCwAHgeKBNqouvS9
	 0ZAWuqb0Oa4yM2uuCVqWuZBdINy4ElVvaid12zEvFdX05XHhmlNv/b0RQkx0W1eIVL
	 s7g9UIiCVL+Pw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] leds: st1202: add hardware-accelerated blink
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <GV1PR08MB84973ADB74B084B108FFE389C5FA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497C5B8CEB2CE19743DFCFFC5FA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB84973ADB74B084B108FFE389C5FA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 15:37:13 +0000
Message-Id: <20260713153713.962DC1F00A3A@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-9065-lists,linux-leds=lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:fombuena@outlook.com,m:linux-leds@vger.kernel.org,m:lee@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[outlook.com];
	FORWARDED(0.00)[lists@lfdr.de];
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
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8ABDB74D234

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] st1202_blink_set() destructively zeroes the PWM pattern registers =
for all other active LED channels, forcing them dark and breaking their ste=
ady states.
- [Medium] Blink brightness is hardcoded to maximum (`U8_MAX`), ignoring us=
er-configured levels.
- [Low] The commit message description is not capitalized, violating LED su=
bsystem naming conventions.

Pre-existing issues:
- [High] The sleepable st1202_brightness_set() function is incorrectly assi=
gned to the non-blocking brightness_set callback.
--

--- Patch [1]: [PATCH 1/1] leds: st1202: add hardware-accelerated blink sup=
port ---
commit 2db7bf5ac4afb8af5d3c0f74d2f24a829da7bc4f
Author: Manuel Fombuena <fombuena@outlook.com>

leds: st1202: add hardware-accelerated blink support

This patch implements blink_set() to enable hardware-accelerated blinking v=
ia
the timer trigger. It uses the LED1202 pattern engine to sequence full
brightness and off periods, sharing timing registers globally.

> leds: st1202: add hardware-accelerated blink support

[Severity: Low]
This isn't a bug, but the subsystem guidelines request capitalizing the
description after the subsystem prefix. Should this be "Add
hardware-accelerated blink support"?

> diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
> index 168df5ecf27b7..fc784a854a33b 100644
> --- a/drivers/leds/leds-st1202.c
> +++ b/drivers/leds/leds-st1202.c
[ ... ]
> +static int st1202_blink_set(struct led_classdev *led_cdev,
> +			unsigned long *delay_on, unsigned long *delay_off)
> +{
[ ... ]
> +	/* Zero out PWM for all other active channels to prevent them from blin=
king */
> +	for (int i =3D 0; i < ST1202_MAX_LEDS; i++) {
> +		if (!chip->leds[i].is_active || i =3D=3D led->led_num)
> +			continue;
> +		ret =3D st1202_pwm_pattern_write(chip, i, 0, LED_OFF);
> +		if (ret)
> +			return ret;
> +		ret =3D st1202_pwm_pattern_write(chip, i, 1, LED_OFF);
> +		if (ret)
> +			return ret;
> +	}

[Severity: High]
Does this code force all other active LEDs on the same chip to go dark and
lose their configured states?

When hardware blinking is enabled on one LED, writing LED_OFF to the patter=
n 0
and 1 PWM registers for other active LEDs seems like it would permanently c=
lear
their steady states (for instance, if they were previously configured to be
constantly ON).

> +
> +	ret =3D st1202_pwm_pattern_write(chip, led->led_num, 0, ST1202_PATTERN_=
PWM_FULL);
> +	if (ret)
> +		return ret;
> +	ret =3D st1202_pwm_pattern_write(chip, led->led_num, 1, LED_OFF);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D st1202_write_reg(chip, ST1202_PATTERN_DUR,
> +				st1202_prescalar_to_miliseconds(on));
> +	if (ret)
> +		return ret;
> +	ret =3D st1202_write_reg(chip, ST1202_PATTERN_DUR + 1,
> +				st1202_prescalar_to_miliseconds(off));
> +	if (ret)
> +		return ret;
> +
> +	for (int patt =3D 2; patt < ST1202_MAX_PATTERNS; patt++) {
> +		ret =3D st1202_write_reg(chip, ST1202_PATTERN_DUR + patt, 0);
> +		if (ret)
> +			return ret;
> +	}

[Severity: High]
Does clearing the global durations for patterns 2 through 7 here break cust=
om
patterns that might be running on any other LEDs?

> +
> +	ret =3D st1202_write_reg(chip, ST1202_PATTERN_REP, U8_MAX);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, U8_MAX);

[Severity: Medium]
Is it intentional to hardcode the blink brightness to maximum (U8_MAX)?

When the timer trigger starts a blink, it sets led_cdev->blink_brightness to
the user's desired intensity. Should this register write use that configured
level instead of always causing the LED to blink at full intensity?

[ ... ]
> @@ -301,6 +382,7 @@ static int st1202_dt_init(struct st1202_chip *chip)
>  		led->led_cdev.pattern_set =3D st1202_led_pattern_set;
>  		led->led_cdev.pattern_clear =3D st1202_led_pattern_clear;
>  		led->led_cdev.default_trigger =3D "pattern";
> +		led->led_cdev.blink_set =3D st1202_blink_set;
>  		led->led_cdev.brightness_set =3D st1202_brightness_set;
>  		led->led_cdev.brightness_get =3D st1202_brightness_get;

[Severity: High]
This is a pre-existing issue, but should st1202_brightness_set() be assigned
to brightness_set?

The st1202_brightness_set() function acquires a mutex and performs I2C writ=
es
which can sleep:

st1202_brightness_set() {
    guard(mutex)(&chip->lock);
    ...
}

The LED core uses the brightness_set callback in atomic contexts like softw=
are
timer interrupts. Should this driver only implement and assign
brightness_set_blocking to prevent scheduling while atomic bugs?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB84973ADB74=
B084B108FFE389C5FA2@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D1

