Return-Path: <linux-leds+bounces-6321-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F05C8ACD5
	for <lists+linux-leds@lfdr.de>; Wed, 26 Nov 2025 17:03:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BF4514EEFDD
	for <lists+linux-leds@lfdr.de>; Wed, 26 Nov 2025 16:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27B1A33BBB6;
	Wed, 26 Nov 2025 16:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GznyddyK"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6384233BBCB
	for <linux-leds@vger.kernel.org>; Wed, 26 Nov 2025 16:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764172833; cv=none; b=HiJyi0GM14BsJSuvLxYvS5+0NsdtpxrEjHNJctqckdARtlwJot90Jfx93G+rJICBxp7Miz1/1EsNTNUxO1ffBrf3kl7pYRNKrLpv+gBPRPEM+SAZutefxC3Fix02yZxf4w3jPTRwJGUNNdEnkhRKo3ekJq9JHyk1B5CUFDYIMCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764172833; c=relaxed/simple;
	bh=WBJ9UwUNrgy/X0b0BvnOXQpDRGyYIy7WU+2Gj+p774c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S2s63JlmQHhgSDzO/jSaJyqaOUKlrP4V5Ht9J5V2lWxvU/Lu2mnVtdZrm0c+AUy8oUFW0jft2INPx13oRvkFzyJ642JWIzR8+rQrkluUQFXgkV+WxXzEpOItlvqqJM6GVyOXo4+802XB+AVGgucNAZcBzaIivndFOhjuUj5GTKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GznyddyK; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-297e239baecso8048425ad.1
        for <linux-leds@vger.kernel.org>; Wed, 26 Nov 2025 08:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764172831; x=1764777631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZ9M6k/4ewqJkE2TX87HwTQsuW0EN1M63J7M16fS/j8=;
        b=GznyddyKpf8VEbt0x7coIKsZpiCgiyOza3ZG0WDpm3vX4OlWsyrTmM5SKHqAuS4UYz
         n7ypeJ0k6VsF3SxHF/VSEBykvU82dWT7h0LDSbjekroXMkqyUKeHI/hbvDpTzc5EH/x+
         5JwmQ6p/nn1JsN8tqBTx9jQFnu9RaSil8FV65Alz5KnFDxjf6h1C9Bt9B6/I6+P8zcJg
         mHq+ckc26vQki1ZAMEdh5Wg9iIHjhMPrPvbWoQwLwvKe5x0v32SUUFqQEI9TBtcLaeEk
         S+ZYHo0XPxBKP/yZ7iBmpQL/n7jq81Quoeq+xb6EB49q4GKsAg/yClET1L1bAZB14Psr
         o/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764172831; x=1764777631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rZ9M6k/4ewqJkE2TX87HwTQsuW0EN1M63J7M16fS/j8=;
        b=DBVy0UxIts9Rvn58ZTA4fE77argbTgjS4ICVzglhqOqSZbvuuvWqSKycFoJJWlqyBf
         uS08CID6MY0h5D5zwP9r0QKN5I+oBcSVXnB4Mz4BzRbr6/3hpPGfFQUx1cfVlkQd/7xi
         OKW1hkK1KPlW/Iaiqffu74PeylcMS7B9cmEk+DfLnUGyFKM/D/QZoWBvdegt1aF8+IWA
         MUIug673IU5XY2cJve6iQSQWkgFORFEHIqjvBCfay175AbgDzBkM/5bVP338XnvEwNtm
         r6EqI0rD6l270I2oqoH5wnSmljkdn/eW9ZzCaRRyhP1C5+IQHx6QNaVFpGq+pEGW2z8Y
         l9Ww==
X-Forwarded-Encrypted: i=1; AJvYcCUiXNGilH7Lskau9W1bj2Jk8lXjsLjZ1WhpLPcI7rG2Xb0oOR9XuGOSuIkG6E6ZMFpmaZBbqr7cIWPX@vger.kernel.org
X-Gm-Message-State: AOJu0YxCB0dI8iSbqrtmhYHGBqsUvKZ/9VZuzWZh3v3xm9fJgC4a2r/r
	3FdD5mBLMfVhyJ3c5AbbAAuTFZ1mChMlvjg7yGLbXIywbd/1IHBtnaLp
