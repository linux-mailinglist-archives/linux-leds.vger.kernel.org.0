Return-Path: <linux-leds+bounces-8295-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFtxJTkZE2oi7gYAu9opvQ
	(envelope-from <linux-leds+bounces-8295-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 24 May 2026 17:28:57 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3E25C2DA8
	for <lists+linux-leds@lfdr.de>; Sun, 24 May 2026 17:28:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E732F3006514
	for <lists+linux-leds@lfdr.de>; Sun, 24 May 2026 15:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F9973911DD;
	Sun, 24 May 2026 15:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D5/smh9K"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D298423507C
	for <linux-leds@vger.kernel.org>; Sun, 24 May 2026 15:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779636534; cv=none; b=oe4Hk4Rl8P1mIio1bFNDx6R/IIUK0tM4+aUBD/GeYojJeHlyFNWo3prRB2GREwdf8T/nVk9bMCQwQUxCUTFPetwKjZJryXBIDx6p6W3hA8ecdkAM8CTmmqC01d+MbJpibPX8FB1tbPGVrljvEBwmjPM6mzqRBpWMXehgTGjxlOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779636534; c=relaxed/simple;
	bh=LOTnnJjEfjgYhK9mTHRLydScQOQIdkcxoYCOiNnNjio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=npAm8USS5pGLiJlRMDgVnojNKpDLYya6YC1zB1Dwiltp8hf4i75UjWpm3N6LOXoycNRiUp6lSQPmfKxgi+ohIlDWAaKCWCC8TLjKkciUcTWT+b3BRsYTPEOvMFa+ccOJCGeYGEtSolwPFcW2ExbRPqe0B6xWro3TBhNKkN+IZq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D5/smh9K; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3660ab73adbso6285277a91.1
        for <linux-leds@vger.kernel.org>; Sun, 24 May 2026 08:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779636532; x=1780241332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W210ympgJYEgFlBfWOamMTnDBMwWQEx0ZM4PLQE0EHo=;
        b=D5/smh9KJ5A/sBpqvx7F/KcXSjN8LQnB3yIuaTtSp7Wk9hqLtIr29naQdOAyBP/O9E
         e6lzLi6EgB+8BBOWHdbVPb3Kcr0It6SRDJy96GWVEusveC2y/N3HqwrVhfm+ro5Wrs84
         C6gNfKdzmmGmwI1RwrlQrhIPOHOSv4ylNecvSyP0UuNclWk5AxnUgqPRRsI9WAz3YlfN
         wVdW7A5MLG5cY6KMQ9XBk+tedth9L1lMyEpYozyldeij7YBikmHfesOGkbHbe+WVzMQo
         yd7jCA6w97TgqZfTbGGPWHIj9Ez0z8gJpUPUodo+1ifKGoFysiqbqmv/wqJMV5FVtKGf
         /azw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779636532; x=1780241332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W210ympgJYEgFlBfWOamMTnDBMwWQEx0ZM4PLQE0EHo=;
        b=WbeXH5pROfjE70LXw7LVPWXDbhHr0awVUv1zUQjgCjay6ty+03NF7k/ibd7/gV6osF
         6GB6WcRY7/b4DiY2VjboQqXH47Lunx5b3TzPCnl8L6uLdqEoYgfG7meD0Hi+kLhiqTYd
         vlrrYNYJstjDm6JLPXdxu9ywp6Wy2GpcTF8i+o4TW3vo/hSQlA0xB6BayhjYUdTxyjFM
         oQm1oUsefiqHpGudzGZDovYuU41nJ0XH4XifHIdaz3NckklTWhhIvX5oz/yVTM2Zjs7K
         109GlfwTuIxAeTSGhoDQkiNK/UxgJOe9BlC208XfQwomOzWFdlNXR6qXKxV6SvKjrPf+
         sLMg==
X-Forwarded-Encrypted: i=1; AFNElJ/xdM79J44X24X7L+i4HEKGchv7iiPzyPb/bgwk8QZlL12Zjb1u+FpDuaphc8zVk103uXR5FtoRgkqn@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1jZVshON6ZFOXaf2ZGTufwTMUvMqI85PE+Uvjr450Jd4VUK02
	woSLnOIXv1TF021BLHKQwdVGPA3EEgj832sZgZ5IBmtoiW7I/+7nRHhV
X-Gm-Gg: Acq92OEW6TgZeYK25Tkmnal1TRnnOnOu0ptEl9NyEJfQCY85RrnyWv/Vw1TFaw9ac+Z
	/8Ob9FW9JjHK92E5RqqIy6ecciakEEyqOf9b5Vi5XOQKLIqgmSkV1bUdMfMrivO5W9C0MJM1D3A
	UIiZsVCBpVFmuKWXPlptK9eertvI6D136nhYX+p7lZYUCRJBhOXJ7iU00qRcjdlWMk9L9Lb7e1h
	QdaMfLE1W/Eq682SVestdSSWs7+mlUYoOqAEeh7/EJ4YO54ht7z95yJa68fn4A4dFBRobM+CXXb
	Ul3/3YiyEJnE+7UW/PuW1lc1Jp/iWo9CeXW5NEoXxDJ6EQeMzVOT2xHPZ5Sg3WhNfURlqgtWVI7
	fXz2GSkkOPkBDrW/TWxL2eWI1tPZFkcmrcvZvzawRjxCGeP5G1omdZH0ud5aV6UI9m+pp9CNgpf
	qu6QTa9hX13lnLThO5bUyn7l5z0aq4xGN8f4MOVILhHLXVZ2+qdw==
X-Received: by 2002:a17:90b:560b:b0:35b:d795:cf5d with SMTP id 98e67ed59e1d1-36a6bb5b91dmr8168182a91.5.1779636532194;
        Sun, 24 May 2026 08:28:52 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a5f:4fa1:cc65:18c0:209b:38a4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36adc0a6e94sm465904a91.4.2026.05.24.08.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 08:28:51 -0700 (PDT)
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
Subject: Re: [PATCH v5 4/5] leds: is31fl32xx: Add powerdown pin to exit hardware shutdown mode
Date: Sun, 24 May 2026 23:28:46 +0800
Message-ID: <20260524152846.381844-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520141259.GD2767592@google.com>
References: <20260520141259.GD2767592@google.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8295-lists,linux-leds=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.997];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 0D3E25C2DA8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> On Fri, 08 May 2026, Jun Yan wrote:
> 
> > The IS31FL32XX series features an SDB shutdown pin.
> > Driving it low (active low) places the chip into hardware shutdown
> > mode for power saving, while all register contents are preserved
> > and registers are not reset.
> > 
> > Drive the pin logic low during probe() to exit hardware shutdown
> > mode.
> > 
> > Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> > ---
> >  drivers/leds/leds-is31fl32xx.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git "a/drivers/leds/leds-is31fl32xx.c" "b/drivers/leds/leds-is31fl32xx.c"
> > index fe07acbb103a..57d779e07a62 100644
> > --- "a/drivers/leds/leds-is31fl32xx.c"
> > +++ "b/drivers/leds/leds-is31fl32xx.c"
> > @@ -10,6 +10,7 @@
> >   */
> >  
> >  #include <linux/device.h>
> > +#include <linux/gpio.h>
> 
> <linux/gpio/consumer.h>?

Got it.

> 
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
> > @@ -421,6 +423,11 @@ static int is31fl32xx_parse_dt(struct device *dev,
> >  	const struct is31fl32xx_chipdef *cdef = priv->cdef;
> >  	int ret = 0;
> >  
> > +	priv->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown", GPIOD_OUT_LOW);
> > +	if (IS_ERR(priv->powerdown_gpio))
> > +		return dev_err_probe(dev, PTR_ERR(priv->powerdown_gpio),
> > +				"Failed to get powerdown gpio\n");
> > +
> 
> "Failed to get 'powerdown' GPIO".
> 
> Shows that powerdown is the name of the pin and correctly capitalises
> GPIO.

Okay, I'll fix this.

> 
> >  	if ((cdef->output_frequency_setting_reg != IS31FL32XX_REG_NONE) &&
> >  	    of_property_read_bool(dev_of_node(dev), "issi,22khz-pwm")) {
> >  
> > -- 
> > 2.53.0
> > 
> > 
> 
> -- 
> Lee Jones


