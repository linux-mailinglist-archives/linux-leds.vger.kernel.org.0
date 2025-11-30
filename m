Return-Path: <linux-leds+bounces-6356-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D288DC9523C
	for <lists+linux-leds@lfdr.de>; Sun, 30 Nov 2025 17:16:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F0A854E07E9
	for <lists+linux-leds@lfdr.de>; Sun, 30 Nov 2025 16:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 021152BF3E2;
	Sun, 30 Nov 2025 16:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P8TTRaU/"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EEC2BF019;
	Sun, 30 Nov 2025 16:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764519365; cv=none; b=WgaJS34oCaFq8OiwkZnqO4zIJ0dxhRivh9WgmvYZxKEF+zxXo03fheumLO/o0WsS6oKdHZ2Pd0rZitmp37A7V6DfOs8GmCn3zuuGrGvHZgNXjMhtrBYsbgVzX2ScNhq7WXPDylC+QkSEmsqVbiId8Siv0txZppZstSww++yonXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764519365; c=relaxed/simple;
	bh=tNEI51lwD5i7AGLAJ9lFuUgR9i8hsEUuvGX5Fji3qF0=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Uedl8m8QPtnykAaRlDU5ucKEi5gE6gVb1RuXL/SEvWwMchFa5lHnKeVNrG7/JNrgV3gvuAMqUy27XFtKaz2d9iwmZa+GfHRPhLnJ8dd+wqkd5+DTtcZCy80oQgdCdyvETJDzTdyX2D8AQ6umlKJ1lPOL4R70ggV8f/ten0aqZQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P8TTRaU/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20919C4CEFB;
	Sun, 30 Nov 2025 16:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764519365;
	bh=tNEI51lwD5i7AGLAJ9lFuUgR9i8hsEUuvGX5Fji3qF0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=P8TTRaU/8R/Y6ssLEVz0sBWXhVJkRCfmB8DMGdIjBrfIYxT5J+9nkP5RchnL5Rv7F
	 km4PycMc4m1ISUT4xX5m5e29dYmQRfWFQAkxV/MYBHOCwFO6zUjUkyUaNCiAR8qKOI
	 283Qo44U7wACfhxRjh+FxAUP5E7ZfW211SI9hrXoRLJKxZ5MwhKf4bWcDc5tsaATr2
	 lJ/Lw05JqAnTOQaddPFP1F8v+KkHNUGrjk5r9NsOKYynz3qG5l3GMhpqXzAAOzsf+P
	 0u48ymS/T5n3nb3hFbljdO/061KclXjeA1YpbBeA0lGePh/1hQN0J+iIBPs9+8f7ZN
	 U4fWQJ323EpYg==
Date: Sun, 30 Nov 2025 10:16:04 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-leds@vger.kernel.org, christophe.jaillet@wanadoo.fr, 
 lee@kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org, pavel@kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 gregkh@linuxfoundation.org, conor+dt@kernel.org, krzk+dt@kernel.org, 
 rdunlap@infradead.org
To: Nam Tran <trannamatk@gmail.com>
In-Reply-To: <20251130153956.241375-2-trannamatk@gmail.com>
References: <20251130153956.241375-1-trannamatk@gmail.com>
 <20251130153956.241375-2-trannamatk@gmail.com>
Message-Id: <176451936212.1126615.11381616288774387236.robh@kernel.org>
Subject: Re: [PATCH v19 1/3] dt-bindings: leds: add TI/National
 Semiconductor LP5812 LED Driver


On Sun, 30 Nov 2025 22:39:54 +0700, Nam Tran wrote:
> The LP5812 is a 4x3 RGB LED driver with an autonomous animation
> engine and time-cross-multiplexing (TCM) support for up to 12 LEDs
> or 4 RGB LEDs. It supports both analog (256 levels) and PWM (8-bit)
> dimming, including exponential PWM for smooth brightness control.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Nam Tran <trannamatk@gmail.com>
> ---
>  .../devicetree/bindings/leds/ti,lp5812.yaml   | 246 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 252 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5812.yaml
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251130153956.241375-2-trannamatk@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


