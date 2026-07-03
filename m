Return-Path: <linux-leds+bounces-8900-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Wbs9B64VR2plTAAAu9opvQ
	(envelope-from <linux-leds+bounces-8900-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 03:51:42 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4C86FDCD1
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 03:51:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=E9CXQAb9;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8900-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8900-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 10171300290D
	for <lists+linux-leds@lfdr.de>; Fri,  3 Jul 2026 01:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 517CF233134;
	Fri,  3 Jul 2026 01:51:36 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DEA1D6BB
	for <linux-leds@vger.kernel.org>; Fri,  3 Jul 2026 01:51:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783043496; cv=none; b=GO/0a5cuEv+dvVu0ODPMGtD3Md4XGL3poKdmWQFVpb8DZ8hGJHGrqelpnES+mq2SKCOUaI7JLs/4rm51MCiVUQ4SOYTv6yIsQHKewISCVLvJdZ9uMjp5j+OU4ZdirRJo+PY7vgOMhynurZza9Cq1kqM6/umn7MSjVY4ZEJYKlhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783043496; c=relaxed/simple;
	bh=cHTG7e/W2PZc9n6wac1SniD0zUXGNUBls9F7Sf4BRBU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e8j4F0BSrfQyb0CjWuY1WlMc+RHXGsrbNF55tT6Yyb3b13vTdp4cElXxiJgSbjkuIQ5NMHUJUIIL0YJiZy+T+y0AtBoO14cEc/UNl9EbDO/SQEnLQflljwtUrbyz8rqnYebm2qBG14cHSmgo22Mjy0bmdFBx//mNrYNePRBTKrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E9CXQAb9; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 119F31F000E9;
	Fri,  3 Jul 2026 01:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783043494;
	bh=arV99sbkA3eezHLTifitkNq67Fk6rQG4Mdf3Pur6bnQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E9CXQAb9FmCDwaUw6eaDkWfg7yZO8r5/KRC9OmFLqXlQtyulZhf67iaYCP8IcB1W4
	 IXmV5cB017yTA5RgaeV6AzzPyKcsZy/isIYHXHPFZhu3vCzH/AHw8fqIU4SkGHbL4i
	 ePQBKgoi3rYR0SVODFW0q7T0rmv9vHGG79zlTOBzha7ahalNzE4UPbJrqgQ+unu6no
	 WdpoGpoQ+REION/H83LqlOhLhZBKWcO7mNdL2/d+ay4j+q6t750ZZJlyEpRZkubxKS
	 tCaqlP5qIh92ZL3qPLkQ2jYzBlpeAYCfhB4+RJXYG7egZklswPMKR9ipCvlw9Jsz5i
	 vqrOvoTyG/jOA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] leds: pca9532: Fix inverted GPIO output polarity
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cosmo Chou" <chou.cosmo@gmail.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260703014201.69829-1-chou.cosmo@gmail.com>
References: <20260703014201.69829-1-chou.cosmo@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 01:51:33 +0000
Message-Id: <20260703015134.119F31F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-8900-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chou.cosmo@gmail.com,m:lee@kernel.org,m:linux-leds@vger.kernel.org,m:choucosmo@gmail.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,lists.linux.dev:replyto,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0E4C86FDCD1

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Silent register state corruption due to unchecked I2C errors in pc=
a9532_setled().
- [High] I2C read errors are silently masked and truncated in pca9532_gpio_=
get_value(), reporting invalid GPIO states.
- [High] A race condition during device removal can cause a use-after-free =
if an input event occurs after the workqueue is cancelled.
--

commit b1c20f70bc549eb29df798aedbdcc982c3294090
Author: Cosmo Chou <chou.cosmo@gmail.com>

leds: pca9532: Fix inverted GPIO output polarity

This patch corrects the GPIO output polarity in the pca9532 driver.
It fixes an issue where a requested logical high incorrectly enabled
the LED output driver, pulling the open-drain pin low, and updates
the input direction configuration to match.

> diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
> index f3bf59495b68d..2d37e00e459de 100644
> --- a/drivers/leds/leds-pca9532.c
> +++ b/drivers/leds/leds-pca9532.c
> @@ -327,9 +327,9 @@ static int pca9532_gpio_set_value(struct gpio_chip *g=
c, unsigned int offset,
>  	struct pca9532_led *led =3D &data->leds[offset];
> =20
>  	if (val)
> -		led->state =3D PCA9532_ON;
> -	else
>  		led->state =3D PCA9532_OFF;
> +	else
> +		led->state =3D PCA9532_ON;
> =20
>  	pca9532_setled(led);

[Severity: High]
This is a pre-existing issue, but does pca9532_setled() handle I2C read
failures safely?

When pca9532_setled() is called here, it performs an unchecked read:

drivers/leds/leds-pca9532.c:pca9532_setled() {
    ...
	reg =3D i2c_smbus_read_byte_data(client, LED_REG(maxleds, led->id));
	/* zero led bits */
	reg =3D reg & ~LED_MASK(led->id);
	/* set the new value */
	reg =3D reg | (led->state << LED_SHIFT(led->id));
	i2c_smbus_write_byte_data(client, LED_REG(maxleds, led->id), reg);
    ...
}

If i2c_smbus_read_byte_data() fails and returns a negative error code
like -EIO, this value is stored directly into a char, truncating it.

Could this result in masking the corrupted data and blindly writing it back,
permanently corrupting the state of the other three pins sharing this same
8-bit register?

> @@ -349,7 +349,7 @@ static int pca9532_gpio_get_value(struct gpio_chip *g=
c, unsigned offset)

[Severity: High]
This isn't a bug introduced by this patch, but does pca9532_gpio_get_value()
silently mask I2C read errors and report invalid GPIO states?

Looking at pca9532_gpio_get_value():

drivers/leds/leds-pca9532.c:pca9532_gpio_get_value() {
    ...
	unsigned char reg;

	reg =3D i2c_smbus_read_byte_data(data->client, PCA9532_REG_INPUT(offset));

	return !!(reg & (1 << (offset % 8)));
    ...
}

The result of i2c_smbus_read_byte_data() is stored in an unsigned char.
If the I2C read fails, the negative error code is truncated into a positive
8-bit value, which is then evaluated as valid GPIO input data.

Since the gpiolib .get callback returns an int and supports returning
negative error codes, could this truncation cause downstream drivers to
act on logically invalid input states instead of properly handling the
I2C failure?

>  static int pca9532_gpio_direction_input(struct gpio_chip *gc, unsigned o=
ffset)
>  {
>  	/* To use as input ensure pin is not driven */
> -	pca9532_gpio_set_value(gc, offset, 0);
> +	pca9532_gpio_set_value(gc, offset, 1);
> =20
>  	return 0;
>  }

[Severity: High]
This is a pre-existing issue, but is there a use-after-free race condition
during device removal if an input event occurs after the workqueue is
cancelled?

In pca9532_destroy_devices() (called from pca9532_remove), the workqueue is
cancelled:

drivers/leds/leds-pca9532.c:pca9532_destroy_devices() {
    ...
		case PCA9532_TYPE_N2100_BEEP:
			if (data->idev !=3D NULL) {
				cancel_work_sync(&data->work);
				data->idev =3D NULL;
			}
			break;
    ...
}

However, because data->idev is managed by devm_input_allocate_device(), it
remains fully registered until devres cleanup begins after pca9532_remove()
returns.

If an input event (like SND_BELL) is triggered in this window,
pca9532_event() will reschedule the work:

drivers/leds/leds-pca9532.c:pca9532_event() {
    ...
	schedule_work(&data->work);

	return 0;
}

When devres subsequently unregisters the input device and frees the data
structure, won't the unexpectedly scheduled work later execute and
dereference the freed data pointer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703014201.6982=
9-1-chou.cosmo@gmail.com?part=3D1

