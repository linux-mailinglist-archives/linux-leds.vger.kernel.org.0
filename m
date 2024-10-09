Return-Path: <linux-leds+bounces-3017-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8A1996C11
	for <lists+linux-leds@lfdr.de>; Wed,  9 Oct 2024 15:33:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEED11F20FF8
	for <lists+linux-leds@lfdr.de>; Wed,  9 Oct 2024 13:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D02AD192D89;
	Wed,  9 Oct 2024 13:33:08 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C5822EEF;
	Wed,  9 Oct 2024 13:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728480788; cv=none; b=hKYKRL+B0YqZ0viJcDpvPjUMCfOTYa5zvNO6yCpXubrsCPW+Opn5BtDmqufkIvlps0lZbfegnXep+/tdtw0+jxjcm4nE7sPDrT2J7AmaWRMSMFE9ZT3TG7hvf1aMEp5CKpdHqWpRpsTC4qPcag9kd/IZHzIP0DDdw5nt+TrdSEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728480788; c=relaxed/simple;
	bh=IFohZxECtwwdtC2YdM15WtXADKYoFT74BVnT0QxITvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uBSOa9VKMpGjg4VMM4Aoc5Rfp6ZAWwLX1SGbVKrs2mfaiJc5Qao9+v3Fi4CZXJY3uYxCWDUgezunfMMh75wlb4agJcuaWUlEqZzLq3n/ewPwJ7ThGZZoj25iIU4zA+F+lEKKtOMueadDFSlhkZar8ASAASddGYD0ocXyaPwLxM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1syWo7-000000006kL-2RHT;
	Wed, 09 Oct 2024 13:32:51 +0000
Date: Wed, 9 Oct 2024 14:32:45 +0100
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
Message-ID: <ZwaF_VNG3TE33rfb@makrotopia.org>
References: <e91ca84ac836fc40c94c52733f8fc607bcbed64c.1728145095.git.daniel@makrotopia.org>
 <4qk3lpdx47b27ru47avpiygijtu5kkax44t3o4wb2wv5m5djoz@uziseiklyq3d>
 <ZwKK4xMlqq3TyDyt@makrotopia.org>
 <6d3hvesqhslk7jaszo44orbaqabl7go6duzpu4beye44sa6lpn@b3c56bp6x3ce>
 <ZwPGbUWImzlbEqb-@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZwPGbUWImzlbEqb-@makrotopia.org>

On Mon, Oct 07, 2024 at 12:30:53PM +0100, Daniel Golle wrote:
> On Mon, Oct 07, 2024 at 08:38:27AM +0200, Krzysztof Kozlowski wrote:
> > On Sun, Oct 06, 2024 at 02:04:35PM +0100, Daniel Golle wrote:
> > > On Sun, Oct 06, 2024 at 02:44:44PM +0200, Krzysztof Kozlowski wrote:
> > > > I think this should be just string enum, see marvell,marvell10g.yaml
> > > 
> > > I found the vendor-specific 'marvell,polarity' property in
> > > https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231214201442.660447-5-tobias@waldekranz.com/
> > > 
> > > However, I can't find that file in any Linux tree.
> > > 
> > > Looking at the suggested patch on patchwork, I got a few questions on
> > > how to deal with the situation as of today:
> > > 
> > > So should the existing support for the 'active-low' and
> > > 'inactive-high-impedance' properties be replaced by that string enum?
> > > Or should the string property be interpreted in addition to the
> > > bools defined in leds/common.yaml?
> > > 
> > > Should the string property be defined for each PHY or should we move
> > > it into a common file?
> > > 
> > > If so, should that common file also be leds/common.yaml or should we
> > > create a new file only for PHY LEDs instead?
> > > 
> > > Sorry for being confused, I don't mind going down what ever path to have
> > > LED polarity configurable properly in DT.
> > 
> > Let's ignore my idea.
> > 
> > However I still wonder whether your choice for lack of properties is
> > appropriate. Lack of properties as "bootloader default" means it can
> > change. Why would anyone prefer to keep bootloader default? The wiring
> > is fixed - it's never "we design PCB based on bootloader, so with new
> > bootloader we will change PCB"?
> > 
> > And if you meant bootstrapping through some hardwired configuration,
> > then again it is known and defined.
> 
> I agree, and my original intention was to just always apply polarity
> settings and force people to correctly declare them in DT.
> However, that would break DT compatibility on devices not making use
> of those properties and relying only on strapping or bootloader
> defaults. See also RFC discussed here:
> 
> https://patchwork.kernel.org/project/netdevbpf/patch/473d62f268f2a317fd81d0f38f15d2f2f98e2451.1728056697.git.daniel@makrotopia.org/
> 

I see that the series was marked as "Not Applicable" in patchwork.
What is the reason for that? To me it looks like it can be applied on
today's net-next cleanly:

[daniel@box linux.git]$ git fetch https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next
From https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next
 * branch                      HEAD       -> FETCH_HEAD
[daniel@box linux.git]$ git checkout FETCH_HEAD
HEAD is now at 6607c17c6c5e net: mana: Enable debugfs files for MANA device
[daniel@box linux.git]$ wget -q -O - https://patchwork.kernel.org/series/895863/mbox/ | git am
Applying: dt-bindings: leds: add 'active-high' property
Applying: net: phy: support 'active-high' property for PHY LEDs
Applying: net: phy: aquantia: correctly describe LED polarity override
Applying: net: phy: mxl-gpy: correctly describe LED polarity
[daniel@box linux.git]$ 

Or did I misunderstand the meaning of "Not Applicable"? If so, please
clarify.

