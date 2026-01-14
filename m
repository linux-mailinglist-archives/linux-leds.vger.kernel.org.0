Return-Path: <linux-leds+bounces-6643-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A07D1FF54
	for <lists+linux-leds@lfdr.de>; Wed, 14 Jan 2026 16:53:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 748073005BA0
	for <lists+linux-leds@lfdr.de>; Wed, 14 Jan 2026 15:53:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4660F39B493;
	Wed, 14 Jan 2026 15:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="hQOHDn7T"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC3635E551
	for <linux-leds@vger.kernel.org>; Wed, 14 Jan 2026 15:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768406021; cv=none; b=ASaxFEzZQO6FCHc3CfMFwJvf1UJTzsPcwRj9yoyvzxYOAvaEQM3BIeN7FKDzLEupeY1pFBGIclDsd0UWNi7o2t7CYEfabfOzQXA+OTpvB1ei/1yIxNVuqL3ywQefAZ9oFjIT2Golzl2J4U/lsZax+LQPR/E99OlEUY9XiFlMEZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768406021; c=relaxed/simple;
	bh=MjjY0CZe9m074IFDhBfEpVxdyYS7Z3Q8v4zhohpRutw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tKNEwnqJsQL3g7xolzdKvHfmUl9S1MnzTRQuL89rieiVtfB5cFIh6jAOHlHLfqZ+zUj4cw5d6bBOILblL6QheEj9mk350Tharwbr0R4oqo2nd4d+71pe+1P9kgSzzuwTdiik5YnR4jLcESMwBGlfq6R3QjRaPROCY//nKSOli5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=hQOHDn7T; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47ee0291921so12754935e9.3
        for <linux-leds@vger.kernel.org>; Wed, 14 Jan 2026 07:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768406017; x=1769010817; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mrePS2BeC/5/zU5iIVNiA/HxBMqtaGmBB9n2hBMQrA0=;
        b=hQOHDn7T8PjZDNbgPW6/0eJb4z6nY8heDKKRssw5W6YsE5B3CgY+QUeaMtbG5HIozl
         BDLBuXvzh89+smKariIFQ7c90ZLHqF628Z1MqBVZ3Q0VPI2tRK1eLhvGW0OojO9/Yey5
         0xvtKFtmC/LqrRbPA6uFHC6hOnai1pCmRQ4cQxni+Ukjf1sv+M+V74u7x1+rJRu+ZEqm
         Cn67cB2aPBtozrafM2L2mXNDWC6YaMd77RDv+KdgxTi9bA3cbnjMlnHqeJ9cYxgEv2tR
         BTXWeUnO6BTE0YiKHa0DpdhBbZ0sDkFAKWi+INFckGy9OStXhLXTnm93tG7D8WZHQdU3
         ne+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768406017; x=1769010817;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mrePS2BeC/5/zU5iIVNiA/HxBMqtaGmBB9n2hBMQrA0=;
        b=hrMYlhZr+FgyO+gj+5gUy7bSkoozvKmyiE56EegIcWQMz+2HV2vPefEBSMBg8Iz6TY
         XzxwQGvw5OJrbSQGmLYVjR5PSQP0KXSR4JK/aUUKXVj6wP4r/33hJ0vs8c//4JCQLhzX
         ybmqG3GGG1NfzDbWfr/XlzREbsFNtJHUFVQrGIPaV5FNtDtQpiH+CUsAVHipS11RWwAt
         pyqNA7OJ6QI99yj1Yuj0N54aC7N+xE1FMItMDtZvsBVwuIWZ3NXos7+UsVn8gyB/Sq5n
         60Q0wvpaq+EzWDfYltCgf7FOAKDw4xZxMgJLOok+NlP0YoB+xhPfqJTETGtq4gQFMLpU
         dLhw==
X-Forwarded-Encrypted: i=1; AJvYcCWkfiZSrH+g1x93u/U/MzILiVSZFIjqgvme2SvDSBuqzV9IOuhadK+JIGSMUUaQVMOFE7UV/UGo6ARd@vger.kernel.org
X-Gm-Message-State: AOJu0YwNU1jAU7G+e4rCP6mhwYT8Z6A4BcmO8o0EYiROOe/RoycfxeNM
	GABvem0zDlbAl+rcTg4vnM6jZjAvBgEcBvhFUkBLf8Nr7mcPmoGYPTccJKVBc5TkhyU=
