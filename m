Return-Path: <linux-leds+bounces-4896-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9157EAEB2F7
	for <lists+linux-leds@lfdr.de>; Fri, 27 Jun 2025 11:32:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2727189F163
	for <lists+linux-leds@lfdr.de>; Fri, 27 Jun 2025 09:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFB25298277;
	Fri, 27 Jun 2025 09:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nqf9iZNK"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E2C298249;
	Fri, 27 Jun 2025 09:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751016673; cv=none; b=WflkjUdIupQekIbZ995lSHOCtv//f95hexuFCq5WPfyAe95ogoXS4RAw/6Opbtrx4FN9JLcL0LxptuL3XvTJ16IHqKEf2SuWZf/0G8Fgp4wc2H1Wu0qBn8H1YhbVKPBH0QIQL0Bg1YuSrPiINlr02t+OAqspO2Z7qMLKvPmpmmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751016673; c=relaxed/simple;
	bh=PfLvLuu3VqBR8of5r4wurKyduxqxtC+tsoMskrI7zzU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=O+tL2HNaEZ6u3gEu3Aai/HIqIzFsbIJrxh6sIni9FRG/AgUPoWDsi6HIuwvQvAMgA7Iyt9Rc4vq25gKt7yfw52APitbCeV4cXwd6efO8amE8ulBbQNLJM6nOuYjQHKIDRllviShnrKRfQc3Wyi6hacM3Ffst3VaP5b3I3Z5FNIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nqf9iZNK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 177BBC4CEE3;
	Fri, 27 Jun 2025 09:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751016673;
	bh=PfLvLuu3VqBR8of5r4wurKyduxqxtC+tsoMskrI7zzU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=nqf9iZNKeurHEpBJ8I5dLQUSCiQCfdApL+fh0X80KJK6cdKMXJKXccwoUbwOjz3M+
	 f5EwllrcdrMU1NZ7NHMz3j7VGWBwebCwKbuyVUN7wri9vOfo49ymroy97DWFN0z1+5
	 DGAZrG/ID0Z9FmW7gDLwbkcZ8yZpLprTm5oUy9+oH7fR3AZcIf5Oj0wO8fWqXAHqZ/
	 R5/t3R1e2Wg0UbvTUjtifqg3v7mzYA17Yc52aKSzfeOmN+TQjSGJUBZ4Sef8TheX+v
	 MgV4mjJo67GrmGjCnfWBt9pK/dyG2qjqja706gQT/lA2MsVzNISTgoOl9GuV0gRcqk
	 TuuE0RhJmeBVQ==
Date: Fri, 27 Jun 2025 04:31:12 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-leds@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Vincent Knecht <vincent.knecht@mailoo.org>, Lee Jones <lee@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, linux-kernel@vger.kernel.org, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 imx@lists.linux.dev, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Li Jun <jun.li@nxp.com>, Fabio Estevam <festevam@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250627-dt-bindings-db-v1-2-d5c7072acbee@linaro.org>
References: <20250627-dt-bindings-db-v1-0-d5c7072acbee@linaro.org>
 <20250627-dt-bindings-db-v1-2-d5c7072acbee@linaro.org>
Message-Id: <175101667122.2392436.17662976986893381131.robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: phy: fsl,imx8mq-usb: Drop 'db' suffix
 duplicating dtschema


On Fri, 27 Jun 2025 10:01:52 +0200, Krzysztof Kozlowski wrote:
> A common property unit suffix '-db' was added to dtschema, thus
> in-kernel bindings should not reference the type.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> RFC because this depends on dtschema changes and should be accepted
> after new dtschema is released with this merged:
> https://github.com/devicetree-org/dt-schema/pull/166
> ---
>  Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml: fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: missing type definition

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250627-dt-bindings-db-v1-2-d5c7072acbee@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


