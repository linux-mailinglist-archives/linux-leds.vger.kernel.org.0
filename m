Return-Path: <linux-leds+bounces-2879-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 453FD988E5D
	for <lists+linux-leds@lfdr.de>; Sat, 28 Sep 2024 10:06:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5211A1F210D0
	for <lists+linux-leds@lfdr.de>; Sat, 28 Sep 2024 08:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46DCD19CCFC;
	Sat, 28 Sep 2024 08:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QaiyGwrL"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA0812E75;
	Sat, 28 Sep 2024 08:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727510756; cv=none; b=s1pqNaHJMx3nTJGUeDNxautPHkHZcPFUA1kKm5n+tS7RCe07ixZD3Nab6m32VXTmFZPr67g3+wFw8mAeyB6uSeNx45u9ZyQ25tidHjdDmde5ur4oDqm9LirjoQT+CFTTXU6dMzbnUUZliilr0Fi0xKnNAlqjoUlVAkUD7CEuCqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727510756; c=relaxed/simple;
	bh=oBWMk5IXftwDZHR1DA8gs5+5AjQ0N9WxypmUP0N6Pw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WsRT9IWznWnI2uQxH1MKGent/SX/wfxM4KObCkLRjbjcuEYHilFLuZfMmv34c7PFh/Y9kiXOdTNLPjzSJOYXJ0Sd0b0mt04E6kG6tztCKV1RYreGQ5NIKOpnxwmWdmqEudZM2LJoTY1BkqceYm+ZMrBd+JAOWIPYjNM7xXTrkCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QaiyGwrL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E56D2C4CEC3;
	Sat, 28 Sep 2024 08:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727510755;
	bh=oBWMk5IXftwDZHR1DA8gs5+5AjQ0N9WxypmUP0N6Pw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QaiyGwrLw2XtwAIBVPsGq6n1pRXl0ow3G80G2c/fQuhlTwHI5OxwRMqNH5nvpye54
	 u5qagd1tSzbEzMJenpYJwJcdzetQv5KY0l6/G+pG9XaE4ykQ3rm9VvLibMVzP5LMrX
	 CjuXsHWBJcy56xfEfKvejxH3oPHoGA9wVi0+LOqhaSsPBA+KzXQsbg/WwWt/rHIN0J
	 jxULFQ1BAZ3GnVcY0S4z7GhHKQNhogl5c/qmntZHIEN2ujZWpRUBEhBZZqY4j4yvfU
	 HPTfo72R8PyV7cAx7KE28XwVA8Ef0J9ZLBx6WfB9Oxlge8yAOJYDNsN5fUArwVWYoE
	 J2YD2rYW5Yl+w==
Date: Sat, 28 Sep 2024 10:05:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, William Zhang <william.zhang@broadcom.com>, 
	Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: leds: bcm63138: Add shift register
 bits
Message-ID: <fmuxz5w77tfkodvntaley2b6kv2c7acgcfb6ojk3plw7g6rbdd@sahgzglndrda>
References: <20240928-bcm63138-leds-v2-0-f6aa4d4d6ef2@linaro.org>
 <20240928-bcm63138-leds-v2-1-f6aa4d4d6ef2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240928-bcm63138-leds-v2-1-f6aa4d4d6ef2@linaro.org>

On Sat, Sep 28, 2024 at 12:29:47AM +0200, Linus Walleij wrote:
> The BCM63138 family of serial LED controllers has a register
> where we can set up bits for the shift registers. These are
> the number of rounds the bits need to be shifted before all
> bits have been shifted through the external shift registers.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Drop the $ref to u32 since the new property is suffixed
>   with "-bits" and thus get standard treatment.
> ---
>  Documentation/devicetree/bindings/leds/leds-bcm63138.yaml | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-bcm63138.yaml b/Documentation/devicetree/bindings/leds/leds-bcm63138.yaml
> index bb20394fca5c..b3d530c46061 100644
> --- a/Documentation/devicetree/bindings/leds/leds-bcm63138.yaml
> +++ b/Documentation/devicetree/bindings/leds/leds-bcm63138.yaml
> @@ -41,6 +41,17 @@ properties:
>    "#size-cells":
>      const: 0
>  
> +  brcm,serial-shift-bits:

bits is an uint32-array, so you need to limit number of items, e.g.
items:
 - minimum: 1
   maximum: 32

default: [0]? or something else?

> +    minimum: 1
> +    maximum: 32
> +    description:
> +      This describes the number of 8-bit serial shifters
> +      connected to the LED controller block. The hardware
> +      is typically using 8-bit shift registers with 8 LEDs
> +      per shift register, so 4 shifters results in 32 LEDs
> +      or 2 shifters give 16 LEDs etc, but the hardware
> +      supports any odd number of registers.

Best regards,
Krzysztof


