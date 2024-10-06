Return-Path: <linux-leds+bounces-2967-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE57991E47
	for <lists+linux-leds@lfdr.de>; Sun,  6 Oct 2024 14:44:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 767E41C20D39
	for <lists+linux-leds@lfdr.de>; Sun,  6 Oct 2024 12:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB71175D2F;
	Sun,  6 Oct 2024 12:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EXzILaqT"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF8554F95;
	Sun,  6 Oct 2024 12:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728218688; cv=none; b=RfQ2WaOfwW5/c2hAR6QpiynTVBybx7wHMK+3Jp2bL2nX2pOgfdlcnoAEYUmhaKB1ZYVFPI0jYTsmYDH5meauZR5VYrrH7zciOyt6JYAFef5WLr0fbEI2ujWfxVkpecWujYm3uocWH20zr2o8Ztp+Dp1WGtnfxuse8+77/p0x5LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728218688; c=relaxed/simple;
	bh=OOlvykhGGyH5S+CQtgoBWBA1w0ZejTDbyyQIYRg+yhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u5riitaR0S+Hg2lpyWoM2taKcIU0yNU4kk7ivc9sKn6mQ4N0NY9hIS95H2+/VreEeQzXJhINRQw+CIMou7d6aNYM03YOMcziW9LSPs5OlhZnFPO8UVzl8xl3rp5S+LsgSP5jah4wtt7Og+CQqxikd7P9SO4uh3wtAbH4hffq794=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EXzILaqT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64289C4CEC5;
	Sun,  6 Oct 2024 12:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728218688;
	bh=OOlvykhGGyH5S+CQtgoBWBA1w0ZejTDbyyQIYRg+yhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EXzILaqTSSg/Kv5BSKQo9AbrSTTkuSLGUCu4BORE8srPjqqENCDEJdnoACsyRqFxh
	 Y42RbkR9ZO3DVx1Oh6EmiFldtzhFpYEkvOXuq0S83lm+a7W0M0jFP7Hz/QUR4KvFgk
	 i6Cz6BCfQfa3OYxPoC4DjisLAgsXwPIJCASNo2PzMZHkw9ZxyS9E2Gz40qCSY7tI2n
	 BcSYX3/m5TWKTNieQrUQkpUnOHWkkSI37UHOVRi+RF3mdAYbCzJlzvilkaPaeHCYWT
	 kdtUTVSe9cllXD+10MRn7uZjGX6+/LD3n9q5hIpb5c0+iT1bjvWo/h8xl9fkBpFBlJ
	 eWcB5M+wiQthw==
Date: Sun, 6 Oct 2024 14:44:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Xu Liang <lxu@maxlinear.com>, 
	Christian Marangi <ansuelsmth@gmail.com>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Robert Marko <robimarko@gmail.com>, Russell King <rmk+kernel@armlinux.org.uk>, 
	Abhishek Chauhan <quic_abchauha@quicinc.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Subject: Re: [PATCH net-next 1/4] dt-bindings: leds: add 'active-high'
 property
Message-ID: <4qk3lpdx47b27ru47avpiygijtu5kkax44t3o4wb2wv5m5djoz@uziseiklyq3d>
References: <e91ca84ac836fc40c94c52733f8fc607bcbed64c.1728145095.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e91ca84ac836fc40c94c52733f8fc607bcbed64c.1728145095.git.daniel@makrotopia.org>

On Sat, Oct 05, 2024 at 05:24:20PM +0100, Daniel Golle wrote:
> Other than described in commit c94d1783136 ("dt-bindings: net: phy: Make

Please run scripts/checkpatch.pl and fix reported warnings. Then please
run 'scripts/checkpatch.pl --strict' and (probably) fix more warnings.
Some warnings can be ignored, especially from --strict run, but the code
here looks like it needs a fix. Feel free to get in touch if the warning
is not clear.

> LED active-low property common") the absence of the 'active-low'
> property means not to touch the polarity settings which are inherited
> from reset defaults, the bootloader or bootstrap configuration.
> Hence, in order to override a LED pin being active-high in case of the
> default, bootloader or bootstrap setting being active-low an additional
> property 'active-high' is required.
> Document that property and make it mutually exclusive to the existing
> 'active-low' property.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  Documentation/devicetree/bindings/leds/common.yaml | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
> index bf9a101e4d42..7c3cd7b7412e 100644
> --- a/Documentation/devicetree/bindings/leds/common.yaml
> +++ b/Documentation/devicetree/bindings/leds/common.yaml
> @@ -202,6 +202,12 @@ properties:
>        #trigger-source-cells property in the source node.
>      $ref: /schemas/types.yaml#/definitions/phandle-array
>  
> +  active-high:
> +    type: boolean
> +    description:
> +      Makes LED active high. To turn the LED ON, line needs to be
> +      set to high voltage instead of low.

And then we are going to get 2 more bools for other variants...

I think this should be just string enum, see marvell,marvell10g.yaml

Best regards,
Krzysztof


