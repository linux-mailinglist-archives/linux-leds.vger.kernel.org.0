Return-Path: <linux-leds+bounces-9054-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jtlJKB3kU2q/fwMAu9opvQ
	(envelope-from <linux-leds+bounces-9054-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2026 20:59:41 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E73E4745AD5
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2026 20:59:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=bXOiZBET;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9054-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-9054-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9AE6D30097EA
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2026 18:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48407397352;
	Sun, 12 Jul 2026 18:59:39 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75AA3090CD
	for <linux-leds@vger.kernel.org>; Sun, 12 Jul 2026 18:59:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783882779; cv=none; b=erLXSTAGctHgiLUqyMzCwdCFuIxycf1tHdfpEwLY5zmxu0oFqcK8HUZr7G9FbgS8JGWN6Fi5Iy8dkN9Lmj7uAHhPH/o7rvCcsNdyrXMXQmFk1OvmzgRiGRJ/lmP9gYB+Pj5nC0dCNNdvwuVqZZ0A0Qs1n1Bu2x80cnNO9Nb6adI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783882779; c=relaxed/simple;
	bh=j4XMCbWGz/NoCktTtEgiCJuWgaqGYcwuMcRIGtLXCio=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RCUHPN6ZlfULnFNd2ho0hdCFFwMWyRkfU2j1U/FyagEGZPaBMAraASv5eBX4iQzjaDAcGe/9fMuYe+JpPepb0x2cpaMdef18zB6RdHG5fKxV5rhdDpE2P+LhtHAKo6N/Vqop9LT7ICWhKkEPyEvNcgcwr4LYcTghUWFtq9APcyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bXOiZBET; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 525471F00A3A;
	Sun, 12 Jul 2026 18:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783882777;
	bh=OkUmLHKzuPNln0NyGwD0k2PNHBRw+kF5W5I/47KHhew=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bXOiZBETkry+t0BBl+f/WhuylTEKelFapcuO8SEVVuKDybXqUGBN/zKi1EHnTNLf+
	 DWWmw0GidkGuYz+BBxsjrepHlmgyMQ1+UUvxN9ycJ1ANOOxOm9UM7Px0BkH7mDRWuj
	 GpmlTMCupIA3whse5CQFPvcVL92dnSo9KTUH7WZZ7WknLXjPSMFUX5WadJHOusKzr3
	 DXCA4JGCG/QgI8uhxiifmqhglNmHgwl37kD39uEPm8HsP/O75wlyZL3X52twHPLAiS
	 t15tCG19KUNtP/THhbSx3tEBPdo//az77C3s6PdlV2jLGaYoIAXIuzaSr2pFnSE4fG
	 9dHPBayQOp1QA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] leds: Texas Instruments LP5816 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alistair Bell" <dev@alistairbell.org>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260712184318.78852-2-dev@alistairbell.org>
References: <20260712184318.78852-1-dev@alistairbell.org>
 <20260712184318.78852-2-dev@alistairbell.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 12 Jul 2026 18:59:36 +0000
Message-Id: <20260712185937.525471F00A3A@smtp.kernel.org>
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
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-9054-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:dev@alistairbell.org,m:lee@kernel.org,m:linux-leds@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,smtp.kernel.org:mid,vger.kernel.org:from_smtp,alistairbell.org:email,lists.linux.dev:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E73E4745AD5

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [Critical] The driver overwrites its initialized mutex with zeroes via a =
struct compound literal assignment.
- [High] The `lp5816_brightness_set` function ignores the requested global =
brightness and writes unscaled relative intensities.
- [High] The LED classdev is registered and sysfs groups are added before h=
ardware startup, creating initialization races.
- [High] The `lp5816_brightness_set()` function fails to latch updated PWM =
values because it omits the required `UPDATE_CMD`.
- [Medium] `lp5816_brightness_get` incorrectly calculates and returns the m=
aximum relative color intensity instead of the global brightness.
- [Medium] Hardware is reset in `.remove()` while the `devm_`-managed LED c=
lassdev is still active, causing a teardown race.
- [Low] The driver hardcodes the LED device name, violating standard Device=
 Tree naming guidelines.
