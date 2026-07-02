Return-Path: <linux-leds+bounces-8889-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uLkgK5PqRmrqfQsAu9opvQ
	(envelope-from <linux-leds+bounces-8889-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 00:47:47 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB8C6FD4A9
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 00:47:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="D/4Jgplz";
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8889-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8889-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 271DE3006501
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 22:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5869C3B992F;
	Thu,  2 Jul 2026 22:47:45 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1CD3D5674
	for <linux-leds@vger.kernel.org>; Thu,  2 Jul 2026 22:47:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783032465; cv=none; b=YSFXdQLCNWIZDdb2uPlAkM0vdO+VM87DZ+A9je6yEV80SoSD8YwHNHBb0Hg4IJnpgWUHIX36n4AVqqYYDWSQIYOcwNxcj10YpIZhUPG2KYk+l/hS+HZzq0c8SXutfD4TG+6Ek1zvSCpQ8LcRXuaUNJFq+ItwQGGadbW/4vTqUF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783032465; c=relaxed/simple;
	bh=wE1Cy762mxnBufGbVRQ7kdcsrlSLPEH1xFgHYCM5k+w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G3vVqRAmYen/sANbmLxu46orYsMTNZl6zckIYqy8tQ57cTmktf5ABlnJBr4OQdLJW5x9Rs8ZWwImKI9RpThm+D36xOTGc7xmW4BJyhNmYBdul+VuA9UsbqdV0hwyb+8vmQEZsxEJGqBGrZ93swKvWvkBOhCl1iKDruHzf/tNdOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D/4Jgplz; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC7C41F000E9;
	Thu,  2 Jul 2026 22:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783032462;
	bh=c3TYRqZ9JQzXAlPloZ/SPdOm3dKnCvULMq+5h1+XUFs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D/4JgplzmFj1z0yYIuHdz1aUt3LAfest24zUE+riB71Vqc2ZBw3Gn22j309kyUufa
	 sCnugsSILF+AcwoSLaHbIXzdUosBVlwHu9ZIixTZwadKORlfHro2ptmYFjeT7Fw1Cx
	 25HnciC9RKHBjtiY9D3lwutm/KpQ1C7K3bzUR0MDn68D5fxJ8/Jl/jj/th9gbczY3k
	 PZHueX2FTp97S5OBIKvFv8mDqBvLvvPEAdjnedstmVoU1trOQwrAcqEUCgmBXbUPbu
	 T8ZC6f5vcLoynadBTpADpu/0oMcHHUfqh+aC5F8hFCM7qhr2AXeLi004DPkIPDi+XN
	 X5zLnQbjthI5A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 7/9] leds: st1202: disable channel when brightness is
 set to zero
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <GV1PR08MB8497F11B30FE7D74CAA25135C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB8497F11B30FE7D74CAA25135C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 22:47:41 +0000
Message-Id: <20260702224741.EC7C41F000E9@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-8889-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,smtp.kernel.org:mid,outlook.com:email,sashiko.dev:url,lists.linux.dev:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1FB8C6FD4A9

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver assigns the sleeping `st1202_brightness_set` function t=
o the non-blocking `brightness_set` callback, causing 'scheduling while ato=
mic' panics.
- [High] The `st1202_led_set` function assigned to `brightness_set_blocking=
` fails to write the actual requested brightness value to the hardware.
- [High] Saving `fwnode_handle` from a child node without taking a referenc=
e inside a scoped iterator leads to a use-after-free.
- [Medium] The `brightness_get` callback silently drops I2C hardware errors=
, resulting in incorrect brightness state reporting.
- [Medium] Global hardware duration registers are corrupted by per-LED patt=
ern changes.
--

commit f5fe39d06324d4108bb5a3ab6d86700cd360c555
Author: Manuel Fombuena <fombuena@outlook.com>

    leds: st1202: disable channel when brightness is set to zero
   =20
    When brightness_set() is called with LED_OFF, only the ILED register is
    zeroed; the channel enable bit is left set from probe time. A hardware
    channel enabled with ILED=3D0 still draws a small residual current, cau=
sing
    a dim glow even when the LED is supposed to be off.
   =20
    Fix this by splitting st1202_channel_set() into a lockless inner functi=
on
    __st1202_channel_set() and a locking wrapper, then calling the inner
    function from brightness_set() while it already holds the mutex. The
    channel is now disabled when value is zero and re-enabled when non-zero,
    in the same lock region as the ILED write.

> diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
> index 4909985ade04b..2ecd36aae336a 100644
> --- a/drivers/leds/leds-st1202.c
> +++ b/drivers/leds/leds-st1202.c
> @@ -188,6 +160,40 @@ static int st1202_channel_set(struct st1202_chip *ch=
ip, int led_num, bool active

[ ... ]

> +static void st1202_brightness_set(struct led_classdev *led_cdev,
> +				enum led_brightness value)
> +{
> +	struct st1202_led *led =3D cdev_to_st1202_led(led_cdev);
> +	struct st1202_chip *chip =3D led->chip;
> +
> +	guard(mutex)(&chip->lock);

[Severity: High]
This isn't a bug introduced by this patch, but is it safe to use a mutex and
i2c operations in st1202_brightness_set()?

The led subsystem requires the brightness_set callback to not sleep, as it =
can
be invoked from atomic contexts like software blink timers in softirq conte=
xt.
This function acquires a mutex and performs i2c bus operations which can sl=
eep.

Should this driver implement only brightness_set_blocking instead to avoid
scheduling while atomic panics?

> +
> +	for (int patt =3D 0; patt < ST1202_MAX_PATTERNS; patt++)
> +		st1202_pwm_pattern_write(chip, led->led_num, patt, ST1202_PATTERN_PWM_=
FULL);
> +	st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, value);
> +	__st1202_channel_set(chip, led->led_num, !!value);
> +}
> +
> +static enum led_brightness st1202_brightness_get(struct led_classdev *le=
d_cdev)
> +{
> +	struct st1202_led *led =3D cdev_to_st1202_led(led_cdev);
> +	struct st1202_chip *chip =3D led->chip;
> +	u8 value =3D 0;
> +
> +	guard(mutex)(&chip->lock);
> +
> +	st1202_read_reg(chip, ST1202_ILED_REG0 + led->led_num, &value);

[Severity: Medium]
This is a pre-existing issue, but does this correctly handle i2c read failu=
res?

If st1202_read_reg() fails, the negative error code is dropped and it retur=
ns
the uninitialized value (which is 0). This could hide hardware failures and
trick the subsystem into believing the led is powered off.

Should it return the negative error code if the read fails?

> +
> +	return value;
> +}
> +
>  static int st1202_led_set(struct led_classdev *ldev, enum led_brightness=
 value)
>  {
>  	struct st1202_led *led =3D cdev_to_st1202_led(ldev);
> =20
>  	return st1202_channel_set(led->chip, led->led_num, !!value);
>  }

[Severity: High]
This is a pre-existing issue, but does this function actually write the
requested brightness value to the hardware?

It converts the brightness value to a boolean and toggles the channel enable
bit via st1202_channel_set(), but it seems to omit writing the actual
brightness value to the ST1202_ILED_REG0 register.

This means intermediate brightness levels might be ignored, and the led is =
only
toggled on or off with whatever brightness was previously configured.

> @@ -257,6 +263,10 @@ static int st1202_led_pattern_set(struct led_classde=
v *ldev,
>  	if (ret !=3D 0)
>  		return ret;
> =20
> +	ret =3D __st1202_channel_set(chip, led->led_num, true);
> +	if (ret !=3D 0)
> +		return ret;
> +

[Severity: Medium]
This is a pre-existing issue, but does setting a pattern on one led corrupt
the timing of concurrent patterns on other leds?

The duration registers are global to the entire chip. If multiple leds
configure patterns, they will overwrite these same global duration register=
s.

Also, st1202_led_pattern_clear() unconditionally zeroes all global duration
registers, which would break running patterns on all other leds.

>  	ret =3D st1202_write_reg(chip, ST1202_CONFIG_REG, (ST1202_CONFIG_REG_PA=
TSR |
>  							ST1202_CONFIG_REG_PATS | ST1202_CONFIG_REG_SHFT));

[Severity: High]
This is a pre-existing issue not shown in the diff, but could there be a
use-after-free in st1202_dt_init() when registering the led?

When using for_each_available_child_of_node_scoped(), it automatically calls
of_node_put() on the child device node at the end of each loop iteration.
Inside the loop, the driver saves the pointer via:

    led->fwnode =3D of_fwnode_handle(child);

but it doesn't increment the reference count. When the driver later registe=
rs
the led using led->fwnode, it accesses a node whose reference count has alr=
eady
been decremented. Could this be an issue if dynamic device tree overlays are
unloaded?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB8497C0B898=
789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D7

