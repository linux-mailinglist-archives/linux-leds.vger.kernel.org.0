Return-Path: <linux-leds+bounces-9091-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6tIqK+ZCV2ocIQEAu9opvQ
	(envelope-from <linux-leds+bounces-9091-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 15 Jul 2026 10:20:54 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4264B75BD05
	for <lists+linux-leds@lfdr.de>; Wed, 15 Jul 2026 10:20:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=IA4MjcN6;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9091-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-9091-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 78FD63018D3B
	for <lists+linux-leds@lfdr.de>; Wed, 15 Jul 2026 08:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAF7D332EA0;
	Wed, 15 Jul 2026 08:20:40 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C0D362130
	for <linux-leds@vger.kernel.org>; Wed, 15 Jul 2026 08:20:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784103640; cv=none; b=npQxPYAl77U9m4PgbDKEq1E+PnAkQ6uCAddC3IJkWbhh6tjBAObxNeZXHQLrivtZfW8ddFdBrvciLsdZpHvKl/76n/9LOu3tjx9zk02UginBAWPoGJOCMJKWyyBev5oOXhczAxghplcRX/s4MtxH+9nuGjmqr+hhH5p9zZq+TEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784103640; c=relaxed/simple;
	bh=hBvHR51jGfLcrTcsFR9ZrFBwG8sTfm/jvQCPHXFPEnI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J9OSO9nJ2Uf61EtlQ8SKtjDQQ7/1E0NxTTg0q5G2FJfCJx6eQcVRb08VOwdKC4V0LSCJwv/OdRCT+L194qMMiJ6BQkRfW4y8s5CMrCA5BcLvcYMN6xgLlwAwNaT8YyggwqcV7FoGcwPxAhAUuMSx+VkZ8ASaFwtk9Ab0P/uC9iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IA4MjcN6; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 032EB1F000E9;
	Wed, 15 Jul 2026 08:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784103639;
	bh=uBw4Ks+sSASmic0yxJzgLHrZAKhCUbTxK/eu7RUqzKQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IA4MjcN67psFoIypcrSiBMnFvs1g1KSQG+R3JJRC45vIsCn/HWzCfjn9XN1letI01
	 VntQ4g6NxyeCoqSVmu4AG2dLvkBKDErg8iy7fmtSPuR4SSHbYVUXaSqiZWTLPUsd6p
	 8OZ9IwolfnFuB1C7wcJ79msD2k6Z/Ir/Kv/9hXwclPrivgBDrQNtRiDMcsa6n4XPvS
	 UMN4LVuWr+g4vuJwAlPjumN+ANP+DuiZsh0Al5emb4QnS/IP3l+af8RxPrCSLXYTk+
	 ZxWIpboVES8QcDOUTPK7rnU7k/SnyWOOpwblSjZfSYjLl9EhYt0pd1bCHrP9KwlcNe
	 7MEuSg7HR8txw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: pca9532: Fix phantom device registration on
 missing hardware
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cosmo Chou" <chou.cosmo@gmail.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260715080747.1638097-1-chou.cosmo@gmail.com>
References: <20260715080747.1638097-1-chou.cosmo@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 08:20:38 +0000
Message-Id: <20260715082039.032EB1F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-9091-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,smtp.kernel.org:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sashiko.dev:url,lists.linux.dev:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4264B75BD05

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Race condition in driver teardown leading to a use-after-free =
on the `data` struct due to delayed unregistration of the devres-managed in=
put device.
- [High] Runtime I2C read errors are truncated and incorrectly treated as v=
alid hardware state, leading to silent hardware state corruption.
- [Low] The driver uses the unmanaged `led_classdev_register()` API instead=
 of the subsystem-mandated managed alternative.
- [Low] Reliance on the deprecated `label` Device Tree property instead of =
`color` and `function`.
- [Low] The driver prints explicit success/info messages to the kernel log =
upon successful probing and GPIO initialization.
- [Low] Failure to use `dev_err_probe` for error paths in the probe routine.
--

--- Patch [1]: [PATCH] leds: pca9532: Fix phantom device registration on mi=
ssing hardware ---
commit 3a305c67b3d567810075afd8ccec5a5e5fff8780
Author: Cosmo Chou <chou.cosmo@gmail.com>

leds: pca9532: Fix phantom device registration on missing hardware

The initial PWM and PSC register writes in pca9532_configure() do not
check the return values of i2c_smbus_write_byte_data(). If the I2C
device is physically absent from the bus, the write fails with -ENXIO.
However, the driver ignores this error and allows probe() to complete
successfully.

This results in the registration of phantom LED class devices and
gpiochips backed by non-existent hardware. Subsequent GPIO reads from
these phantom chips return bogus values (due to -ENXIO being truncated
to an unsigned char in pca9532_gpio_get_value()), silently corrupting
hardware state tracking in userspace.

Propagate the I2C write failures back to probe() so the driver core
can gracefully abort binding and release devres-managed resources.

> diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
> index 2d37e00e459de..b2e081c8f1393 100644
> --- a/drivers/leds/leds-pca9532.c
> +++ b/drivers/leds/leds-pca9532.c
> @@ -397,10 +397,14 @@ static int pca9532_configure(struct i2c_client *cli=
ent,
>  	for (i =3D 0; i < 2; i++)	{
>  		data->pwm[i] =3D pdata->pwm[i];
>  		data->psc[i] =3D pdata->psc[i];
> -		i2c_smbus_write_byte_data(client, PCA9532_REG_PWM(maxleds, i),
> -			data->pwm[i]);
> -		i2c_smbus_write_byte_data(client, PCA9532_REG_PSC(maxleds, i),
> -			data->psc[i]);
> +		err =3D i2c_smbus_write_byte_data(client, PCA9532_REG_PWM(maxleds, i),
> +						data->pwm[i]);
> +		if (err < 0)
> +			return err;
> +		err =3D i2c_smbus_write_byte_data(client, PCA9532_REG_PSC(maxleds, i),
> +						data->psc[i]);
> +		if (err < 0)
> +			return err;
>  	}
> =20
>  	data->hw_blink =3D true;

[Severity: Critical]
This isn't a bug introduced by this patch, but could this driver teardown
sequence lead to a use-after-free?

In pca9532_destroy_devices(), the workqueue is canceled:

pca9532_destroy_devices() {
    [ ... ]
    cancel_work_sync(&data->work);
    data->idev =3D NULL;
    [ ... ]
}

However, the input device is devm-managed and remains active until devres
unwinds later. If a user-space process sends an event (like EV_SND) during
this window, pca9532_event() can still be called:

pca9532_event() {
    [ ... ]
    schedule_work(&data->work);
    [ ... ]
}

This schedules work on the data structure just before devres frees it.
When the delayed work executes, will it dereference the freed data structur=
e?

[Severity: High]
This is a pre-existing issue, but does the driver mishandle hardware read
errors here?

In pca9532_setled(), the code reads from the hardware register:

pca9532_setled() {
    [ ... ]
    reg =3D i2c_smbus_read_byte_data(client, LED_REG(maxleds, led->id));
    /* zero led bits */
    reg =3D reg & ~LED_MASK(led->id);
    [ ... ]
}

If a transient I2C error occurs, i2c_smbus_read_byte_data() can return a
negative error code like -ENXIO. This signed error code is then used as
valid data, masked, modified, and written back to the device.

A similar situation occurs in pca9532_gpio_get_value():

pca9532_gpio_get_value() {
    [ ... ]
    reg =3D i2c_smbus_read_byte_data(data->client, PCA9532_REG_INPUT(offset=
));
    return !!(reg & (1 << (offset % 8)));
}

The negative error code is truncated, which might lead to false positive
or negative GPIO bit readings. Could this silently corrupt the hardware
state of other LEDs sharing the same register?

[Severity: Low]
This isn't a bug introduced by this patch, but does this registration comply
with the LED subsystem guidelines?

pca9532_configure() {
    [ ... ]
    err =3D led_classdev_register(&client->dev, &led->ldev);
    [ ... ]
}

The guidelines dictate that drivers should use managed APIs like
devm_led_classdev_register() to prevent resource leaks and simplify
lifecycle management.

[Severity: Low]
This is a pre-existing issue, but does the device tree parsing rely on
deprecated properties?

pca9532_of_populate_pdata() {
    [ ... ]
    if (of_property_read_string(child, "label",
                                &pdata->leds[i].name))
    [ ... ]
}

The LED subsystem deprecates the label property in favor of color and
function bindings. Extracting the legacy label property directly ignores
the standard naming conventions.

[Severity: Low]
This isn't a bug introduced by this patch, but do we need these explicit
success messages in the kernel log?

pca9532_probe() {
    [ ... ]
    dev_info(&client->dev, "setting platform data\n");
    [ ... ]
}

pca9532_configure() {
    [ ... ]
    dev_info(&client->dev, "gpios %i...%i\n",
    [ ... ]
}

The LED subsystem guidelines mention that drivers should not print
success log messages upon successful probing or GPIO initialization.

[Severity: Low]
This is a pre-existing issue, but shouldn't this error path use
dev_err_probe()?

pca9532_probe() {
    [ ... ]
    dev_err(&client->dev, "no platform data\n");
    return -EINVAL;
    [ ... ]
}

The LED subsystem guidelines mandate using dev_err_probe() to handle
probe failures.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715080747.1638=
097-1-chou.cosmo@gmail.com?part=3D1

