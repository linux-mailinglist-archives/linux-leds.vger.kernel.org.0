Return-Path: <linux-leds+bounces-6379-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E51CA5089
	for <lists+linux-leds@lfdr.de>; Thu, 04 Dec 2025 20:00:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC11231936D3
	for <lists+linux-leds@lfdr.de>; Thu,  4 Dec 2025 18:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C51C345CAA;
	Thu,  4 Dec 2025 18:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="micvC0PH"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EC3344050;
	Thu,  4 Dec 2025 18:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764874187; cv=none; b=jys8mw9JZBZ6/iq9skKoHY7NN9XGoZ/Mr8d6FXXm2IvBAxrFzyzpaOvdgZhINy6PfYDahnsY958kyEC08AMFSgnsMeiio/bDyhrYAwOhVyZwCGmkz+9wYseiC9YocnpbIAHciR1qPrkmgSrZxyCbB3Upvq0Ndq5oT4UE60PxX4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764874187; c=relaxed/simple;
	bh=6AiEXx+Vx3in9BLvgOkOE4t47CVyX/TX/0nCAs8EZqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p7ahji6Dg0dtrlXuTRuO4nXuGfn7Ccv77oXEiEY1hMciOHrye12Oo4qn3R5tAi7SezCKbJ29JuHReyXYZmza34l1mHvlRD00Z6Olab3LiBMk9y1OeOEvGJn2RsGDFd+TDxYvZvN7WN65JL2of0GPUM/Kkm2nc1GZvdRXzYlv0T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=micvC0PH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7547DC4CEFB;
	Thu,  4 Dec 2025 18:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764874186;
	bh=6AiEXx+Vx3in9BLvgOkOE4t47CVyX/TX/0nCAs8EZqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=micvC0PH980DdDnGAQilzIbnqgiOy6spHYMbbs03d/51MPGSrmHq9ThIrkswKLpjQ
	 6Lgx0XzJk0FMr0JxajDmKaKIgDhfcWEZRPQVbkKQPGH0kDggTkPkd3lBM/GPnI1FPx
	 oRjEX00HoZXnznqsc5/aStVDPIiYxbcm4LLibDh3LNFBT4FzEQVnm/3WLUsbmF5NIO
	 wGA1Wz4F1d98KI5pHoUWL9tvLoMvGUNtNj1OV6S2j3c8EMuUp99MZAD0UsxxmbEErv
	 R6wBCdZhDTgabPzenuYlpJnlfmOuV2gtz06jvaeuhhQJBROnT0ZASEN9bA0Jsq0Keg
	 aSzyHdihQVZ3w==
Date: Thu, 4 Dec 2025 12:49:44 -0600
From: Rob Herring <robh@kernel.org>
To: Nam Tran <trannamatk@gmail.com>
Cc: lee@kernel.org, gregkh@linuxfoundation.org, pavel@kernel.org,
	rdunlap@infradead.org, christophe.jaillet@wanadoo.fr,
	krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v19 1/3] dt-bindings: leds: add TI/National Semiconductor
 LP5812 LED Driver
Message-ID: <20251204184944.GA1972172-robh@kernel.org>
References: <176451936212.1126615.11381616288774387236.robh@kernel.org>
 <20251203164033.363984-1-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203164033.363984-1-trannamatk@gmail.com>

On Wed, Dec 03, 2025 at 11:40:33PM +0700, Nam Tran wrote:
> On Sun, 30 Nov 2025, Rob Herring (Arm) wrote:
> 
> > On Sun, 30 Nov 2025 22:39:54 +0700, Nam Tran wrote:
> > > The LP5812 is a 4x3 RGB LED driver with an autonomous animation
> > > engine and time-cross-multiplexing (TCM) support for up to 12 LEDs
> > > or 4 RGB LEDs. It supports both analog (256 levels) and PWM (8-bit)
> > > dimming, including exponential PWM for smooth brightness control.
> > > 
> > > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > > Signed-off-by: Nam Tran <trannamatk@gmail.com>
> > > ---
> > >  .../devicetree/bindings/leds/ti,lp5812.yaml   | 246 ++++++++++++++++++
> > >  MAINTAINERS                                   |   6 +
> > >  2 files changed, 252 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5812.yaml
> > > 
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> > Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> > Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> > Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> > Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> > Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> > Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> > Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> > 
> > doc reference errors (make refcheckdocs):
> > 
> > See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251130153956.241375-2-trannamatk@gmail.com
> 
> Accessing the link results in a 404 error on my side, is it expected?

That's patchwork.kernel.org now.


> > The base for the series is generally the latest rc1. A different dependency
> > should be noted in *this* patch.
> > 
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > date:
> > 
> > pip3 install dtschema --upgrade
> > 
> > Please check and re-submit after running the above command yourself. Note
> > that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> > your schema. However, it must be unset to test all examples with your schema.
> 
> The LP5812 binding validates correctly. The errors reported by the bot come
> from the unrelated thermal bindings. Is it normal for the bot to report these
> unrelated errors?

You can ignore the bot report, linux-next broke it over the holidays.

Rob

