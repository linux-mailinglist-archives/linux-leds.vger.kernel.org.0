Return-Path: <linux-leds+bounces-8893-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pfqMJULrRmoGfgsAu9opvQ
	(envelope-from <linux-leds+bounces-8893-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 00:50:42 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CF96FD4E1
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 00:50:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=YAKuYoo7;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8893-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8893-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BDFF3010BB9
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 22:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D657B3C3C01;
	Thu,  2 Jul 2026 22:49:26 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67C2433E8F
	for <linux-leds@vger.kernel.org>; Thu,  2 Jul 2026 22:49:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783032566; cv=none; b=hCiXs2f5LBZgHqSgI95BWbCJvrqPPYcjIFSM0Wv29ced+4SvNAia0ASG+uaj//KxyENUmHlS3/EFPOc235hqrzqI0ytTzs2readKAXwVrwyJMYE/RCq5laxaayB8cdxCxKxAmL6xJjP0pZgWb6pM+Yo87mqCbNW6ff+xInNc5L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783032566; c=relaxed/simple;
	bh=iK6PiL2fUhAWlitsv+DiMXQgnMkjnyAKzVnYoJ7IfR8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kwiZbTBlrZpaXeqmvTPhRKIAVSoJi5aVBvrWfHG4osf/8gkd5WBCwrHFol5CujlorIVx3hd+PJxBkL/ngzvINyoF63cg0YLn4YabnoGhP3uypYJfmnylOaqkWMpthjr3JAK+nWEsKzYDlnmPo9Zrb0GKifdYFwDldVNr75cFq0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YAKuYoo7; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BEBA1F00A3A;
	Thu,  2 Jul 2026 22:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783032565;
	bh=PigX67YYlYWkpsiA489Z4ancLSOZqzGFd14Ji/zd3gQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YAKuYoo7fDIUIozw4BNXXDipmutVRTBfb13/YRAGeMFqC499xEVIdjfqzRo4xL6lh
	 HOmFj/Ku7MbcHjmnQ+Xz/ld+9gB8tVaShwax+Gcj+gC+RMh8esfxmk7RtaFl7DPfJb
	 4HIA50y/q0rS2CGTW8/WiHYhtJhR5tWAttr34MrOyI060D7ElJuMkekKc1tEYcsFfk
	 SM0kkUGXtUJXb3opfGAmyf8moK1pq5pVKfbD72tv8FlGi38cTidMpPRTbpf3QoFJnE
	 AsTsjp4y7GQlvjQ0H8ebX0wW4+QpiYefIUBi3+ymP/bkKQkq8Z6BWaCLcEBDn4apIo
	 K8M34nqCIk2MA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 6/9] leds: st1202: fix brightness having no effect
 while pattern mode is active
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <GV1PR08MB8497570FD162D0D42A9864E3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB8497570FD162D0D42A9864E3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 22:49:24 +0000
Message-Id: <20260702224925.2BEBA1F00A3A@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-8893-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[outlook.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fombuena@outlook.com,m:linux-leds@vger.kernel.org,m:lee@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,vger.kernel.org:from_smtp,smtp.kernel.org:mid,sashiko.dev:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,outlook.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 35CF96FD4E1

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [Medium] The return value of `st1202_pwm_pattern_write` is ignored, resul=
ting in missing error handling and I2C error log spam.

Pre-existing issues:
- [High] The driver assigns a sleeping function to the LED classdev `.brigh=
tness_set` callback, violating the atomic context constraint and exacerbati=
ng schedule-while-atomic bugs.
- [High] Per-channel pattern operations incorrectly overwrite global hardwa=
re state, breaking independent channel operation for all other active LEDs.
- [High] `st1202_led_pattern_set` does not scale the 8-bit brightness value=
s to the 12-bit PWM register scale, resulting in extremely dim patterns.
- [High] Device node references fetched during `for_each_available_child_of=
_node_scoped` are not properly acquired, resulting in Use-After-Free when t=
hey are accessed later during LED registration.
--

commit c4f0635e8d1cc229cdb504a2e19927bd1b7b1d3d
Author: Manuel Fombuena <fombuena@outlook.com>

leds: st1202: fix brightness having no effect while pattern mode is active

Once a hardware pattern is running (PATS=3D1), writing to the brightness
sysfs attribute only updates the ILED register. The visible output is
ILED x Pattern_PWM / 4095, so the change has little effect and the LED
never returns to steady static operation as the user expects.

> diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
> index b8a5712829009..4909985ade04b 100644
> --- a/drivers/leds/leds-st1202.c
> +++ b/drivers/leds/leds-st1202.c
> @@ -136,6 +136,8 @@ static void st1202_brightness_set(struct led_classdev=
 *led_cdev,
> =20
>  	guard(mutex)(&chip->lock);
> =20
> +	for (int patt =3D 0; patt < ST1202_MAX_PATTERNS; patt++)
> +		st1202_pwm_pattern_write(chip, led->led_num, patt, ST1202_PATTERN_PWM_=
FULL);

[Severity: Medium]
Does this loop need to handle errors from st1202_pwm_pattern_write()?=20

If the underlying I2C transaction fails, the function returns an error code,
but it is ignored here. This could result in multiple unnecessary writes and
I2C error log spam upon a hardware bus failure.

[Severity: High]
This is a pre-existing issue, but does assigning this function to the=20
brightness_set callback cause schedule-while-atomic panics?

The LED core expects brightness_set to be safe to call from atomic context
(like the timer trigger for software blinking), but st1202_brightness_set()
acquires a mutex and performs sleeping I2C writes. Adding this loop of up
to 16 additional I2C writes inside the callback exacerbates the blocking
behavior.

Should this driver use brightness_set_blocking instead?

>  	st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, value);
>  }

[Severity: High]
This is a pre-existing issue, but does st1202_led_pattern_clear() break
patterns for all other active LEDs?

When clearing a pattern on a single channel, the code overwrites the global
config register and zeroes out the shared pattern duration array:

st1202_led_pattern_clear() {
        ...
        ret =3D st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG=
_SHFT);
        ...
        ret =3D st1202_write_reg(chip, ST1202_PATTERN_DUR + patt, 0);
}

Since the LED1202 uses a single global sequencer and shared pattern duratio=
n=20
registers, it seems this halts and corrupts running patterns on all other
channels.

[Severity: High]
This isn't a bug introduced by this patch, but does st1202_led_pattern_set()
fail to scale 8-bit brightness values?

The driver initializes led_cdev.max_brightness =3D U8_MAX, meaning the patt=
ern
trigger passes brightness values in the range [0, 255]. However, these are
written directly to 12-bit PATTERN_PWM hardware registers:

st1202_led_pattern_set() {
        ...
        ret =3D st1202_pwm_pattern_write(chip, led->led_num, patt, pattern[=
patt].brightness);
}

Would this result in the patterns being visually very dim, as the maximum=20
brightness of 255 only scales to roughly 6% duty cycle on the hardware?

[Severity: High]
This is a pre-existing issue, but does st1202_dt_init() cause a use-after-f=
ree
during LED registration?

The device node references fetched during the scoped iterator loop do not s=
eem
to be properly acquired:

st1202_dt_init() {
        ...
        for_each_available_child_of_node_scoped(...) {
                led->fwnode =3D of_fwnode_handle(child);
        }
}

Because the scoped iterator drops its reference at the end of each iteratio=
n,
the raw pointer assigned to led->fwnode might drop to a zero refcount befor=
e=20
devm_led_classdev_register_ext() is called later in probe.

Should this be using fwnode_handle_get() to safely increment the refcount?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB8497C0B898=
789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D6

