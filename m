Return-Path: <linux-leds+bounces-8688-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MZflKPtINWoOrQYAu9opvQ
	(envelope-from <linux-leds+bounces-8688-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 19 Jun 2026 15:49:47 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EB56A62DC
	for <lists+linux-leds@lfdr.de>; Fri, 19 Jun 2026 15:49:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=o6g0j7yU;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8688-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8688-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B77F430182B1
	for <lists+linux-leds@lfdr.de>; Fri, 19 Jun 2026 13:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62F5A2C1594;
	Fri, 19 Jun 2026 13:49:24 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99916299A82
	for <linux-leds@vger.kernel.org>; Fri, 19 Jun 2026 13:49:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781876964; cv=none; b=cTPAZVK4ciBAQkX1/ZrvZ0sMFmKAT/XsX763jsdCsYnzB3T75GwTBobZrgSjN/rE1INDvk9mcDW+Jo/etHqq0xWfeUCuCYkXUG99hEs+kzl2RBfjTlvSELzxZbA+siuDz+IGT0WnIIeR+bC7Fs7bnQHEkw5/4vfjGjZqLcVCI5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781876964; c=relaxed/simple;
	bh=ERtdo924JiX+Z6QNTl0dtWFkcfFf8Jxw+aTsC1dB6Vw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LkTaXsAl5hzNe/oJ5TuHrODX94lRSepkyrfmO9eMe94Ve7XPF2Pqi4NJ+YUuBhKUUqtwkm3hFsvlOPTB+FlWelbdumUGSr2Duvh1Wlc3PIBCJHXjSB/cuKcIQ97ikGJ0bkh9vfw0CIa6EYfdnU9cCRPQ1lb+3dSGEdkRqayHm9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=o6g0j7yU; arc=none smtp.client-ip=209.85.221.54
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45ef56d9b67so1772805f8f.2
        for <linux-leds@vger.kernel.org>; Fri, 19 Jun 2026 06:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781876961; x=1782481761; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mak+r4t0gOoUCWsrOnopo0paxlJtnN6e+PJJFdkXJuk=;
        b=o6g0j7yUYSXrccaTdOx4N+Mo+liz3KyFXTUz+O7baE48X6GrRwKwL+u8XMNhXrUnh5
         JaAalmToBwFA4XtRC2SYtcNqL+2oIbndCOA6px+PesCm48N5p2p9hEyuNfdgjAW+VW8n
         6MOCtEZJEFbLummpy68wCDR4VWLf4R7AF5ewQrrJKLobv5rB0ojEBkWorVPuFmrI1m8/
         fRNjKcr+KCJhV4perYdTaGTSQ7jk0oJTmGQhxyqWPwWqnfllzxb1fv0gGRvGGaAxDNDt
         6lGqN8pD8OZVhZ+NbXcKVOMXtwsb5sPaX87F41UESO3TKyguesxr9MkczXJKYwBAb2OO
         fEDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781876961; x=1782481761;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mak+r4t0gOoUCWsrOnopo0paxlJtnN6e+PJJFdkXJuk=;
        b=q38FjjTt7MyX8aApR2FrhaVfth3SFYHa0A2GSa7Agb78IlrHQ2c0pBlabDQgBfkKQa
         588QqBVvC9fLFQSeYip681SjnFVKfNzwyUEqGk7+AqdHrSkkqgItP+D6+9HkpsZBr+tF
         J+me36ZHq+l8J/r7Hh7T7RiLK8rLzG6QhIfyC0WVljU0uMUhEdfAyu+54YqzqtS3sagq
         tG9JQ43Ta7jxYroS0RCOFBKoG+Jzk2nVpWLxTIBKiJ7ptDSUOrRlFG0+F91McBnmRw5K
         SITMlRsq7IGTxyDiKvWXUOOnTpzSqnggzevAq8inn3cBVCMTuvtaHs+fdi3hjIHuAbNO
         aJgQ==
X-Forwarded-Encrypted: i=1; AFNElJ+eImeQstckuHxSSlAcbPYvwvExihasS+W7ujfo+wGteIU2IVJZTKUiqGy6lS++T0p+Jh2UAfNC/Q8X@vger.kernel.org
X-Gm-Message-State: AOJu0Yw60t/lQGUVVJOw/5XkZMnCnbafjVsc6Y1KPtyfn32ibi5gMe3a
	Syaca8IVKx2IS4H8bzXFcJZ5UVr7dKSWkERLXxyQwh25aDQL2vPiY1mVME46M0ZOhjg=
X-Gm-Gg: AfdE7cmYMep/zFZb2vEF0pZwqJDVGHO6ufzfKVsjahyZv+6jsEn251NSEhdB+eGdl07
	IvljdDJBGOCQwfqiWxUYKJpQGGCyvehTR9KkcvwkCzZvxcPaBuGJkR+qYj0j7u7c95TXWDaSQaU
	VqT56BYN8l52ZfxxKkOGXxpEWGsdmzUhXkuxPlr5TyN5PVKlbVJcpLCvCaK0G/Whn06xZtEOFNz
	RMbSeWytJRNVNbzOyw3/vhZvcUuPlF2lAdp+R9V85jzRVt8+2szS48TUUIl9qHLRsKPtJNS0pll
	Y0pzJX74p9IbofLV7MlzJhJQ5A9wc/q6CEYDzfAS6qtdun0tfWPrXh57IImpElltAJCyOYqfhWM
	XRFZ026TT+zr80xjS+PYkn2G0S/G7qfRdIPXsLIb4yMzw737txXvTJkDoc/Snk6uqEuvgyGvl0G
	3rsgxpt5DuaCfdr8oYy5SX+utAXx4fHuKrrLoL8X6/ljBNf1KMHRSf1PkVoIo2d6mECw5XrU9J5
	lE=
X-Received: by 2002:a5d:4d01:0:b0:45e:633e:a7cc with SMTP id ffacd0b85a97d-46501b5ad1bmr5318194f8f.24.1781876960955;
        Fri, 19 Jun 2026 06:49:20 -0700 (PDT)
Received: from localhost (p200300f65f47db04359fc0e70763236f.dip0.t-ipconnect.de. [2003:f6:5f47:db04:359f:c0e7:763:236f])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-46508a04692sm9139982f8f.6.2026.06.19.06.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 06:49:19 -0700 (PDT)
Date: Fri, 19 Jun 2026 15:49:18 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jan Carlo Roleda <jancarlo.roleda@analog.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/2] leds: ltc3208: Add driver for LTC3208
 Multidisplay LED Driver