X-Gm-Gg: AY/fxX4bIlJ/XFh99+gBdKkC3CebmOedoBjs7VRjq2Kwa38vrNHV4ZJfQHOaJQ7FKSt
	HlTc33OyBZTHy9sZKXvK3/lmEMhp7MrOL2QpaLJb0KryCNyOBmzFPrCud/rlGrHydED/hfS9dvb
	Wli/wL95sbS1njOq2goMJ5URZaM0rH7kXUNoYRqP+HllWxkRGw0uOmUuGxBsflxB9eJQfC2ReNq
	AWiCJ95z8n3w1HesY2xGAgwywuKcs3g0n+9xT2dIuU0X9WdyvF16xPlRgi4vjXRwBkVsSI2dQ48
	KxGGRGqBPSypEhCySVbfkc1qDoe3CCyAgtuzRICGWhe4MX1QcgBtVlHVYToh/GVuxkWE9+ua9Az
	tjyq6Uo3NTxi0ES+fjPBLNjuYZUAgq3L7gbjLmGK5LpQj4HDDyTLtX7332deaLeWwARGIWqHUbF
	pBa8pkuiqVXdxpxHdGN/XoeszDNvu/8b+2euv9ftbENdSPgOg2IRVsaqBfZZLGjTny8QEHA2EwH
	knPrkj3gpiZh3L22+k0cUc86UvXJ/5qeJis45TIjkzUcpvmFKA6o+I/ia4s5A9asS54f11u9rUs
	Kfwxp5A=
X-Received: by 2002:a05:600c:4515:b0:45c:4470:271c with SMTP id 5b1f17b1804b1-47ee339455dmr35015355e9.18.1768406016823;
        Wed, 14 Jan 2026 07:53:36 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee870sm51184009f8f.36.2026.01.14.07.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:53:36 -0800 (PST)
Date: Wed, 14 Jan 2026 15:53:34 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: tessolveupstream@gmail.com
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
	pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: backlight: gpio-backlight: allow
 multiple GPIOs
Message-ID: <aWe7_hFpmO0E2sJe@aspen.lan>
References: <20260105085120.230862-1-tessolveupstream@gmail.com>
 <20260105085120.230862-2-tessolveupstream@gmail.com>
 <aVuKdAyXfWLs-WJI@aspen.lan>
 <c182df66-8503-49cf-8d1d-7da17214b843@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c182df66-8503-49cf-8d1d-7da17214b843@gmail.com>

On Tue, Jan 13, 2026 at 10:15:53AM +0530, tessolveupstream@gmail.com wrote:
>
>
> On 05-01-2026 15:25, Daniel Thompson wrote:
> > On Mon, Jan 05, 2026 at 02:21:19PM +0530, Sudarshan Shetty wrote:
> >> Update the gpio-backlight binding to support configurations that require
> >> more than one GPIO for enabling/disabling the backlight.
> >>
> >> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> >> ---
> >>  .../bindings/leds/backlight/gpio-backlight.yaml      | 12 +++++++++++-
> >>  1 file changed, 11 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
> >> index 584030b6b0b9..1483ce4a3480 100644
> >> --- a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
> >> +++ b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
> >> @@ -17,7 +17,8 @@ properties:
> >>
> >>    gpios:
> >>      description: The gpio that is used for enabling/disabling the backlight.
> >> -    maxItems: 1
> >> +    minItems: 1
> >> +    maxItems: 2
> >
> > Why 2?
> >
>
> In the current design, the LVDS panel has a single backlight that
> is controlled by two GPIOs. Initially, It described as two separate
> backlight devices using the same gpio-backlight driver, since the
> existing driver supports only one GPIO per instance.
>
> So the maintainer suggested to extend the gpio-backlight driver
> and bindings to support multiple GPIOs.
> https://lore.kernel.org/all/q63bdon55app4gb2il5e7skyc6z2amcnaiqbqlhen7arkxphtb@3jejbelji2ti/

Right. So, once we support multiple GPIOs then why limit it to 2?


Daniel.

