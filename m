Return-Path: <linux-leds+bounces-2965-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1AB991943
	for <lists+linux-leds@lfdr.de>; Sat,  5 Oct 2024 20:09:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F0011C21160
	for <lists+linux-leds@lfdr.de>; Sat,  5 Oct 2024 18:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC0715854F;
	Sat,  5 Oct 2024 18:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="My4Dwevc"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6859915854A;
	Sat,  5 Oct 2024 18:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728151689; cv=none; b=ksxaDKa5+iV+U3R/qTN5WMGw8myGxvCg2F+sxsRNsZPS5BXJV5JNMFULZ01mW+/0o0kUU4Qw9kuvQ9CHw7vNXxOco3O746XsKUO9ftTZ9NXRifMZ/WM+IwfmZSSn4MxSox4oxuk0tnT+i9gbj0qzndzPrCrxSBUlDMOSVmIpVUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728151689; c=relaxed/simple;
	bh=49/t/8KBEiiEwXH2mK980zJgf7nK2Z7MQbml2DBMDEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ppWW36ui1qwKTTPBzk0CLZLz08z05wud+uyE4WmD1SUkYX+RHU1ed0w6FXBMEEaXZqmsFDVlCZ9XrQzl0mONDnFmZmED4qiRh2gFr8ZCaCuVQgAgaqX2hthtQ8Q0jfzBK2aH3V4z4FuNeHWZDbssNLfdla+Ria8/b3Vll+bi4A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=My4Dwevc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BEEDC4CEC2;
	Sat,  5 Oct 2024 18:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728151689;
	bh=49/t/8KBEiiEwXH2mK980zJgf7nK2Z7MQbml2DBMDEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=My4DwevcoNVQat0dc8p8xFYhKgU+15TSQPGjSIWfD7rhWmtBHm3kIXkILR9jBCtJP
	 a2ggo4E85OQc4Yg31mb2K35P8amQv180kTb1jQr7Gg6HE7kgBDG8erUTRsUFJgtQh9
	 2eSW+L1S9xTaXa05xP9CQO+X8iV8yXLp3TmpBEc23XLqq4ljOqsqfq+QN9ZcBNOUew
	 z3mwaRV5gl21bWU6vV3FzXq9Y6ixLJ6Ot9bc89COU4IHxiRP/iz8y6PeTs2+Iq8iXA
	 cvlmm7rBQh0nV1HIuf/9py5yCxq4bNPeYxUiS8rE0Yk+ZpBEzAhsUxAXVKitB8TofT
	 51IMsvx0T4Dhg==
Date: Sat, 5 Oct 2024 13:08:08 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Anand Gore <anand.gore@broadcom.com>, devicetree@vger.kernel.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
	Kursad Oney <kursad.oney@broadcom.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Lee Jones <lee@kernel.org>,
	William Zhang <william.zhang@broadcom.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH v3 1/4] dt-bindings: leds: bcm63138: Add shift register
 bits
Message-ID: <172815168655.479624.2716334888825153554.robh@kernel.org>
References: <20241004-bcm63138-leds-v3-0-ba99a8e464b9@linaro.org>
 <20241004-bcm63138-leds-v3-1-ba99a8e464b9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004-bcm63138-leds-v3-1-ba99a8e464b9@linaro.org>


On Fri, 04 Oct 2024 09:59:22 +0200, Linus Walleij wrote:
> The BCM63138 family of serial LED controllers has a register
> where we can set up bits for the shift registers. These are
> the number of rounds the bits need to be shifted before all
> bits have been shifted through the external shift registers.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - Mention that HW defaults will be used if the shift
>   register property is missing.
> ChangeLog v1->v2:
> - Drop the $ref to u32 since the new property is suffixed
>   with "-bits" and thus get standard treatment.
> ---
>  Documentation/devicetree/bindings/leds/leds-bcm63138.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


