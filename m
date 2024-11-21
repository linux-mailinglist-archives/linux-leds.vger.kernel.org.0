Return-Path: <linux-leds+bounces-3427-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9159D5474
	for <lists+linux-leds@lfdr.de>; Thu, 21 Nov 2024 22:05:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 212FC1F21F98
	for <lists+linux-leds@lfdr.de>; Thu, 21 Nov 2024 21:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEEC01C4A0B;
	Thu, 21 Nov 2024 21:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ko30Kico"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA778145A03;
	Thu, 21 Nov 2024 21:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732223115; cv=none; b=s9xQbWU6oAgumWJADi4N5Xy3lOXnPNnZYdglCXBYBHBOufMdCG6gqhkOkQS1HOrQxz74QikKyBad0rAD3HXeGLM5OkL71sOCiUDLkSGnyoo59u2xwPCcir/InEad+518xshuYeQIPmMuTgRLIzLXyiMiG/t4xdY3kPybebbjoo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732223115; c=relaxed/simple;
	bh=X3eu61xg9llcnUKHcb0Q5Uo0q9OVZwoeWaPet4215wY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IYV31IM+kT/xMM5s641ntQEe3rKbacX83UDNSJRjHMGzGPq6lOqwVE0zpoJmIiHMtcZTv+8m2LMaoFnwqSYGZSLzgms+rSKbyTGKgySo3iP+9vLhElTAYpMlNm0os3Y1HRQ3+UghzjLy4bKJ0R0kKS3I7VX7yXYIBBudITYgNWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ko30Kico; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C4F4C4CECC;
	Thu, 21 Nov 2024 21:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732223115;
	bh=X3eu61xg9llcnUKHcb0Q5Uo0q9OVZwoeWaPet4215wY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ko30KicoHx8gnZ/U7OKxZrl0iYK5pvTuG7i4fkptS/RpBBI+9pxGVJdnoMTAZUdTp
	 JBT4M5+gbBtmuaJ6ggBgwnc7hfjkALeBjBqqmBErKqKJfPvCrODXXLETxMWVmk4x5Q
	 8Rs/6vYBFmWkgWuKlUicKAOw4IJq6DN8+rnZFK7C8bNj3ZSrN0nM7YMfPfd1qgHG33
	 ikLttYrZOXWg88HnwyyhY/j7+L4dbrSpAzErkAJUpbQcYu+4x/nJGyNlT2T8Icac6G
	 riaXWOl919iNwVuIxnhrCWWUXGuFe+4p1//LtrUiihXw7scyAn/vqrxiDoAONFAfhA
	 23oUPDSN1YJ5w==
Date: Thu, 21 Nov 2024 15:05:14 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
Cc: Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org, linux-doc@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v9 2/3] dt-bindings: leds: Add LED1202 LED Controller
Message-ID: <173222307644.3811087.7654504224510124517.robh@kernel.org>
References: <20241121165829.8210-1-vicentiu.galanopulo@remote-tech.co.uk>
 <20241121165829.8210-3-vicentiu.galanopulo@remote-tech.co.uk>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241121165829.8210-3-vicentiu.galanopulo@remote-tech.co.uk>


On Thu, 21 Nov 2024 16:58:24 +0000, Vicentiu Galanopulo wrote:
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
> Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
> ---
> v1: https://lore.kernel.org/lkml/ZnCnnQfwuRueCIQ0@admins-Air/T/
> v2: https://lore.kernel.org/all/ZniNdGgKyUMV-hjq@admins-Air/T/
> v3: https://lore.kernel.org/all/ZniNdGgKyUMV-hjq@admins-Air/T/
> 
> Changes in v4:
>   - remove label property, use devm_led_classdev_register_ext instead
> Changes in v3:
>   - remove active property
> Changes in v2:
>   - renamed label to remove color from it
>   - add color property for each node
>   - add function and function-enumerator property for each node
> 
>  .../devicetree/bindings/leds/st,led1202.yaml  | 132 ++++++++++++++++++
>  1 file changed, 132 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/st,led1202.yaml
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

Missing tags:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>