Message-ID: <ajVHk3__YAhZX5ao@monoceros>
References: <20260619-upstream-ltc3208-v5-0-075d18060606@analog.com>
 <20260619-upstream-ltc3208-v5-2-075d18060606@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7dllwc3mvu3jueri"
Content-Disposition: inline
In-Reply-To: <20260619-upstream-ltc3208-v5-2-075d18060606@analog.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jancarlo.roleda@analog.com,m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-8688-lists,linux-leds=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[baylibre.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,monoceros:mid,baylibre.com:dkim,baylibre.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 04EB56A62DC


--7dllwc3mvu3jueri
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 2/2] leds: ltc3208: Add driver for LTC3208
 Multidisplay LED Driver
MIME-Version: 1.0

On Fri, Jun 19, 2026 at 06:45:09AM +0800, Jan Carlo Roleda wrote:
> [...]
> +static int ltc3208_probe(struct i2c_client *client)
> +{
> +	enum ltc3208_aux_channel aux_channels[LTC3208_NUM_AUX_LEDS];
> +	struct ltc3208 *ddata;
> +	struct regmap *regmap;
> +	bool disable_rgb_aux4_dropout_signal;
> +	bool disable_camhl_pin;
> +	bool set_sub_control_pin;
> +	int ret;
> +	u8 reg_val;
> +
> +	regmap =3D devm_regmap_init_i2c(client, &ltc3208_regmap_cfg);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(&client->dev, PTR_ERR(regmap),
> +				     "Failed to initialize regmap\n");
> +
> +	ddata =3D devm_kzalloc(&client->dev, sizeof(*ddata), GFP_KERNEL);
> +	if (!ddata)
> +		return -ENOMEM;
> +
> +	ddata->regmap =3D regmap;
> +
> +	disable_camhl_pin =3D device_property_read_bool(&client->dev,
> +						      "adi,disable-camhl-pin");
> +	set_sub_control_pin =3D
> +		device_property_read_bool(&client->dev, "adi,cfg-enrgbs-pin");
> +	disable_rgb_aux4_dropout_signal =3D device_property_read_bool(
> +		&client->dev, "adi,disable-rgb-aux4-dropout");

Unusual line break. I'd write that as:

	disable_rgb_aux4_dropout_signal =3D
		device_property_read_bool(&client->dev,
					  "adi,disable-rgb-aux4-dropout");


> +
> +	reg_val =3D FIELD_PREP(LTC3208_OPT_EN_RGBS, set_sub_control_pin) |
> +		  FIELD_PREP(LTC3208_OPT_DIS_CAMHILO, disable_camhl_pin) |
> +		  FIELD_PREP(LTC3208_OPT_DIS_RGBDROP,
> +			     disable_rgb_aux4_dropout_signal);
> +
> +	ret =3D regmap_write(regmap, LTC3208_REG_G_OPT, reg_val);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret,
> +				     "error writing to options register\n");
> +
> +	/* Initialize aux channel configurations */
> +	for (int i =3D 0; i < LTC3208_NUM_AUX_LEDS; i++) {
> +		ret =3D device_property_match_property_string(
> +			&client->dev, ltc3208_dt_aux_channels[i],
> +			ltc3208_aux_opt, LTC3208_NUM_AUX_OPT);
> +		/* Fallback to default value (AUX) if not found */
> +		if (ret =3D=3D -EINVAL)
> +			aux_channels[i] =3D LTC3208_AUX_CHAN_AUX;
> +		else if (ret >=3D 0)
> +			aux_channels[i] =3D ret;
> +	}
> +
> +	reg_val =3D FIELD_PREP(LTC3208_AUX1_MASK, aux_channels[0]) |
> +		  FIELD_PREP(LTC3208_AUX2_MASK, aux_channels[1]) |
> +		  FIELD_PREP(LTC3208_AUX3_MASK, aux_channels[2]) |
> +		  FIELD_PREP(LTC3208_AUX4_MASK, aux_channels[3]);
> +
> +	ret =3D regmap_write(regmap, LTC3208_REG_E_AUX_SELECT, reg_val);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret,
> +			"error writing to aux channel register.\n");
> +
> +	i2c_set_clientdata(client, ddata);

