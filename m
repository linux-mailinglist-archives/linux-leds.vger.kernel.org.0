Return-Path: <linux-leds+bounces-6292-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB356C7F2D9
	for <lists+linux-leds@lfdr.de>; Mon, 24 Nov 2025 08:30:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F0F93A561D
	for <lists+linux-leds@lfdr.de>; Mon, 24 Nov 2025 07:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6171D2DCF78;
	Mon, 24 Nov 2025 07:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gjaqjrCA"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9F62417F2;
	Mon, 24 Nov 2025 07:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763969441; cv=none; b=fn6zzKJpnZWSRm6uK+utGffzKzGKN5UrWj7sLHAzGABSZpWVSPNDiKRTIqHVUb/DeV2EwxDmVO2xxoPvV8UrApjralX4DpfStQBVGfXlXHlTFiJdBV9zzdhroxxPUZK8/Fri8U+yeT+YTjTJ7VIXgldpZvYKbVEac6of2D8Ojz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763969441; c=relaxed/simple;
	bh=LLn6DIVYaobgD3Yzy8q/6nNLmjxkA1iToYHH82eXmJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qS3v4S8281WrycPTqSOGoxMG5mEXhQREfYi/483mMjcTPlLmXYW4ie/6JNs0LNXIifDDB19aQIDjD/Aw5gbLNMtIz51AixOEvV4PDsiVImNFtsGB8r8Z3OXUUa4LQI2+RdUXMKw9vwZzoQAMpX+A1lRQXft2GBIuUzF2SP+GjbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gjaqjrCA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DD82C4CEF1;
	Mon, 24 Nov 2025 07:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763969440;
	bh=LLn6DIVYaobgD3Yzy8q/6nNLmjxkA1iToYHH82eXmJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gjaqjrCAKud+WZ/S7JbJ5lZVNvU4D4gbiaESnv2RslJyKQJTodRMCj+aoPbHz4HCQ
	 v1S4dlGUdrLlujCLr7HG2y0NFOx53v86Oo0ZW6Z6+GDdIk7afttSNqJdRs+lz8Kred
	 c3HFJDIW+bvU0Me/kXWKHRERwTRtKZj69+iVNT09kn4gbwve56TK0YQTTXe6Ipgdsy
	 8hmQyXXIiDPuVoQqmRrzQc5B1edrwWOThodz9yAyIqI/UnQQIKxXND3kRk+bi04AJm
	 L7P+bA8yu5Icn8deuWQWKmPjdzs835VTrp/+RirP41bVt0e8fIGyenpWaXgaRx9Mza
	 4pPVZdzycRcLg==
Date: Mon, 24 Nov 2025 08:30:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nam Tran <trannamatk@gmail.com>
Cc: lee@kernel.org, pavel@kernel.org, gregkh@linuxfoundation.org, 
	rdunlap@infradead.org, christophe.jaillet@wanadoo.fr, krzk+dt@kernel.org, 
	robh@kernel.org, conor+dt@kernel.org, corbet@lwn.net, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v18 1/3] dt-bindings: leds: add TI/National Semiconductor
 LP5812 LED Driver
Message-ID: <20251124-imperial-manul-of-dignity-6ab5ad@kuoka>
References: <20251123191042.116917-1-trannamatk@gmail.com>
 <20251123191042.116917-2-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251123191042.116917-2-trannamatk@gmail.com>

On Mon, Nov 24, 2025 at 02:10:40AM +0700, Nam Tran wrote:
> The LP5812 is a 4x3 RGB LED driver with an autonomous animation
> engine and time-cross-multiplexing (TCM) support for up to 12 LEDs
> or 4 RGB LEDs. It supports both analog (256 levels) and PWM (8-bit)
> dimming, including exponential PWM for smooth brightness control.
> 
> Signed-off-by: Nam Tran <trannamatk@gmail.com>

You received review from me - where did you explain reasons of dropping
it?

You then received SECOND review from Rob and where did you explain
reasons of ignoring/dropping it?

You will not get third review, please start respecting our work. Read
carefully submitting patches document.

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

Best regards,
Krzysztof


