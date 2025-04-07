Return-Path: <linux-leds+bounces-4436-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A637A7E66E
	for <lists+linux-leds@lfdr.de>; Mon,  7 Apr 2025 18:29:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B593166061
	for <lists+linux-leds@lfdr.de>; Mon,  7 Apr 2025 16:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41894213E70;
	Mon,  7 Apr 2025 16:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="hgBbv+tn"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9F020B1E5
	for <linux-leds@vger.kernel.org>; Mon,  7 Apr 2025 16:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744042743; cv=none; b=SKOxvvvCWKYyuvI35Cccvsz8yC3KnsNiNR7s4CcCuWn94C3kyi+ebtQkXmKUEhV4J5QUHlZ/WFFv0l7nr+3J04jWv1k1GyTu7Y8rkXWg7Xh8KBK3zuC+5V+FajkW43L1YiZJ6o1WLn0PSm48Y+sM4CHiU3al1+tB/X8qy6tw4zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744042743; c=relaxed/simple;
	bh=oQfeLGLwN0ia9mkF/LrZhoiRwa+hmOwNqpU0xO/chsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gm2I89YzArJPMCYvNI2+fGd2c3gSOS2kWmE7lqQNdPLQrlVIiSYBpnOSfvvhk8dj5ac07k7M5Xq9UeyEf8nfxrTeyZNhfkIj3Yn5qnFdPqkIuNxQQrFKUd+XDaphJQ7nRtzNFgny0PZoO/mJvI7ucRQMfDsB4343VpbEenFYXBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=hgBbv+tn; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-391342fc0b5so3605035f8f.3
        for <linux-leds@vger.kernel.org>; Mon, 07 Apr 2025 09:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744042739; x=1744647539; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FlvRbUOqYjIG9Hb+k1k+g6fdWn9FeWH5VnocqRc/bEs=;
        b=hgBbv+tnGW2Hf+TMWrtQEODiGSglq6jGf9+7Y1Gycp6G4O7jzt6JO/fF7WJ5+dHBJE
         YfOpDUxFiIqHxEhHdxmp6x8F4ESdRjp0bQqBSCmvM5MeKUybnM1lr95MmMhVrFqZALWE
         gwsjKtsG7zE9TgORbAprhJXQoUv+ILeE9f6A5SdJkkwdZjaPCGf5wR6inFvdLYuDAx6w
         1o19DFH92b3dXNTz08eWIweW4F/w+NcelHOzdkncik5fxzhF3k0f0MWLDiksEoj0z04H
         +yiAp8xANdFRLQOLN4k1zqZOJcRrypNgHw3TK8s7tSvOwNUEZR/I6lPXtRCVG/S2bHJR
         k3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744042739; x=1744647539;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FlvRbUOqYjIG9Hb+k1k+g6fdWn9FeWH5VnocqRc/bEs=;
        b=wrJ8iTeiVaTh0CsQWQdZ5qcjc38LeOQoKw4v50QdoIjuUwl4pkWZ8ZV1qXOKSdZAxC
         UIVnUCjvgCKJFC+RBxZghavAf8TB4SRt/jz2MEs3bimUfFZq8RRZKrlzXPdrMVoCaV5f
         TxbBg6Zgv/wCWDsjVMmTny7DWsijrvQlSxFx+/FlQ8PLpBRkAUZe3MDNdWtsDj4yRc9u
         n1f1XYEa0z65tVJ5SwHrNM+QlonZuL+DFTGvt0Ikry+nB+9vqHrmbpdnXg6i+bVdB4E2
         VXmQJq+OHKEsEuv35DiIk9QLH1KzmZt3sRFh8//Cgk7jxcdwv+vA4wSbrUz+fZR+EU2h
         40Gw==
X-Forwarded-Encrypted: i=1; AJvYcCVXUOfXYH85Cj9xYT6CDbVd6iwBuQFxgzIYXuAo6s/rxCziuIMuhy5wc7btuDHb+/tG1eDW0Ua8r/W3@vger.kernel.org
X-Gm-Message-State: AOJu0YxBS/mCQ0IUp+Zz70av0mn0B9iVMkgfHTM/ONPAaTVIhy0Guwi5
	n290QFJ7lelJ6jDa7ZK1ND2wmdLpwPO+EUzmjJ1wh1Zi8lr1WKy+qmKuXlPs0P0=
X-Gm-Gg: ASbGncsyqdge8CjDkKScWi7+ShcKPG8Ocy9H2WmPFZy6o6R/rumUjPdnVyg7ZdMs4em
	WK2XePwNrH6OJ+NWbEyoXqH6wMVuxsEYkAGhpsOcO6Zo/cVUH51kWak7Zq9/ZycAcgoMcM9fx4G
	3+Y2PSYNmypuaAoglZJDaZnawvyIYW2ipJGfhM+wBuAw+rHaDId4puUEv/GZTdGxBIv32bIzSr0
	mDiaFDP0bg4M4iTXw+xhedRAOZJRCLeB0kVjxW1gWUU6CXpub/EyuZxZpX4GlFzw1+ZbqfJghld
	J9U3m0mFFRhCWOv+IOUkaevL1fUYfYQR7vVIDBFVpIE5ATZEVS9b/2eayfzh16lbM3E0tTdS2b0
	HDkrSE6Xscd4B1U/7LNPvGWUjJR9H3tYzjJ2GcQ==
X-Google-Smtp-Source: AGHT+IGAiFgCHKC4NxdMI0XYxiblAlo6teR2sZ4ryX4FXGKNTm7nHjhUAQ7KJxNf9HDeA8CDyhXndw==
X-Received: by 2002:a05:6000:2285:b0:391:3049:d58d with SMTP id ffacd0b85a97d-39cadc85ab6mr11452084f8f.0.1744042739225;
        Mon, 07 Apr 2025 09:18:59 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226da7sm12857720f8f.98.2025.04.07.09.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 09:18:58 -0700 (PDT)
Date: Mon, 7 Apr 2025 17:18:56 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Jianhua Lu <lujianhua000@gmail.com>, Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 4/4] backlight: ktz8866: add definitions to make it more
 readable
Message-ID: <Z_P68OP1c8XcbXle@aspen.lan>
References: <20250407095119.588920-1-mitltlatltl@gmail.com>
 <20250407095119.588920-5-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407095119.588920-5-mitltlatltl@gmail.com>

On Mon, Apr 07, 2025 at 05:51:19PM +0800, Pengyu Luo wrote:
> LSB, MSB and their handling are slightly confused, so improve it.
>
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/video/backlight/ktz8866.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/video/backlight/ktz8866.c b/drivers/video/backlight/ktz8866.c
> index b67ca136d..5364ecfc0 100644
> --- a/drivers/video/backlight/ktz8866.c
> +++ b/drivers/video/backlight/ktz8866.c
> @@ -24,7 +24,9 @@
>  #define DEVICE_ID 0x01
>  #define BL_CFG1 0x02
>  #define BL_CFG2 0x03
> +/* least significant byte */
>  #define BL_BRT_LSB 0x04
> +/* most significant byte */

I'm not convinced these comments are necessary.


>  #define BL_BRT_MSB 0x05
>  #define BL_EN 0x08
>  #define LCD_BIAS_CFG1 0x09
> @@ -47,6 +49,8 @@
>  #define PWM_HYST 0x5
>
>  #define CURRENT_SINKS_MASK GENMASK(5, 0)
> +#define LOWER_BYTE GENMASK(2, 0)

I like using masks and FIELD_GET() but this is not a byte. These are
the least significant bits.


Daniel.

