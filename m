Return-Path: <linux-leds+bounces-5245-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D56B2C3A6
	for <lists+linux-leds@lfdr.de>; Tue, 19 Aug 2025 14:33:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E7467B7019
	for <lists+linux-leds@lfdr.de>; Tue, 19 Aug 2025 12:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EB7D334719;
	Tue, 19 Aug 2025 12:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KUV1pM+P"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4A832C300;
	Tue, 19 Aug 2025 12:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755606750; cv=none; b=nwWYzairyDEpzpQ0G/GJbR2IhBfkHM0dO8Ua6kUE+hW+L1edmh8i1mNnyztCGyL74Uq2+fHcqO+sPNg+h0fARjrCfTuwEI9sk4bZ0kuND60/tHwUAMcDMZdfx+S7m5dyogbNh7UsIsE4ziatEKlMYQXl1TGy4RZW2lWe7TclSOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755606750; c=relaxed/simple;
	bh=wjs09Gdigf2R0IE1uLQxql5R4PimNeWNLQzbngasLiU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=SWn33NghYdyS1llPyrEkO94Jo3R3HBVdbzm24cwJH0EYM56vhe8B1SPWli7H40a8hvmeF1BVP4zUeDSaxLaJwoqzNMLmiNVUKvHWQHS0ZV1BDI4YYl9OmesYzy5dUTD3l/nr2mfcYpw/B+GbpXVwH8G/0eRNicapCgjz2ihx2rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KUV1pM+P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9002C116C6;
	Tue, 19 Aug 2025 12:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755606750;
	bh=wjs09Gdigf2R0IE1uLQxql5R4PimNeWNLQzbngasLiU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=KUV1pM+PSUrbgiuC2qfRrjBmoh/K7SwKUZPEG9Sx43lERH2mIAhJXE43x+YxV+SGd
	 BdtNUMqKKJlINMh6dccC0ScwziqT9emXyV3D+9wnX46JUt0c61L45wM8zOfFf0CUsy
	 97atbCKu7MfQ/4A3q50GqnxaNp6SbtNu00FjCioMQHjnpu///w0Wgu48LG7iKegR3U
	 RtPibAw8lDKnpEhhsGpLfj9WdTX0+K7FHZIU0mYidnxYnEIqCUDkH/n/cMTfLHPWT7
	 IhwS1l80k7T0xpDkP4EHbmRjQGlOAcqofRTPzapIJnpKAwBV6uY2JPtc91+jz2rP06
	 rz76yHEIf9sUQ==
Date: Tue, 19 Aug 2025 07:32:29 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org, 
 Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Daniel Thompson <danielt@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org, 
 linux-leds@vger.kernel.org, Helge Deller <deller@gmx.de>
To: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <20250819-max25014-v2-1-5fd7aeb141ea@gocontroll.com>
References: <20250819-max25014-v2-0-5fd7aeb141ea@gocontroll.com>
 <20250819-max25014-v2-1-5fd7aeb141ea@gocontroll.com>
Message-Id: <175560674579.26233.12902824583404207699.robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: backlight: Add max25014 bindings


On Tue, 19 Aug 2025 12:58:59 +0200, Maud Spierings wrote:
> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> with intgrated boost controller.
> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>  .../bindings/leds/backlight/maxim,max25014.yaml    | 79 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 84 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250819-max25014-v2-1-5fd7aeb141ea@gocontroll.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


