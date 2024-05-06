Return-Path: <linux-leds+bounces-1616-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2BE8BD655
	for <lists+linux-leds@lfdr.de>; Mon,  6 May 2024 22:40:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D8D01C20FB4
	for <lists+linux-leds@lfdr.de>; Mon,  6 May 2024 20:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F00AF15B57A;
	Mon,  6 May 2024 20:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oOI6ctcL"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED3015B56E;
	Mon,  6 May 2024 20:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715028027; cv=none; b=EtOENF0tGUR3OC8D83Rc3QDlNmdSghJqlW3jMtqeD9A6BUP1PVHQFJh4cH3gIBdFW9+8JccitBVEZyynXnPQlOIZthF36eHz+6tYLYLrFJaBtOrhzGq/SKywPVq7Hyp8AitM74SKU8CXn5Vw2T9+bTY/1HuDzSpRbk2wTadKnis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715028027; c=relaxed/simple;
	bh=gp0Hiz0fY4V+2j9w+5I7W4FxOvOzlKPG4eD+czuDYLI=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=Pkf8Sco/sgKXuQqbBFY0P6ryL6IKSvrc0WfBwejNiiETkkcb6BPYkNcbx2qUYsmNk1Dl/PNuWj1xpxs3Drp93W5emfD3Pf2lOlLDMa0SW95//Wwbi3BZIGes59Iz/RNd/UydxKNkIh+lLrU1keM13TReSrjgqcAQ710y+HyK4LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oOI6ctcL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B8C5C116B1;
	Mon,  6 May 2024 20:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715028027;
	bh=gp0Hiz0fY4V+2j9w+5I7W4FxOvOzlKPG4eD+czuDYLI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=oOI6ctcL+acwEojD8kAo5S6uwfr6y9MY8/6M1Yy9hP/VbjR3b6w/oo3ezOyID5h3d
	 dTOg4LZRshKJ1WlLvnD3pWknyeH8JRv0vpBzQsbIeGmdHWrT2sB/Vv/P2g2ArIyCKL
	 neVt5rxD+ApxK5lg2MYRbgn7+gGNHB52MsDcSpLJkuwYjfvHAnrR0zMjYgz63fT9hs
	 OHiVDP/Jr/yMjTLGmeAr0MNuNQkjdKXoBoS9oBlW8JHZwA1315kywLzADP80SUIWIp
	 cRHN9qQJZ7cahrpryaNeZPognEcuQN7YHlxuFjkRrTtSWkDzkV/tHHjPFZLxj8QggL
	 KXdVY87dg3Zjw==
Date: Mon, 06 May 2024 15:40:25 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Tianling Shen <cnsztl@immortalwrt.org>, 
 linux-arm-kernel@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 linux-clk@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, 
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, 
 linux-mediatek@lists.infradead.org, linux-leds@vger.kernel.org, 
 "David S. Miller" <davem@davemloft.net>, Lee Jones <lee@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Frank Wunderlich <frank-w@public-files.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, 
 Eric Woudstra <ericwouds@gmail.com>
In-Reply-To: <20240505164549.65644-1-linux@fw-web.de>
References: <20240505164549.65644-1-linux@fw-web.de>
Message-Id: <171502764339.89536.5670988761224031139.robh@kernel.org>
Subject: Re: [RFC v1 0/5] Add Bananapi R3 Mini


On Sun, 05 May 2024 18:45:44 +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add mt7986 based BananaPi R3 Mini SBC and fix some related binding errors.
> 
> Frank Wunderlich (5):
>   dt-bindings: leds: add led trigger netdev
>   dt-bindings: clock: mediatek: add address-cells and size-cells to
>     ethsys
>   dt-bindings: net: mediatek,net: add reset-cells
>   dt-bindings: arm64: dts: mediatek: add BananaPi R3 Mini
>   arm64: dts: mediatek: Add  mt7986 based Bananapi R3 Mini
> 
>  .../devicetree/bindings/arm/mediatek.yaml     |   1 +
>  .../bindings/clock/mediatek,ethsys.yaml       |   6 +
>  .../devicetree/bindings/leds/common.yaml      |   2 +
>  .../devicetree/bindings/net/mediatek,net.yaml |   3 +
>  arch/arm64/boot/dts/mediatek/Makefile         |   1 +
>  .../mediatek/mt7986a-bananapi-bpi-r3-mini.dts | 486 ++++++++++++++++++
>  6 files changed, 499 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dts
> 
> --
> 2.34.1
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y mediatek/mt7986a-bananapi-bpi-r3-mini.dtb' for 20240505164549.65644-1-linux@fw-web.de:

arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: crypto@10320000: interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: crypto@10320000: interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#