- [Low] The commit message prefix does not follow the standard naming conve=
ntion for the LED subsystem.
--

--- Patch [1]: [PATCH 1/2] leds: Texas Instruments LP5816 driver ---
commit e41d9f624b4be8a22f82da1e0e301eeb37f92003
Author: Alistair Bell <dev@alistairbell.org>
leds: Texas Instruments LP5816 driver

This patch adds support for the Texas Instruments LP5816 4-channel I2C RGBW
LED driver. It provides independent 4-channel control via the multicolor
sysfs class, as well as configurable fade effects and current limits.

> leds: Texas Instruments LP5816 driver

[Severity: Low]
This isn't a bug, but does this commit message prefix follow the standard
naming convention for the LED subsystem? The guidelines usually mandate a
capitalized format like leds: lp5816: Add support for ...

> diff --git a/drivers/leds/leds-lp5816.c b/drivers/leds/leds-lp5816.c
> new file mode 100644
> index 0000000000000..584c348a7fdb2
> --- /dev/null
> +++ b/drivers/leds/leds-lp5816.c
[ ... ]
> +static enum led_brightness lp5816_brightness_get(struct led_classdev *cd=
ev)
> +{
> +	struct mc_subled *leds;
> +	struct lp5816 *chip;
> +	int intensity;
> +
> +	chip =3D container_of(cdev, struct lp5816, mcdev.led_cdev);
> +
> +	mutex_lock(&chip->mtx);
> +	leds =3D lcdev_to_mccdev(cdev)->subled_info;
> +	intensity =3D MAX(leds[0].intensity, leds[1].intensity);
> +	intensity =3D MAX(intensity, MAX(leds[2].intensity, leds[3].intensity));
> +	mutex_unlock(&chip->mtx);
> +	return intensity & 0xff;
> +}

[Severity: Medium]
Does this return the actual global LED brightness state? It appears to
calculate and return the maximum of the relative sub-LED color weights
instead of returning the overall brightness level.

> +static int lp5816_brightness_set(struct led_classdev *cdev, enum led_bri=
ghtness br)
> +{
> +	struct lp5816 *chip;
> +	struct led_classdev_mc *mc;
> +	u8 vals[4];
> +
> +	mc =3D lcdev_to_mccdev(cdev);
> +	chip =3D container_of(cdev, struct lp5816, mcdev.led_cdev);
> +
> +	vals[0] =3D mc->subled_info[0].intensity & 0xff;
> +	vals[1] =3D mc->subled_info[1].intensity & 0xff;
> +	vals[2] =3D mc->subled_info[2].intensity & 0xff;
> +	vals[3] =3D mc->subled_info[3].intensity & 0xff;
> +
> +	chip =3D container_of(cdev, struct lp5816, mcdev.led_cdev);
> +
> +	mutex_lock(&chip->mtx);
> +	regmap_bulk_write(chip->regmap, REG_OUT0_MANUAL_PWM, vals, ARRAY_SIZE(v=
als));
> +	mutex_unlock(&chip->mtx);
> +	return 0;
> +}

[Severity: High]
Does lp5816_brightness_set() ignore the requested global brightness
parameter br? It looks like it assigns the unscaled relative intensity
weights directly instead of calling led_mc_calc_color_components() to
compute the correct brightness values.

[Severity: High]
Are these updated PWM values actually applied to the hardware output?
It appears this function writes to the holding registers but does not send
the UPDATE_CMD to REG_UPDATE_CMD to latch the changes, which might leave
the hardware output entirely unchanged.

