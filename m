Return-Path: <linux-leds+bounces-6384-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A41CACE45
	for <lists+linux-leds@lfdr.de>; Mon, 08 Dec 2025 11:36:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4ED2E3050CFB
	for <lists+linux-leds@lfdr.de>; Mon,  8 Dec 2025 10:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3258A310652;
	Mon,  8 Dec 2025 10:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="nMhn5PTL"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D7030FC0A
	for <linux-leds@vger.kernel.org>; Mon,  8 Dec 2025 10:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765190164; cv=none; b=qbysEyfoc7DPD/BPbuhIatDvsdmMg6rwdTXmO8/Jipe43gQ0FhttBea3a/2jsEti57ZPmxUqR5B7J5UCwJ3qXvSC5F5V/+iQaOeRRhBwuKSW2IRd1aLRK6sOp44bdgB7QWQDaEzSyTERak2T0VSU3fJQ9glDV/TgRc+Fr+P/cLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765190164; c=relaxed/simple;
	bh=s0L/F0IMsYB37Rxo4CHT7apF8oSazdCraUwxwRSEMFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RgJ0X8KcsDIauX3A17s2mZv06cYIs9CnOUCYaqsetrhNODNOgU4GhUPO33Bp2vXrokXpwNIpHIPgfucOCPlth7yg4IQPY1uZ2H1o7nWT41r8QiaYMN00sZ6wjSgdT1h4WFEVUBDh+A3VDQ/JkAbXth3y4OrdqKdSNI5rtDdsPMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=nMhn5PTL; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477a1c28778so55773255e9.3
        for <linux-leds@vger.kernel.org>; Mon, 08 Dec 2025 02:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1765190159; x=1765794959; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+E3SOYkqsEc+5aDXpHHAZRqmKpJ7LXworventsdWgtI=;
        b=nMhn5PTL7mWngGMbeboSyi0dP4zWTcbikcsfwcPLTx5aKFoQ6YACS3xEp7I5wQDn19
         8+2oMBb4KM3f7xm5TgP9iNxIw/2JGVRoGc/fIIAHZCJuKS2POcqde2W0oj0v2OJZXhry
         SGzWvtxeP2UNR1Ac3c0KW4Iy328FdcyzlRVD1YFVYiJpFajCmcYmS/YYa83/nJwGzhL5
         taurYQskIYL4QueLkW7MvOdtVB/nOFF3a5YJUQMYQ/Qus+r3ic3+3YR3sdJ52y8CFwIw
         1BF2mfTZdOGsRkm1dGNzEBa+ZtAMAKYlVhHE9DqtAcDBWxU6MWii/vchH0S8uzaWaY5x
         Ip6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765190159; x=1765794959;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+E3SOYkqsEc+5aDXpHHAZRqmKpJ7LXworventsdWgtI=;
        b=mbS1VUP5kGn0xGRpACHdedW9A901rSJGOn+PLH1+8WuGNWUrsiGwlNfbodq8+a9Ocs
         nl4PdBWU2qBdvTNgtwH/135MUbqD0AZxXqqXihSzgZ8h113xPQnXGjm9nHAcMVsVB8/Q
         9urscEtN9nHcLzv8MaR4dhGJ8DtPgL08hJvYsnlIpmoRlm2xTt7jzVFssImUseKK8ovt
         6JJh+6ggg6PpRB4UoIjhc7JrmUBRw1GSkT97uid0hFJ3uGouGYzoH0tiUiwgTpwDneq6
         M4nV84oJVVEpzS/pbw1Au2lX7ZZ1LOJ6t0RDU+1M6mc5TX2ZtVz3MYy48sc8JFXXsZdI
         uEsA==
X-Forwarded-Encrypted: i=1; AJvYcCU0okveRY1lJLGVwNG8+n1zT6TNBNq3XXXCDZBipRlkYrql5CyHJLdtUjjsszqnqqRbLBN8sMzBa3gv@vger.kernel.org
X-Gm-Message-State: AOJu0YweYlJKEfHvU5ruDVRl4tqAQrGp+to+CpnGCrwCE7zRoBppWjnP
	0xG6lg/pG9zSU9J6jJYvcfw6hQCge5LFVfVCR8FNMFeMadm6M0KWOtTzUlxXVTOnCcg=
