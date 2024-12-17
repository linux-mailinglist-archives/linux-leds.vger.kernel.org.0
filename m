Return-Path: <linux-leds+bounces-3630-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BBF9F4E34
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2024 15:49:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D1D416640C
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2024 14:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10F1F1F63C5;
	Tue, 17 Dec 2024 14:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hwJmiM3M"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25A91F427A;
	Tue, 17 Dec 2024 14:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734446948; cv=none; b=KV46+O+uHa/RkruPYBZNH+ZefRIPRyh2Ozwsz4FtwY2RInPlMLsliZIHoJU/nLxI2RKARsXg4EN3sza4xzjeyDmQRMuTyWJFylxBeGVp37SH2A02CwMc4Mu+BNeh3z/+k6I8s0JqApkBzURbYFfSofhqDD/8hY+pts5wBFMIjVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734446948; c=relaxed/simple;
	bh=ovUCsXIAcZwln0owfwVIC8+hc5eQXi2CD0JoDSmNu74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VXZ6Jzt5vYGd/eymIVLuuTFBYNyDXDa8285z8rSpPuXRQDyTXdmTCmGQPuC8jLlF7eKDMHthr6mPyt5SCEM3mjLmAmUWKgy1Jxad+IundHMdDcJAC4A8Y/3HmwqIDfKlCJ2riF2/lwBS2pY+hNs/TMMZpUCncNSDh0cTVPxKNzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hwJmiM3M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59C0AC4CEDD;
	Tue, 17 Dec 2024 14:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734446947;
	bh=ovUCsXIAcZwln0owfwVIC8+hc5eQXi2CD0JoDSmNu74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hwJmiM3MCtayeazrAxE0vsMDLigqnketgZff9rdBg6XV0JvlJLy2+fyU5Uo5jcZfr
	 r/3NSW5d6FD5gheiQPq1orEGlReGRPlRY/xlUwIe/AUOhqlS9Kyyh9Q1OQdXYqDTUI
	 5t0Pc+BSgg3Hw99PQ655QxCQReM6uptUyT5iXg1S+UfHGy01emoQWM2lQrf6Jo0xO/
	 zmeTvvb5z0ET7Bcwak3aMLjyTBQ7+YYJE9CUaiCTQJ1xtIEQ8MRUCK53x51563PnEu
	 EM8CA3wispePvBh+ZQJFJ7YCKmuqRwdav3lgu+ccYz0wSzwFroc8K6d/k+WA+pAXzS
	 K5F4dkK0RBPZQ==
Date: Tue, 17 Dec 2024 14:49:02 +0000
From: Lee Jones <lee@kernel.org>
To: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
Cc: Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v9 1/3] Documentation:leds: Add leds-st1202.rst
Message-ID: <20241217144902.GL2418536@google.com>
References: <20241121165829.8210-1-vicentiu.galanopulo@remote-tech.co.uk>
 <20241121165829.8210-2-vicentiu.galanopulo@remote-tech.co.uk>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241121165829.8210-2-vicentiu.galanopulo@remote-tech.co.uk>

On Thu, 21 Nov 2024, Vicentiu Galanopulo wrote:

> Add usage for sysfs hw_pattern entry for leds-st1202
> 
> Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
> ---
>  - Changes in v3: Add leds-st1202 to index.rst
>  - Changes in v2: Implement review comments
> 
>  Documentation/leds/index.rst       |  1 +
>  Documentation/leds/leds-st1202.rst | 36 ++++++++++++++++++++++++++++++
>  2 files changed, 37 insertions(+)
>  create mode 100644 Documentation/leds/leds-st1202.rst
> 
> diff --git a/Documentation/leds/index.rst b/Documentation/leds/index.rst
> index 3ade16c18328..0ab0a2128a11 100644
> --- a/Documentation/leds/index.rst
> +++ b/Documentation/leds/index.rst
> @@ -28,4 +28,5 @@ LEDs
>     leds-mlxcpld
>     leds-mt6370-rgb
>     leds-sc27xx
> +   leds-st1202.rst
>     leds-qcom-lpg
> diff --git a/Documentation/leds/leds-st1202.rst b/Documentation/leds/leds-st1202.rst
> new file mode 100644
> index 000000000000..e647966e496c
> --- /dev/null
> +++ b/Documentation/leds/leds-st1202.rst
> @@ -0,0 +1,36 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +============================================
> +Kernel driver for STMicroelectronics LED1202
> +============================================
> +
> +/sys/class/leds/<led>/hw_pattern
> +--------------------------------
> +
> +Specify a hardware pattern for the ST1202 LED. The LED
> +controller implements 12 low-side current generators
> +with independent dimming control. Internal volatile memory
> +allows the user to store up to 8 different patterns.
> +Each pattern is a particular output configuration in terms
> +of PWM duty-cycle and duration (ms).
> +
> +To be compatible with the hardware pattern
> +format, maximum 8 tuples of brightness (PWM) and duration must
> +be written to hw_pattern.

Some very odd formatting here.

Doesn't your editor do line-wrapping for you?

> +
> +- Min pattern duration: 22 ms
> +- Max pattern duration: 5660 ms
> +
> +The format of the hardware pattern values should be:
> +"brightness duration brightness duration ..."
> +
> +/sys/class/leds/<led>/repeat
> +----------------------------
> +
> +Specify a pattern repeat number, which is common for all channels.
> +Default is 1; negative numbers and 0 are invalid.
> +
> +This file will always return the originally written repeat number.
> +
> +When the 255 value is written to it, all patterns will repeat
> +indefinitely.
> -- 
> 2.39.3 (Apple Git-145)
> 

-- 
Lee Jones [李琼斯]

