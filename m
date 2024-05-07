Return-Path: <linux-leds+bounces-1629-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D538BECB2
	for <lists+linux-leds@lfdr.de>; Tue,  7 May 2024 21:36:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CBF1BB2264A
	for <lists+linux-leds@lfdr.de>; Tue,  7 May 2024 19:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25C7416E893;
	Tue,  7 May 2024 19:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hUhfyIqg"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E206916E880;
	Tue,  7 May 2024 19:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715110560; cv=none; b=FOPCv9acc4y9H2QL6SAvb/4HOpkVc4sGj4I9WNLd1X33hGMTHPjcuEjgFq2EwjT+oe7PpMlmfO0uKOxyMvGEV6GR3+NFzR0PNzgftXRsHRuWUVSj/u4dJgLjRo/XXOmOvcIxD1yXio3DoHiU9YXJDP3ZKgt/AzKERNGv+drIWlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715110560; c=relaxed/simple;
	bh=bRHbcYBsOau7RDjFb4TOtC+YEMb0oH2Rg3gRpr/6wGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qHivMvC8ztl43sfCqx/Dteuc3hYin2EcWGWDPUXrTU6DF1WpXMMvPVOshMWgwtyOVrZaqA5owdEjuBcbeSCa3J5+6t8awlDgxI9Jsb7llhP0hg4GJoPs6DyJQnGyXNvgfREpvsAlu/KtpTUyqRa72lovMLKdEqCxUIBp8KWu9oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hUhfyIqg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27DFEC2BBFC;
	Tue,  7 May 2024 19:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715110559;
	bh=bRHbcYBsOau7RDjFb4TOtC+YEMb0oH2Rg3gRpr/6wGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hUhfyIqgDc7kjRSbwQgC0OoI/RDBN9Ux6JALUaqshYxEFPa6wmQ2fkgPhNkgM2dtU
	 QTzt1ROsrKQhB/LJi5Hei/I/nSEyAld3Iat/IbbGFHuFSQ2y2QvXtxAt3AX2lnHYAo
	 J8YVu0/7vBFKKD+MDwLe3sj7V5tNZYNzOwgg/3taLFAdn7EHpDO13WIWeX2S7DI3UV
	 hxWSrxgrulED+svg0ShBGgzKks8Kw3qd2z5KhpdgJyRR6SqRcNM+0PR4YDK+Eit0R/
	 qQF7h5hPXbik8gNcWut6WxI045KzrabGMvqTlHsdza4HlMTJtpvEagRE4uT46RtBom
	 RXmqb+qmu8bvA==
Date: Tue, 7 May 2024 14:35:57 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Frank Wunderlich <linux@fw-web.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Eric Woudstra <ericwouds@gmail.com>,
	Tianling Shen <cnsztl@immortalwrt.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-leds@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: Aw: Re: [RFC v1 2/5] dt-bindings: clock: mediatek: add
 address-cells and size-cells to ethsys
Message-ID: <20240507193557.GA924525-robh@kernel.org>
References: <20240505164549.65644-1-linux@fw-web.de>
 <20240505164549.65644-3-linux@fw-web.de>
 <9f8237c4-f603-459a-9d34-9cda556874b8@linaro.org>
 <trinity-9ceb52ff-9a3b-4fe2-93f8-2e95b8ffb1ee-1715014303393@3c-app-gmx-bap23>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <trinity-9ceb52ff-9a3b-4fe2-93f8-2e95b8ffb1ee-1715014303393@3c-app-gmx-bap23>

On Mon, May 06, 2024 at 06:51:43PM +0200, Frank Wunderlich wrote:
> > Gesendet: Montag, 06. Mai 2024 um 10:18 Uhr
> > Von: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>
> > On 05/05/2024 18:45, Frank Wunderlich wrote:
> > > From: Frank Wunderlich <frank-w@public-files.de>
> > >
> > > Add missing properties already used in mt7986a.dtsi.
> >
> > Missing for what? Or why? Provide context, IOW, explain why they are
> > missing.
> 
> ethernet-node in mt7986a.dtsi hast reset-cells-property
> 
> https://elixir.bootlin.com/linux/v6.9-rc1/source/arch/arm64/boot/dts/mediatek/mt7986a.dtsi#L559
> 
> and
> 
> address-cells and size-cells are used here:
> 
> https://elixir.bootlin.com/linux/v6.9-rc1/source/arch/arm64/boot/dts/mediatek/mt7986a.dtsi#L495
> 
> i saw the warnings while checking my r3mini dts...
> 
> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: syscon@15000000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/clock/mediatek,ethsys.yaml#
> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: ethernet@15100000: Unevaluated properties are not allowed ('#reset-cells' was unexpected)
> 	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
> 
> so i thought it is a good idea to fix this now ;)

The dts is already fixed dropping these properties in linux-next.

If you don't have child nodes with reg/ranges, then you never need 
#address-cells or #size-cells.

Rob

