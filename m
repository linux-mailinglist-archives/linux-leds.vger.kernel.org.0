Return-Path: <linux-leds+bounces-6351-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED2EC93014
	for <lists+linux-leds@lfdr.de>; Fri, 28 Nov 2025 20:20:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EB213A87AE
	for <lists+linux-leds@lfdr.de>; Fri, 28 Nov 2025 19:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD90285419;
	Fri, 28 Nov 2025 19:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZmeTvPuV"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDE22080C8;
	Fri, 28 Nov 2025 19:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764357600; cv=none; b=hr4cfBJuDv5LE28I6+1DUMh+8cxUX//iO+8OVD5fV42XF3G30qAA+UW7s3UpSFrrowWTiG4vMqpo3LGk7E/f4SGlSgPKTCck/LtC3JAcEnJW6ukk61XVY+kfMr9nvEWnmS+4ZPUxzFDxi+Tr27dXrQKAZeSZ++V/Ya1geaFRRzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764357600; c=relaxed/simple;
	bh=dTkANfMGELC3lBBkiGRU6SrZpu6EpsHNDVpjSuigasA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=MQeuk1pnnFhVkf8O8lx+xZ7i7Qeimq9Bpu6O04j5mEIoRxzkxHGMWro0RGppIyp9H3jae49dWtMSkSQCqewZ1mrG0PPItwyhR5GJxm6StldYhz8C0H552D+n87jVgB0SWlM1j1x+vC1Uhj19Y5YzKBdfO5d7Q3JAnij+O6VjOYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZmeTvPuV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A805C4CEF1;
	Fri, 28 Nov 2025 19:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764357598;
	bh=dTkANfMGELC3lBBkiGRU6SrZpu6EpsHNDVpjSuigasA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ZmeTvPuVnLVm4XEV+kHaxbPTKdnnxpr7CHeNoShPX576G5V6U0T5V7IlLnbjo2Gte
	 5kMdywSvxQbx79gbtmdeauCKDAxgy0lLN/gUeS6rvqtHQqJ1xwJvVKrbBOtKb2mflY
	 nrvfWFixcSq/c5cHQnBPg8vg80ft9BEQVgC9F3h4cFnab5Yha7H3JbBcw73o2t0+YB
	 1lO0Oaku6CwKVGonf9IFez9Gqq2Yhm2H+RSQ9NHSIs+eM6TbrN767vRjI8nUCJ7jfR
	 FbsDiLOslXmlczOko3GACiJmuFk9yw+5Jrftwisvm/hH9bvNFumUOceb9t3fXYW/5A
	 syWynqU6ZWYZw==
Date: Fri, 28 Nov 2025 13:19:56 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
 krzk+dt@kernel.org, linux-kernel@vger.kernel.org, pavel@kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-leds@vger.kernel.org
To: Lukas Timmermann <linux@timmermann.space>
In-Reply-To: <20251128175827.649481-2-linux@timmermann.space>
References: <20251128175827.649481-1-linux@timmermann.space>
 <20251128175827.649481-2-linux@timmermann.space>
Message-Id: <176435759680.2396163.4980372483978246141.robh@kernel.org>
Subject: Re: [PATCH v12 1/2] dt-bindings: leds: Add new as3668 support


On Fri, 28 Nov 2025 18:58:26 +0100, Lukas Timmermann wrote:
> The bindings are incomplete, as the GPIO/Audio Input pin
> is still undocumented. The hardware used for testing this patch series
> does not allow modification, so the mentioned pin has been omitted.
> 
> Signed-off-by: Lukas Timmermann <linux@timmermann.space>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/leds/ams,as3668.yaml  | 74 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++
>  2 files changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/ams,as3668.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251128175827.649481-2-linux@timmermann.space

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


