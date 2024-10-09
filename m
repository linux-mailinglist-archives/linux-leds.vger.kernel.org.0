Return-Path: <linux-leds+bounces-3023-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF73E996E99
	for <lists+linux-leds@lfdr.de>; Wed,  9 Oct 2024 16:48:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB76E282579
	for <lists+linux-leds@lfdr.de>; Wed,  9 Oct 2024 14:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 163AA19CC29;
	Wed,  9 Oct 2024 14:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E68s2qL8"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE5E19ABB4;
	Wed,  9 Oct 2024 14:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728485321; cv=none; b=LfEX+bfkasaxL9R0YNC3ZsfGAgNwuw30Tfa29SEfGBunBD6h69Egg6ODHVb3LV1jiXQTuDA01asYZg3LrEaruAPAapgaDldsTDsx9Okk+d6/xsS3vx+1bggH40O6Siy3NJ0bvZ3590fPcTwWDD/anzZTsa0XMdN6ZS6onJ4J3ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728485321; c=relaxed/simple;
	bh=/px8Z9EoQkpFPcXutKrIm9lfL0PO8yTz3WJC8EVkC7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tAcq9mF/wCcC1+oB3kFe+5uIvG+nhyQXorA++xqzCJops2vLnRW1nXrZYTKuFpCaOk87x9fLFC5lwO+X+70bWUhnPMUedgrarM/rz++3dQohsD7ynkHFSgak+g0LO9FhJxDl4ePRm4v6QbJqppbZRVJ6zknm4YU8Pun4WpGX/tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E68s2qL8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E69B5C4CEC3;
	Wed,  9 Oct 2024 14:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728485320;
	bh=/px8Z9EoQkpFPcXutKrIm9lfL0PO8yTz3WJC8EVkC7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E68s2qL8XqM/wVOB1adTupwrVpdNs5tOGYfp2r0tGnxQ7fFXn2gS9BRXpkQ9PtqUc
	 NQunOIiUIZp03Nq3IhdeBPCcGosTp8fbo5Cf+PPWX4owwmILWZ5Gu8jIdKKzelpHF8
	 9LtbwckVHTYPCRDZI1LFX06DtLIV8KOqzhCoVHpCt5XNkSvgOmA1evvrADtGGXbutj
	 V8de0ucNTs9Yey/KTETA/GTU/Rn25TA16V6XhW5PWCUbodvM72O5z+Exf1y6Cr4yhT
	 VZOYn9MNJeDikCn3eqQLzaXi8DNgZkkuZcKFuraRm9CFZOnbzZojVnfTQQFwOra0Ru
	 H1tYqS1UaqvHw==
Date: Wed, 9 Oct 2024 15:48:36 +0100
From: Lee Jones <lee@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: leds: Document "rc-feedback" trigger
Message-ID: <20241009144836.GA596552@google.com>
References: <20241007205315.2477060-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241007205315.2477060-1-heiko@sntech.de>

On Mon, 07 Oct 2024, Heiko Stuebner wrote:

> Document the "rc-feedback" trigger which is used to control LEDs by
> remote control device activity. This is an existing trigger used in
> existing DTs, document it so validation of those DTs would pass.
> 
> It was originally introduced into the Linux kernel in 2013 with
> commit 153a60bb0fac ("[media] rc: add feedback led trigger for rc keypresses")
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
> changes in v2:
> - put the entry in the correct position and comment above it (Pavel)
> 
>  Documentation/devicetree/bindings/leds/common.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
> index bf9a101e4d42..9cd89f30fa7c 100644
> --- a/Documentation/devicetree/bindings/leds/common.yaml
> +++ b/Documentation/devicetree/bindings/leds/common.yaml
> @@ -118,6 +118,8 @@ properties:
>              # No trigger assigned to the LED. This is the default mode
>              # if trigger is absent
>            - none
> +            # LED indicates remote control feedback
> +          - rc-feedback

Is 'rc' a recognised and well known abbreviation for remote control?

How about we people some (look-up) time and say:

  - remote-control-feedback

?

>              # LED indicates camera torch state
>            - torch
>              # LED indicates USB gadget activity
> -- 
> 2.43.0
> 

-- 
Lee Jones [李琼斯]

