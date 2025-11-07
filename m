Return-Path: <linux-leds+bounces-6038-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 53614C40DB1
	for <lists+linux-leds@lfdr.de>; Fri, 07 Nov 2025 17:24:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 00A6E4F4AA2
	for <lists+linux-leds@lfdr.de>; Fri,  7 Nov 2025 16:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B3A8277035;
	Fri,  7 Nov 2025 16:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="GrSpfDG5"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDF627145F
	for <linux-leds@vger.kernel.org>; Fri,  7 Nov 2025 16:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762532442; cv=none; b=PgxinaP2t+xUC8yIDjm7w0xtaKFcj7TWnFsl1uUFmNJIzQv1rvztuThj7GyZnLSml6NV6CmmXHGodkGORkkUDT/1wBgKkq/EuFbFMFzLA5BMIz0XU4rpq9DG/n/OZMJ9t3dPk7oGRXQdNDUyLZoGCxmWWgO0iIEn6wLxRKwemNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762532442; c=relaxed/simple;
	bh=Fqsv7T5UOZsDf8OyIMapY71LUPMEa73mHQs1iYV1MDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kTPMi8yWvnC5w836h+Ac/NlgRYMaErA6jaNqKR39nlTuX0/joS67rjuBpgmVwvt/zSgVKBd+w8vrMuPUpj4hFywDp8erhxmC/j9Czdd5Q2cbRjSH22YlO91v7McZ2CI8NXYpws043a9nAqEoHDp5q3oj436RJyEheT7svAX5ErM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=GrSpfDG5; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-475ca9237c2so5028765e9.3
        for <linux-leds@vger.kernel.org>; Fri, 07 Nov 2025 08:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1762532438; x=1763137238; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wDYDeeQ/vWAVkTVZ2tumPs2hnzhDw4b29aU1EHWCyII=;
        b=GrSpfDG5UEA62RszPCamiXBlJMTzRq/172nlAeJBrWsdesZzjS4yKwDk2uPZl2TAxD
         kovPJcpe3glAbYlq4vnnS1Xcq4eAfxVVjXer2YHuVUpnQlxdLDhGwrXECH32yG/ug1/R
         xvqGOpIfPF2NFGtE1jYgxQ+nUvPNthJTXKBCxGZ/rbivATdqQsKWCceJXObblp7IgqTK
         ucKfiisyTfcihb7quFaxVwbf3Ru0FEUwLkVf+y4DCD9NLNN8d60M/3xra+KJ1JtMnGdb
         YaTFnPIveiIpNv/+J+PE+soVDp6fM8gNFA8/D6lqyRDWVn2fdZA3jkR6L+CXomvE2QpK
         IKRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762532438; x=1763137238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wDYDeeQ/vWAVkTVZ2tumPs2hnzhDw4b29aU1EHWCyII=;
        b=MdNrvLtxcW/RvZacc6poigSczuofgqpsq6AeqcGBmdFYro8pFkaQ1QPNOiiuODcrtk
         latRb/1BIOnnnPaNDy/fZbsZOSHtHFES3eZXJrwcsWx0PnkZT/PoH3zzTrmb6AdPMr1W
         syzAlfzLfCBIFKHzmiGyI9w7rmwB/sBW6q2V35Rq3wtwVvfG1h8KM3DNfdKVKWyOQ9UR
         ebn7TDNqAXnH1bhdTDj/gMTclALGiEp5kLKnhT37JgnTo3SYgXrz661PvEGsqAqR/Uck
         Ia55UG24AXr/NZYqjcmC92mO50yAf3ljujx5kjpXQgY/4CAt9AAqR5T0M5tMzxEPdhjA
         zpoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXu2z9sUS+D78fmgqvevCL0M0Y2ARacwIX80cPJ5pa+MONBfU0V73SUQQuNKwhAKl1Bi/+FKFt8vtc@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6TqxBw+/+EEohS/gHDlX47K6xY6Oq+1VCr5M5/o1zUNmSNyL+
	eu02vILWJBBIFaNFOTyJhheIjKUub6QANYOsLLQRlvn4svzKh18Rntl8IAGpYW01004=
X-Gm-Gg: ASbGncs28wh/cMj22X0ZsBDGZNlE6C7mQXT5GSDMeiqiBYjpkn3NiJJ8KoV1lIzJ9Tb
	6nH7EL4u7xcT/1+VT/l7fGvJlMclm0GGkHz+Bmg1wJ3d0bIHbh2HibS/sD/h7t9/ChHd4jmn9kL
	N1GA620PJd+H8oK46i53+ku37+quJVkatzgUE3U5wyXGcKtlthdgO0mGOfidAC+WTYtMkPlMmpZ
	DEa23ftLblXfFtJNcSjZ+fYQykvFRiGwP5IpwJg5wEdZNufBpuIaCuM/iUn6eZtsl+jdYz4V+2c
	1h1q5TWmumKcVrbBd4KhpYqfumM8OKDVfh9DW7Uh3RMN9rXjFzkIu7cixMFANUxIcGgEYBt1Wf0
	ySoyL93SBDyWvxDPzRswR4zvsPVkebvLyn3UhITGMW0bkeNyOXCQtM3CbM8DnVlez6Tz9QG0J/B
	gXW2SBeE7NW7ioyU2sK0IlL+Vbzq/G/j00n823B7tGf+nqBG1jj7Fu9KV04R0=
X-Google-Smtp-Source: AGHT+IFcgdIpQe62FnRg4rVkke0TruBClBrbAABNqXTY7mPIIJ+cQeAzHNDnmh9vCKPrBQJ6NHkN0w==
X-Received: by 2002:a05:600c:1c8e:b0:475:ddf7:995e with SMTP id 5b1f17b1804b1-4776bca6415mr30487885e9.12.1762532438329;
        Fri, 07 Nov 2025 08:20:38 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477641fdbd8sm48938385e9.5.2025.11.07.08.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 08:20:37 -0800 (PST)
Date: Fri, 7 Nov 2025 16:22:33 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: Frank Li <Frank.li@nxp.com>
Cc: maudspierings@gocontroll.com, Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
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
Subject: Re: [PATCH v5 2/4] backlight: add max25014atg backlighty
Message-ID: <aQ4cyVKzgBUfpsj9@aspen.lan>
References: <20251107-max25014-v5-0-9a6aa57306bf@gocontroll.com>
 <20251107-max25014-v5-2-9a6aa57306bf@gocontroll.com>
 <aQ4Vb4eUmSX0Nj6+@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQ4Vb4eUmSX0Nj6+@lizhi-Precision-Tower-5810>

On Fri, Nov 07, 2025 at 10:51:11AM -0500, Frank Li wrote:
> On Fri, Nov 07, 2025 at 01:49:59PM +0100, Maud Spierings via B4 Relay wrote:
> > From: Maud Spierings <maudspierings@gocontroll.com>
> >
> > The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> > with integrated boost controller.
> >
> > Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>

<snip>

> > +static int max25014_probe(struct i2c_client *cl)
> > +{
> > +	struct backlight_device *bl;
> > +	const struct i2c_device_id *id = i2c_client_get_device_id(cl);
> > +	struct max25014 *maxim;
> > +	struct backlight_properties props;
> > +	int ret;
> > +	uint32_t initial_brightness = 50;
>
> try keep reverise christmas order

I thought reverse christmas tree order only applied to code where the
maintainers called it out in Development/process (e.g. netdev and tip).


Daniel.

