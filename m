Return-Path: <linux-leds+bounces-5786-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC52BDAA05
	for <lists+linux-leds@lfdr.de>; Tue, 14 Oct 2025 18:35:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D1B54354F03
	for <lists+linux-leds@lfdr.de>; Tue, 14 Oct 2025 16:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C02FA30100E;
	Tue, 14 Oct 2025 16:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SDyjImDT"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933BF28C5D9;
	Tue, 14 Oct 2025 16:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760459716; cv=none; b=dJuvRXqLLFzPb9WNlMX/sz2g7bvc5m6ewXVRLgDfvAM5HCkTgHrXayP0oXARFuYCIe/Pszt61sm3madkR3f0ry9YsyMpuu6ssY0/Y66nqnCWAulG6e7EJhSfkBX9zMIiiZj71ImloaHBmtsZ0WDAIns9lQzwVsfcwxdEJO4iOew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760459716; c=relaxed/simple;
	bh=zlam+9c3aClbXAqtN9ctFoL1G6kJAWZf95a413iRBtI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=AQ6UD70Y/ZsA8GlraoC9yd9abxb5l23MAGw+PSAGLfTdg/mOGImf5sjYvdciXkklvwH5qZ1hd7a521vyCt05D65hqGbzN468+LyJnlWsbpCTNndof9tEYNpYb09dyLWDP8BroyVbDivngePTE6lkkikOxgmEzy3pi7jUVAzLBNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SDyjImDT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3D8BC4CEE7;
	Tue, 14 Oct 2025 16:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760459716;
	bh=zlam+9c3aClbXAqtN9ctFoL1G6kJAWZf95a413iRBtI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=SDyjImDTuj7NXdKzJJpciKnXstAOt1vE7gwkxVzHhffWnm3yE74xaRMO0PR+LQY6Y
	 uFvSz9T+ITtKAoaLzBj+vSS2GOoV1oUVDAwMAIRDFlPWOmjZX6L+8gmFarqofXHyfJ
	 kXnyrjy6EpC4y6rq1pnZiwE//27jURm/v+ukr0OinBteHkLwJgq4XQgJdGHVnz/ZgG
	 c8qoyHkeLuBsHID8/+i1ssjrhybk7yDCInMfsqFo1/VCJ4XQDraLdBbJL3FhXalHvk
	 VHTmW0JU8pR1Dr7gHU9YHSAA+k623PE2/caUzd4q7BclL8Oc1JoqrgRPgH6vm+QXDj
	 CZsX0rjAwEBNA==
Date: Tue, 14 Oct 2025 11:35:14 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
 Jonathan Brophy <professor_jonny@hotmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Radoslav Tsvetkov <rtsvetkov@gradotech.eu>, lee Jones <lee@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org
To: Jonathan Brophy <professorjonny98@gmail.com>
In-Reply-To: <20251013120955.227572-2-professorjonny98@gmail.com>
References: <20251013120955.227572-1-professorjonny98@gmail.com>
 <20251013120955.227572-2-professorjonny98@gmail.com>
Message-Id: <176045970322.4162030.1944332704990379178.robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: leds: Add YAML bindings for
 Virtual Color LED Group driver


On Tue, 14 Oct 2025 01:09:45 +1300, Jonathan Brophy wrote:
> From: Jonathan Brophy <professor_jonny@hotmail.com>
> 
> Document Virtual Color device tree bindings.
> 
> Co-developed-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
> Signed-off-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
> Signed-off-by: Jonathan Brophy <professor_jonny@hotmail.com>
> ---
>  .../leds/leds-group-virtualcolor.yaml         | 100 ++++++++++++++++++
>  1 file changed, 100 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml: patternProperties:^led@[0-9a-f]$:properties:blink-delay-off: 'anyOf' conditional failed, one must be fixed:
	'note' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
Lexical error: Documentation/devicetree/bindings/leds/leds-group-virtualcolor.example.dts:25.28-55 Unexpected 'LED_FUNCTION_VIRTUAL_STATUS'
Error: Documentation/devicetree/bindings/leds/leds-group-virtualcolor.example.dts:25.28-55 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:132: Documentation/devicetree/bindings/leds/leds-group-virtualcolor.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1525: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251013120955.227572-2-professorjonny98@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


