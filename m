Return-Path: <linux-leds+bounces-8904-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Qyx0HEM8R2qqUgAAu9opvQ
	(envelope-from <linux-leds+bounces-8904-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 06:36:19 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BED576FE737
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 06:36:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=IVgjY2iB;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8904-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8904-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1E14303AA97
	for <lists+linux-leds@lfdr.de>; Fri,  3 Jul 2026 04:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09233310651;
	Fri,  3 Jul 2026 04:31:58 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB581319848;
	Fri,  3 Jul 2026 04:31:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783053116; cv=none; b=i/wJymyNVMRz9VemI4J2wwNMSceVsIC7TLUoDwDHjDhVeUYGk0RmTmp67luaY6puphbksRuU1/5eYJn/3ULqMOZ4WSvMIVhbLKaIkVXRkmG4RgXQ46gsOsIZtnJr4pxy8L/eZiQo8tgG0Rieh+KzAEHZCEn/JBaMRHrGQ/+N3lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783053116; c=relaxed/simple;
	bh=VPlBo+oTUt4xBTlbhFWQ8YzVOaq11kAaMXTzlvCVwnU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PSWWYQJC7wdvYMbaS1mv0Demil9d8YlzXhH116Y+z9ieuF+DuDuIffI172tbRWuJLGff8Ivx00LDGsfQFbpUvk15znPrECGAayMkt0xJC4IGWzx6wGePNv93ox8Bn9dIwhNo/yUxWjzZzQz40nXAxT61rW8CPWoKXqkTBsWPd2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IVgjY2iB; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE9F11F000E9;
	Fri,  3 Jul 2026 04:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783053107;
	bh=BKgtEul0l149q2IZJ9Rsmdxx1N4tyD7YjB0lpQu37yo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IVgjY2iBwVf+zSyyUYEG1ix7Gp7LPmId6dU6Ocd2xC8ntpL40srIfyLjxDAvTJ2T+
	 zdsq7fWIbNp+SeSAXIh2hG6KXwuw5VubMmJOMtEy8eK1mY/F4NJEUyi7Xsmo0L3Xva
	 fLooiV7bXY3N0PVmEWlBOyp5adpejuc9wgELt//JS5cybF0x/xTW/TFIDyu64L9LX5
	 FAr1217RS44R0L/XddTOI0jZZAQqW23PPS9qqyJ9tb5lNVuBuJQiaAfK3dv5sP1rx2
	 sm4WmfkDmfZETQFcW337Cq1z3W6H+Zwo9/pA+cm0tXp7/SH/pB+BV6yOiV3yKUeswx
	 VVW4FupJ9DVyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 2/2] leds: ltc3220: Add Support for LTC3220 18
 channel LED Driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Edelweise Escala" <edelweise.escala@analog.com>
Cc: robh@kernel.org, lee@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260703-ltc3220-driver-v12-2-d4f0da2985e2@analog.com>
References: <20260703-ltc3220-driver-v12-0-d4f0da2985e2@analog.com>
 <20260703-ltc3220-driver-v12-2-d4f0da2985e2@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 04:31:46 +0000
Message-Id: <20260703043146.BE9F11F000E9@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-8904-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,analog.com:email,smtp.kernel.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sashiko.dev:url,lists.linux.dev:replyto];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:edelweise.escala@analog.com,m:robh@kernel.org,m:lee@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BED576FE737

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] In aggregated LED mode, regcache_sync() during resume incorrectly =
turns off all LEDs due to the hardware QUICK_WRITE broadcast feature.
- [High] Missing bounds checks in the second pass of child node iteration l=
eads to an out-of-bounds memory write if the device tree is modified concur=
rently.
- [Medium] The `pattern_set` callback silently ignores the `repeat` argumen=
t, breaking repeating LED patterns.
- [Medium] Setting LED_CORE_SUSPENDRESUME destructively interferes with har=
dware blink and gradation state restoration on resume.
--

commit f1453b8dca779cc861037537a42cea5f29931bc3
Author: Edelweise Escala <edelweise.escala@analog.com>

leds: ltc3220: Add Support for LTC3220 18 channel LED Driver

Add driver for the LTC3220 18-channel LED driver
with I2C interface, individual brightness control, and hardware-assisted
blink/gradation features.

> diff --git a/drivers/leds/leds-ltc3220.c b/drivers/leds/leds-ltc3220.c
> new file mode 100644
> index 0000000000000..f8e1f4bcd5529
> --- /dev/null
> +++ b/drivers/leds/leds-ltc3220.c

[ ... ]

