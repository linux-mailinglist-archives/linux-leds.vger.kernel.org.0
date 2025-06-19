Return-Path: <linux-leds+bounces-4852-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CDBAE0241
	for <lists+linux-leds@lfdr.de>; Thu, 19 Jun 2025 12:02:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C75E1BC2E37
	for <lists+linux-leds@lfdr.de>; Thu, 19 Jun 2025 10:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07074220F5C;
	Thu, 19 Jun 2025 10:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ED6wMDEa"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE86020E715;
	Thu, 19 Jun 2025 10:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750327369; cv=none; b=bGR2CK+sY88r2VIscKlnEMk20kVZr2FZFJDZzSh18OWTVoWzvnLT2VUQtUwpWdv/otLnmXUE9Ag8jNzeNFPZfCyOlo2mqgvb7YiNW/ohL9lcXkX68cm0F6SeoMR0rDRXix9Kdv5oe2d8EWtMwmKZZCYZhc/lAj6kh2wxkWs2nT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750327369; c=relaxed/simple;
	bh=YFB6a7EpiPV53fOiD+A4i7B9iBKnd4sLHm6gZp/bhGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=koDPNtChrc7JplPr0LhuYemwMS3fGSH7dQdp1v5dvPfNkfjIlMl5ZOKgDHnvdS2WVuiJAOttzIpFg362ObQvVq7dGqmGeUxO6bJ6upxRQXeVUlx3VRfhEeREUskw6tlVbMZKJyCK8bo1wCJJ6a2KEIqO4+F0qxvObfqENXisw48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ED6wMDEa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AA1DC4CEEA;
	Thu, 19 Jun 2025 10:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750327369;
	bh=YFB6a7EpiPV53fOiD+A4i7B9iBKnd4sLHm6gZp/bhGg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ED6wMDEaqw5Y3zbbYAaheUZJX1sW5upk4hrMagwFG64NTJ/HZ5zUCFmtifPUc03hB
	 EavuqdYTyplsAkDjsH7NNNmGHGG1UUqtgKK+cs0Z/sME/o1qZsLVjZPtpT2CbZOSxE
	 t7AWPkzkkPTB/Q7R5JPzo8QXIUq1OKlX6lvpZa1qgduxzz2l2PGNJtIUB/qtQuwkHq
	 EXIP+GgGcrwbduBYxWtvOl8trcvxn3+vcozNuskXdeCni1BFHK1mCUcXAK3bHHz5V6
	 5Fu7y/9fXeRYbILMO10xlIbeVpwTG5BbQIUWE4ItLRbmbHTbEYf1E/mnzu3mZoaq+V
	 79ZwVPex3mp+Q==
Date: Thu, 19 Jun 2025 11:02:44 +0100
From: Lee Jones <lee@kernel.org>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Johan Adolfsson <johan.adolfsson@axis.com>,
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kernel@axis.com
Subject: Re: [PATCH RFC v4 1/2] leds: leds-lp50xx: Handle reg to get correct
 multi_index
Message-ID: <20250619100244.GC587864@google.com>
References: <20250526-led-fix-v4-0-33345f6c4a78@axis.com>
 <20250526-led-fix-v4-1-33345f6c4a78@axis.com>
 <2bb62450-df35-4063-ac5e-60bc1ef8f5e7@gmail.com>
 <20250612105341.GC381401@google.com>
 <851e68e1-f358-49c6-8147-912d582c6a00@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <851e68e1-f358-49c6-8147-912d582c6a00@gmail.com>

On Sat, 14 Jun 2025, Jacek Anaszewski wrote:

> On 6/12/25 12:53, Lee Jones wrote:
> > On Mon, 26 May 2025, Jacek Anaszewski wrote:
> > 
> > > Hi Johan,
> > > 
> > > On 5/26/25 16:54, Johan Adolfsson wrote:
> > > > mc_subled used for multi_index needs well defined array indexes,
> > > > to guarantee the desired result, optionally use reg for that.
> > > > 
> > > > If devicetree child nodes is processed in random or reverse order
> > > > you may end up with multi_index "blue green red" instead of the expected
> > > > "red green blue".
> > > > If user space apps uses multi_index to deduce how to control the leds
> > > > they would most likely be broken without this patch if devicetree
> > > > processing is reversed (which it appears to be).
> > > > 
> > > > arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts has reg set
> > > > but I don't see how it can have worked without this change.
> > > > 
> > > > If reg is not set, the previous behavior is kept, index will be in
> > > > the order nodes are processed.
> > > 
> > > This is a bug and I don't see any value in keeping buggy code.
> > > Just expect reg to be present and make sure that all in-tree
> > > dts files using these bindings use them in a proper way.
> > > 
> > > To not break existing users of stable releases, if any of them
> > > implement DT subnodes without 'reg' property, we can just not mark this
> > > commit with "Fixed" tag, so that it wasn't applied to stable releases.
> > > Although I am not sure if we should not fix it there as well.
> > > I'm leaving it to Lee.
> > 
> > We cannot assume that a patch won't end up in LTS just by omitting the
> > Fixes: tag.  Sasha's AUTOSEL tooling it still likely to pick it up if we
> > describe the commit as a fix, which we do and is correct.
> > 
> > I see no reason not to apply it.  If users are relying on broken
> > semantics, then those should be fixed also.
> > 
> > Is everyone happy with this patch as-is?
> 
> Nope, we should require presence of proper 'reg' value then.
> 
> > > > If reg is out of range, an error is returned.
> > > > reg within led child nodes starts with 0, to map to the iout in each bank.
> > > > 
> > > > Signed-off-by: Johan Adolfsson <johan.adolfsson@axis.com>
> > > > ---
> > > >    drivers/leds/leds-lp50xx.c | 8 +++++++-
> > > >    1 file changed, 7 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
> > > > index 02cb1565a9fb..8067aaa916bf 100644
> > > > --- a/drivers/leds/leds-lp50xx.c
> > > > +++ b/drivers/leds/leds-lp50xx.c
> > > > @@ -476,6 +476,7 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
> > > >    			return -ENOMEM;
> > > >    		fwnode_for_each_child_node(child, led_node) {
> > > > +			int multi_index = num_colors;
> > > >    			ret = fwnode_property_read_u32(led_node, "color",
> > > >    						       &color_id);
> > > >    			if (ret) {
> > > > @@ -483,8 +484,13 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
> > > >    				dev_err(priv->dev, "Cannot read color\n");
> > > >    				return ret;
> > > >    			}
> > > > +			ret = fwnode_property_read_u32(led_node, "reg", &multi_index);
> > > > +			if (ret == 0 && multi_index >= LP50XX_LEDS_PER_MODULE) {
> 
> Here we should fail if 'reg' is not present too.

Works for me.

-- 
Lee Jones [李琼斯]

