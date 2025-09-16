Return-Path: <linux-leds+bounces-5517-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76655B5978A
	for <lists+linux-leds@lfdr.de>; Tue, 16 Sep 2025 15:25:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 288021BC6392
	for <lists+linux-leds@lfdr.de>; Tue, 16 Sep 2025 13:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D29EA315D2C;
	Tue, 16 Sep 2025 13:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oz2kAG5V"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A855C314A62;
	Tue, 16 Sep 2025 13:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758029117; cv=none; b=UxOSK1C2EzQEjdOaN4a61Sc9YZRmhJ7qvCU0Sg5MSEWY20pa1HJA8uXaFLZZy4gqz3Op11gAJAjiOoUfpP/sEkLnnU8QOptx7PPrqYnMl6pk+9YvBEFLBbYn0rWuzkFreFvXeog5CCiZBIQaU0iZT7tM9zSua94TxRMoL2MHi1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758029117; c=relaxed/simple;
	bh=stqsNDi0MRmRsGuVrx4YIZiZv4PKdOen65Yeo1HfsEg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=AwsS9LSVbwwfH3n/WHpv4ZiVLieuadeUFcxEqnzm0UVdQKtylQw4R4X5gCybEg+z7s5fcQpSrLv1X1JbwS+1eBy154GKp3joPyCSZ7Y/NY2Xhg5hwtjmyokb9Y7PnYI89VJAyVV6pWMZ69k6VcQtKtNqXly50ywwL1jA8UJASxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oz2kAG5V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09815C4AF0B;
	Tue, 16 Sep 2025 13:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758029117;
	bh=stqsNDi0MRmRsGuVrx4YIZiZv4PKdOen65Yeo1HfsEg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Oz2kAG5VEW1Kt/uhKXZqkiiF2PDUyogatKvB9PyUaKmfN9gV7VVUDJsygv0pSvJWO
	 uWJEqEwR5S7Z7bQ50qHK29B4UMp+eP9KhB+FpYJf4knNTEYmELEsEoxtUH8s8iExz0
	 +Dx2ZgtX9CkOj+8PgHfGEyQmIamf+zC8e9dOM6T53NOCaa/Nr+mLcGm5AIxx7Hm4We
	 qY9npojjHnFcVY0kjxe1c5c22KOLAXsJbsbPwhykRX3WTjyvcryUtLWIwpt2uNm3ri
	 ry0XEtzYxA0PEwEzoVit3O9SuTURP4t7m+4FiHszGLcb8ZgUN8+wbq5MjGsembJAAh
	 xXNzsJ/xg1zqQ==
Date: Tue, 16 Sep 2025 08:25:16 -0500
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
 Radoslav Tsvetkov <rtsvetkov@gradotech.eu>, devicetree@vger.kernel.org, 
 Jonathan Brophy <professor_jonny@hotmail.com>, linux-leds@vger.kernel.org, 
 Pavel Machek <pavel@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, lee Jones <lee@kernel.org>
To: Jonathan Brophy <professorjonny98@gmail.com>
In-Reply-To: <20250916110217.45894-3-professorjonny98@gmail.com>
References: <20250916110217.45894-1-professorjonny98@gmail.com>
 <20250916110217.45894-3-professorjonny98@gmail.com>
Message-Id: <175802889901.3636371.13778327614351953763.robh@kernel.org>
Subject: Re: [PATCH 3/5] dt-bindings: leds: Add YAML bindings for Virtual
 Color LED Group driver


On Tue, 16 Sep 2025 23:02:15 +1200, Jonathan Brophy wrote:
> From: Jonathan Brophy <professor_jonny@hotmail.com>
> 
> Document Virtual Color device tree bindings.
> 
> Co-developed-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
> Signed-off-by: Jonathan Brophy <professor_jonny@hotmail.com>
> ---
>  .../leds/leds-group-virtualcolor.yaml         | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml:5:6: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml:6:10: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml:79:7: [error] no new line character at the end of file (new-line-at-end-of-file)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml: monochromatic-leds: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml: patternProperties:^led@[0-9a-f]$:properties:monochromatic-leds:items:maxItems: False schema does not allow 1
	hint: Scalar properties should not have array keywords
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml: patternProperties:^led@[0-9a-f]$:properties:monochromatic-leds:type: 'array' is not one of ['boolean', 'object']
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml:
	Error in referenced schema matching $id: http://devicetree.org/schemas/leds/leds.yaml
	Tried these paths (check schema $id if path is wrong):
	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/leds.yaml
	/usr/local/lib/python3.13/dist-packages/dtschema/schemas/leds/leds.yaml

/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.example.dtb: leds (leds-group-virtualcolor): '#address-cells', '#size-cells' do not match any of the regexes: '^led@[0-9a-f]$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/leds/leds-group-virtualcolor.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.example.dtb: leds (leds-group-virtualcolor): {'compatible': ['leds-group-virtualcolor'], '#address-cells': 1, '#size-cells': 0, 'led@0': {'reg': [[0]], 'label': ['status:red'], 'monochromatic-leds': [4294967295], 'priority': 2, 'blink-delay-on': 500, 'blink-delay-off': 500}, 'led@1': {'reg': [[1]], 'label': ['status:green'], 'monochromatic-leds': [4294967295], 'priority': 1}, '$nodename': ['leds']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/leds/leds.yaml#"}
	from schema $id: http://devicetree.org/schemas/leds/leds-group-virtualcolor.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.example.dtb: leds (leds-group-virtualcolor): led@0: {'reg': [[0]], 'label': ['status:red'], 'monochromatic-leds': [4294967295], 'priority': 2, 'blink-delay-on': 500, 'blink-delay-off': 500} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/leds/leds.yaml#"}
	from schema $id: http://devicetree.org/schemas/leds/leds-group-virtualcolor.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.example.dtb: leds (leds-group-virtualcolor): led@0:monochromatic-leds:0: 4294967295 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/leds/leds-group-virtualcolor.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.example.dtb: leds (leds-group-virtualcolor): led@1: {'reg': [[1]], 'label': ['status:green'], 'monochromatic-leds': [4294967295], 'priority': 1} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/leds/leds.yaml#"}
	from schema $id: http://devicetree.org/schemas/leds/leds-group-virtualcolor.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.example.dtb: leds (leds-group-virtualcolor): led@1:monochromatic-leds:0: 4294967295 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/leds/leds-group-virtualcolor.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250916110217.45894-3-professorjonny98@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


