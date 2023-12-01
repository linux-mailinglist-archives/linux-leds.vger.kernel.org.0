Return-Path: <linux-leds+bounces-229-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A63800966
	for <lists+linux-leds@lfdr.de>; Fri,  1 Dec 2023 12:09:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 78F061C20963
	for <lists+linux-leds@lfdr.de>; Fri,  1 Dec 2023 11:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63625210F3;
	Fri,  1 Dec 2023 11:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ObgOAzlG"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F0820B18;
	Fri,  1 Dec 2023 11:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EB25C433C8;
	Fri,  1 Dec 2023 11:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701428988;
	bh=o05AhYqQMl6gqIIPfGCy+BD9YDKBTaLzd34nySfyWC8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ObgOAzlGppLIARiW9BNQhCs7HUjaLBSKRMhtQ7DM97/eILMUSwzVUGLDlQLiNYPoG
	 2kxr3XplZIBqxW1ofmIxBV6dQLD7kn8LTQ5Bi0D8PeQXOgJNfrtwVfs3hL2uWue4dK
	 OxUsZwJzBVbfiOb5PXFNB+pTQtn3rIDcH5WnRwJ+AAxX4pXCZ67DjvAvayC71LWUE3
	 SjHNf5Wr0ORlU4GAanKnhn+yHYxFhioAAmbfMORbjtY5iB6+FHHoB4BpXBJ6q6FGxg
	 9M64qnfg1QKRRayQLXIRT2MzornCrSNSFf+jSNsaoeV05TP6Dx0qtsUU6a8WoOqgKE
	 z5yGuxuI8zuTA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, pavel@ucw.cz, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 andy.shevchenko@gmail.com, Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: kernel@sberdevices.ru, rockosov@gmail.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20231125200519.1750-1-ddrokosov@salutedevices.com>
References: <20231125200519.1750-1-ddrokosov@salutedevices.com>
Subject: Re: [PATCH v5 00/11] leds: aw200xx: several driver updates
Message-Id: <170142898612.3365188.2222761548333694548.b4-ty@kernel.org>
Date: Fri, 01 Dec 2023 11:09:46 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Sat, 25 Nov 2023 23:05:08 +0300, Dmitry Rokosov wrote:
> The following patch series includes several updates for the AW200XX LED
> driver:
>     - some small fixes and optimizations to the driver implementation:
>       delays, autodimming calculation, disable_locking regmap flag,
>       display_rows calculation in runtime;
>     - fix LED device tree node pattern to accept LED names counting not
>       only from 0 to f;
>     - add missing reg constraints;
>     - support HWEN hardware control, which allows enabling or disabling
>       AW200XX RTL logic from the main SoC using a GPIO pin;
>     - introduce the new AW20108 LED controller, the datasheet for this
>       controller can be found at [1].
> 
> [...]

Applied, thanks!

[01/11] leds: aw200xx: fix write to DIM parameter
        commit: 785fec3a8daff2957fd55e49cbdfe0a50866fdb7
[02/11] leds: aw200xx: support HWEN hardware control
        commit: eabe8239022cf3c75b90d9ee07dcfbbe4e50bcac
[03/11] dt-bindings: leds: aw200xx: introduce optional enable-gpios property
        commit: e91899ea3759d04e185721153a036e1a25e315b7
[04/11] leds: aw200xx: calculate dts property display_rows in the driver
        commit: 4ccd392c3ea7ceefbee58622e634d4997ef46acc
[05/11] dt-bindings: leds: aw200xx: remove property "awinic,display-rows"
        commit: 66d078f105837670c52bb31da29e26ad13bc2923
[06/11] leds: aw200xx: add delay after software reset
        commit: aac13e5630d6e081a9f6c5a57e5e6fc1152acca8
[07/11] leds: aw200xx: enable disable_locking flag in regmap config
        commit: 851fa70b9b162bbf5b5f5f92fc450633e6b21a3a
[08/11] leds: aw200xx: improve autodim calculation method
        commit: 5fcc24b92b43f012cbf430244f0698ff588ec9fc
[09/11] leds: aw200xx: add support for aw20108 device
        commit: abc74724d5e714bb3359124f3576d5318828a83e
[10/11] dt-bindings: leds: awinic,aw200xx: add AW20108 device
        commit: d6bbe677add2c560ae4aa2f9dab7a19c287e2193
[11/11] dt-bindings: leds: aw200xx: fix led pattern and add reg constraints
        commit: 5707a06e5391a4eeaf0c2705f973336537a41c79

--
Lee Jones [李琼斯]


