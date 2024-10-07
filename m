Return-Path: <linux-leds+bounces-2971-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6967992A3B
	for <lists+linux-leds@lfdr.de>; Mon,  7 Oct 2024 13:31:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D76B71C2290D
	for <lists+linux-leds@lfdr.de>; Mon,  7 Oct 2024 11:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66DFE1C0DF0;
	Mon,  7 Oct 2024 11:31:21 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0C9101C4;
	Mon,  7 Oct 2024 11:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728300681; cv=none; b=Xu6Tll7q8LvyX2VDP5F78ZrjC9d/WBnc/O0xW5G5rU10BW+GaLVJVihV2vTny64V87wJVYhEVe1QmukQDOlFSG1ipjnFBtbEKuV0gghqy4Bj0QvSBM7nDvQ4kSuiPuC/o699wgIygdv/XpSqOwj0gz6N0GMT9V+KgKUWu/a3aWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728300681; c=relaxed/simple;
	bh=7tFqPXIR8Oj7mN8Mv3E1ReRdWth6sARj/sqyo2PSm6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pfxri3hzE1l0Qsmnzb7CbOEE8ZR2HTbe5iMOWcBp07Ox43/PObLO4sXCNr1QZGctQaoEa5Ve2vjM0LDMGhK0QQEmC2HmTZBIlTR3ybyC4jz4z+nTfkWWKszWw2DTAAe+V6+zbRUoPwlIf1HvLGFA5JOD4DWB12aCpmSZWBeWIls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1sxlx9-000000002KX-3SEU;
	Mon, 07 Oct 2024 11:31:03 +0000
Date: Mon, 7 Oct 2024 12:30:53 +0100
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
Message-ID: <ZwPGbUWImzlbEqb-@makrotopia.org>
References: <e91ca84ac836fc40c94c52733f8fc607bcbed64c.1728145095.git.daniel@makrotopia.org>
 <4qk3lpdx47b27ru47avpiygijtu5kkax44t3o4wb2wv5m5djoz@uziseiklyq3d>
 <ZwKK4xMlqq3TyDyt@makrotopia.org>
 <6d3hvesqhslk7jaszo44orbaqabl7go6duzpu4beye44sa6lpn@b3c56bp6x3ce>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d3hvesqhslk7jaszo44orbaqabl7go6duzpu4beye44sa6lpn@b3c56bp6x3ce>

On Mon, Oct 07, 2024 at 08:38:27AM +0200, Krzysztof Kozlowski wrote:
> On Sun, Oct 06, 2024 at 02:04:35PM +0100, Daniel Golle wrote:
> > On Sun, Oct 06, 2024 at 02:44:44PM +0200, Krzysztof Kozlowski wrote:
> > > I think this should be just string enum, see marvell,marvell10g.yaml
> > 
> > I found the vendor-specific 'marvell,polarity' property in
> > https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231214201442.660447-5-tobias@waldekranz.com/
> > 
> > However, I can't find that file in any Linux tree.
> > 
> > Looking at the suggested patch on patchwork, I got a few questions on
> > how to deal with the situation as of today:
> > 
> > So should the existing support for the 'active-low' and
> > 'inactive-high-impedance' properties be replaced by that string enum?
> > Or should the string property be interpreted in addition to the
> > bools defined in leds/common.yaml?
> > 
> > Should the string property be defined for each PHY or should we move
> > it into a common file?
> > 
> > If so, should that common file also be leds/common.yaml or should we
> > create a new file only for PHY LEDs instead?
> > 
> > Sorry for being confused, I don't mind going down what ever path to have
> > LED polarity configurable properly in DT.
> 
> Let's ignore my idea.
> 
> However I still wonder whether your choice for lack of properties is
> appropriate. Lack of properties as "bootloader default" means it can
> change. Why would anyone prefer to keep bootloader default? The wiring
> is fixed - it's never "we design PCB based on bootloader, so with new
> bootloader we will change PCB"?
> 
> And if you meant bootstrapping through some hardwired configuration,
> then again it is known and defined.

I agree, and my original intention was to just always apply polarity
settings and force people to correctly declare them in DT.
However, that would break DT compatibility on devices not making use
of those properties and relying only on strapping or bootloader
defaults. See also RFC discussed here:

https://patchwork.kernel.org/project/netdevbpf/patch/473d62f268f2a317fd81d0f38f15d2f2f98e2451.1728056697.git.daniel@makrotopia.org/

