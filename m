Return-Path: <linux-leds+bounces-626-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7700983274C
	for <lists+linux-leds@lfdr.de>; Fri, 19 Jan 2024 11:08:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F6BE2856FA
	for <lists+linux-leds@lfdr.de>; Fri, 19 Jan 2024 10:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9F263D0BD;
	Fri, 19 Jan 2024 10:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nxvPX3Om"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DAD3CF69
	for <linux-leds@vger.kernel.org>; Fri, 19 Jan 2024 10:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705658834; cv=none; b=o8DZq/Vtp/KAaFUTPV7IyPmezU8UHscY7l6TsnNxDVT7Qc2HCy22LrpWsbfgYGSiv4a93WeUdhDx1I+XgJfvtWl/hA5UMvxI9ICmlU2+yiQCwp32ZThmXvwuOLmELIY2/ayvchhXDM1r2IVUeLbWzaK5+YEkEb4/fXO43x9gWvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705658834; c=relaxed/simple;
	bh=zLXtu6szFeWljVZSoUilDAfrFCs1+Io7uRaQKIIJn+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J8evzq76ZbbKTRgCslfHyFO+ad0qeUiF18/JfIR4+LIghF0Gox2jpWbYCZ/PXrVYoAXRReGqsjx3iSEpzz27rB+Fstp7l5KHcGegP3lhUx4LWwNRJojEPgWY8Isbk7FYfk1so9GSQqqVqTB2tYRYv9Zdkg2UucuWJ7jEnUPvD4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nxvPX3Om; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40e8801221cso5243765e9.1
        for <linux-leds@vger.kernel.org>; Fri, 19 Jan 2024 02:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705658831; x=1706263631; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zLXtu6szFeWljVZSoUilDAfrFCs1+Io7uRaQKIIJn+c=;
        b=nxvPX3Om+xaLq70JPCHvi8At6AFleuldoQDRnSExDfQqaOOrHXaEkwAYHTIBaRbneL
         QN154fd/3Ua02TZlc6YZj37C/v/+sc1uxwYltjfsqFUqfAL6KuMdsZ+gSasPlmAjvfQO
         SHXrJUa0sRgZrRkyb4XDOMb1fnOzXuoniWeM05qtaXzI2TUkkt0q2fSP3N7joHLOw45t
         vc7fY1qdnxJv9Ak7QrQd6WaCXk0ROM7mpER0T9wCxJt3xbVykmQXpAdZS88Ot8KAGm+d
         vyWJJ5sZHDHSlG6odU0TPWaXNU+cAEiz983Thw8KP3khUCY6yRa/TSRRVbHOHUiGvuH1
         +qoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705658831; x=1706263631;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zLXtu6szFeWljVZSoUilDAfrFCs1+Io7uRaQKIIJn+c=;
        b=V7JXwbzlEdoaWBmIFn3YdP5SMBXpRZhq36aHbQeorufjeLt9Ji+RuZiX5yTUfagbzF
         Z9o/E/iZyBmZvYZrgcu3pgd2yu2bBowuuwDSAIgSeLBeHpV9VU6JnEyS6ybpg3Y4mjNN
         2nVp8g3ZaNkfiEKU2/90c80Qnqvp9cDsGgxhNZ1SOeN36P3ea4RqjnpHQMk+KtsBtXow
         HKzryc3bNSZiCiKwyT/4L/oK+url4CfrcUoiU5ZwCDbyNJBwqEnYnmYP3QJL16PztN1c
         RPKGq/m3HyZPq1WIA+1ZD/yBjmr9oaxzOaoyyHIL/fYGrJXKtcYGBvutvlDMTQQ4kxMI
         CJzw==
X-Gm-Message-State: AOJu0Yz1r2nMCdbTnWCmG3c4WRkq1ZmRa90aDsxlZ0AwnMkq/uffgi5w
	vvTY4axTQhfI9BE+Vh1lq0FxNeiUUXMGlTQjQnF+n9DrB44L93GLRszFmAXtiJ8=
X-Google-Smtp-Source: AGHT+IF8++eqimkhaOkxMirehfcF2AeHDfKJiw3+NZuqF110PBm1nBFe26FRDTwpJUXDtN6ZBmLrbg==
X-Received: by 2002:a05:600c:2114:b0:40e:3b47:eb71 with SMTP id u20-20020a05600c211400b0040e3b47eb71mr1469467wml.73.1705658831414;
        Fri, 19 Jan 2024 02:07:11 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id r20-20020a05600c35d400b0040d8eca092esm32535456wmq.47.2024.01.19.02.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 02:07:11 -0800 (PST)
Date: Fri, 19 Jan 2024 10:07:09 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Karel Balej <balejk@matfyz.cz>,
	~postmarketos/upstreaming@lists.sr.ht,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 2/2] backlight: Add Kinetic KTD2801 driver
Message-ID: <20240119100709.GB100705@aspen.lan>
References: <20240118-ktd2801-v2-0-425cf32e0769@skole.hr>
 <20240118-ktd2801-v2-2-425cf32e0769@skole.hr>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240118-ktd2801-v2-2-425cf32e0769@skole.hr>

On Thu, Jan 18, 2024 at 06:32:39PM +0100, Duje Mihanović wrote:
> Add driver for the Kinetic KTD2801 backlight driver.
>
> Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
>
> ---
> Shared ExpressWire handling code and preemption watchdogs haven't been
> implemented in this version as my questions regarding these two weren't
> answered.
> ---

The last mail I saw on this topic was of the "do you have any better
ideas?" variety. I (mis)read that as "unless you have any
better ideas" and didn't realize you were waiting for anything.

I didn't have any better ideas!



Daniel.