=46rom a quick glance, this is unused.

> +	device_for_each_child_node_scoped(&client->dev, child) {
> +		struct ltc3208_led *led;
> +		struct led_init_data init_data =3D {};
> +		u32 chan;
> +
> +		ret =3D fwnode_property_read_u32(child, "reg", &chan);
> +		if (ret)
> +			return dev_err_probe(&client->dev, ret,
> +					    "Failed to get reg value of LED\n");
> +		else if (chan >=3D LTC3208_NUM_LED_GRPS)
> +			return dev_err_probe(&client->dev, ret,
> +					     "%d is an invalid LED ID\n", chan);
> +
> +		led =3D &ddata->leds[chan];
> +
> +		led->rfield =3D
> +			devm_regmap_field_alloc(&client->dev, ddata->regmap,
> +						ltc3208_led_reg_field[chan]);
> +		if (IS_ERR(led->rfield))
> +			return dev_err_probe(&client->dev, PTR_ERR(led->rfield),
> +					     "cannot allocate regmap field\n");
> +		led->client =3D client;
> +		led->channel =3D chan;
> +		led->cdev.brightness_set_blocking =3D ltc3208_led_set_brightness;
> +		led->cdev.max_brightness =3D LTC3208_MAX_BRIGHTNESS_4BIT;
> +
> +		if (chan =3D=3D LTC3208_CHAN_MAIN || chan =3D=3D LTC3208_CHAN_SUB)
> +			led->cdev.max_brightness =3D LTC3208_MAX_BRIGHTNESS_8BIT;
> +
> +		init_data.fwnode =3D child;
> +
> +		ret =3D devm_led_classdev_register_ext(&client->dev, &led->cdev,
> +						     &init_data);
> +		if (ret)
> +			return dev_err_probe(&client->dev, ret,
> +					     "LED %u Register failed.\n", chan);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id ltc3208_match_table[] =3D {
> +	{.compatible =3D "adi,ltc3208"},
> +	{}
> +};

Please make this:

static const struct of_device_id ltc3208_match_table[] =3D {
	{ .compatible =3D "adi,ltc3208" },
	{ }
};


> +MODULE_DEVICE_TABLE(of, ltc3208_match_table);
> +
> +static const struct i2c_device_id ltc3208_idtable[] =3D {
> +	{ "ltc3208" },
> +	{}
> +};

Please make this:

static const struct i2c_device_id ltc3208_idtable[] =3D {
	{ .name =3D "ltc3208" },
	{ }
};

> +MODULE_DEVICE_TABLE(i2c, ltc3208_idtable);

Best regards
Uwe

--7dllwc3mvu3jueri
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmo1SNwACgkQj4D7WH0S
/k5rxgf/UpwQblP4Glirp3wWDdF9rExHUqKGzDKoKvEy2CE5yo6c4bVHlHbngvp9
hHkNJjZzXmI6l18Tikzooc7O5dKqIM76Rc/ewYnJbpcyjRQVMql5ALS5XbF5yXRB
LuAPHo/IwzZLaTXflGEkm5/I50EO2GfUaY9zfcK5xHj5znrx5dSfGK8kYIgMQEtg
/bxKWo9RIpe8qYDspWz8LDX1f6mqF+1rATrIDoiZLAs3pQ1BPQLAlhB5DUTsKJuf
A5oYyQeHTwcTx81NYp3TVM0eChcVhPIDOjEMT5E3AE9T1FbvOl8XeyHVvmwxbNfE
cm3L4V0bJaGraj1eQlS4nBNmEeyy5g==
=CK3y
-----END PGP SIGNATURE-----

--7dllwc3mvu3jueri--

