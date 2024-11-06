Return-Path: <linux-leds+bounces-3316-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A34279BEFAC
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 14:59:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24A07B212DE
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 13:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47A75200CB7;
	Wed,  6 Nov 2024 13:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AAC2tMlv"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F8017DFF2;
	Wed,  6 Nov 2024 13:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730901552; cv=none; b=GzZCkoLtGk4gxBVmutuN9ku12/STHGBUW+3PbGwdPrBO+nWgYAlD0VZXFrJm9lkv2uL2PBg5x0SmYey+dHttPdWet7EefKAWdReM8Ojxdcn72g8kOQFfR9zxc5c27sO9ucN4ngE2eXgD+VbOzeG2UOm/UKAuoOAZbBa0J8P/k9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730901552; c=relaxed/simple;
	bh=L/8YMxvyNwnI5zLAy8H13m0yzgYnRf4I8l3T6fZ9kp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kkNUL0FBZ+th6qVguHhw6Uf58Ek293uvte2gc1iaQlihwytgxV5VQqbA8gp7lQNvWVbIFpMEiBHL6PW50Vmh7BvzW5bOkb2n/4ZHCmGbRm75FeG0aHvOFzneBr74gAI2/1AoZTACa3LqhEixxtVsRXXKy3lfHmc3pjeMi6/LexY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AAC2tMlv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F352C4CEC6;
	Wed,  6 Nov 2024 13:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730901551;
	bh=L/8YMxvyNwnI5zLAy8H13m0yzgYnRf4I8l3T6fZ9kp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AAC2tMlvCJbV+uWBMVEliFPVSO9bTha3xYSXhQAPt+H9lLA58DMqvN4hmiwYYiWFx
	 12R5+XhgTpUi6+t16UD2DJiIrY/lHPx3RkZHg8D4E65lpVPOEuNPrypkZmm4K0zXoV
	 ci/sGr39maUiaVzl04vQfxAnLOeD9jIJy1RSkoejgQ3vtkGmXtnR2ZFpjMxUMFXwOY
	 lSbjAp37B28zxvxdKWbIR3JbLt5rKg/9AcPQQEB+8oJrRy/kAsGAAPsoGQLYhNC6Uu
	 jNG7hTe20UX3HX7UtlQ/l6haQHJquE/7LEGAKq1aysds6PuMzDsIEVI8YbzbQzcy2J
	 oU8esAsYPShpg==
Date: Wed, 6 Nov 2024 14:59:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/3] [PATCH v4] dt-bindings: leds: Add LED1202 LED
 Controller
Message-ID: <us45a35olruo6xaykepmhkdhal3zbit6f5kxo2utzqiukc3kte@kzbwcm7qtfww>
References: <20241106061812.6819-1-vicentiu.galanopulo@remote-tech.co.uk>
 <20241106061812.6819-2-vicentiu.galanopulo@remote-tech.co.uk>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241106061812.6819-2-vicentiu.galanopulo@remote-tech.co.uk>

On Wed, Nov 06, 2024 at 06:18:08AM +0000, Vicentiu Galanopulo wrote:
> The LED1202 is a 12-channel low quiescent current LED driver with:
>   * Supply range from 2.6 V to 5 V
>   * 20 mA current capability per channel
>   * 1.8 V compatible I2C control interface
>   * 8-bit analog dimming individual control
>   * 12-bit local PWM resolution
>   * 8 programmable patterns
> 
> If the led node is present in the controller then the channel is
> set to active.
> 
> v1: https://lore.kernel.org/lkml/ZnCnnQfwuRueCIQ0@admins-Air/T/
> v2: https://lore.kernel.org/all/ZniNdGgKyUMV-hjq@admins-Air/T/
> v3: https://lore.kernel.org/all/ZniNdGgKyUMV-hjq@admins-Air/T/

This goes after ---.

Please run scripts/checkpatch.pl and fix reported warnings. Then please
run 'scripts/checkpatch.pl --strict' and (probably) fix more warnings.
Some warnings can be ignored, especially from --strict run, but the code
here looks like it needs a fix. Feel free to get in touch if the warning
is not clear.

This ws correct in v3 so I do not understand what is happening with this
patch.

> 
> Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
> 
> ---
> Changes in v4:
>   - remove label property, use devm_led_classdev_register_ext instead

Where? This is a binding.

>   - use as base patch the v3

What does it mean? How can you no use v3, but something else?

> Changes in v3:
>   - remove active property
> Changes in v2:
>   - renamed label to remove color from it
>   - add color property for each node
>   - add function and function-enumerator property for each node
> ---

You have also whitespace errors in your patch. Again:
Please run scripts/checkpatch.pl and fix reported warnings. Then please
run 'scripts/checkpatch.pl --strict' and (probably) fix more warnings.
Some warnings can be ignored, especially from --strict run, but the code
here looks like it needs a fix. Feel free to get in touch if the warning
is not clear.

>  .../devicetree/bindings/leds/st,led1202.yaml  | 132 ++++++++++++++++++
>  1 file changed, 132 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/st,led1202.yaml

Best regards,
Krzysztof


