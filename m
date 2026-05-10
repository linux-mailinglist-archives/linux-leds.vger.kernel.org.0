Return-Path: <linux-leds+bounces-8064-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJrUG2NNAGqsGAEAu9opvQ
	(envelope-from <linux-leds+bounces-8064-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 10 May 2026 11:18:27 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAFF5034BD
	for <lists+linux-leds@lfdr.de>; Sun, 10 May 2026 11:18:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA5B1300D863
	for <lists+linux-leds@lfdr.de>; Sun, 10 May 2026 09:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55095366067;
	Sun, 10 May 2026 09:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="GOLPhyCv"
X-Original-To: linux-leds@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1E7257452
	for <linux-leds@vger.kernel.org>; Sun, 10 May 2026 09:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778404682; cv=none; b=lNHLx6vGCdFXhCY9D5ko5Wu/7n32zD+zj+6Mq/TQxY5kLVSaTKTKeQi/NLyaHILRtlYMKmsHLjJ+tdruoAG3bHtIbboeFy47NtFR40aiu08RsGVdYARhGl4Yk2iA6MY4NHu4BUmR4WdrxJrzgE1Oyl1OnwTD4qg7J48iwjOtQCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778404682; c=relaxed/simple;
	bh=VawkETnX8PoJzHvUasVU2WbedSBrxD6+b377xMUR2tY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pCoe5dDpUPcEeGXOvWxpeeX25DQ2BZr9cao6QmqYrIdqxF5VlZKepPagw5LrEKp/OWD/KAi71Vjir1G2tv8izq3FSFQcB0Fs6uwigeVVCx/TMEcS2AtsexNPaaxj81Ps5Qnxl0Hr3QZvbrQl0mNITMp1NCfPQHmKI1L0SQEs/M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=GOLPhyCv; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from [IPv6:2a02:1812:162d:3d00:649f:659d:f6c1:d42] (2a02-1812-162d-3d00-649f-659d-f6c1-d42.ip6.access.telenet.be [IPv6:2a02:1812:162d:3d00:649f:659d:f6c1:d42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 825D377C82E;
	Sun, 10 May 2026 11:07:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1778404069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sOyjSRnXMke/uMfYW5oFYQefgV2luLs/zo2rvA+MaDE=;
	b=GOLPhyCvxpCgmMnPMqLWIzQn7yjmN33oZErIHT6PpCPMp8U4lZgn3V+hM0S20GpQ9rKeLl
	VZ6IFyVCEiy+F/QmSqidAD1E/2B3c4jvqazzee9T4t48UtXV1WeXEsPIaWuZAg4Ba9YP0K
	qYvguvPaLAnvLFdogQCaE2czZclPmSTKBdVbHiKPnwo80P1UWYV4NNgris7PrYft6GInMZ
	9fhEqwUuoNawg1UPhnfoNgXUDk4Qcqm03jpP7mZGX+9v2fRiXGpvwgAWlYScq0er10LknJ
	b3SQuFtPX37W99AgGv/Rb5XBv5pAwoEi9YnChVL4nMlXUHWbToPKO1YMk7LxHQ==
Message-ID: <32d4a57c074c766c8ad83e4b220e44b1df9ae485.camel@svanheule.net>
Subject: Re: [PATCH v7 2/2] leds: ltc3220: Add Support for LTC3220 18
 channel LED Driver
From: Sander Vanheule <sander@svanheule.net>
To: Edelweise Escala <edelweise.escala@analog.com>, Lee Jones
 <lee@kernel.org>,  Pavel Machek <pavel@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Sun, 10 May 2026 11:07:48 +0200
In-Reply-To: <20260508-ltc3220-driver-v7-2-0f092ba54f23@analog.com>
References: <20260508-ltc3220-driver-v7-0-0f092ba54f23@analog.com>
	 <20260508-ltc3220-driver-v7-2-0f092ba54f23@analog.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: CEAFF5034BD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[svanheule.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[svanheule.net:s=mail1707];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8064-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[svanheule.net:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sander@svanheule.net,linux-leds@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,svanheule.net:mid,svanheule.net:dkim]
X-Rspamd-Action: no action

Hi Edelweise,

On Fri, 2026-05-08 at 12:09 +0800, Edelweise Escala wrote:
> +static const struct regmap_config ltc3220_regmap_config =3D {
> +	.reg_bits =3D 8,
> +	.val_bits =3D 8,
> +	.max_register =3D LTC3220_GRAD_BLINK_REG,
> +	.cache_type =3D REGCACHE_FLAT,
> +	.volatile_reg =3D ltc3220_volatile_reg,
> +};

With this config, you are assuming that all register values will default to=
 0,
otherwise the cache will not work properly. While the datasheet seems to
indicate this is the case, I also suspect you are now seeing the warning

    "using zero-initialized flat cache, this may cause unexpected behavior"

I would suggest to use REGCACHE_FLAT_S instead.

[...]

> +static int ltc3220_reset(struct ltc3220 *ltc3220, struct i2c_client *cli=
ent)
> +{
> +	struct gpio_desc *reset_gpio;
> +	int ret;
> +
> +	reset_gpio =3D devm_gpiod_get_optional(&client->dev, "reset",
> GPIOD_OUT_HIGH);
> +	if (IS_ERR(reset_gpio))
> +		return dev_err_probe(&client->dev, PTR_ERR(reset_gpio),
> "Failed on reset GPIO\n");
> +
> +	if (reset_gpio) {
> +		gpiod_set_value_cansleep(reset_gpio, 0);
> +
> +		return devm_add_action_or_reset(&client->dev,
> ltc3220_reset_gpio_action,
> +						reset_gpio);
> +	}
> +
> +	ret =3D regmap_write(ltc3220->regmap, LTC3220_COMMAND_REG, 0);
> +	if (ret)
> +		return ret;
> +
> +	for (int i =3D 0; i < LTC3220_NUM_LEDS; i++) {
> +		ret =3D regmap_write(ltc3220->regmap, LTC3220_ULED_REG(i), 0);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return regmap_write(ltc3220->regmap, LTC3220_GRAD_BLINK_REG, 0);
> +}

regmap_write() will always go to hardware, so this feels a bit like you're
manually forcing the hardware to match the cache state. The implied all-0 c=
ache
could otherwise prevent later regmap_update_bits() calls from actually
performing a write.=20

> +static DEFINE_SIMPLE_DEV_PM_OPS(ltc3220_pm_ops, ltc3220_suspend,
> ltc3220_resume);
> +
> +static int ltc3220_probe(struct i2c_client *client)
> +{
> +	struct ltc3220 *ltc3220;
> +	bool aggregated_led_found =3D false;
> +	int num_leds =3D 0;
> +	u8 led_index =3D 0;
> +	int ret;
> +
> +	ltc3220 =3D devm_kzalloc(&client->dev, sizeof(*ltc3220), GFP_KERNEL);
> +	if (!ltc3220)
> +		return -ENOMEM;
> +
> +	ltc3220->regmap =3D devm_regmap_init_i2c(client,
> &ltc3220_regmap_config);
> +	if (IS_ERR(ltc3220->regmap))
> +		return dev_err_probe(&client->dev, PTR_ERR(ltc3220->regmap),
> +				=C2=A0=C2=A0=C2=A0=C2=A0 "Failed to initialize regmap\n");
> +
> +	i2c_set_clientdata(client, ltc3220);
> +
> +	ret =3D ltc3220_reset(ltc3220, client);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret, "Failed to reset
> device\n");

Up to you if you want to clear the device configuration (maybe this causes =
LED
flickering?), but with REGCACHE_FLAT_S, you should be able to maintain the =
boot
state of the device.

Best,
Sander

