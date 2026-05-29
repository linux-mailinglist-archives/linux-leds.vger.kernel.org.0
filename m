Return-Path: <linux-leds+bounces-8375-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBG/GHN7GWpHxAgAu9opvQ
	(envelope-from <linux-leds+bounces-8375-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 13:41:39 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61ABB601C57
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 13:41:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3983C3003729
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 11:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E03BE3DA5C0;
	Fri, 29 May 2026 11:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="OMibXqXV"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837723D9DC4
	for <linux-leds@vger.kernel.org>; Fri, 29 May 2026 11:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780054839; cv=none; b=KUF54Hi066O4Pv3R2kgAQCy4ERJn6f7dQ9sxpjHenOQ23p+Xj/gKqJpaGiOiFHapRJ5/XzUuSXjfipMCLVyBvNmX2oICHhuwiWvXVeWkCQycYQ0zMSXO+neUixtHqfnG8swtlMcR8Z7MghqhuIR9FvsWp6oIUouH8V4NECqGEyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780054839; c=relaxed/simple;
	bh=UdoH9v2264a88kp9dYn9Bs+q1THx8Q+a+wHVLI7diCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QBAHLfHrUb94wVMvDJz8W542zwFlsG+zPSht7NXicYSQizBv/BK+5WVEgmgtnalJYDMgYW3cRLAy/iH2bF1VN51m1kXNmGbEWQArLgQdvB5GmPd15jFcN4L7FdvzY71iniEMej8b5u0IUuJYJP117OaJgOud2dhOAHCIthjf9+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=OMibXqXV; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso74668825e9.3
        for <linux-leds@vger.kernel.org>; Fri, 29 May 2026 04:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780054835; x=1780659635; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UdoH9v2264a88kp9dYn9Bs+q1THx8Q+a+wHVLI7diCc=;
        b=OMibXqXV5mEQCNRTJLjbmYObR13KYuljSFFP/FUsPgo+DIhHXf14qjCSauZjIyXMbB
         fxrI+mF3DBivpNWrFXS7mLA7FT9uinGHJ2MoJNBg0SLwZ04BYM5QpjUQZykFneaINvYI
         IbKsZ6zD+fbJESOtVo/RmvR29TkyL+bvC19zw/6OqFOG7JJ1EQqVU2rW/oG/5xdUKTfB
         nyVh///i+zk1BM2EQ6d5popMa0c+L+e2tEEN9ngzVvrm1mVuRsA+CC5GfsbQnEVsPfHO
         4nZtoZ55Y8abrD47an9QDrv79XXuTsMwOPA6/0PNwIizFv8x5OrH8rmxA/uzNcFa8CoG
         KWTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780054835; x=1780659635;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UdoH9v2264a88kp9dYn9Bs+q1THx8Q+a+wHVLI7diCc=;
        b=Ia7ri1nMWMEvUfPjLE9bznx5kX6cWEv+JogUvLkXrGCKfsz6Z9CbEZx+5ej6sO6lb4
         P7w/y0ob8ZEccKgzEZfE1XCyC3KCdCvS7czwDh1SNRqAHNSG9aTpkaK/E4mhjCice3DC
         Y88jb41QPU24pDa6cpOOQBtO0Cw3jDyyrqFCJvWavIGZgon2UCYs/zWy5yNgiv24hOhT
         NMunykCu9/xhWvW3WZb/rQom16VK+eT/23eLqGT2y90F7vbaBC4bvRTsj2ftfNdXCWPq
         YymV7FElmmS1iTgQYhnsTG+tq8bT65WxRspLflJIY0l3te4MahUyRby8tLUKM7kuaqy5
         fYhQ==
X-Forwarded-Encrypted: i=1; AFNElJ8teTTFd6xaj19LyiW1+sq+F3v9QBHZerrD4FePk/B/XXYgNB2Cdm03S2xT4m+ZC+P8UlK/j9OjWLjp@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxvz+Pb4kWx0FK1MSnqz+4xzxsw5Nij5D7mEqXgLxSKkWOgnpV
	wc7BTzsEolUmCN7HlhvtKmPveZ39og18uqnWj49QbuxtjocRaX8BCPpbgYli5oQpLJM=
X-Gm-Gg: Acq92OGFs140FrTiyOqAlBsLfWwdVphvFUKX75XghvTzMLOanL5A8C2H3zfkLZcR4nT
	udy/CFogK2Vx9tti3r/Swi68O8EbjY+xlXqEQtlaS5xKmSvhBK1flp7qArsk1Z49Jsv3FsOWIpH
	uVWaCcGly7BqLLHYq2a4WJwIk4L4aoN898LwP2yCRpFrPi9/rZcKPHVOA2weUxYtDf76OKIh3Rg
	BryEx3kSQiClq6mHHq/RmuCAALimsuRaXgssxMA7oj1dOkKyQ1HTewdds5C/kE/JyqXKh8Qe231
	eYYQ02E68uMYJphUEipU85IeMIyXh870itCZHjW2bEmswkRWMrrt7V/1ZVIjAjw/qVMYkCcJr0H
	c/vpQHelb+HgqogwCCnZ5B7KEiMq/8NAhSyddUx4EwBxYHUbYICacpIP51XaQ0n5jWFr4ppkvCt
	ETG0+0czWyNvP8O/JHc7bJ5xir9PURLnS+TNxZy5Q3KmpRJ472HPJ9BIsuLSAGytFoA+3f1img1
	T+BpqYvx4SzU0KQwqg6a+a4BSlePtDDR5PhbSwD3g0MIMOQzT+kvk3ApYAV3dBoOFrhfvf1D93T
	zVjN35nPAjDDov+ma1g=
X-Received: by 2002:a05:600c:1d0f:b0:490:3d2e:b67d with SMTP id 5b1f17b1804b1-4909c0c598cmr48050845e9.30.1780054834629;
        Fri, 29 May 2026 04:40:34 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c6319ddsm41281115e9.0.2026.05.29.04.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 04:40:34 -0700 (PDT)
Date: Fri, 29 May 2026 12:40:32 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>,
	Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 5/6] video: backlight: lm3533_bl: Set initial mapping
 mode from DT
