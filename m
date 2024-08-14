Return-Path: <linux-leds+bounces-2438-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBDE9522C5
	for <lists+linux-leds@lfdr.de>; Wed, 14 Aug 2024 21:45:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 046522838E3
	for <lists+linux-leds@lfdr.de>; Wed, 14 Aug 2024 19:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15EED1BF311;
	Wed, 14 Aug 2024 19:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uu14FtmD"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D489C1BF301;
	Wed, 14 Aug 2024 19:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723664747; cv=none; b=BltWHI1xKQ/KujaLgSZ7gmVFbErmmmayF/fXKZfm1SgYHj9x8ByLMDLZxiJH1tTVEdnTxhrk3N0sV7AHGT3D8HuBn18kxPKXs7o/kSWKilu0icJ7/qeS6NR9TLc2zVGSbV899+Jt7MbgoPFhtu2rRDpaHURhQBy2e5lieWLEXEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723664747; c=relaxed/simple;
	bh=PjoGOteprY83X7rgDhoQT5uGKeal0EWWvDRj7w9jbUw=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=C3UYWHMKKxFeAiOye8/7NGb+DXC5oCwMLZw+NtAM+xlwRW3ITqM0t0aIcvfTqkndRa+U8T6BxmI5CuXGn4DtmHiXIrBl/aM6qf2NShqTceG8VJpn78wag5YSvbt1MLp2kl1mxYmOT8mBT7kPaAFebtxueE3D3ocTlBngtOsh5ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uu14FtmD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B864C116B1;
	Wed, 14 Aug 2024 19:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723664746;
	bh=PjoGOteprY83X7rgDhoQT5uGKeal0EWWvDRj7w9jbUw=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Uu14FtmDwGz/ArsK7bLA2f2ehbuK0fFwyYhF6weIinIP7spPmBiXkm8j+BYOto4+v
	 rrFvMmKKIdCwj4TtYOZ44ldPG4MWGXTgQIuyhwFsUQfL1+SMMJMprsQ6O81jlk1ltC
	 0rrx2Wq+iA8xrg8fm6b59zazaMsOHTbIduGXrzFxWsekXQPPrJXjHXfekVcTrzBrls
	 gv6XzOrm0pCya/T60mNYDZgssGxSa2QtwraY7nMALixjO4EhQE7rAsouzKoRX4bFaC
	 kGpcNls2ONhBbRbeeMXHjzAzLCUESkL83VGDx2R9vBRAZk4NNK5wN8Y7QLdQL4vO3N
	 Bb72zaeH2V5WA==
Date: Wed, 14 Aug 2024 13:45:45 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-leds@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev
In-Reply-To: <20240814175748.4028351-1-Frank.Li@nxp.com>
References: <20240814175748.4028351-1-Frank.Li@nxp.com>
Message-Id: <172366474532.3823277.4154762816777506927.robh@kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: leds: convert leds-lm3692x to yaml
 format


On Wed, 14 Aug 2024 13:57:47 -0400, Frank Li wrote:
> Convert binding doc leds-lm3592x to yaml format.
> Additional change
> - Add ref to common.yaml for child node
> - Add i2c node at example
> 
> Fix below warning:
> arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dtb: /soc@0/bus@30800000/i2c@30a40000/backlight@36:
> 	failed to match any schema with compatible: ['ti,lm36922']
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/leds/leds-lm3692x.txt |  65 ------------
>  .../devicetree/bindings/leds/ti.lm36922.yaml  | 100 ++++++++++++++++++
>  2 files changed, 100 insertions(+), 65 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/leds/leds-lm3692x.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/ti.lm36922.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/leds/ti.lm36922.example.dtb: /example-0/i2c/led-controller@36: failed to match any schema with compatible: ['ti,lm3692x']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240814175748.4028351-1-Frank.Li@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


