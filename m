Return-Path: <linux-leds+bounces-4805-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79223ADACF0
	for <lists+linux-leds@lfdr.de>; Mon, 16 Jun 2025 12:05:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78110188825D
	for <lists+linux-leds@lfdr.de>; Mon, 16 Jun 2025 10:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1B92EB5B5;
	Mon, 16 Jun 2025 09:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PvsnX9U4"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9CD2E7F1B;
	Mon, 16 Jun 2025 09:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750067991; cv=none; b=LVxYW4PiOjaM3QeU/iLdFI1LU8rsKQgcO3fg7wC5y2sCduFZCIZl9fY5fi1bJuiuetw90dWoTMxtCk2aJ+sw6rm87cK5KfubIowoIOq2KU75MODaMNIpMBdgR+lVsgdvMFrVK8ck5x+KR2CqGfVuqJwsiKQIFXKb4hQ6Q6btY7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750067991; c=relaxed/simple;
	bh=DHwnW5tWKwgmW1+X3cVu0d99P45MmBzMs9DpMm2Wt5Y=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=CUcJN/vjzRAxMqinn1D1iWm17hPFSoVeHMLRQV+e48L2nMi0yz0SGEuUouxMkCV6VznVs3qL4gfGOE6s+fbsa0XE4bNDW/X5RdmTQCJhnGPakdpykVrOfqd2ZyB6vANkwCBKiXCzgxa6Rh78zIgABH4Gg7bcnAivnrVKwzRoZak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PvsnX9U4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97CDFC4CEEA;
	Mon, 16 Jun 2025 09:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750067991;
	bh=DHwnW5tWKwgmW1+X3cVu0d99P45MmBzMs9DpMm2Wt5Y=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=PvsnX9U4GYzvBesH8XXm2KHkmR6LqFo5OwzydWbMpSu7JzEo/j5nJWoFE3yEG30VB
	 2dgoe7ShIAy9R+5Pa/nTfrXVJZnSFVCmzUGD1DFAEgi4Ez17x7SUTQRoC0eI/kztZJ
	 m0tY9mHwAkgOLVfXdJHCBE268C5f7LuicaH0U3bUieXWHSsuU5RlBn5/BpUvTHNwQN
	 Ki/2SXWXGxT61dlH1foEjDnTcK4d8wFwWxOYPAKv6nqXG1pFBEUAW/dhL/vTJ1bHqf
	 LJhRyBGU1adsQDT+XBlhgfkypwZvacBlQtKEDzYoS+9uYWUAfpEZoOF0yXLIBC+LZ7
	 GYaVo3SH2PwJA==
Date: Mon, 16 Jun 2025 04:59:49 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andrew Davis <afd@ti.com>, Lee Jones <lee@kernel.org>, kernel@axis.com, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pavel Machek <pavel@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Johan Adolfsson <johan.adolfsson@axis.com>
In-Reply-To: <20250616-led-fix-v5-2-f59c740831ab@axis.com>
References: <20250616-led-fix-v5-0-f59c740831ab@axis.com>
 <20250616-led-fix-v5-2-f59c740831ab@axis.com>
Message-Id: <175006798950.3330655.3341024776863428708.robh@kernel.org>
Subject: Re: [PATCH v5 2/2] dt-bindings: leds: lp50xx: Document child reg,
 fix example


On Mon, 16 Jun 2025 09:57:09 +0200, Johan Adolfsson wrote:
> The led child reg node is the index within the bank, document that
> and update the example accordingly.
> 
> Signed-off-by: Johan Adolfsson <johan.adolfsson@axis.com>
> ---
>  .../devicetree/bindings/leds/leds-lp50xx.yaml        | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml: patternProperties:^multi-led@[0-9a-f]$:patternProperties:^led@[0-9a-f]+$:properties:reg: {'maxItems': 1, 'items': [{'minimum': 0, 'maximum': 2}], 'description': 'This property denotes the index within the LED bank. The value will act as the index in the multi_index file to give consistent result independent of devicetree processing order.'} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml: patternProperties:^multi-led@[0-9a-f]$:patternProperties:^led@[0-9a-f]+$:properties:reg: 'anyOf' conditional failed, one must be fixed:
	'items' is not one of ['maxItems', 'description', 'deprecated']
		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
	'maxItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	'items' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	1 is less than the minimum of 2
		hint: Arrays must be described with a combination of minItems/maxItems/items
	hint: cell array properties must define how many entries and what the entries are when there is more than one entry.
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250616-led-fix-v5-2-f59c740831ab@axis.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