X-Gm-Gg: ASbGncvNv3ANTCXwgYz+Nvc1CUhA1JsN80OpwdSpfFroum6jIk4BZeXqYV38oXt5Tn/
	TkZnZrET340rOVJ0VEDYLHdXuhMDBFDcq3orbdJVZe0jm8pneVbtG97TR8QrrF3I/hoB0omgAiy
	CTMA0TBggurpQAwS9lSAQ5zlrh5478LOPc2P8L3KQlAIPzKF1Lp78cYb7kUDtrmm5ySexHdbqcE
	JUJDQ7NTxKlLVN/o6wTSUILVcyAFzgzFR+CHg55tMLueIlKObXkPsILI0TZ6+AAMqcnK/EPMCZK
	uRv/a6wtUAh71v8Icz+3cqpxeP9PMPCQvq4L1I5nFi3k7kc7KCa48jDzrwdaLINLuu7y9vIcMMj
	oQh3G6rn9wbw4n/GmZwi9oqplr8mq/l49sHd922ms956ELhNCKHg3GnQQTD+nVAJO+NzzgRUUW5
	/yWZR59gIzNm8N1YM6IyvHzQ==
X-Google-Smtp-Source: AGHT+IHW4vl9EURMb8YJrD3dHKPOSvMXx6AkbqAkBsNYyyUqCnQUvs3T4dn6AYYdWnbh0jPv+aNGrQ==
X-Received: by 2002:a17:903:384f:b0:297:f527:885f with SMTP id d9443c01a7336-29b5df697dfmr276743665ad.0.1764172830405;
        Wed, 26 Nov 2025 08:00:30 -0800 (PST)
Received: from DESKTOP-P76LG1N.lan ([42.116.199.188])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13a865sm203447045ad.33.2025.11.26.08.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 08:00:29 -0800 (PST)
From: Nam Tran <trannamatk@gmail.com>
To: lee@kernel.org
Cc: gregkh@linuxfoundation.org,
	pavel@kernel.org,
	rdunlap@infradead.org,
	christophe.jaillet@wanadoo.fr,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v18 2/3] leds: add basic support for TI/National Semiconductor LP5812 LED Driver
Date: Wed, 26 Nov 2025 23:00:24 +0700
Message-Id: <20251126160024.141129-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251125134836.GC1127788@google.com>
References: <20251125134836.GC1127788@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 25 Nov 2025, Lee Jones wrote:

> > +static ssize_t parse_drive_mode(struct lp5812_chip *chip, const char *str)
> > +{
> > +	int i;
> > +
> > +	chip->u_drive_mode.s_drive_mode.mix_sel_led_0 = false;
> > +	chip->u_drive_mode.s_drive_mode.mix_sel_led_1 = false;
> > +	chip->u_drive_mode.s_drive_mode.mix_sel_led_2 = false;
> > +	chip->u_drive_mode.s_drive_mode.mix_sel_led_3 = false;
> > +
> > +	if (sysfs_streq(str, LP5812_MODE_DIRECT_NAME)) {
> > +		chip->u_drive_mode.s_drive_mode.led_mode = LP5812_MODE_DIRECT_VALUE;
> > +		return 0;
> > +	}
> > +
> > +	for (i = 0; i < ARRAY_SIZE(chip_mode_map); i++) {
> > +		if (!sysfs_streq(str, chip_mode_map[i].mode_name))
> > +			continue;
> > +
> > +		chip->u_drive_mode.s_drive_mode.led_mode = chip_mode_map[i].mode;
> > +		chip->u_scan_order.s_scan_order.scan_order_0 = chip_mode_map[i].scan_order_0;
> > +		chip->u_scan_order.s_scan_order.scan_order_1 = chip_mode_map[i].scan_order_1;
> > +		chip->u_scan_order.s_scan_order.scan_order_2 = chip_mode_map[i].scan_order_2;
> > +		chip->u_scan_order.s_scan_order.scan_order_3 = chip_mode_map[i].scan_order_3;
> 
> Where are all of these used?

These fields are part of unions (u_drive_mode and u_scan_order).
The bitfields are packed into drive_mode_val and scan_order_val, which are
written to DEV_CONFIG1 and DEV_CONFIG2 in lp5812_set_drive_mode_scan_order().

> [...]
> 
> > +union u_scan_order {
> 
> What is 'u'?

The u_* and s_* prefixes were originally meant to indicate union/struct, but they are not idiomatic.
I will rename it to
        union lp5812_scan_order {
            struct {
                u8 order0:2;
                u8 order1:2;
                u8 order2:2;
                u8 order3:2;
            } bits;
            u8 val;
        };
and do the same for u_drive_mode.

Thanks for reviewing.

Best regards,
Nam Tran

