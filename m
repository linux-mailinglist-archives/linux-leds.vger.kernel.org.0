Return-Path: <linux-leds+bounces-5004-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA6FAFAB93
	for <lists+linux-leds@lfdr.de>; Mon,  7 Jul 2025 08:18:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B489B189BAAB
	for <lists+linux-leds@lfdr.de>; Mon,  7 Jul 2025 06:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B53AC279DD1;
	Mon,  7 Jul 2025 06:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PPsQEllN"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88804189919;
	Mon,  7 Jul 2025 06:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751869083; cv=none; b=O5Fh1gcqj0p1BdIdVqnu3x5dZLVAdA4GdbEt+/qd621WtI73GO9GsViE7s4cPnEvk8vjZMlArpCV3vcKgLYd2rHEpvw53TRKOFh0raeVYuClbTC4CmFOe0zE9RLTwCQhynM5ZWZYEVv8/FewF++sQ67I2HsTzpZF27jFnc/LEw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751869083; c=relaxed/simple;
	bh=FEnyy0ttREgkNusNm/cWMbf4I0ab7s6gN1D2futEk7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nzR4B6AEiyiqRLoYnBySmlBy6cngUzPGmB6oBNJ8bzASUK1dPeWli3PFM9VxHVCTV89Ru0hkVAj/g6ZFPYvf1freXtK9FvxpLGQw1hkwVhboP3t+zYXbge60sJ46egQLwcbXa+91y/GTqtYqemVnNtx6xNMJEnybgX17qo/LAzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PPsQEllN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70BDEC4CEF1;
	Mon,  7 Jul 2025 06:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751869083;
	bh=FEnyy0ttREgkNusNm/cWMbf4I0ab7s6gN1D2futEk7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PPsQEllNgMDXE4dVs6B+mehSZkGlSrO8DkAaLTvEueNX4a7Rbhi5/No3Cj7WJ03kS
	 7pJt09k5VIwzPWSYQ8qWFX4jjAUFWbpp1i3p7lgBjVnBre41S/DtGJaKHXRQSzD1QF
	 Fcpl057ZhIqF+NTRhgZlhb+I7nehrd23CTok/vQOBBG37BBGKBuNb2Hws4rjw2qpzk
	 SER1/5lA92NgyyuqGPDu4LfCPfg/GOsniCTQK7C/HFACE4WgBXNviv3+3d6ddsntcz
	 Wd3IaYP0D/wkoUjRnuD7l2A25FH+QBWVS4tecg/qY5QajqkH3YCPCq6WQSaHFaYZLW
	 yKBDUurvm35Ow==
Date: Mon, 7 Jul 2025 08:18:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
Cc: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH V6 0/2] leds: pwm: Add optional GPIO enable pin support
Message-ID: <20250707-lovely-practical-chinchilla-fe2d0e@krzk-bin>
References: <20250707020752.713372-1-Qing-wu.Li@leica-geosystems.com.cn>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250707020752.713372-1-Qing-wu.Li@leica-geosystems.com.cn>

On Mon, Jul 07, 2025 at 10:07:50AM +0800, LI Qingwu wrote:
> Add support for an optional GPIO enable pin to the PWM LED driver.
> Some LED controllers require an additional enable GPIO to be enabled
> on the device before PWM control can take effect.
> 
> Testing:
> - Tested on i.MX8MP EVK board with TPS92380 LED backlight driver
> - Verified GPIO enable/disable functionality works correctly
> - Confirmed both GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW polarities
>   work properly
> 
> 
> Device tree configuration used for testing:
> 
> 	backlight_keypad: backlight-keypad {
> 		compatible = "pwm-leds";
> 
> 		led {
> 			color = <LED_COLOR_ID_WHITE>;
> 			enable-gpios = <&pca6416 11 GPIO_ACTIVE_HIGH>;
> 			function = LED_FUNCTION_KBD_BACKLIGHT;
> 			max-brightness = <100>;
> 			pwms = <&pwm3 0 2500 0>;
> 		};
> 	};
> 
> Changes in V6:
> - Collected Reviewed-by from Krzysztof Kozlowski on 1/2 patch. (Thanks!)

Don't send new versions for that. It's just unnecessary traffic and
effort for us to sort out such emails.

Read submitting patches in this regard.

Best regards,
Krzysztof