X-Gm-Gg: ASbGncvgGzS9ju/J404r4e6y0elzy2LYw867Jcig4dgDoUAmDE33AsBUjzCCU2t8D5A
	+EQwkPi1AKYPOmDHQWJCXyPeMYpHrKsHgUdj6cpYNs0PlBgdTUiIa4avV5p2JS/tk7cGq1fvsBg
	wAwsqBhztJA+icAV/n4kduOZrMhoHTVjH/wj8dzsYxynGxAo6bXC3F5kVJYVVjqjQ786LYaYkfR
	VAG8wtn1kEOE2hsyAaWEcNkOtqwPYfcmQIYC1fw1vB/I/rantSiX6yWeGkbk/M+Q111VF7Z1gQB
	ESOYKWu2LjjLlosk8s66YdUGpiOJCDm9HuhbEkyxnNbYNgKErklRHn8PydgqH//AtJqUgEMGLAf
	UtALCEbG7jLp5ScJgkAE2dPBHMAhDMJzMUCjnyI+ixuOFxXiMtaST5rOXIkOjGDDLTKkxHzM4gC
	IBjglvTBI81ysHOwLXgLKK75m83ayYi0V5z8Fc8xP4dt4ax4XFFQlKiehVwi0Wx7ANi2Tbcw==
X-Google-Smtp-Source: AGHT+IGge21HXj48TLUzsA7ggUbHSFC0xO5HgqxGNKT4MTX7Oe0oV8kQd6FtV8OIYLtnHQGrRwLESw==
X-Received: by 2002:a05:600c:818e:b0:477:9fcf:3fe3 with SMTP id 5b1f17b1804b1-47939c87088mr76977635e9.0.1765190159388;
        Mon, 08 Dec 2025 02:35:59 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479311e712fsm240407865e9.9.2025.12.08.02.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 02:35:58 -0800 (PST)
Date: Mon, 8 Dec 2025 10:35:55 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 2/4] backlight: add max25014atg backlight
Message-ID: <aTaqCxsGj_waN92Y@aspen.lan>
References: <20251201-max25014-v6-0-88e3ac8112ff@gocontroll.com>
 <20251201-max25014-v6-2-88e3ac8112ff@gocontroll.com>
 <aTG0EK_zuSB-U_bb@aspen.lan>
 <8a9a59b8-d5c0-46b3-8f86-a4cd910b7af3@gocontroll.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a9a59b8-d5c0-46b3-8f86-a4cd910b7af3@gocontroll.com>

On Fri, Dec 05, 2025 at 04:20:55PM +0100, Maud Spierings wrote:
> Thanks for the review.
>
> On 12/4/25 17:17, Daniel Thompson wrote:
> > On Mon, Dec 01, 2025 at 12:53:21PM +0100, Maud Spierings via B4 Relay wrote:
> > > The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> > > with integrated boost controller.
> > >
> > > Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
>
> <snip>
>
> > > +static int max25014_update_status(struct backlight_device *bl_dev)
> > > +{
> > > +	struct max25014 *maxim = bl_get_data(bl_dev);
> > > +	uint32_t reg;
> > > +	int ret;
> > > +
> > > +	if (backlight_is_blank(maxim->bl))
> > > +		bl_dev->props.brightness = 0;
> >
> > This isn't right. Why would you change the backlight level just because
> > it is currently blanked (and sorry I missed this one last time).
>
> so just remove this bit then jeah?

Yes. backlight_get_brightness() is all you should need.


> > > +
> > > +	reg  = TON_STEP * bl_dev->props.brightness;
> >
> > The correct way to honour blanking is just go call
> > backlight_get_brightness() instead of reading the property directly.
>
> will do.

Thanks.


Daniel.

