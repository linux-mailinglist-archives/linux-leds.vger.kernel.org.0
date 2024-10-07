Return-Path: <linux-leds+bounces-2970-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 736969924FC
	for <lists+linux-leds@lfdr.de>; Mon,  7 Oct 2024 08:38:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C7772823AF
	for <lists+linux-leds@lfdr.de>; Mon,  7 Oct 2024 06:38:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E69514A4C3;
	Mon,  7 Oct 2024 06:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EHXj7NNO"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C37C42077;
	Mon,  7 Oct 2024 06:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728283112; cv=none; b=DwQuDbOe3uywwVH8jxgKAwymmokKlcmGuVxT0hkVFbqnJHkqQZScrbMErK2VwdpRPnPrnyquMXKlr+Oi31e8/g0BuHz+iPyWBxA4qgSa2n9w5NXy+jB8RMC647DAqujElxgE/fhA1NFkrw6Fp9Kiiq1RDj34KJWBiTQwXi+jAD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728283112; c=relaxed/simple;
	bh=L5jmh8zIotR73Clk8Z/8lkjelQDuJc3WVxOip6W9Cwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YsGF863v0zdhXUc07fw/IWGO+vEMde1DNffa7nFwn0HOclBlhroeJJAXdvBIm8LR3Kog2e/Y8vmQ/Bz4K4RazGGQP+pQXS43gL6IPncvEKKmWFFEdisepb1L6LPS41tgGuuQYiw/T57hogRLAbyK0eQLXIAmb/AcPxADQebmDVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EHXj7NNO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B824BC4CEC6;
	Mon,  7 Oct 2024 06:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728283111;
	bh=L5jmh8zIotR73Clk8Z/8lkjelQDuJc3WVxOip6W9Cwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EHXj7NNOfSVtTwh6UntCSldeYx3GLL/TUvuYlqE2H40VjocY3qqk3xvlYn0Fps9aB
	 ZC7BiBoCEpWdHgXBL4xYajBm/gZRfBd7jZsVaMSAiosTTCcfxqenqF4uxbZFn6KCis
	 Gu3Gd1myYe52nF4Hk/VKnX3a0w3ofqTajKoHAxO9INdSINU/JFlckyMzhYk5o8ia/m
	 4C8q/FSM8oBJTROvXCbx0pfdRIp1c9HFnQuIJVhWBt4hEbIGwlGUuC4rrsWDS01a4S
	 UxHEmSX3iBmJ+uZwaQQTsxp2BxTUYhwPk8CJ0aFdrv/mLnuOZSJyQjF1lZFSpLiUM2
	 zQ4mTuUYS9kdg==
Date: Mon, 7 Oct 2024 08:38:27 +0200
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
Message-ID: <6d3hvesqhslk7jaszo44orbaqabl7go6duzpu4beye44sa6lpn@b3c56bp6x3ce>
References: <e91ca84ac836fc40c94c52733f8fc607bcbed64c.1728145095.git.daniel@makrotopia.org>
 <4qk3lpdx47b27ru47avpiygijtu5kkax44t3o4wb2wv5m5djoz@uziseiklyq3d>
 <ZwKK4xMlqq3TyDyt@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZwKK4xMlqq3TyDyt@makrotopia.org>

On Sun, Oct 06, 2024 at 02:04:35PM +0100, Daniel Golle wrote:
> On Sun, Oct 06, 2024 at 02:44:44PM +0200, Krzysztof Kozlowski wrote:
> > On Sat, Oct 05, 2024 at 05:24:20PM +0100, Daniel Golle wrote:
> > > Other than described in commit c94d1783136 ("dt-bindings: net: phy: Make
> > 
> > Please run scripts/checkpatch.pl and fix reported warnings. Then please
> > run 'scripts/checkpatch.pl --strict' and (probably) fix more warnings.
> > Some warnings can be ignored, especially from --strict run, but the code
> > here looks like it needs a fix. Feel free to get in touch if the warning
> > is not clear.
> 
> Sorry about that, I was expecting '--fix-inplace' to take care of that
> but it didn't and I didn't notice. I will address that in a follow-up
> patch.
> 
> > 
> > > LED active-low property common") the absence of the 'active-low'
> > > property means not to touch the polarity settings which are inherited
> > > from reset defaults, the bootloader or bootstrap configuration.
> > > Hence, in order to override a LED pin being active-high in case of the
> > > default, bootloader or bootstrap setting being active-low an additional
> > > property 'active-high' is required.
> > > Document that property and make it mutually exclusive to the existing
> > > 'active-low' property.
> > > 
> > > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > > ---
> > >  Documentation/devicetree/bindings/leds/common.yaml | 14 ++++++++++++++
> > >  1 file changed, 14 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
> > > index bf9a101e4d42..7c3cd7b7412e 100644
> > > --- a/Documentation/devicetree/bindings/leds/common.yaml
> > > +++ b/Documentation/devicetree/bindings/leds/common.yaml
> > > @@ -202,6 +202,12 @@ properties:
> > >        #trigger-source-cells property in the source node.
> > >      $ref: /schemas/types.yaml#/definitions/phandle-array
> > >  
> > > +  active-high:
> > > +    type: boolean
> > > +    description:
> > > +      Makes LED active high. To turn the LED ON, line needs to be
> > > +      set to high voltage instead of low.
> > 
> > And then we are going to get 2 more bools for other variants...
> 
> I don't see a problem combining 'active-high' or 'active-low' with
> 'inactive-high-impedance' which would be the equivalent of
> 'active-low-tristate' and 'active-high-tristate'.

Oh, I missed that we have already two bool properties. I thought that
there is only active-high.

> 
> > 
> > I think this should be just string enum, see marvell,marvell10g.yaml
> 
> I found the vendor-specific 'marvell,polarity' property in
> https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231214201442.660447-5-tobias@waldekranz.com/
> 
> However, I can't find that file in any Linux tree.
> 
> Looking at the suggested patch on patchwork, I got a few questions on
> how to deal with the situation as of today:
> 
> So should the existing support for the 'active-low' and
> 'inactive-high-impedance' properties be replaced by that string enum?
> Or should the string property be interpreted in addition to the
> bools defined in leds/common.yaml?
> 
> Should the string property be defined for each PHY or should we move
> it into a common file?
> 
> If so, should that common file also be leds/common.yaml or should we
> create a new file only for PHY LEDs instead?
> 
> Sorry for being confused, I don't mind going down what ever path to have
> LED polarity configurable properly in DT.

Let's ignore my idea.

However I still wonder whether your choice for lack of properties is
appropriate. Lack of properties as "bootloader default" means it can
change. Why would anyone prefer to keep bootloader default? The wiring
is fixed - it's never "we design PCB based on bootloader, so with new
bootloader we will change PCB"?

And if you meant bootstrapping through some hardwired configuration,
then again it is known and defined.

Best regards,
Krzysztof


