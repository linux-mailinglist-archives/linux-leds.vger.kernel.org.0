Return-Path: <linux-leds+bounces-9053-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FZGWKQ7kU2q9fwMAu9opvQ
	(envelope-from <linux-leds+bounces-9053-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2026 20:59:26 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1449D745AD0
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2026 20:59:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=NOYcsWRx;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9053-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-9053-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C4788300B989
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2026 18:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 184F5367F5E;
	Sun, 12 Jul 2026 18:59:23 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B6D20ADF8
	for <linux-leds@vger.kernel.org>; Sun, 12 Jul 2026 18:59:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783882763; cv=none; b=YCGf639lxK/GzlvJ3fnUEJnNzJ7yrwUv6/ye9DpjiTc7G68fb2GUYV60ORHk8cI+SRFaefkYUXwhZ2foNFZAllSwywJ48ma40Ug/Knorcj++WlarXiIUE0D4WXGsY0nvBnWPgfZG5pDezPzYmbGvhR73WxBZ/QeDVD9dCTQvlL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783882763; c=relaxed/simple;
	bh=BtC/0U9Tj8nUqgOJZNOo7M63Nx0ZplIgpNCJTkiosU8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jH4ja4Jbckenko9dpdjo0uo0pHeEqEFyBwJPpP6++LJLpnhHm1n6dEI1+3SyJ0q23dNwUzeIdOLs6vtVneS8AUewzdfs5KQc1m4jOxOU/WlXbm0KH2CdFNbVgTM8WFvgyQPKvwm3/M8QknY+OKvyUt1Lu/E7vj1POCjBxy95/OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NOYcsWRx; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05BCE1F00A3A;
	Sun, 12 Jul 2026 18:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783882761;
	bh=Qh19RVtoYTuv5n9IulRsUc+of+SNh6/aglVcjpnQb9g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NOYcsWRx3ENIUwSeY2zILErExQX3Z9T+JMP1SPu+6ZxsNC7c07hDfaMhH1pys8hz/
	 d2llCtN927B+qKNhsFdCq1OLOLqLtBLaDzzzuViXgzN7uXEWh+DfkpmwMuCxjMKyNV
	 IGTc2RHo6SI0s53Cmmq5XGaEFEsIeG3Og8PbeGQQgIjzOzQtZClJqk61SWol1ahpnN
	 pgg4nGaK3d5wchHmQal1tiXY59w4o7lf/zdiN3Q71st5zWS1fSHayc99Zp32PIzjef
	 qfSLkFLS11xvk0cbdwsiQrxzNHARx1Ub1OUEBZrFIaWf8KPObiMDllq/Fvi/U7sDjB
	 OlGneHKMPyPtA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: leds: Add binding for ti,lp5816
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alistair Bell" <dev@alistairbell.org>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260712184318.78852-3-dev@alistairbell.org>
References: <20260712184318.78852-1-dev@alistairbell.org>
 <20260712184318.78852-3-dev@alistairbell.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 12 Jul 2026 18:59:20 +0000
Message-Id: <20260712185921.05BCE1F00A3A@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-9053-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:dev@alistairbell.org,m:lee@kernel.org,m:linux-leds@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,alistairbell.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sashiko.dev:url,smtp.kernel.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1449D745AD0

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [High] The driver overwrites the initialized mutex with zeroes during a c=
ompound struct assignment, causing an inevitable crash on first use.
- [High] The driver ignores the master brightness parameter and fails to us=
e the multi-color calculation helper.
- [High] The driver resets the hardware in `remove()` before the LED is unr=
egistered, causing a use-after-disable window.
- [High] Missing register update command in brightness setter prevents hard=
ware from applying new values.
- [Medium] The commit introduces custom, device-specific sysfs attributes (=
`fade` and `fade_mode`) that hardcode specific RGBW colors, bypassing stand=
ard LED subsystem mechanisms.
- [Medium] The device tree binding fails to define standard LED child nodes=
 and omits common standard LED properties, breaking hardware description pr=
inciples.
- [Medium] The device is exposed to user-space before its hardware is initi=
alized.
- [Low] The device tree binding description explicitly references the opera=
ting system's software driver.
- [Low] Use of undeclared identifier `MAX` causes a compilation error.
- [Low] The patch commit message violates the LED subsystem naming conventi=
on.
--

--- Patch [2]: [PATCH 2/2] dt-bindings: leds: Add binding for ti,lp5816 ---
commit b91ef8e4c561a1f06d4c4b39a848e64275caccbb
Author: Alistair Bell <dev@alistairbell.org>

dt-bindings: leds: Add binding for ti,lp5816

Add devicetree binding for Texas Instruments LP5816
4-channel I2C LED device.

> dt-bindings: leds: Add binding for ti,lp5816

[Severity: Low]
Does this commit message subject violate the LED subsystem naming conventio=
n?
The subsystem guidelines expect the prefix to follow the format:
leds: <Driver>: <Capitalized description>.

> diff --git a/Documentation/ABI/testing/sysfs-class-leds-lp5816 b/Document=
ation/ABI/testing/sysfs-class-leds-lp5816
> new file mode 100644
> index 0000000000000..2d1fd107abf67
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-class-leds-lp5816
> @@ -0,0 +1,123 @@
> +What: /sys/class/leds/<device>/fade
> +Date: July 2026
> +KernelVersion: 7.2
> +Contact: <dev@alistairbell.org>
> +Description:
> +	Enables/disables hardware fading of each individual LED and sets transi=
tion duration
> +	between an old intensity and new intensity
> +
> +	Format: <enable_red> <enable_green> <enable_blue> <enable_white> <durat=
ion>

[Severity: Medium]
Does introducing these custom, device-specific sysfs attributes that hardco=
de
specific RGBW colors bypass the standard LED subsystem mechanisms?
This forces user-space tools to implement custom string parsing for this
specific chip.

> diff --git a/Documentation/devicetree/bindings/leds/ti,lp5816.yaml b/Docu=
mentation/devicetree/bindings/leds/ti,lp5816.yaml
> new file mode 100644
> index 0000000000000..d33489c306dfc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/ti,lp5816.yaml
[ ... ]
> +properties:
> +  compatible:
> +    const: ti,lp5816
> +    description: |
> +      Specifies device as LP5816 and the uses that kernel driver

[Severity: Low]
Does this description improperly reference the operating system's software
driver?
Device tree bindings should be OS-agnostic hardware descriptions.

[ ... ]
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false

[Severity: Medium]
Does this schema fail to define standard LED child nodes?
By dropping child node specifications and omitting common standard LED
properties, a device tree attempting to define standard LED properties
like color or function will fail validation.

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

[Severity: Low]
Will this result in a compilation error?
The uppercase MAX macro is undeclared; the standard kernel macro for maximum
values is lowercase max().

[ ... ]
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

[Severity: High]
Does this ignore the master brightness parameter?
The core functionality of setting the LED brightness appears broken because
the driver does not use led_mc_calc_color_components(mc, br) and ignores the
requested master brightness, making it impossible to turn off the LED via t=
he
standard API.

> +
> +	chip =3D container_of(cdev, struct lp5816, mcdev.led_cdev);
> +
> +	mutex_lock(&chip->mtx);
> +	regmap_bulk_write(chip->regmap, REG_OUT0_MANUAL_PWM, vals, ARRAY_SIZE(v=
als));

[Severity: High]
Are we missing the register update command here?
Without issuing a REG_UPDATE_CMD after the bulk write, the brightness chang=
es
requested via the standard API will fail to take effect on the hardware.

> +	mutex_unlock(&chip->mtx);
> +	return 0;
> +}
[ ... ]
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

