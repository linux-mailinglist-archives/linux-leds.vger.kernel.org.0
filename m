Return-Path: <linux-leds+bounces-5288-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6A6B3104A
	for <lists+linux-leds@lfdr.de>; Fri, 22 Aug 2025 09:26:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0980AAC0D3E
	for <lists+linux-leds@lfdr.de>; Fri, 22 Aug 2025 07:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FC342E8B64;
	Fri, 22 Aug 2025 07:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="zNVQzzFn"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9886E2E7BDE
	for <linux-leds@vger.kernel.org>; Fri, 22 Aug 2025 07:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755847591; cv=none; b=ld3mpsw1agtUuVPeR308pZ01FQML032zvKVvexh6LWhQy3gT4kY9iH6Q4LCQjpzKcf/T7u9Lbt1A1YRrDjk6IbxTngpSS/OQXATle9tWEO1+BmhVcMdSGG/BGBEVIPYEA8cCJ8zA4w/FWkoAdyb96xNr8zSM/QduhAYliR+p18c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755847591; c=relaxed/simple;
	bh=0cIVGZsKog3LpWjaV7XG6J5KkdzzL27b/J6vLZIoci4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=guztTGxUUXBEaWeOYxFH5Hro2GMTV8e32kGR397xHy5Htr/5WypULExMwFVGDsC6Krz6+3uz0UnxWOv7E5kcPmy21BSfjgn9QDh7oSQ+28VaFp4XfK+dBLdCb1tuNvn9Gs1b/x/XHaMbrdcmKHZX9y+hI98t0yD4HN7lSZXr6p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=zNVQzzFn; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45a1b0bd237so13420465e9.2
        for <linux-leds@vger.kernel.org>; Fri, 22 Aug 2025 00:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755847587; x=1756452387; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lK3kj6aT+uG8TNpObwIxTe+g6r92LKlTq+gjwtDBVRk=;
        b=zNVQzzFnw6Ir2uWiC0VDKKumRfmUWCmeEV31QGKcZ2nzBt4CI97D5zdXjcrOEHjS0h
         xZ5yZWK9gnuuNPd9PEZnUUIOmLC2Cd0dVUKsXitGDOU0lNvynkUexFOGtCqQ/vp/lxgI
         HbJZvVDtCaK08BhzMB9rjzNbbgGrbAQoHarWOfCMLk4JiZS7sxhxcApcag6oUH3r4HZd
         etubO1LL0MaWgki/QT5hQ6EPCP26zR1TW/tBrwLXBEfcnJrhr+UbT912a4ITqoNKLGHf
         eGfp+KVlD9n5veE5OCs3CS23rYqicCrXT4TGgTN+ki5KCoQnhM1/r6/DbYRyXNxyM9D0
         axsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755847587; x=1756452387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lK3kj6aT+uG8TNpObwIxTe+g6r92LKlTq+gjwtDBVRk=;
        b=mAAJYEiahVCedNfQeXr/XNbkwRnnX6oTVhX83xScR/4CE5a15iqWc/1hADhlAmgaRb
         k6+r8QRPVRiH7SJEbD0NsYOu61pnvDOMBChQdmQjpvsQrOjrunMjbByPa80rWPbxVQvr
         mLA198cOIdieqR+tE1mrXhwCyoadY5n8w83o/sULryVCMme+uTnQA6YEr5dCFS7WLqvw
         HEoAwI/EvYhlQxakLTfJuoZIS9ifhx1DpmpLBGIVJa8tu3dQhO+NWES9G5zib7+ctdwO
         ItKGLk29F8jY3R5gVhw5g2MwyKvg7YciwXtWHvG9TKIqdgf1jQ6sV3yp88i2nQLXcmve
         tjNA==
X-Forwarded-Encrypted: i=1; AJvYcCXJbssedilimpXzzTIF+VaQKXPZcrg94RiNz1jLnmehcMHfWY+L0LgdJ06GphAvJppr+ZR+bUeWU+Ns@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/rtzp0XMrF64G1b0bZjhroEsFaMoTYcWWvDUF/ccK7wSRApuf
	9vXNqcTK214yaJNwidTT9DcvNgQNo42ovmANo8lSAAsKsNOAHTCs132CRVtBbHsRLJw=
X-Gm-Gg: ASbGncvVoVHsL9m+q+NXdBkUqaftY60yraGFfZ73kNeGTkKUrGNMULvJM0pOToM58Ih
	3CK6AIeuTiGPOTJYIPwCbIFLCpD44MGndbI0NQmpJ5oWcOWvUYe3I1GWPGW2rA+9GQ+gjGDe+Oa
	/nP4CLZIfoeJaoaW/SXoQn0ocS+upSzLNJoyLkEPjpU2mWkNf8loWF3wb6Lh84NQwBbnKFoHiDa
	bgruOeDBMJMlGj9k9H7DgNhGCVV0BX1hCMxpILA/TDzFWqFkjLbCPXA2U17DYFYn5l8THiEKV65
	8sR+PjBhjgt0b3sO8NAYrT8XB1wefJ/p4utLGyFLZ+7mkxDXQm+G8ZlX4jz+GX2LsIl7J7aUUek
	j0JmbK3PqfyZbUv+Jw0IZC78oYKb6yumW8JB+PmeQw9SKrNqEnE6Q0pN4kJxtEiRH8xf4LC4TsV
	fDgIdKRg==
X-Google-Smtp-Source: AGHT+IHDuHRP55niLwTskQO1m/b/5ctH5UZu5kjoy3BiQ8RvkZmMD4Fr6kF/PognPgs2X/R938TpUw==
X-Received: by 2002:a05:600c:1c28:b0:459:d780:3604 with SMTP id 5b1f17b1804b1-45b51798fb1mr14095255e9.3.1755847586840;
        Fri, 22 Aug 2025 00:26:26 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b50e2f0adsm25076255e9.13.2025.08.22.00.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 00:26:26 -0700 (PDT)
Date: Fri, 22 Aug 2025 08:26:24 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: maudspierings@gocontroll.com
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: backlight: Add max25014 bindings
Message-ID: <aKgboFjwjtZsanWb@aspen.lan>
References: <20250819-max25014-v2-0-5fd7aeb141ea@gocontroll.com>
 <20250819-max25014-v2-1-5fd7aeb141ea@gocontroll.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-max25014-v2-1-5fd7aeb141ea@gocontroll.com>

On Tue, Aug 19, 2025 at 12:58:59PM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> with intgrated boost controller.
>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>  .../bindings/leds/backlight/maxim,max25014.yaml    | 79 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 84 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..30b591152fa31d5e43243cac44c72028b05b5f8a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/maxim,max25014.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Maxim max25014 backlight controller
> +
> +maintainers:
> +  - Maud Spierings <maudspierings@gocontroll.com>
> +
> +allOf:
> +  - $ref: common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - maxim,max25014
> +
> +  reg:
> +    maxItems: 1
> +
> +  enable-gpios:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1

Is the interrupt useful for anything?

AFAIK its perfectly OK for DT bindings to describe hardware features the
driver does not use... but is the driver missing out on error reporting
(for example) by not using this interrupt for anything?


Daniel.