Message-ID: <ahl7MKBzUhmgdj8b@aspen.lan>
References: <20260528135123.103745-1-clamor95@gmail.com>
 <20260528135123.103745-6-clamor95@gmail.com>
 <ahl0La8OQHXAlV3m@aspen.lan>
 <CAPVz0n0kpYBACOo=YyNk31KGwBEoyrf+dii8V6QY4iRCGd2PNQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n0kpYBACOo=YyNk31KGwBEoyrf+dii8V6QY4iRCGd2PNQ@mail.gmail.com>
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8375-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@riscstar.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 61ABB601C57
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 29, 2026 at 02:17:00PM +0300, Svyatoslav Ryhel wrote:
> пт, 29 трав. 2026 р. о 14:10 Daniel Thompson <daniel@riscstar.com> пише:
> >
> > On Thu, May 28, 2026 at 04:51:22PM +0300, Svyatoslav Ryhel wrote:
> > > Add support to obtain the initial mapping mode from DT instead of leaving
> > > it unconfigured. Additionally, update the linear sysfs code, which uses a
> > > similar coding pattern.
> >
> > Words like "additionally" in a patch description can be a sign the patch
> > should actually be two patches. In this case the patch would be a lot
> > easier to read if you cleaned up the linear sysfs code (patch N) and then
> > added the new DT logic (patch N+1).
> >
>
> I looked into this in reverse. My goal was to add DT logic I don't
> case how sysfs works. My code matched with what sysfs does I just
> included sysfs change as well. I might better drop sysfs changes
> entirely since with such pace this patchset will inflate from 6 to 15
> and beyond.

Not sure about that. The clean up is good and introducing the new
BIT(2 * n + 1) macro does need to be used pervasively or there's no
point in adding it.


Daniel.

