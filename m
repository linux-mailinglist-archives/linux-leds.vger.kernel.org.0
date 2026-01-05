Return-Path: <linux-leds+bounces-6526-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E9BCF2DD3
	for <lists+linux-leds@lfdr.de>; Mon, 05 Jan 2026 10:55:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 810E93002900
	for <lists+linux-leds@lfdr.de>; Mon,  5 Jan 2026 09:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 285AE23EA89;
	Mon,  5 Jan 2026 09:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="akG68zoo"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2BE31326C
	for <linux-leds@vger.kernel.org>; Mon,  5 Jan 2026 09:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767606908; cv=none; b=fO0ZTW9K8QN3Pc4r5R8Ag4iqYllNADCgXpAxvVC124RnATtForw0d4bauvi9+SAPzUayrlugDJUQwAUumr2fdcxQPf80ZOCZQqciW1/51nJPacdg7g7+RN//E5Rkr2b7eWpIz/yB+/z+s2WcYEZI9QUUJkGBw5jnLY6eqSgmJNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767606908; c=relaxed/simple;
	bh=6HoC5B1ekt0sL7loIBZy8fGIO8xpT7YLxuo/MRO5H70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XoSZ+fW2yaTVa2Y5yKNkr6+bo1LjcmkdK1RfVU3JVd2MiGwTf9OIwZVaBbKGI9HRZLMv09e+C+Z837m+CD3vNryYkcD+qu6FDWUIZiYa6ZrOx5W41DDH+9gp0amMwR0jz2UWlXldiwVnM9ikg5wroSWiYfh+Qy4yvWCf5m7jCUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=akG68zoo; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so103549435e9.0
        for <linux-leds@vger.kernel.org>; Mon, 05 Jan 2026 01:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767606903; x=1768211703; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8EEV3Yajgow2Le02Xox/uVz7KgADcHkRJO8r3JoHZTc=;
        b=akG68zoozxjQ3b0JhmiR3iSEikMHAgtq4KK/Lc/49V0Zr0cF5q/S2NYqsCsBPSwo7O
         9iPiVTJQs6iI6eMzlEOvFlpvMD3XK6uYjpaSvBpq+eOTZ3UlDK/W2hzQkTQvksIDeA+L
         p4Wals4wzn1GfbLz/mU9gvBGvikPFfAvyl6pEeaxvns40WtJxkXYxoN3ACQy1VVm/MVn
         TzTYQygnhWGKHKLyvfqw0ACySBwqmx/Cs3Fr10/dSSdbX1m0YjCdWouqPEzF0W3Sb/Nl
         qBSR9V3jMUnAYM/I+ZvNK4Hx0igLZXTJYjtHJ+ad9dN2jd3/1rbjKGq0mUSoCC9g/+kA
         TM+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767606903; x=1768211703;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8EEV3Yajgow2Le02Xox/uVz7KgADcHkRJO8r3JoHZTc=;
        b=rccmlVBdVDTznXCbT53pR/RkYWfoBz7XHaa0+4qOUtoWWlUGZEc0r2BuRC7Kda+1/2
         ycgofqiqeLjz6JUNm7pW8BQdLl+ZLuRtQEkyPzI6et2HI5UdLUQGM6HnNrhbCmeNHf6N
         YzqBdH/wvM6VEHCvvZzME+jvPAOy1IMki86JZgtvFKdTq5SdIUp3opWC7NtMDTg69RLs
         qKeZvoOn/uOGmsVyCUOK3JJvU/OYRKpCTL/2ND8j7rPgDqZOlysiOZOYgZuUS0GW85ge
         b/+bIHRt9ZlG43IGMCPVo53rjv7jxMAi/qCzCvv9Ks4AR+UUs8Ulb/oD6Vr7vCRCc6vr
         bt6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWzYUeNaERrqJafS0JrvuRC33Am4XvJomp0JnZrttWZVJP0ANt3oZLp4U1esdsnt7EWtCrW/BB016Cd@vger.kernel.org
X-Gm-Message-State: AOJu0YyGi0k6neJCgszRgQMBKUbAyqNrQ6o34BXa+eCYc/BuoZuz/m88
	PzmzgWrM50/RVF2ShDTMFK5oIIOZJqFnMOp5RXkgUEUnHbwk8le0AwwTCBe/uEnyLJA=
X-Gm-Gg: AY/fxX7kb3IyavoSJrdgypWoaF1Ie1VgRY6TVRelnOAMI61a9E+MIfTQCYpBmZrq2Cu
	goyNKp2ECHoETp58SlYlgKTevzSJoOmgD+HYRSPjrKMGX0/gcu/DoP6eAxdm7a6lHT3PY5wv05H
	geHpwmsMiaNn9c6EXRHjzuchEASPWFUqc5/6oWJCg8YCHNCQMc4uiv7CLKto7UJCOlyVkadNAhr
	NO61Rk8XULGDeheDS8pY3v5G2lbjOM47/j70opZs3jJWuNuULzFpjeV7KMJqnfdouwkFrQ0YZq8
	vKj8n0zCVISWOQFbmqKlZs0vEBY0fBPeDUu7ESTFeORZDJVlbzGoqNF2nFWyYv2FhZNuWjVGol3
	RokvhnmCnv16SnZmNrf2OH0JV9yTk2+pFtFQ/jeZ/5inCMtnJuVfLmN+W3ZJwNSnq9BYS+ghngL
	vH/VZaUihl8iQvkCpgjWucC2LNPuT5PiTkmQ4a3oXiOJ08QFfWgP+2feUvyub/odhj2384PE4hE
	MoHa+Jh3ptwjDnbz8bwm1dYjJDHnv++WULGhj+qPpFlbFupfd1mMV53GD8jNV0bxcnxv7qG
X-Google-Smtp-Source: AGHT+IEDntn78ZAZ+9BLk0OP0TDSrFfpGHytu7a8eXwL+wuSz/sJ8bMiyLl9n++coQm1Y605Eud1ag==
X-Received: by 2002:a05:600c:4446:b0:475:e007:bae0 with SMTP id 5b1f17b1804b1-47d1956f896mr636890455e9.16.1767606903267;
        Mon, 05 Jan 2026 01:55:03 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6be5e2eesm55247805e9.5.2026.01.05.01.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 01:55:02 -0800 (PST)
Date: Mon, 5 Jan 2026 09:55:00 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: Sudarshan Shetty <tessolveupstream@gmail.com>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
	pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: backlight: gpio-backlight: allow
 multiple GPIOs
Message-ID: <aVuKdAyXfWLs-WJI@aspen.lan>
References: <20260105085120.230862-1-tessolveupstream@gmail.com>
 <20260105085120.230862-2-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105085120.230862-2-tessolveupstream@gmail.com>

On Mon, Jan 05, 2026 at 02:21:19PM +0530, Sudarshan Shetty wrote:
> Update the gpio-backlight binding to support configurations that require
> more than one GPIO for enabling/disabling the backlight.
>
> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> ---
>  .../bindings/leds/backlight/gpio-backlight.yaml      | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
> index 584030b6b0b9..1483ce4a3480 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
> +++ b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
> @@ -17,7 +17,8 @@ properties:
>
>    gpios:
>      description: The gpio that is used for enabling/disabling the backlight.
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2

Why 2?


Daniel.

