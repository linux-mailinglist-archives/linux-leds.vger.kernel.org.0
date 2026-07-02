Return-Path: <linux-leds+bounces-8876-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a/1wC/+oRmrqbAsAu9opvQ
	(envelope-from <linux-leds+bounces-8876-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 20:07:59 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A42D6FBDB4
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 20:07:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="V99f/FXu";
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8876-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8876-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9281C30316C5
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 18:06:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AC23339719;
	Thu,  2 Jul 2026 18:06:49 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662BF3655D5
	for <linux-leds@vger.kernel.org>; Thu,  2 Jul 2026 18:06:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783015609; cv=none; b=skSx8zfOQRPTfgtLzv8UOstxqglU6FBhGBC699JdV4GkZ9BO6ZDtg7YDctqT91z86H3Sj1SID6lbXdvUnov6fIcbi0QYcOJ5PhbEAUdCk6P7Y5hGjy6hfTwjroKOnRSwHkOjsY5LhAKhJPk/GxccbqkImCRznBuw/fSIDFiSC78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783015609; c=relaxed/simple;
	bh=whCs9JTOEFx6V9FRmXmHnlAWqRxod5IodvUIbNpf/Zs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dEO4hIrten4tvGqRXD81rxdWaRPRtoWo5vRcMc9K2+TEBFEsPZb2xgexStEKh2cVyPIiRwnqhHMmtuP3mTmMV+h9kXaL4/Qbl9s8rJdCb9K8uL0TTt2egiNgapLBboW2tp50P1is4+xqm/e2ESIAo9g91iUo50xbMtyiALKdCLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V99f/FXu; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDE411F000E9;
	Thu,  2 Jul 2026 18:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783015608;
	bh=87r1KHfEbsqjxFcheeeLk3RGPAVbSSUe2zUWMD88T68=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V99f/FXurjgRwDBB/fvNCb+IrjzYxupy/vhFyZsyyDRT6dwktJuZbL7QYc1f0wtOS
	 cD2T5rWDP4qOrZduOy3QpGGIpPPLIN+1GGOG/3kMVBC/pNdL+uwfOvawjxIQ3/buVq
	 FPPMsaNsm3ZK0SGJavO+E+eg4AA3ugzdmBWKs6l8c82qkWdJeYnLvulShm6ZW2l/HP
	 ZU+7j8ey/RnEP8fTw15Op138Byxh2OAMrqh1C7cj9jQMcKAcxcn43J+SgfZVR1v96+
	 tcDVYUDbchcEQq4tNHGe4VNlqIQRFzTpJBYhT9Kf/cPesqvpBqcwX9J1hRsV4jgeyo
	 gz1lzQnt31P2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 9/9] leds: st1202: correct and extend hw_pattern
 documentation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <GV1PR08MB8497245CDA30E7304917EE72C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB84972A16ED557BFB96D63F57C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB8497245CDA30E7304917EE72C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 18:06:47 +0000
Message-Id: <20260702180647.CDE411F000E9@smtp.kernel.org>
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
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-8876-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,vger.kernel.org:from_smtp,outlook.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,smtp.kernel.org:mid,lists.linux.dev:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8A42D6FBDB4

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the driver viola=
tes the LED subsystem API contract by registering a sleeping function (`st1=
202_brightness_set`) as the non-blocking `brightness_set` callback. This fu=
nction acquires a mutex and calls I2C functions, which will cause a 'schedu=
ling while atomic' kernel panic when called from atomic context.
--

commit dab687d256f9aaff49be14575dcf7a85acc3dd4a
Author: Manuel Fombuena <fombuena@outlook.com>

leds: st1202: correct and extend hw_pattern documentation
   =20
Fix the repeat section: -1 is a valid value meaning infinite repeat,
as accepted by the ledtrig-pattern sysfs interface; only 0 and values
below -1 are rejected. The previous text incorrectly stated all negative
numbers were invalid. Also remove the redundant trailing sentence since
the behaviour is now covered inline.
   =20
Add the brightness range (0-255) to the hw_pattern section, which was
previously undocumented.

> diff --git a/Documentation/leds/leds-st1202.rst b/Documentation/leds/leds=
-st1202.rst
> index a2353549469ee..ed32eb3a27d45 100644
> --- a/Documentation/leds/leds-st1202.rst
> +++ b/Documentation/leds/leds-st1202.rst

[ ... ]

While this patch is a documentation update, there is a pre-existing issue i=
n the
corresponding C file:

drivers/leds/leds-st1202.c:

> static void st1202_brightness_set(struct led_classdev *led_cdev,
> 				enum led_brightness value)
> {
> 	struct st1202_led *led =3D cdev_to_st1202_led(led_cdev);
> 	struct st1202_chip *chip =3D led->chip;
>=20
> 	guard(mutex)(&chip->lock);
>=20
> 	for (int patt =3D 0; patt < ST1202_MAX_PATTERNS; patt++)
> 		st1202_pwm_pattern_write(chip, led->led_num, patt, ST1202_PATTERN_PWM_F=
ULL);
> 	st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, value);
> 	__st1202_channel_set(chip, led->led_num, !!value);
> }

[Severity: High]
This isn't a bug introduced by this patch, but does the driver violate the =
LED
subsystem API contract by registering a sleeping function
(st1202_brightness_set) as the non-blocking brightness_set callback?

This function acquires a mutex and calls I2C functions, which will cause a
'scheduling while atomic' kernel panic when called from atomic context.

Could this crash the kernel if a user configures an LED trigger like
ledtrig-timer or ledtrig-pattern that runs in softirq (atomic) context?

The trigger's timer callback calls led_set_brightness(), which is guaranteed
not to sleep, and synchronously invokes the driver's brightness_set callbac=
k.
Because st1202_brightness_set uses guard(mutex) and performs I2C transactio=
ns,
it sleeps in an atomic context, triggering a crash. Any user with sysfs acc=
ess
to configure LED triggers can trigger this path.

[ ... ]

> static int st1202_dt_init(struct st1202_chip *chip)
> {
[ ... ]
> 		led->led_cdev.max_brightness =3D U8_MAX;
> 		led->led_cdev.brightness_set_blocking =3D st1202_led_set;
> 		led->led_cdev.pattern_set =3D st1202_led_pattern_set;
> 		led->led_cdev.pattern_clear =3D st1202_led_pattern_clear;
> 		led->led_cdev.default_trigger =3D "pattern";
> 		led->led_cdev.brightness_set =3D st1202_brightness_set;
> 		led->led_cdev.brightness_get =3D st1202_brightness_get;
> 	}

[Severity: High]
This is a pre-existing issue, but by assigning st1202_brightness_set to the
non-blocking callback pointer, we risk atomic sleep panics.

Should this be assigned to brightness_set_blocking instead, and brightness_=
set
set to NULL so the LED core can correctly defer blocking operations to a
workqueue?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB84972A16ED=
557BFB96D63F57C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D9

