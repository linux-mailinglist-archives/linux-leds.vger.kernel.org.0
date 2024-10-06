Return-Path: <linux-leds+bounces-2968-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FD9991E5B
	for <lists+linux-leds@lfdr.de>; Sun,  6 Oct 2024 15:05:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0049282694
	for <lists+linux-leds@lfdr.de>; Sun,  6 Oct 2024 13:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 124F7175D2F;
	Sun,  6 Oct 2024 13:05:00 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4110C154423;
	Sun,  6 Oct 2024 13:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728219900; cv=none; b=DJCVjCi7ruo/z2dE/F33o0sBBVUeaRMYOq/fwsxOiKrwAAi/62fZZ0IjcAwoEkz9IICo3IjnimUtylyziT2YnJPQ8+7j6LWbdg17Lb0+RzF/DyVFJh0AFRcfgiTzi2JXlJcVUWZPwhxcIKWGQBukFvi+Dbzqge9xPajXTBswDtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728219900; c=relaxed/simple;
	bh=o4D/+AyghCOcmPiWqvZL2HSHmixZXOAzBaXp651p2vk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KSyzey0Q5uPraxE06u2S3/w0x6qlCeaa11+xuR803ej2ryS9leeM5kRiNXcxpflI2HHtyKPKsJAiKWszqQsKIIgScdg73iiTjRLC9c/VrPCV42zICP4nbmhwB06CWR5otvqjOi7YQdI3JapXAKS31uCObmkCHBJ6kboCsszlbWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1sxQwF-0000000071c-35gd;
	Sun, 06 Oct 2024 13:04:43 +0000
Date: Sun, 6 Oct 2024 14:04:35 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Xu Liang <lxu@maxlinear.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Robert Marko <robimarko@gmail.com>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Abhishek Chauhan <quic_abchauha@quicinc.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 1/4] dt-bindings: leds: add 'active-high'
 property
Message-ID: <ZwKK4xMlqq3TyDyt@makrotopia.org>
References: <e91ca84ac836fc40c94c52733f8fc607bcbed64c.1728145095.git.daniel@makrotopia.org>
 <4qk3lpdx47b27ru47avpiygijtu5kkax44t3o4wb2wv5m5djoz@uziseiklyq3d>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4qk3lpdx47b27ru47avpiygijtu5kkax44t3o4wb2wv5m5djoz@uziseiklyq3d>

On Sun, Oct 06, 2024 at 02:44:44PM +0200, Krzysztof Kozlowski wrote:
> On Sat, Oct 05, 2024 at 05:24:20PM +0100, Daniel Golle wrote:
> > Other than described in commit c94d1783136 ("dt-bindings: net: phy: Make
> 
> Please run scripts/checkpatch.pl and fix reported warnings. Then please
> run 'scripts/checkpatch.pl --strict' and (probably) fix more warnings.
> Some warnings can be ignored, especially from --strict run, but the code
> here looks like it needs a fix. Feel free to get in touch if the warning
> is not clear.

Sorry about that, I was expecting '--fix-inplace' to take care of that
but it didn't and I didn't notice. I will address that in a follow-up
patch.

> 
> > LED active-low property common") the absence of the 'active-low'
> > property means not to touch the polarity settings which are inherited
> > from reset defaults, the bootloader or bootstrap configuration.
> > Hence, in order to override a LED pin being active-high in case of the
> > default, bootloader or bootstrap setting being active-low an additional
> > property 'active-high' is required.
> > Document that property and make it mutually exclusive to the existing
> > 'active-low' property.
> > 
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > ---
> >  Documentation/devicetree/bindings/leds/common.yaml | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
> > index bf9a101e4d42..7c3cd7b7412e 100644
> > --- a/Documentation/devicetree/bindings/leds/common.yaml
> > +++ b/Documentation/devicetree/bindings/leds/common.yaml
> > @@ -202,6 +202,12 @@ properties:
> >        #trigger-source-cells property in the source node.
> >      $ref: /schemas/types.yaml#/definitions/phandle-array
> >  
> > +  active-high:
> > +    type: boolean
> > +    description:
> > +      Makes LED active high. To turn the LED ON, line needs to be
> > +      set to high voltage instead of low.
> 
> And then we are going to get 2 more bools for other variants...

I don't see a problem combining 'active-high' or 'active-low' with
'inactive-high-impedance' which would be the equivalent of
'active-low-tristate' and 'active-high-tristate'.

> 
> I think this should be just string enum, see marvell,marvell10g.yaml

I found the vendor-specific 'marvell,polarity' property in
https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231214201442.660447-5-tobias@waldekranz.com/

However, I can't find that file in any Linux tree.

Looking at the suggested patch on patchwork, I got a few questions on
how to deal with the situation as of today:

So should the existing support for the 'active-low' and
'inactive-high-impedance' properties be replaced by that string enum?
Or should the string property be interpreted in addition to the
bools defined in leds/common.yaml?

Should the string property be defined for each PHY or should we move
it into a common file?

If so, should that common file also be leds/common.yaml or should we
create a new file only for PHY LEDs instead?

Sorry for being confused, I don't mind going down what ever path to have
LED polarity configurable properly in DT.

