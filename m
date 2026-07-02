Return-Path: <linux-leds+bounces-8870-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TOO7BgimRmreawsAu9opvQ
	(envelope-from <linux-leds+bounces-8870-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 19:55:20 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 633226FBB62
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 19:55:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=FhbolNdQ;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8870-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8870-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7500F3020870
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 17:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35B1A361DC3;
	Thu,  2 Jul 2026 17:55:18 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F265C37A83C
	for <linux-leds@vger.kernel.org>; Thu,  2 Jul 2026 17:55:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783014918; cv=none; b=YAA3LAn6y7qEw2/0rS8SLXPRdoPguCUqLxmhAYymugk9yNKv/a8oUTaQgBm9xhxB5vHCLHw3Ie/+WLwsqx7QIK5y4Nwg32AZYLIc+tVLT2cAMrxzMin1rb6V9WKAuLZgttr8Oc5fY+cfY2VaKhxYiOZkfXsLD+B4TbqqV9Irpc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783014918; c=relaxed/simple;
	bh=kmBgLA7qZx//OuBSAP4PlJv+8mqc5KFGQP83aBpoUSM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ldfmCAFJksCmjkr7rK+SZF7kpU3YE5fc+zYZMnBrHWRgHQQ/e9Scv+XQDMZmaqa2viucU23sUllGZBdPOKT/XFugK5bD4GTzpM/BdCRhURpNEwrYLo0D0G0KyEiywJG5yZHu/DM246BqJsX+MaUkDmL5Oqp9540OGkvsVtchns8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FhbolNdQ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A03D21F00A3A;
	Thu,  2 Jul 2026 17:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783014916;
	bh=bLsH3+MMpH6GKGF/6PuPvsm0X5C8+BAF1O9Z3nywyJk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FhbolNdQ/ONJ9ecmOodmcFFfwF74JK239fmhf7isuVe/RPHEga0K8mvoJt6SMon2j
	 lbOt2BtNFI7FiPq9LKm6ckNSHOhc2sLfbBs5WJirZmtRCL2UHUHhjsgoYJ9Ordm60Q
	 KXTh1mVmotRmMfpI6o5rGECsKI7yL3yoaYWBVotHmI6VQhhux7100HIeUii64afe1G
	 enBohCBe6OXk9RuUIaVA1QFyBfR8cpBNMPMpJZKbrSn3k0Zz87lf+3BfdsVOVvTDgb
	 RMI9S5F7+S/txprOhB/R9vzqPr3MIDDDxvFONCHGubou4c5Mcb+K0EjubIcS1KiOU6
	 R3WZIY85bc9mw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/9] leds: st1202: set all pattern PWM slots to full
 after clearing pattern
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <GV1PR08MB849765352C4031BD2D800207C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB84972A16ED557BFB96D63F57C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB849765352C4031BD2D800207C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 17:55:16 +0000
Message-Id: <20260702175516.A03D21F00A3A@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-8870-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[outlook.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fombuena@outlook.com,m:linux-leds@vger.kernel.org,m:lee@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,sashiko.dev:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,outlook.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 633226FBB62

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [Medium] The commit message hallucinates details about the baseline code =
behavior, falsely claiming it previously restored Pattern0 to full duty cyc=
le.

Pre-existing issues:
- [High] Clearing a pattern on one LED destructively halts the global seque=
ncer and zeroes shared duration registers, breaking active patterns on all =
other channels.
- [High] The driver provides a non-blocking `brightness_set` callback that =
incorrectly performs sleeping operations, causing panics in atomic contexts.
- [Medium] Programming a shorter pattern fails to clear trailing sequence s=
teps, causing leftover pattern steps to execute.
- [Medium] The user-provided 8-bit brightness is written directly to a 12-b=
it PWM register without scaling, causing patterns to be extremely dim.
--

commit 030b013dca5ca1bf862e53e8c7cfe3288cb86967
Author: Manuel Fombuena <fombuena@outlook.com>
Subject: leds: st1202: set all pattern PWM slots to full after clearing pat=
tern

The commit alters st1202_led_pattern_clear() to set all 8 PWM slots
to ST1202_PATTERN_PWM_FULL. This aims to prevent unintended blinks
if another channel starts the global sequencer.

> pattern_clear() zeros all PWM registers then restores only Pattern0 to
> full duty cycle. Patterns 1-7 are left at zero.

[Severity: Medium]
Is this description of the previous behavior accurate?

The baseline code appears to iterate over all patterns and set them to
LED_OFF, without restoring Pattern0 to full duty cycle. Could the commit
message be updated to precisely reflect the original baseline behavior?

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
>  		if (ret !=3D 0)
>  			return ret;
> =20

[Severity: High]
This is a pre-existing issue, but does clearing a pattern on one LED
destructively halt the global sequencer for all channels?

If a user configures a pattern on LED0, and then clears the pattern on LED1,
st1202_led_pattern_clear() writes to the global ST1202_CONFIG_REG:

    ret =3D st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHF=
T);

And then zeroes the shared ST1202_PATTERN_DUR registers:

    ret =3D st1202_write_reg(chip, ST1202_PATTERN_DUR + patt, 0);

Since this patch now sets all PWM slots to ST1202_PATTERN_PWM_FULL for the
cleared channel, making it immune to the sequencer state, is it still
necessary to stop the sequencer and zero the shared durations in this
per-channel callback?


[Severity: High]
This is a pre-existing issue, but is it possible for the brightness_set
callback to perform sleeping operations in an atomic context?

The driver assigns st1202_brightness_set to the non-blocking callback
pointer in st1202_dt_init():

    led->led_cdev.brightness_set =3D st1202_brightness_set;

However, st1202_brightness_set() acquires a mutex which can sleep:

    guard(mutex)(&chip->lock);

Since the LED core can call brightness_set from atomic contexts (like
softirqs used by the timer trigger), could this cause a scheduling while
atomic kernel panic? Would it be better to rely solely on
brightness_set_blocking for this driver?


[Severity: Medium]
This is a pre-existing issue, but would programming a shorter pattern fail
to clear the trailing sequence steps?

In st1202_led_pattern_set(), the loop terminates exactly at len:

    for (int patt =3D 0; patt < len; patt++) {

If a user programs a pattern of length 8, and later programs a shorter
pattern of length 4, the hardware will continue executing the leftover
non-zero steps from the previous pattern. Should the driver explicitly
zero the duration register of the len-th step to mark the end of the
sequence?


[Severity: Medium]
This is a pre-existing issue, but could the user-provided 8-bit brightness
be written directly to a 12-bit PWM register without scaling?

In st1202_led_pattern_set():

    ret =3D st1202_pwm_pattern_write(chip, led->led_num, patt,
                                   pattern[patt].brightness);

Since the 8-bit value (0-255) is written directly into the 12-bit register
(0-4095), the maximum possible pattern brightness is only about 6 percent of
the LED capability. Should this brightness value be scaled before writing it
to the hardware?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB84972A16ED=
557BFB96D63F57C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D4

