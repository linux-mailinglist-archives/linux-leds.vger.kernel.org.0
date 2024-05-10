Return-Path: <linux-leds+bounces-1654-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E808C2618
	for <lists+linux-leds@lfdr.de>; Fri, 10 May 2024 15:53:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B7AE1F22907
	for <lists+linux-leds@lfdr.de>; Fri, 10 May 2024 13:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFDCA12C530;
	Fri, 10 May 2024 13:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A64OWzCE"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D3912C46B;
	Fri, 10 May 2024 13:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715349188; cv=none; b=VhxhDAVhVc/Mfum4O+enlE6Mf3cdWb2X+ApqGsKpnE74e9zgBXv6mhMhpP7XdEFf7mW2PPMsUPfiNosi1i10R+0L/2HAIyUaHb1SY4iJw1rN56fhRRXemgSTCp3Xc2CnmieQZhLMPuMUA6X8wxOehUbI5NR7yIaAwVGWR+/Qcw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715349188; c=relaxed/simple;
	bh=6KpXMrLeritzB8bNaBffhCqm+rUB+tqQRQjkCVrSwOg=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=PbR+04Fg5EPhbPTqKcmH1+cFFA6wW3IRzCYhQjOoIh2+gW88pPn3YRRuaiykdW06od2GhGEyZHBw5/FKCcfs3v5oawVnxGBCcA5F/cUzm0RsSM9Eur4Lm+eWb908rdZxCFj7TdWm/Sphib5WfAgLCvI7ttHPsok/1i2XWYLwzCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A64OWzCE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D53BC113CC;
	Fri, 10 May 2024 13:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715349188;
	bh=6KpXMrLeritzB8bNaBffhCqm+rUB+tqQRQjkCVrSwOg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=A64OWzCEMg4DcJItwWnY/nQEN6c08na6QOnzyyA16EkwyYPWJ0jqdPmypqBP4bPWm
	 aMs0AL9rwpbVHg1YxLozM2876hLrD+tfiPoHgmt33/rS4iubuU2khWvDeLwHFJCu0C
	 iNJIv9QfrfvN6SO6RMmb348ykhR/eLLtTsby5SoNDTiz+c0/AHSdlTBHKygkAsTUdQ
	 FGbRxxawWdHBachzf/P47ZiJ9ealbDgrhjRXW7J6EQIQzlGh+Aa8PTHNVuCak4A4eD
	 6ML1uJJeDIl7bSuY1ckxngyoXYlQWIl6VeL6FvID6dQP+HGn/8bZTOzPZgWA4QnVB0
	 FFIvO/XokF11A==
Date: Fri, 10 May 2024 08:53:06 -0500
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
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 Stephen Boyd <sboyd@kernel.org>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 Frank Wunderlich <frank-w@public-files.de>, 
 Eric Woudstra <ericwouds@gmail.com>, Tianling Shen <cnsztl@immortalwrt.org>, 
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 Pavel Machek <pavel@ucw.cz>, Conor Dooley <conor+dt@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, 
 Michael Turquette <mturquette@baylibre.com>, Lee Jones <lee@kernel.org>, 
 Eric Dumazet <edumazet@google.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, 
 Paolo Abeni <pabeni@redhat.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <20240510095707.6895-1-linux@fw-web.de>
References: <20240510095707.6895-1-linux@fw-web.de>
Message-Id: <171534910744.4114753.13367969845540831259.robh@kernel.org>
Subject: Re: [PATCH v3 0/2] Add Bananapi R3 Mini


On Fri, 10 May 2024 11:57:05 +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add mt7986 based BananaPi R3 Mini SBC.
> 
> changes in v3:
> - fixed unicde parenthesis in commit description of dts patch
> - dropped "dts:" from title of binding patch
> - added AB to binding and RB to dts patch
> 
> changes in v2:
> - dropped patches for unrealated binding fixes which are already fixed in next.
> - add missing node for nand
> - add some information about the board in description
> 
> change dts based on review from angelo+krzysztof
> 
>  - drop fan status
>  - rename phy14 to phy0 and phy15 to phy1
>  - drop default-trigger from phys and so also the binding-patch
>  - use regulator names based on regexp regulator-[0-9]+v[0-9]+
>  - add comment for pwm
> 
> Frank Wunderlich (2):
>   dt-bindings: arm64: mediatek: add BananaPi R3 Mini
>   arm64: dts: mediatek: Add  mt7986 based Bananapi R3 Mini
> 
>  .../devicetree/bindings/arm/mediatek.yaml     |   1 +
>  arch/arm64/boot/dts/mediatek/Makefile         |   1 +
>  .../mediatek/mt7986a-bananapi-bpi-r3-mini.dts | 493 ++++++++++++++++++
>  3 files changed, 495 insertions(+)
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


New warnings running 'make CHECK_DTBS=y mediatek/mt7986a-bananapi-bpi-r3-mini.dtb' for 20240510095707.6895-1-linux@fw-web.de:

arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: crypto@10320000: interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: crypto@10320000: interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#






