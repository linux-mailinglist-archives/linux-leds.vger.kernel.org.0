Return-Path: <linux-leds+bounces-104-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C3C7F5D04
	for <lists+linux-leds@lfdr.de>; Thu, 23 Nov 2023 11:55:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA0901C20E13
	for <lists+linux-leds@lfdr.de>; Thu, 23 Nov 2023 10:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76FD322EE0;
	Thu, 23 Nov 2023 10:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DQDoVQ79"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C3E224E1;
	Thu, 23 Nov 2023 10:55:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9429DC433C8;
	Thu, 23 Nov 2023 10:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700736910;
	bh=NGJuny/T+fyg0bzZg8rPSHmJVa/rpExZEmSSYXneMOg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DQDoVQ795iRe1AeJ0JE0DdQLKCHM4AMUcZd6QEjh2vi6f+YXd2u3WvyvdLBl0Oi0P
	 huPpFsn58tBf+keKnxM0QvYeQXJDLg1+bnXHmslVns0T5uATrg/W5BeMXPacUQksxj
	 TRX/HuQccMzyCcCuUbVBb88ETEpQCnFMJiDRMIOuwoLgjUCAmzBjr68DW2m60YNLp0
	 SO+n86vKNJ40PV39QkNDdKAoiv+iNoSgf5IBk+YP95bZL2k6SWKIK3IxGnIvxBTV8p
	 t50AMXEu4iRdmzdvehN7QV4rvKlI6Kry/UO1BFpc4qIaQJ60NQi/30PJI8dvsIMKij
	 ptAf+w0t6mdsg==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 John Watts <contact@jookia.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Maksim Kiselev <bigunclemax@gmail.com>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, 
 Trevor Woerner <twoerner@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20231029212738.7871-1-samuel@sholland.org>
References: <20231029212738.7871-1-samuel@sholland.org>
Subject: Re: (subset) [PATCH v8 0/5] leds: Allwinner A100 LED controller
 support
Message-Id: <170073690632.1239913.13249026950783494795.b4-ty@kernel.org>
Date: Thu, 23 Nov 2023 10:55:06 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Sun, 29 Oct 2023 16:26:54 -0500, Samuel Holland wrote:
> This series adds bindings and a driver for the RGB LED controller found
> in some Allwinner SoCs, starting with A100. The hardware in the R329 and
> D1 SoCs appears to be identical.
> 
> This series was tested on the Nezha board (one onboard LED) and the
> Dongshan Nezha STU board (with an external strip of 16/32/48 LEDs, also
> with gaps in the LED addresses).
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: leds: Add Allwinner A100 LED controller
      commit: 57ef666e1586823adc1b7909ed3472dec117df1f
[2/5] leds: sun50i-a100: New driver for the A100 LED controller
      commit: 090a25ad97983720f52b11d9c5a8d1a446217c1d

--
Lee Jones [李琼斯]


