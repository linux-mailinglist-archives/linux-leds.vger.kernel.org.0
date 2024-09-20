Return-Path: <linux-leds+bounces-2791-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A814997DAC8
	for <lists+linux-leds@lfdr.de>; Sat, 21 Sep 2024 01:25:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B5334B21F66
	for <lists+linux-leds@lfdr.de>; Fri, 20 Sep 2024 23:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 858FE186E4B;
	Fri, 20 Sep 2024 23:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m0RlxiI3"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDF52E634;
	Fri, 20 Sep 2024 23:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726874748; cv=none; b=p76jhkDPUsgnjEtRnjxcRokXsFnnwr4RNXFKmVownNU/YTJw6M7+dl1Ti90WBSnzTA2Qw3wrRQZVbl9UPg5Eu2PyKggaciBuqiWHJPj0iW4MJ5wtK5AIUkri4foANDy6qXuFqWJSbOnD94lhJsLxhRxopa5q/JxR4lA+DWi9a+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726874748; c=relaxed/simple;
	bh=bHKyq9dkPcY3kuSY5//VKVV/vHEafG1whJMO43gGmA0=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=ZhoCaHTNL4CVyWqLPkkYi5iPXZTqSsrV0CnhRWXF1Fl4ZLk/LdtHC3qZmFj25KTSHgcEQvwTqiZpqqDPenWo73IO0ucsUDW2Ap/lgVq9/vQpqxR+tVJJvhB0Dv1GJ3jpu79XcjE9aPyxdXCQxfAb/hbJcH6CdXCW9pyRggUwYX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m0RlxiI3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0B71C4CEC3;
	Fri, 20 Sep 2024 23:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726874747;
	bh=bHKyq9dkPcY3kuSY5//VKVV/vHEafG1whJMO43gGmA0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=m0RlxiI3y6bPkkb/QilR6Qvx1hj1XlrL4rbmSCl2h9fHhjectLdPs4LIOOLkEOwgZ
	 LkbpNHb5U5Jko7FDO/WLtZ3HEYtjkJcRJOFwMgVEPAooG2ARr1tVA8tsNTGeWBiiyl
	 NIVSDKA5Kvhb49W0+xFFwI86JNvgty9s4tSJppZqc9DF6VEp3XnJbjMFdT6r465SZg
	 nZNnymWKQsXQ4oiem7J0NFE7pVyS1wsUei4mwBuO25/0GsO86r+H9Y0h9HoX8iF18+
	 IrlNpc/XgNdI5sOiD+vd/o6zHXzRv9u71sVCt5EFPcB6f4qyjK0deWdG4FQmJkKPjx
	 3MV0eZSIjaytg==
Date: Fri, 20 Sep 2024 18:25:47 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 William Zhang <william.zhang@broadcom.com>, linux-leds@vger.kernel.org, 
 Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Pavel Machek <pavel@ucw.cz>, Kursad Oney <kursad.oney@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>
In-Reply-To: <20240920-bcm63138-leds-v1-1-c150871324a0@linaro.org>
References: <20240920-bcm63138-leds-v1-0-c150871324a0@linaro.org>
 <20240920-bcm63138-leds-v1-1-c150871324a0@linaro.org>
Message-Id: <172687474699.76800.9000778662895195623.robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: leds: bcm63128: Add shift register
 bits


On Fri, 20 Sep 2024 23:59:03 +0200, Linus Walleij wrote:
> The BCM63138 family of serial LED controllers has a register
> where we can set up bits for the shift registers. These are
> the number of rounds the bits need to be shifted before all
> bits have been shifted through the external shift registers.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  Documentation/devicetree/bindings/leds/leds-bcm63138.yaml | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/leds-bcm63138.yaml: properties:brcm,serial-shift-bits: '$ref' should not be valid under {'const': '$ref'}
	hint: Standard unit suffix properties don't need a type $ref
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/leds-bcm63138.example.dtb: leds@ff800800: brcm,serial-shift-bits: 16 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/leds/leds-bcm63138.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/leds-bcm63138.example.dtb: leds@ff800800: brcm,serial-shift-bits: 16 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/property-units.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240920-bcm63138-leds-v1-1-c150871324a0@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


