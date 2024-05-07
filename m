Return-Path: <linux-leds+bounces-1630-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 808E08BECB5
	for <lists+linux-leds@lfdr.de>; Tue,  7 May 2024 21:37:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B27BC1C20F00
	for <lists+linux-leds@lfdr.de>; Tue,  7 May 2024 19:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 749C716DECF;
	Tue,  7 May 2024 19:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HuMAi3Uo"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4486115F3E6;
	Tue,  7 May 2024 19:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715110634; cv=none; b=bIelwTtK+hh/A7VMkEIqPNj7m1xlBFkJ8RR2sG8MhzxPrhu78LwmNCrza7/WL9bvezMRoArkarvIezeGPAC3BGX6q/IjKv5Vj6ABlzmsfOwfX7hLSrcT5yxqKWFNKrDSsU1T4XW0v3/Viz2BAEYtOWgZwawLS6qhHSLfOld38+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715110634; c=relaxed/simple;
	bh=yHasmc7IXw0fuXXWeaKDZcjOs9eO4PtyDEOjKl8QIqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AN9/lN1sYpH/fYoxtim7X+bAI9QEAJ/IhXwPCC7hX5+0562u9abA6Mi8jVuJH8BroYp1UBtU9FNsvFRo5zh9CZjJCWtN2iDr27dtr+OHYIC4Dbpdxd3A37m3FFLQkjalI7swQ6/pJ6pwniy/BDyRBuqqcyWq8YBtMOA+nObN5AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HuMAi3Uo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98449C2BBFC;
	Tue,  7 May 2024 19:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715110633;
	bh=yHasmc7IXw0fuXXWeaKDZcjOs9eO4PtyDEOjKl8QIqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HuMAi3Uo+48/zh7gwr6CF6sqB/AfQOyO29HbMEul4VDj+mQ7Cmo6jXTxix6coyh1i
	 nLF1WL9TejJJAdr9tSIihlfXLYdae8f7or4pYSmnGCl7B30sQ5va/ZrAM/mGUvrzh+
	 hVqgpj9vD86UYT85h9gB+9Qe6cnqHCunIIxxTNmzPH+lxCQsu9d1U1Izvs5OpZ8WDh
	 5g+8QxxeBRBav46kWSBcptZJjbf3yw96B6LnZTyL0f0/Tbsh4HXD7XHH8QVq2MT62Q
	 13S9SECt+eUSvdrfkUQHnch/t81uunAUy8i1JON93HEtJVlKWpCfyt2s138SOKa8Up
	 eaxAfVokPa3uw==
Date: Tue, 7 May 2024 14:37:11 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	Eric Woudstra <ericwouds@gmail.com>,
	Tianling Shen <cnsztl@immortalwrt.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-leds@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [RFC v1 3/5] dt-bindings: net: mediatek,net: add reset-cells
Message-ID: <20240507193711.GA933697-robh@kernel.org>
References: <20240505164549.65644-1-linux@fw-web.de>
 <20240505164549.65644-4-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240505164549.65644-4-linux@fw-web.de>

On Sun, May 05, 2024 at 06:45:47PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add missing binding for property used in mt7986a.dtsi.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  Documentation/devicetree/bindings/net/mediatek,net.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
> index e74502a0afe8..5214927c0fe8 100644
> --- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
> +++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
> @@ -101,6 +101,9 @@ properties:
>    "#address-cells":
>      const: 1
>  
> +  "#reset-cells":
> +    const: 1

Also fixed already.

Rob

