Return-Path: <linux-leds+bounces-4709-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DBCAC278B
	for <lists+linux-leds@lfdr.de>; Fri, 23 May 2025 18:25:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD599175937
	for <lists+linux-leds@lfdr.de>; Fri, 23 May 2025 16:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A59C296FA8;
	Fri, 23 May 2025 16:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bkyZzxOz"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E0B296FA0;
	Fri, 23 May 2025 16:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748017499; cv=none; b=k9utD48hW3mR4ZaJW52uf4L13EmN8f5OqIOM13o5Xx9BqwiwqDngxpsIGoZfFS/JGOjHoJBK1f0CV3Qf/zFiWFqJalkaZTh9GQ9FIWBIMHPmPo+pFPM7iuKdwui6qPAklbR+axOiN/ptQDF7ckEHLhrfpJTvJ4BTDQiNB+6o6tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748017499; c=relaxed/simple;
	bh=2iHX86bcccGOrn/j3Ad570mI9WPJYIQ++L9qb0jLXZE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=q4jvoe6d/EZ/OQGRNsscp8+FQAJEDC9OHq+25jG6znXPsjp640KjnB5U8MkNtvz6Gn1TraHFZgV3otiMjiegjLBrDTvoj+lWTk456+sYEZFWkBVDCSLBQ5phxt/4jZH+7tUg7A2X3BiTMsw38espOL3dm1nTzUZZ8VuxBW0JcGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bkyZzxOz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3431AC4CEE9;
	Fri, 23 May 2025 16:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748017498;
	bh=2iHX86bcccGOrn/j3Ad570mI9WPJYIQ++L9qb0jLXZE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=bkyZzxOzSqcc8hMu8gP1JhJpx84kLV9kuHECMnWcStPZ/J1svGA7/2rjpRB67IZCK
	 h+bJe194yFMLudcdtYxWPWlzkcJ9N/Ke+O7Be6V9XGsrejq2/0td36ln7lNlKzk34m
	 HAqohriDfV5nm/tTBX9cQ+7YgG7clZdQVj26DOunhFiDMfZS1Y4z2ejo2FM3MZJ/yA
	 iIUGDQE7h7fwa7g2e4yPYj5we1nA1urej2Fxks98ArCWT1Ofl0TRS6weO+HzIvyyHa
	 PQQon0TatkhZkZT6WwRhbngNAYd+WYq0zks3yKZGCoKhEs4wbEmSdfofsIUzeSdMoL
	 PBHmOyG4NrG/Q==
Date: Fri, 23 May 2025 11:24:56 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-leds@vger.kernel.org, Pavel Machek <pavel@kernel.org>, 
 linux-kernel@vger.kernel.org, Andrew Davis <afd@ti.com>, 
 Conor Dooley <conor+dt@kernel.org>, kernel@axis.com, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, devicetree@vger.kernel.org
To: Johan Adolfsson <johan.adolfsson@axis.com>
In-Reply-To: <20250523-led-fix-v3-2-86d2690d2698@axis.com>
References: <20250523-led-fix-v3-0-86d2690d2698@axis.com>
 <20250523-led-fix-v3-2-86d2690d2698@axis.com>
Message-Id: <174801749606.2187789.2422753786565500556.robh@kernel.org>
Subject: Re: [PATCH RFC v3 2/2] dt-bindings: leds: lp50xx: Document child
 reg, fix example


On Fri, 23 May 2025 17:26:28 +0200, Johan Adolfsson wrote:
> The led child reg node is the index within the bank, document that
> and update the example accordingly.
> 
> Signed-off-by: Johan Adolfsson <johan.adolfsson@axis.com>
> ---
>  .../devicetree/bindings/leds/leds-lp50xx.yaml          | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml: patternProperties:^multi-led@[0-9a-f]$:patternProperties:^led@[0-9a-f]+$:properties:reg: 'minimum' should not be valid under {'enum': ['const', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'minimum', 'maximum', 'multipleOf', 'pattern']}
	hint: Scalar and array keywords cannot be mixed
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml: patternProperties:^multi-led@[0-9a-f]$:patternProperties:^led@[0-9a-f]+$:properties:reg: 'maximum' should not be valid under {'enum': ['const', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'minimum', 'maximum', 'multipleOf', 'pattern']}
	hint: Scalar and array keywords cannot be mixed
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml: patternProperties:^multi-led@[0-9a-f]$:patternProperties:^led@[0-9a-f]+$:properties:reg: 'anyOf' conditional failed, one must be fixed:
	'minimum' is not one of ['maxItems', 'description', 'deprecated']
		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
	'maximum' is not one of ['maxItems', 'description', 'deprecated']
		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
	Additional properties are not allowed ('maximum', 'minimum' were unexpected)
		hint: Arrays must be described with a combination of minItems/maxItems/items
	'maxItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	1 is less than the minimum of 2
		hint: Arrays must be described with a combination of minItems/maxItems/items
	hint: cell array properties must define how many entries and what the entries are when there is more than one entry.
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250523-led-fix-v3-2-86d2690d2698@axis.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


