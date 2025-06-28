Return-Path: <linux-leds+bounces-4917-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D60AEC990
	for <lists+linux-leds@lfdr.de>; Sat, 28 Jun 2025 19:55:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E5793BF98E
	for <lists+linux-leds@lfdr.de>; Sat, 28 Jun 2025 17:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E604C25E46F;
	Sat, 28 Jun 2025 17:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ps//O5MJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7ED6242938;
	Sat, 28 Jun 2025 17:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751133302; cv=none; b=QKalZ/a+9prlfO9TN+QOG5/A0POcGpsis0v+T6Lh2FnuUBQ3AzkG+3UAongSeGNHhHnXNkZbweE1lCy3djIPkMINntPB0qHfS6ezvU4SegsedqsVg4WllGL9dvEWabOluIm1u0GRZj38RaYhV6seLb0dIYcXi5KUOQZe/YDgh4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751133302; c=relaxed/simple;
	bh=uVmSuEBFBJrJu1bKVDSNCMVGFTihFKNa5w9hNDGISAI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Qr1bItJusNh9N2eZWEm/pA5LbEQUezElX4FCTV4ohxJivG3icAJ/k/MYHPCBWMBBAUkbPouBpM1Ogh1LLjNziGyA+Nnpx4YXhYr9iZ76NdZVD3+RKDVrN2AiJnSvXcpF284/dOfFmdj7b2x2Hn+9xH5ra+kDcWLQ1lOedGIKwbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ps//O5MJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38540C4CEEA;
	Sat, 28 Jun 2025 17:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751133302;
	bh=uVmSuEBFBJrJu1bKVDSNCMVGFTihFKNa5w9hNDGISAI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Ps//O5MJ6YNtiYhDVZIqPHWZPGnwKZqGrNN6gS1gdZqdW9uAhAV3bPvuyTcfdCUgm
	 RPIrL2n4f3+Mxt1hSgFFgrWDtbIJQBk+rKRJg6Xu0/cwpjCxoXL4fcnWkiZmEvgKkR
	 0aTyjUvv+gCzDhnywTYo5NM1wdyXoC2vM1YJ4IWLYXL9nhbdKxASBFTpycfEGf61hc
	 6e7c4uHI6Z67Bz45utuzV11NeQ4bor/fRC4zQhZRNZfbjQnsDeaP5+AtRJjsLLFHxT
	 H2NBx9zog40XXc4w9KxcyB/F61GDRYY1r0W+R0g2jKg7R4YUF+AWUjDNqouqftMlml
	 8Nvon3qCOuqXg==
Date: Sat, 28 Jun 2025 12:55:01 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Boris Gjenero <boris.gjenero@gmail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>, linux-leds@vger.kernel.org, 
 Christian Hewitt <christianshewitt@gmail.com>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Paolo Sabatino <paolo.sabatino@gmail.com>, devicetree@vger.kernel.org, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Conor Dooley <conor+dt@kernel.org>
To: =?utf-8?q?Jean-Fran=C3=A7ois_Lessard?= <jefflessard3@gmail.com>
In-Reply-To: <20250628161850.38865-7-jefflessard3@gmail.com>
References: <20250628161850.38865-1-jefflessard3@gmail.com>
 <20250628161850.38865-7-jefflessard3@gmail.com>
Message-Id: <175113330138.2294536.6016522770274673220.robh@kernel.org>
Subject: Re: [PATCH 6/8] dt-bindings: auxdisplay: add Titan Micro
 Electronics TM16XX


On Sat, 28 Jun 2025 12:18:43 -0400, Jean-François Lessard wrote:
> Add documentation for TM16XX and compatible LED display controllers.
> 
> This patch is inspired by previous work from Andreas Färber and Heiner Kallweit.
> 
> Co-developed-by: Andreas Färber <afaerber@suse.de>
> Co-developed-by: Heiner Kallweit <hkallweit1@gmail.com>
> Signed-off-by: Jean-François Lessard <jefflessard3@gmail.com>
> ---
>  .../bindings/auxdisplay/tm16xx.yaml           | 153 ++++++++++++++++++
>  1 file changed, 153 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/auxdisplay/tm16xx.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/auxdisplay/tm16xx.example.dts:59.29-83.11: ERROR (duplicate_label): /example-1/spi: Duplicate label 'display_client' on /example-1/spi and /example-0/i2c
ERROR: Input tree has errors, aborting (use -f to force output)
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/auxdisplay/tm16xx.example.dtb] Error 2
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1519: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250628161850.38865-7-jefflessard3@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


