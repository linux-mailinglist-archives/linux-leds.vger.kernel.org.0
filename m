Return-Path: <linux-leds+bounces-8418-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAkNMT6rHWoLdAkAu9opvQ
	(envelope-from <linux-leds+bounces-8418-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 01 Jun 2026 17:54:38 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5576221C0
	for <lists+linux-leds@lfdr.de>; Mon, 01 Jun 2026 17:54:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A1963059039
	for <lists+linux-leds@lfdr.de>; Mon,  1 Jun 2026 15:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED1103D9048;
	Mon,  1 Jun 2026 15:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1rc+j1k"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46EB3D9693
	for <linux-leds@vger.kernel.org>; Mon,  1 Jun 2026 15:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780328766; cv=none; b=OItEEtFHInmqKWZsC1o4aSnrJZLkBZ7jTZhpeOSbJ5c8RrP9Uw9/X5PUjIEd7Zo/xJ50KFUymVfm6aEZ9o52oHH57pXxgUzotem7mqN/BtjdmjUGA5CIyueIHIbI2oxLXkgu1HZWKPwiZ6EZi/n0BC/B2rayqxjB1vakV5EVszA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780328766; c=relaxed/simple;
	bh=e2pnY2qmmzkm/CpC6ZwLYOJy5t4zUkqjW0tG1nYULv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qlnIfIJse7Lz04yPsxK2654qn27q4bzlrRN5pWA34PE797QMLXBoASUqr0x7J40LodlBomWHtRwYSv2pPk1nji7pQc0UOFKf+WM8poN6BvyPrOr/5winkAdOaU8RzrGuUPD99tCtBo7FtMiKKIHRyvsxl0nRsuycUv+Q/GWANEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k1rc+j1k; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-13621cca8f5so7712300c88.0
        for <linux-leds@vger.kernel.org>; Mon, 01 Jun 2026 08:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780328765; x=1780933565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3uG4ix1UGsv+5molCxwa32LUYrghrpeXWnN1jOsh2Dw=;
        b=k1rc+j1knhlPThDKffLia5VIJJ7w800lSugbcBBBPnWEIJhFCvL4pFcNpiSvJXYqgl
         shjQ1obNdTDq5bWDlD27FBMrge2wT6om1wkf2iGCIthVcInZmj+of2aJV5KFgnYaDXWx
         ZRHD1q/OASX1LatyfFC07XN794yKaaiqpOKdSsdAJtCdcQa5EwrUlB5P1En+nuDGr8c7
         KFLtcA098WkH8S1O6S/gvF96oGAqlVKqCCEpqvvcrJCKirXx1Q7JN/1BlQU6WA3t+D6Z
         TfPMOMH1EOsSZBQSmFMoYzprSlLQuAdHB9ySl3aI2zDgYIknThVNFbQCgD/2LSU7WhBA
         PCAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780328765; x=1780933565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3uG4ix1UGsv+5molCxwa32LUYrghrpeXWnN1jOsh2Dw=;
        b=ewkbMH+0M+gjHBIKZouZO4YRsV3XUJqtPJSNO0J0BGM2rFAvFw+iJUbYHCFE98KKRl
         jVb/TQAS5jS5KEnHVm9hD2PnJz4RQ1JMtZKR/cHoc6VZfM4iJVNYGnp8tTTaRhNCwXnO
         SpmL8PLL2DNcSxdY3io22BS7MeEgZvIuHKg2WISZ4sV2rI5QJAjX5l0vb5LFR2Tg1XaB
         t3ZoneFKCkYMB308URyA1/C3Ryjoub7nqPXoQeeN2sPbG/eY7oFjJo9eoZCLP/6s7rFV
         u56yqI/UgZJQqlmxshO+Do3HPcU47KLSf1+gqIVIf1ZaYLTGiaHICH9k5T4r4i2yT1SR
         virQ==
X-Forwarded-Encrypted: i=1; AFNElJ/1G8VPY/qfZkIh3GLcJj1/L+8N1/2Tw51SEylXXuAsdsw87GHCkAU8PSsYPSZx+aNa6MJP6nGbbESW@vger.kernel.org
X-Gm-Message-State: AOJu0YzeLsBociWngRNsDk8jHe1T5iA6PLTctaquvzkGuc/bE7pXWYF+
	25Q48Z4n1z9XQRsAUa5kMViUwul/upwrqbBXc1B1aSM2TrwiPGjwo+Jt
X-Gm-Gg: Acq92OELjZ1kvg6rWQmnCFbvmVpdsiJ8PohTcII04RJjzEv9pVCjpYcN9IwKg7FucqL
	Kx/zNqWuRzVdf5MTgdJ4On8LgewqwHCMX/IXf1+R3qr79n8QSx3AroinAi6UEoTO8ku0JPZ6F8F
	0S7u1MmkL8YtWCt3KPqNzK8A4u0NQp9XwM3H1wE0FRQq0gLnGAhkBes8kRC7yLa2BENP3AujdqA
	Cl9I12d4f4UVGph/8SXS2YT1CmBUJn8UamscwD517ppquBB4XheSGXobymhFcgcBmlZ5R5sCLcx
	L6AJ3mlMeidYKGSx1KiBHCt/rwfbG7qpPmQe6X8DFym/SPmpXSBbYnRu+b56Uw9klT/vmvcI26E
	kwwlfQ9UCwq+OJjTAGjBHNG+KYJWQ6jmNaGQdrfPXPg6HquIe2tg2DoeBB1OQYZhayHMU+9LlG2
	e89dyNbWNKVS0vWwGlpfa/syRElkPffZ1aioQnV1FAjGIlhlNrKA==
X-Received: by 2002:a05:7022:117:b0:11a:e426:911a with SMTP id a92af1059eb24-137d3f132bbmr6136731c88.15.1780328764643;
        Mon, 01 Jun 2026 08:46:04 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a54:e741:3a5a:3245:d3dc:4b5d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137b36aef95sm6996203c88.4.2026.06.01.08.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:46:04 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: lee@kernel.org
Cc: conor+dt@kernel.org,
	daniel@zonque.org,
	devicetree@vger.kernel.org,
	jerrysteve1101@gmail.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk,
	robh@kernel.org
Subject: Re: [PATCH v7 6/6] leds: is31fl32xx: Move pwm frequency setting to init_regs()
Date: Mon,  1 Jun 2026 23:45:57 +0800
Message-ID: <20260601154557.1675809-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260527151929.GB712405@google.com>
References: <20260527151929.GB712405@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8418-lists,linux-leds=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,zonque.org,vger.kernel.org,gmail.com,thegoodpenguin.co.uk];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 2B5576221C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> On Wed, 20 May 2026, Jun Yan wrote:
> 
> > commit a18983b95a61 ("leds: is31f132xx: Add support for is31fl3293")
> > swapped the order of is31fl32xx_parse_dt() and is31fl32xx_init_regs().
> > 
> > This causes the PWM frequency configuration programmed in
> > is31fl32xx_parse_dt() to be overwritten by the register reset
> > operation performed in is31fl32xx_init_regs().
> > 
> > Move the PWM frequency setting logic from is31fl32xx_parse_dt() to
> > is31fl32xx_init_regs() and separates device tree parsing from hardware
> > initialization.
> > 
> > Fixes: a18983b95a61 ("leds: is31f132xx: Add support for is31fl3293")
> > Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> > ---
> >  drivers/leds/leds-is31fl32xx.c | 22 ++++++++++------------
> >  1 file changed, 10 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
> > index 2d7ff4c5a08c..c545a3b7a05a 100644
> > --- a/drivers/leds/leds-is31fl32xx.c
> > +++ b/drivers/leds/leds-is31fl32xx.c
> > @@ -63,6 +63,7 @@ struct is31fl32xx_priv {
> >  	struct i2c_client *client;
> >  	struct gpio_desc *powerdown_gpio;
> >  	unsigned int num_leds;
> > +	bool pwm_22khz;
> >  	struct is31fl32xx_led_data leds[];
> >  };
> >  
> > @@ -346,6 +347,14 @@ static int is31fl32xx_init_regs(struct is31fl32xx_priv *priv)
> >  	if (ret)
> >  		return ret;
> >  
> > +	if ((cdef->output_frequency_setting_reg != IS31FL32XX_REG_NONE) &&
> > +		priv->pwm_22khz) {
> 
> Nit: No need to wrap here.  Use up to 100-chars to beautify.

OK.

> 
> > +		ret = is31fl32xx_write(priv, cdef->output_frequency_setting_reg,
> > +							IS31FL32XX_PWM_FREQUENCY_22KHZ);
> 
> Nit: Line-up with the '('.

Got it.

Thanks for the review, will fix everything in v8.

> 
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> >  	/*
> >  	 * Set enable bit for all channels.
> >  	 * We will control state with PWM registers alone.
> > @@ -420,7 +429,6 @@ static struct is31fl32xx_led_data *is31fl32xx_find_led_data(
> >  static int is31fl32xx_parse_dt(struct device *dev,
> >  			       struct is31fl32xx_priv *priv)
> >  {
> > -	const struct is31fl32xx_chipdef *cdef = priv->cdef;
> >  	int ret = 0;
> >  
> >  	/* Driving this GPIO line low takes the chip out of shutdown,
> > @@ -431,17 +439,7 @@ static int is31fl32xx_parse_dt(struct device *dev,
> >  		return dev_err_probe(dev, PTR_ERR(priv->powerdown_gpio),
> >  				"Failed to get powerdown gpio\n");
> >  
> > -	if ((cdef->output_frequency_setting_reg != IS31FL32XX_REG_NONE) &&
> > -	    of_property_read_bool(dev_of_node(dev), "issi,22khz-pwm")) {
> > -
> > -		ret = is31fl32xx_write(priv, cdef->output_frequency_setting_reg,
> > -				       IS31FL32XX_PWM_FREQUENCY_22KHZ);
> > -
> > -		if (ret) {
> > -			dev_err(dev, "Failed to write output PWM frequency register\n");
> > -			return ret;
> > -		}
> > -	}
> > +	priv->pwm_22khz = of_property_read_bool(dev_of_node(dev), "issi,22khz-pwm");
> >  
> >  	for_each_available_child_of_node_scoped(dev_of_node(dev), child) {
> >  		struct led_init_data init_data = {};
> > -- 
> > 2.54.0
> > 
> > 
> 
> -- 
> Lee Jones
> 