> +static int ltc3220_pattern_set(struct led_classdev *led_cdev,
> +			       struct led_pattern *pattern,
> +			       u32 len, int repeat)
> +{
> +	struct ltc3220_uled_cfg *uled_cfg =3D container_of(led_cdev, struct ltc=
3220_uled_cfg,
> +							 led_cdev);

[Severity: Medium]
Does this code safely handle repeating patterns?=20

If a user requests a repeating pattern (e.g. repeat =3D -1 for infinite=20
looping) via sysfs, this function does not check the repeat parameter=20
and unconditionally returns 0.=20

By returning 0 instead of -EINVAL or -EOPNOTSUPP, the driver falsely=20
claims it natively handles the requested repeating pattern. The LED core=20
consequently skips setting up a software fallback timer, causing the LED=20
to perform a single ramp and permanently stop instead of looping.

> +	struct ltc3220 *ltc3220 =3D container_of(uled_cfg - uled_cfg->led_index=
, struct ltc3220,
> +					       uled_cfg[0]);

[ ... ]

> +static int ltc3220_resume(struct device *dev)
> +{
> +	struct ltc3220 *ltc3220 =3D i2c_get_clientdata(to_i2c_client(dev));
> +	int ret;
> +
> +	ret =3D regmap_update_bits(ltc3220->regmap, LTC3220_COMMAND_REG,
> +				 LTC3220_SHUTDOWN_MASK, 0);
> +	if (ret)
> +		return ret;
> +
> +	usleep_range(10000, 12000);
> +
> +	return regcache_sync(ltc3220->regmap);
> +}

[Severity: High]
Will this regcache_sync() turn off all LEDs in aggregated LED mode?

During ltc3220_reset(), all 18 ULED registers are written to 0, populating=
=20
the regmap cache with 0s for unused channels.

On resume, regcache_sync() writes all dirty registers in address order.=20
It first restores COMMAND_REG, enabling the QUICK_WRITE_MASK. It then=20
restores ULED_REG(0) to the active brightness, which broadcasts to all LEDs=
.=20

However, it subsequently syncs ULED_REG(1) through ULED_REG(17) using their=
=20
cached 0s. Because QUICK_WRITE is active, each of these writes broadcasts=20
0 to all 18 LEDs, turning them off and overwriting the restored state.

[ ... ]

> +static int ltc3220_probe(struct i2c_client *client)
> +{

[ ... ]

> +		led->led_cdev.blink_set =3D ltc3220_blink_set;
> +		led->led_cdev.pattern_set =3D ltc3220_pattern_set;
> +		led->led_cdev.pattern_clear =3D ltc3220_pattern_clear;
> +		led->led_cdev.flags =3D LED_CORE_SUSPENDRESUME;
> +	}

[Severity: Medium]
Does setting this flag break hardware blink and gradation state=20
restoration on resume?

Because the driver sets the LED_CORE_SUSPENDRESUME flag, the LED core force=
s=20
the brightness to 0 on suspend. ltc3220_set_led_data() executes this by=20
clearing the mode bits (LTC3220_NORMAL_MODE) in the regmap cache.

On resume, the driver correctly syncs the regmap cache, but it now contains=
=20
the wiped mode state. Finally, the LED core restores the previous brightnes=
s,=20
but does so via the basic setter, leaving the LED permanently in normal=20
(solid) mode instead of restoring the hardware blink/pattern.=20

Since the driver natively manages power management via chip shutdown, is=20
opting into the LED core's power management overrides necessary?

[ ... ]

> +	/* Second pass: register LEDs after validation */
> +	device_for_each_child_node_scoped(&client->dev, child) {
> +		struct led_init_data init_data =3D {};
> +		struct ltc3220_uled_cfg *led;
> +		u32 source;
> +
> +		ret =3D fwnode_property_read_u32(child, "reg", &source);
> +		if (ret)
> +			return ret;
> +
> +		init_data.fwnode =3D child;
> +		init_data.devicename =3D "ltc3220";
> +
> +		led_index =3D source - 1;
> +		led =3D &ltc3220->uled_cfg[led_index];

[Severity: High]
Can this sequence cause an out-of-bounds write to the uled_cfg array?

The first pass validates that the reg property is within 1 to=20
LTC3220_NUM_LEDS. However, the second pass re-iterates the device's=20
children via device_for_each_child_node_scoped(), re-reads the reg=20
property into source, but skips validation.=20

If a device tree overlay adds a new child node to the device concurrently=20
with the ltc3220_probe() execution, source could be out of bounds or 0.=20
The driver computes led_index =3D source - 1 and uses it to index=20
&ltc3220->uled_cfg[led_index].=20

Passing this invalid pointer to devm_led_classdev_register_ext() would=20
corrupt memory.

> +
> +		ret =3D devm_led_classdev_register_ext(&client->dev, &led->led_cdev, &=
init_data);
> +		if (ret)
> +			return dev_err_probe(&client->dev, ret, "Failed to register LED class=
\n");
> +	}
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703-ltc3220-dr=
iver-v12-0-d4f0da2985e2@analog.com?part=3D2

