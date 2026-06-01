Return-Path: <linux-leds+bounces-8417-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oD7VMriqHWq+cwkAu9opvQ
	(envelope-from <linux-leds+bounces-8417-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 01 Jun 2026 17:52:24 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 27342622132
	for <lists+linux-leds@lfdr.de>; Mon, 01 Jun 2026 17:52:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 801AE305D5E9
	for <lists+linux-leds@lfdr.de>; Mon,  1 Jun 2026 15:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80EAE3DB63D;
	Mon,  1 Jun 2026 15:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RaUJRkQN"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CBE3D9048
	for <linux-leds@vger.kernel.org>; Mon,  1 Jun 2026 15:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780328742; cv=none; b=gsoC4YqFEta3DYF5w8cyl4WXzn395G4GmQhux7qwtKcfMN8obokRVah3PY4ldScHNLYgGBirHeYEX4fPbz05ghbcM35Sw9nQzzSZhtnwTBeLVu+qgP3ksDW4DuGqH/uhPZUQznOvxr6ZTikeqwEhR5nIvGNOgLgR1b7tjEwWhwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780328742; c=relaxed/simple;
	bh=ROYx6QEukf3YLjEl566ZTbj9VuE6iPvNRMj6LD7v8eU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cmZcWyCE/xM/5v3T0ybdxTvDPoWxKGIVAo+JB3AgkcZiND/xAslrh2fab8UWYcoheSDaaqili+33aJN759hfUN2IVM3AFXbze2i6oc9lE0dFWcK6PWchOCTak47IC5aPYyMQoXTe8FqoGrxfaLjldZstoXvRnDLmc74JpHNP8hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RaUJRkQN; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-304d7f31215so4134162eec.1
        for <linux-leds@vger.kernel.org>; Mon, 01 Jun 2026 08:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780328740; x=1780933540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UaqksUdxiXyCtVFqTvdAaP62ws3AIE3gaygTLx44flo=;
        b=RaUJRkQNSA2o5iSTJITFFeSw24PkWjZPSyIu+Z1gD/gk2Ulj2QdrefgKXaooOJUNuu
         ko7Ti/WzAmV2kIcizA4DiMCP+DV5CkDXIrVjE3hl286ggvDDhbczAC5zrXhRxVKas7Fg
         o/LF45t8MmOqn/lkUuahDfqUfT657ThINrXKQqA7hnkco5ArZzg+KhFWynafvGOfyHal
         ukuOynMioZNRfWEcgvQ3arj3O9FJ6fN+ezI7Xc1p+OiWFai9sY77RYBhk8FewHrzrsn0
         lyxQ4aV5F091dZvgb/iFzPAq3eS8SGwNdQzUyFvtdaNinb7WNueqG7fApXC5f25MoAid
         Kg7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780328740; x=1780933540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UaqksUdxiXyCtVFqTvdAaP62ws3AIE3gaygTLx44flo=;
        b=lzj7rpn0kuldDYAFc7xUzjXp5ztDMTjv5c+xFPBUKjhcl9LlK59LVkbqjOsm/llpUW
         Go82IkuxoIFuKGXWai+huhuGtUzu9hHn27cm2AlkW1+du7Kt8yfnachMR33aTI5zUY8h
         /XFQU4m2ticZI6Se4q1iZeGdc1zM4CLnxCSj5EBVLurG9ubaWXde/wn3Kn8/6MCHcQaN
         wFZLv1VTKzU0OuDrdg+aEJVCRYOLM/+IH9P/ZsYpT3WWQP20lJ9pZoV9iVRJt/1HfaNy
         /WWvyjgHvyxhcR5ZygzuXrgNGWXM5IzrSxO/I07Kaaw6L/0i7jHYqFixeP2nu7o6N/48
         6rdA==
X-Forwarded-Encrypted: i=1; AFNElJ9ZDdZfevnqw0xTLnQy1vQPJUrQKJzKiGay8P1oSUyGFzRdIrNr3Wdl/zb3H1Afadz01LIPY+x3x5Pc@vger.kernel.org
X-Gm-Message-State: AOJu0YymPy4LS/pQky52SV3QE8p8afzv4JvdcaFrN64iCj1FjzRQCBsG
	ZSd+P0CkKONP7gFzd/QVMuWBiWPEn3jdJtdnxM1GbLBWsi/akxWcJiaw
X-Gm-Gg: Acq92OHemj61hYdaNMygsMFAdrzgrTa+7fVxtu/fhxjx86dED4O4DN8J/bGyytyUWiF
	oAaxRGnaPSoS2j9gg3RPh+QXbGzjAcmsDl9k3F5aO2dDJV7HkdwoTtQl8hEfLXDMe4JJebOZOv0
	0wtUOceiHwDpAcs1pOL3qTf5DwIGD7xSMh7fUlbQTmABqhTXSKJZEydYoLRCLBgCGns48XBH7ia
	HKGE0pjuYWPd2gieqWOyc8KhacYL/OVbd3qtjgL4tCYBkOHoXBqMyzpM2W5LTFi1fIPuK/2q10g
	UBVT2WIib+ChlqRYq6Quw/Q6t3fMp2MvQRa23c621du+y9W6SkEx0rkVgn75ytaSdRGhbBHfn4G
	V9YRNpt3945dYqhUcFGAOZP2/pE3ezq2YTDbKKu8w0srr1SRy7sq7MqVZfkRdP63HVioDcA+lMk
	WeYekInLnBZHNYWlh5IWjrHfPyjhT+cOTKC0pmPaYoQAdpKkPwDyifP8qIPe59
X-Received: by 2002:a05:7300:e12a:b0:2d8:71c2:255d with SMTP id 5a478bee46e88-304fa51a193mr4979946eec.14.1780328740237;
        Mon, 01 Jun 2026 08:45:40 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a54:e741:3a5a:3245:d3dc:4b5d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed563d09sm8875697eec.15.2026.06.01.08.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:45:39 -0700 (PDT)
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
Subject: Re: [PATCH v7 4/6] leds: is31fl32xx: Add powerdown pin for hardware shutdown mode
Date: Mon,  1 Jun 2026 23:45:33 +0800
Message-ID: <20260601154534.1675736-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260527151743.GA712405@google.com>
References: <20260527151743.GA712405@google.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8417-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 27342622132
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> On Wed, 20 May 2026, Jun Yan wrote:
> 
> > The IS31FL32XX series features an SDB shutdown pin.
> > Driving it low (active low) places the chip into hardware shutdown
> 
> Nit: No need to wrap for a new sentence.

Got it.

> > mode for power saving, while all register contents are preserved
> > and registers are not reset.
> > 
> > Deassert/assert the pin accordingly during probe() and remove()
> > to manage hardware shutdown mode.
> > 
> > Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> > ---
> >  drivers/leds/leds-is31fl32xx.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> > 
> > diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
> > index fe07acbb103a..5b9ed5a1818f 100644
> > --- a/drivers/leds/leds-is31fl32xx.c
> > +++ b/drivers/leds/leds-is31fl32xx.c
> > @@ -10,6 +10,7 @@
> >   */
> >  
> >  #include <linux/device.h>
> > +#include <linux/gpio/consumer.h>
> >  #include <linux/i2c.h>
> >  #include <linux/kernel.h>
> >  #include <linux/leds.h>
> > @@ -60,6 +61,7 @@ struct is31fl32xx_led_data {
> >  struct is31fl32xx_priv {
> >  	const struct is31fl32xx_chipdef *cdef;
> >  	struct i2c_client *client;
> > +	struct gpio_desc *powerdown_gpio;
> >  	unsigned int num_leds;
> >  	struct is31fl32xx_led_data leds[];
> >  };
> > @@ -421,6 +423,14 @@ static int is31fl32xx_parse_dt(struct device *dev,
> >  	const struct is31fl32xx_chipdef *cdef = priv->cdef;
> >  	int ret = 0;
> >  
> > +	/* Driving this GPIO line low takes the chip out of shutdown,
> > +	 * as it is flagged as GPIO_ACTIVE_LOW in provider (such as the device tree).
> > +	 */
> 
> Please use properly formatted multi-line comments.

OK.

> 
> > +	priv->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown", GPIOD_OUT_LOW);
> > +	if (IS_ERR(priv->powerdown_gpio))
> > +		return dev_err_probe(dev, PTR_ERR(priv->powerdown_gpio),
> > +				"Failed to get powerdown gpio\n");
> 
> Nit: GPIO

OK.

Thanks for the review, will fix all of in v8.

> 
> > +
> >  	if ((cdef->output_frequency_setting_reg != IS31FL32XX_REG_NONE) &&
> >  	    of_property_read_bool(dev_of_node(dev), "issi,22khz-pwm")) {
> >  
> > @@ -609,6 +619,9 @@ static void is31fl32xx_remove(struct i2c_client *client)
> >  	if (ret)
> >  		dev_err(&client->dev, "Failed to reset registers on removal (%pe)\n",
> >  			ERR_PTR(ret));
> > +
> > +	if (priv->powerdown_gpio)
> > +		gpiod_set_value(priv->powerdown_gpio, 1);
> >  }
> >  
> >  /*
> > -- 
> > 2.54.0
> > 
> > 
> 
> -- 
> Lee Jones


