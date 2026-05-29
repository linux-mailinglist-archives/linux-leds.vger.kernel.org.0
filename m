Return-Path: <linux-leds+bounces-8373-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIM9O1h0GWogwwgAu9opvQ
	(envelope-from <linux-leds+bounces-8373-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 13:11:20 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E396015EE
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 13:11:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A1D7F30048F8
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 11:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 073043C4548;
	Fri, 29 May 2026 11:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="zHK8lmBu"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCB0367F5B
	for <linux-leds@vger.kernel.org>; Fri, 29 May 2026 11:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780053042; cv=none; b=tISKsfNUw4jy4uT3gjqEhbZ8VWEyaRexq58zOB6M12PLJLK+IILTzLq7aDhyjja4PJiN6EqZfRvOh1R8sku7WZFTmuNVrfaOQP3b8XB17MUWHMhS+jSIZFQaky8noNgQrFHLFBNWdRd+nL5HzU9TPkZv8FdO15MPE1EML+nfcJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780053042; c=relaxed/simple;
	bh=VwGJ1aVISsmjGLnoNcjoGKPnok5e19Xi0seckWEDRu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=evMiDe7AbVVSAyNBBJQVOGyCp+eP4HrRn0O3PYbSo1kajdJ/tuk/Ytt9nywMG8JorVom+9IrqYzvhpl/rUVGwcMvAA0e+mzNrVqEqC9e5d5qfk48cACS+5yzxZkCdl0i/0SQfVnuierg2D7i6pQ0SUB4FT96m1eTm+5KIBLslWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=zHK8lmBu; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso70252255e9.2
        for <linux-leds@vger.kernel.org>; Fri, 29 May 2026 04:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780053040; x=1780657840; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VwGJ1aVISsmjGLnoNcjoGKPnok5e19Xi0seckWEDRu0=;
        b=zHK8lmBucbZ1kGYWNxWdhPPADUlkMHzI3vr/HtsrxyRdyVZ5iG3yZ9ZYZ57JdWiK8O
         Nj8/ghwxaaR9CN2MwOzZftw6rWW5HY0/VgIk8uWJEEVMnvoeR0jiiV4j2K+iPZNDHjY/
         9OgFRmOq6lzmOS7R44nxtdSpkaGmRKzaIuG6GxMxUpR+4ix131SJVw4fclFmord8xWV6
         5qP0M0B+H24ll019X3oA1PztnydZq7Xmwq4/8bvp+VbE/UP9UETZ5zybyKl7IoBreLZm
         1wEMEitUqJog6Sz0xtKz1eCC7dgcDpPmMf746vzVqLxWRsu8QSDGuJgSik4+lf1xmny5
         Pjgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780053040; x=1780657840;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VwGJ1aVISsmjGLnoNcjoGKPnok5e19Xi0seckWEDRu0=;
        b=jXAkwfn2Woenl9idXKpfK9i8lVz8z3Yo91f/Khwi1mcvrxzAa/dcI19/IXauIG0nAO
         jngASpIF3WAPWJLbzyVvnVp36Rxk24K1/4Bwz9Td8AWzhw2xXVHOevGgDrdxV/OVyZ+b
         3iz3DhbYL1PV6HCNNyi3Adm1C7Z0x0DUSbSE44pEjLl0ilY1QtXH9Nf3Qzf7pqLZuucs
         VluufmsGYWdHTdSTpExOyDyBmBVQTih/sAr0HmwC6K/vX2YRP0nWdRhfz52Zt7fVM3W4
         jn4VWvg8lowqk2y6eNppstJQ6Tv7NV8LHJbd8dFh2Ye9hJAtI4U1rWi6mUxKCSCOf1MB
         bl9A==
X-Forwarded-Encrypted: i=1; AFNElJ+6f1zaNqCadJRmkoFbPig5Xw/H5qLK81otXvtHqu1JVaOBCqsTeBOCNdXz4YD8E1rHvbmenIwgVeWE@vger.kernel.org
X-Gm-Message-State: AOJu0YxjXdj570Hx6ffEVogzcaplgch8p/EE5v284XFxMU9UToSznKXH
	kopfTa92HYAJBDe8yjHE4GQM71YXAVqQiDYOMNuIWd+8fM5qt1x7shLsnchmjQn5/ME=
X-Gm-Gg: Acq92OHzgvJiwAt8ejKuiQxzAwd17PrHW6pEkFj4BQKV/J2h1mlPeH9iRMYvvtV4S0o
	DQSf1z+gyFbIDMz43ORlQ85VA6fncfJiwHm2OfqI6FerN6Nj6A8CrHrEzYjHT7MnEs7hjSdaeBQ
	keJAF/0uyL743tInfcxcv+wtBZN7GgR36U1wCJrdWPCmPxrr88fd/I07YlXcdDGVhU45rWtxL3W
	RdkFdGsG+6KjUiNTu+LxB4G1XnuSNZPMxyf4sswvfq79vMgwVIpdwktqXAVHdC+53bU3BwE7K2H
	TNj7I3Dden/ljo14e8ghaFKCzRt9VrUHVWkWQX0keKES1m+PDeYtQsGmsl8TzQk7dFMXCTvYL2Y
	WIBea2Y3MvaNdIYPdhVxu+3qm8w8lNr9oRv0dDIx9VviZJcPVR6LUMEdD7ClplW6ZZxRWYuQK0T
	reFcRZNKXoiEe8UHkwtl2dGLJh8zaCxUS/iEZ8gCNm5Go8NNxAXmK2xt3lyn1+28WSQLnHTNsQt
	pWXpS8gbM2VdxY2Thr0s3SBvafYUfr3Fd1Xym9nWkFosAZfbfC8cdeWhWuGAnddUDnqLbGBFLES
	hz2Dq4Z6+2dy/H0EVBIUd2gpLYtvfQ==
X-Received: by 2002:a05:600c:4595:b0:490:52fb:12dd with SMTP id 5b1f17b1804b1-4909c0a4c85mr41540435e9.10.1780053040047;
        Fri, 29 May 2026 04:10:40 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c103b98sm11912765e9.19.2026.05.29.04.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 04:10:39 -0700 (PDT)
Date: Fri, 29 May 2026 12:10:37 +0100
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
Message-ID: <ahl0La8OQHXAlV3m@aspen.lan>
References: <20260528135123.103745-1-clamor95@gmail.com>
 <20260528135123.103745-6-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528135123.103745-6-clamor95@gmail.com>
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8373-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@riscstar.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,aspen.lan:mid,riscstar-com.20251104.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 68E396015EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 04:51:22PM +0300, Svyatoslav Ryhel wrote:
> Add support to obtain the initial mapping mode from DT instead of leaving
> it unconfigured. Additionally, update the linear sysfs code, which uses a
> similar coding pattern.

Words like "additionally" in a patch description can be a sign the patch
should actually be two patches. In this case the patch would be a lot
easier to read if you cleaned up the linear sysfs code (patch N) and then
added the new DT logic (patch N+1).


Daniel.