> +static int lp5816_probe(struct i2c_client *client)
> +{
> +	struct lp5816 *chip;
> +	char *name;
> +	int res;
> +
> +	chip =3D devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return dev_err_probe(&client->dev, -ENOMEM,
> +			"failed to allocate lp5816 internal structure\n");
> +
> +	i2c_set_clientdata(client, chip);
> +	mutex_init(&chip->mtx);
> +
> +	(*chip) =3D (struct lp5816) {
> +		.dev =3D &client->dev,
> +		.regmap =3D devm_regmap_init_i2c(client, &lp5816_regmap_config),
> +		.subleds =3D {

[Severity: Critical]
Does this compound literal assignment overwrite the mutex that was just
initialized? Since the assignment explicitly zeroes out all unlisted fields
in the struct, it seems this will wipe out the mutex state and could lead
to a panic or lockdep warning on the first attempt to acquire chip->mtx.

[ ... ]
> +	if (IS_ERR(chip->regmap))
> +		return dev_err_probe(&client->dev, PTR_ERR(chip->regmap),
> +				"failed to allocate register map\n");
> +
> +	name =3D devm_kasprintf(&client->dev, GFP_KERNEL, "%s:rgbw", dev_name(&=
client->dev));

[Severity: Low]
Is hardcoding the LED device name to end in :rgbw recommended here?
This might prevent standard userspace tools from correctly identifying the
LED by parsing Device Tree color and function properties per the LED
subsystem rules.

> +	if (!name)
> +		return dev_err_probe(&client->dev, -ENOMEM,
> +				"failed to allocate led-classdev name\n");
> +
> +	chip->mcdev =3D (struct led_classdev_mc){
> +		.led_cdev =3D (struct led_classdev){
> +			.brightness_set_blocking =3D lp5816_brightness_set,
> +			.brightness_get =3D lp5816_brightness_get,
> +			.name =3D name,
> +		},
> +		.num_colors =3D ARRAY_SIZE(chip->subleds),
> +		.subled_info =3D chip->subleds,
> +	};
> +
> +	res =3D devm_led_classdev_multicolor_register(&client->dev, &chip->mcde=
v);
> +	if (res < 0)
> +		return dev_err_probe(&client->dev, res, "failed to register classdev m=
ulticolor\n");
> +
> +	res =3D devm_device_add_group(chip->mcdev.led_cdev.dev, &lp5816_group);
> +	if (res < 0)
> +		return dev_err_probe(&client->dev, res, "failed to add led device grou=
p\n");
> +
> +	res =3D lp5816_startup(chip);

[Severity: High]
Could this registration sequence cause initialization races?
By registering the LED classdev and firing uevents before adding the custom
sysfs groups and before the hardware is actually powered on in
lp5816_startup(), udev might miss the custom groups. Additionally, any
immediate userspace writes could be wiped out when lp5816_startup()
subsequently issues a hard reset.

> +	if (res < 0)
> +		return dev_err_probe(&client->dev, res,
> +				"failed to execute chip startup procedure\n");
> +	return 0;
> +}
> +
> +static void lp5816_remove(struct i2c_client *client)
> +{
> +	struct lp5816 *chip;
> +
> +	chip =3D i2c_get_clientdata(client);
> +	if (!chip)
> +		return;
> +
> +	mutex_lock(&chip->mtx);
> +	regmap_multi_reg_write(chip->regmap, (const struct reg_sequence[]) {
> +		{ .reg =3D REG_RESET_CMD, .def =3D RESET_CMD },
> +		{ .reg =3D REG_UPDATE_CMD, .def =3D UPDATE_CMD }}, 2);
> +	mutex_unlock(&chip->mtx);
> +}

[Severity: Medium]
Can this manual hardware reset race with the managed teardown?
Because the LED class device is registered via devres, it is still active
when lp5816_remove() resets the chip. The LED core might attempt to set the
brightness to 0 during its unregistration phase later, writing to a reset
and sleeping chip.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260712184318.7885=
2-1-dev@alistairbell.org?part=3D1

