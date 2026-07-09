Return-Path: <linux-leds+bounces-8983-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Zzv8JPzzTmpIXgIAu9opvQ
	(envelope-from <linux-leds+bounces-8983-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 09 Jul 2026 03:06:04 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF41F72B8B5
	for <lists+linux-leds@lfdr.de>; Thu, 09 Jul 2026 03:06:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=JiXHKJic;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8983-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8983-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8469B31B9BFD
	for <lists+linux-leds@lfdr.de>; Thu,  9 Jul 2026 00:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C815395AFE;
	Thu,  9 Jul 2026 00:55:35 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF08F396D25;
	Thu,  9 Jul 2026 00:55:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783558535; cv=none; b=NINeK7J3pL1v1rcQuSh8/J6ar3FoEP6Liu4jjTaX8oG6Dbw9Otvz4fdRJhY8o2K+XVw457fsAJ7G2qS8LKIYN2epbwObWL+G6yTpCcMJ1sKlaoEeMdhjeIdY1XmY2k9bb4moPNJBzWsY2OLVFJIH/WSA22yYLWb5L9Pg1QRqvIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783558535; c=relaxed/simple;
	bh=VZbjTj8RNeP20M959Sjq3LuiFicJTyW5BvZ5DrIl8HY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rlhYpGzCg8BFcBrWI4rgViwwy7xwPf+hQVgy+v/VAxOAORxqN/6hIcBYqmpSoGjjoTp5Q56yZxv8N2jPQBldYhP6geC5tMB1RtjumJUVBSMB2HVUS35/VOJeOOEXxj5aXtGSLkdNbRFfP5wkMSX0R2WIX3D4Dqn3JabxJE1dInY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JiXHKJic; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6680A1F000E9;
	Thu,  9 Jul 2026 00:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783558533;
	bh=R+tcRO3dTcE+0g7iHvZYOceKT7rkmUjsf6KBSAe4TKQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JiXHKJicQmpKI8+Iau3xaDTPxeKk7nXtCfkn1A65GXcMDR2LFaujcbWS4n9CaKQY+
	 EQqlRjnmCDboiwz26+M1MhBgc+fEJvvaBXhe9/upviF72KTT8pz8QNA8unad9gvTrl
	 kOA662uI6fIdMJ1XgkxzERBFyeJ2IHQgAcqKx0ZhrYjNvVREChZHgTT1rgNau9KcV1
	 2oI8hbzAEwHMFcFLEP17ucHXLOjHHu2bApRcW+tTH3N7QrPTXEYGM7ziFRWA9RSgsm
	 1/20TCftl8tqbWTnvSXgBSyG1eGf7Yo5vHhfdgnIuytI/eaiRlljR7Ihd8rWFZTqDJ
	 u+1YHJLv7GT6A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 2/2] leds: ltc3220: Add Support for LTC3220 18
 channel LED Driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Edelweise Escala" <edelweise.escala@analog.com>
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260709-ltc3220-driver-v13-2-9b53237642eb@analog.com>
References: <20260709-ltc3220-driver-v13-0-9b53237642eb@analog.com>
 <20260709-ltc3220-driver-v13-2-9b53237642eb@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 00:55:32 +0000
Message-Id: <20260709005533.6680A1F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8983-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,vger.kernel.org:from_smtp,smtp.kernel.org:mid,analog.com:email,lists.linux.dev:replyto,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:edelweise.escala@analog.com,m:devicetree@vger.kernel.org,m:linux-leds@vger.kernel.org,m:lee@kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DF41F72B8B5

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Aggregated LED mode breaks after suspend/resume because regcache_s=
ync() overwrites LEDs 2-18 with zeros.
- [Medium] Missing LED_CORE_SUSPENDRESUME flag and missing locking in suspe=
nd/resume handlers allow race conditions.
--

--- Patch [2]: [PATCH v13 2/2] leds: ltc3220: Add Support for LTC3220 18 ch=
annel LED Driver ---
commit 530249002ce164e8156c89d4dcd1994b3713c0c8
Author: Edelweise Escala <edelweise.escala@analog.com>