[Severity: High]
Will this compound struct assignment overwrite the initialized mutex?
Standard C semantics zero-initialize omitted members in a compound literal,
which will wipe the internal state of chip->mtx and cause a kernel oops or
deadlock on the first mutex_lock() call.

> +		.dev =3D &client->dev,
> +		.regmap =3D devm_regmap_init_i2c(client, &lp5816_regmap_config),
> +		.subleds =3D {
> +			{ .color_index =3D LED_COLOR_ID_RED, .intensity =3D 0 },
> +			{ .color_index =3D LED_COLOR_ID_GREEN, .intensity =3D 0 },
> +			{ .color_index =3D LED_COLOR_ID_BLUE, .intensity =3D 0 },
> +			{ .color_index =3D LED_COLOR_ID_WHITE, .intensity =3D 0 },
> +		},
> +	};
[ ... ]
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

[Severity: Medium]
Is it safe to expose the device to user-space before its hardware is initia=
lized?
If udev or user-space accesses the device after devm_led_classdev_multicolo=
r_register()
but before lp5816_startup() finishes, the hardware reset in the startup seq=
uence
could destroy that state.

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

[Severity: High]
Does resetting the hardware in remove() before the LED is unregistered caus=
e a
use-after-disable window?

Because the LED class device is registered using a devres API, it will be
unregistered automatically after remove() returns. That automatic cleanup c=
alls
led_set_brightness() to turn off the LED, which will write I2C commands to a
device that has already been reset.

> +	mutex_unlock(&chip->mtx);
> +}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260712184318.7885=
2-1-dev@alistairbell.org?part=3D2

