Return-Path: <linux-leds+bounces-1335-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C09D889A4E
	for <lists+linux-leds@lfdr.de>; Mon, 25 Mar 2024 11:27:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13F4728C421
	for <lists+linux-leds@lfdr.de>; Mon, 25 Mar 2024 10:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6507213F434;
	Mon, 25 Mar 2024 05:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bUL61oDb"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D85153565;
	Mon, 25 Mar 2024 02:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711332789; cv=none; b=SApzReKVz2g0aU4LbqPSPW2h0h0UIzfDOS8yj3SB16yO1Yeoj/binlc3H9PcYIxtODK+3Tz/LbLzi6xI+1wEWyuB/VfxCCOPWrqMFM4dSJtIW/xpElWzXUFle4cdUlB7Of0DQUcxr6NVc1cm8mti21CQzFCZ4zioXpF3RlzVRAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711332789; c=relaxed/simple;
	bh=aJvg1KH6joFG6oJkgTHoc61lNEcN6UYDL94Kek/0h5A=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=KzTCJAun7M9C8eBdTcNdls0RfZD6iudWV5CE2cfxZzP83RVqEuzDUcl18iBEzrKrUXPw/aL7kw9JW9EMNCjyXTiM2xgvUKmgGoKfix4kzK0y89bzZy0LQryiEq6EUHhdEyBdlvt/Fdu43B891uhQiJVTSwiyNMvMEXxNbAbZK1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bUL61oDb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76189C43394;
	Mon, 25 Mar 2024 02:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711332787;
	bh=aJvg1KH6joFG6oJkgTHoc61lNEcN6UYDL94Kek/0h5A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bUL61oDb/M+5KYmdH9GZAQdZT3PYKaJ010SbGP/0QAETJ2gY+Rxd19+hfItokn4fc
	 qXm+5UshaVvnLaKO+h8US6GsQq7XoxEkTJDEVJIEaNCFv8M2uUBhoQrMAu3fisTCQo
	 B4fRFMNeMscSki123E/z54cBRXf+v5p5HhYpLJ3jJtc1OvR7VQslOwZ36RRz8NHOez
	 HFUH5lzzeG0rrZGBHCyr2OTeNZB2H2sILwj6OEqE53Bfd2qCAI/Z34pAg9I1JWd2Cn
	 dq/bNtJWoCPVpzv9DjBiOxvAIfXazxrFfLBNOkzXYWWq5P+zSQavVa4Lgiia++T7N2
	 7rjlBqvf/ljRg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5AFA0D2D0E0;
	Mon, 25 Mar 2024 02:13:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v6 000/164] pwm: Improve lifetime tracking for pwm_chips
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <171133278736.9916.5526869645378949035.git-patchwork-notify@kernel.org>
Date: Mon, 25 Mar 2024 02:13:07 +0000
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
In-Reply-To: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40pengutronix=2Ede=3E?=@codeaurora.org
Cc: linux-pwm@vger.kernel.org, corbet@lwn.net, Jonathan.Cameron@huawei.com,
 james.clark@arm.com, andriy.shevchenko@linux.intel.com, broonie@kernel.org,
 marcan@marcan.st, sven@svenpeter.dev, claudiu.beznea@tuxon.dev,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 florian.fainelli@broadcom.com, rjui@broadcom.com, sbranden@broadcom.com,
 shc_work@mail.ru, bleung@chromium.org, p.zabel@pengutronix.de,
 shawnguo@kernel.org, s.hauer@pengutronix.de, paul@crapouillou.net,
 vz@mleia.com, mika.westerberg@linux.intel.com, andy@kernel.org,
 linus.walleij@linaro.org, hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 neil.armstrong@linaro.org, khilman@baylibre.com, conor.dooley@microchip.com,
 daire.mcnamara@microchip.com, j.neuschaefer@gmx.net, heiko@sntech.de,
 krzysztof.kozlowski@linaro.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 mwalle@kernel.org, orsonzhai@gmail.com, baolin.wang@linux.alibaba.com,
 zhang.lyra@gmail.com, fabrice.gasnier@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, hammerh0314@gmail.com, thierry.reding@gmail.com,
 jonathanh@nvidia.com, nobuhiro1.iwamatsu@toshiba.co.jp,
 sean.anderson@seco.com, michal.simek@amd.com, brgl@bgdev.pl,
 andrzej.hajda@intel.com, rfoss@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 pavel@ucw.cz, lee@kernel.org, quic_amelende@quicinc.com,
 quic_bjorande@quicinc.com, keescook@chromium.org, robh@kernel.org,
 johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
 kernel@pengutronix.de, linux-doc@vger.kernel.org, alyssa@rosenzweig.io,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 groeck@chromium.org, chrome-platform@lists.linux.dev, festevam@gmail.com,
 linux-imx@nxp.com, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-mediatek@lists.infradead.org,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-rockchip@lists.infradead.org, alim.akhtar@samsung.com,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 dianders@chromium.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 gustavoars@kernel.org, linux-hardening@vger.kernel.org

Hello:

This series was applied to chrome-platform/linux.git (for-next)
by Uwe Kleine-König <u.kleine-koenig@pengutronix.de>:

On Wed, 14 Feb 2024 10:30:47 +0100 you wrote:
> Hello,
> 
> this is v6 of the series introducing better lifetime tracking for
> pwmchips that addresses (for now theoretic) lifetime issues of pwm
> chips. Addressing these is a necessary precondition to introduce chardev
> support for PWMs.
> 
> [...]

Here is the summary with links:
  - [v6,001/164] pwm: Provide an inline function to get the parent device of a given chip
    https://git.kernel.org/chrome-platform/c/4e59267c7a20
  - [v6,003/164] pwm: Provide pwmchip_alloc() function and a devm variant of it
    https://git.kernel.org/chrome-platform/c/024913dbf99f
  - [v6,029/164] pwm: cros-ec: Change prototype of helpers to prepare further changes
    https://git.kernel.org/chrome-platform/c/7256c2e79b8e
  - [v6,030/164] pwm: cros-ec: Make use of pwmchip_parent() accessor
    https://git.kernel.org/chrome-platform/c/19a568a8d3c4
  - [v6,031/164] pwm: cros-ec: Make use of devm_pwmchip_alloc() function
    https://git.kernel.org/chrome-platform/c/452be9421eda

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