leds: ltc3220: Add Support for LTC3220 18 channel LED Driver

Add driver for the LTC3220 18-channel LED driver with I2C interface, indivi=
dual
brightness control, and hardware-assisted blink/gradation features.

> diff --git a/drivers/leds/leds-ltc3220.c b/drivers/leds/leds-ltc3220.c
> --- /dev/null
> +++ b/drivers/leds/leds-ltc3220.c

[ ... ]

> @@ -371,20 +371,11 @@ static int ltc3220_suspend(struct device *dev)
>  {
>  	struct ltc3220 *ltc3220 =3D i2c_get_clientdata(to_i2c_client(dev));
>  	int ret;
> =20

[Severity: Medium]
Should ltc3220->lock be held here?

Because LED_CORE_SUSPENDRESUME is not set on the led_classdev, triggers and
sysfs writes can still fire during suspend, potentially racing with these
state changes and executing I2C writes while the device is in shutdown.

>  	ret =3D regmap_update_bits(ltc3220->regmap, LTC3220_COMMAND_REG,
>  				 LTC3220_SHUTDOWN_MASK, LTC3220_SHUTDOWN_MASK);
>  	if (ret)
>  		return ret;

[ ... ]

> @@ -391,24 +382,15 @@ static int ltc3220_resume(struct device *dev)
>  {
>  	struct ltc3220 *ltc3220 =3D i2c_get_clientdata(to_i2c_client(dev));
>  	bool quick_write_enabled;
>  	unsigned int command_reg;
>  	int ret;

[ ... ]

>  	if (quick_write_enabled) {
>  		ret =3D regmap_update_bits(ltc3220->regmap, LTC3220_COMMAND_REG,
>  					 LTC3220_QUICK_WRITE_MASK, 0);
>  		if (ret)
>  			return ret;
>  	}
> =20
>  	ret =3D regmap_update_bits(ltc3220->regmap, LTC3220_COMMAND_REG,
>  				 LTC3220_SHUTDOWN_MASK, 0);
>  	if (ret)
>  		return ret;
> =20
>  	usleep_range(10000, 12000);
> =20

[Severity: Medium]
Because the driver does not set LED_CORE_SUSPENDRESUME or hold ltc3220->lock
during resume, can an LED trigger fire during this sleep?

If a trigger calls ltc3220_set_led_data() here while QUICK_WRITE is tempora=
rily
disabled, the write would only apply to a single LED instead of broadcasting
to all channels.

>  	ret =3D regcache_sync(ltc3220->regmap);

[Severity: High]
Does this regcache_sync() break aggregated LED mode?

Since the cache for LEDs 2-18 contains zeros from their initial state, and
QUICK_WRITE is disabled during the sync, this looks like it will explicitly
write zeros to those channels, leaving most LEDs permanently off after resu=
me.

>  	if (ret)
>  		return ret;

[ ... ]

> @@ -499,19 +481,10 @@ static int ltc3220_probe(struct i2c_client *client)

[ ... ]

>  	/* Second pass: register LEDs after validation */
>  	device_for_each_child_node_scoped(&client->dev, child) {
>  		struct led_init_data init_data =3D {};
>  		struct ltc3220_uled_cfg *led;
>  		u32 source;

[ ... ]

>  		init_data.fwnode =3D child;
>  		init_data.devicename =3D "ltc3220";
> =20
>  		led_index =3D source - 1;
>  		led =3D &ltc3220->uled_cfg[led_index];
> =20

[Severity: Medium]
Does this led_cdev need the LED_CORE_SUSPENDRESUME flag set in its flags
field so the LED core knows to suspend triggers during system suspend?

>  		ret =3D devm_led_classdev_register_ext(&client->dev, &led->led_cdev, &=
init_data);
>  		if (ret)
>  			return dev_err_probe(&client->dev, ret, "Failed to register LED class=
\n");
>  	}
> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-ltc3220-dr=
iver-v13-0-9b53237642eb@analog.com?part=3D2

