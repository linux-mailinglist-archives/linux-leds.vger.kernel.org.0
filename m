Return-Path: <linux-leds+bounces-5088-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36895B09206
	for <lists+linux-leds@lfdr.de>; Thu, 17 Jul 2025 18:41:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85200563AB9
	for <lists+linux-leds@lfdr.de>; Thu, 17 Jul 2025 16:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B15DD2F948A;
	Thu, 17 Jul 2025 16:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tDQ0D4yV"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84469145348;
	Thu, 17 Jul 2025 16:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752770456; cv=none; b=UKpC4LPsZeWZik+0RUxa7m/b1JLXj9mXUToGXzS5DV+F0mfKxy/AnrZVksQtDCvkrcmpw9F+BKXBkQ829KSD9LVIOYodESORHVLDsDfjEq5pjuAOr9M53fNkq6/DyhpeM+wA7o0Q36X0OITSwQojZVcthekl10snQLzzQgNH1xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752770456; c=relaxed/simple;
	bh=ByddQ4ljqeLh42/kuXmBPmD/rtrLWHzLSHkW5sCBl/c=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Ms50eMWJbqibuDxab1FLDXzVsnbZziUajEGVywpNS2Jg+WO4IOk/WE1GmgDhg+pC6BhPLSMRcApbUIkG8kyHWKM7nGJmAFUpm4mhEjWDgMLnrh7LkpGjeXzouyewwtwgjsmH6Lxk7H1VtBSQKq346D346HHd1p1WvpyoQH397eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tDQ0D4yV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FD03C4CEE3;
	Thu, 17 Jul 2025 16:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752770456;
	bh=ByddQ4ljqeLh42/kuXmBPmD/rtrLWHzLSHkW5sCBl/c=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=tDQ0D4yVm8wPO+1jUMV5uAPSjTijFlu8rb1ey7CqJXM6AtvYrh+d9zAEgVNPqiBv3
	 TkAsyBuiqDRuv1Gwhi9yATpffHCks5BRCuJdLXhTjwWMu5i4v0QQ1WBpW9QMV2FUAI
	 H4l4ApXSvoQr6vYeljmm4XKuPf7J/H7jtq0uvZKK3Fvbg+7Ifyq/mkOtT7XBBK6cxw
	 fuYW9QeBLWpFy6mM7NgV5ml4olIJH+WAwsbSZaskaZ5MhRDlekf9gyh+6QwWUHnFR/
	 ed2kwn55MavDjwnBVQ9guVJltGAvIngQdLE8jQR+f219jrTKXrfb/z66QuoHroXmrq
	 BM7DSfaRK2luQ==
Date: Thu, 17 Jul 2025 11:40:55 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, 
 Lucca Fachinetti <luccafachinetti@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 linux-leds@vger.kernel.org
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
In-Reply-To: <20250717-leds-is31fl3236a-v4-1-72ef946bfbc8@thegoodpenguin.co.uk>
References: <20250717-leds-is31fl3236a-v4-0-72ef946bfbc8@thegoodpenguin.co.uk>
 <20250717-leds-is31fl3236a-v4-1-72ef946bfbc8@thegoodpenguin.co.uk>
Message-Id: <175277045533.3779995.9523277801474945480.robh@kernel.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: leds: is31fl32xx: convert the
 binding to yaml


On Thu, 17 Jul 2025 16:02:07 +0100, Pawel Zalewski wrote:
> From: Lucca Fachinetti <luccafachinetti@gmail.com>
> 
> Add datasheets for reference, NB that I was not able to find an
> up-to-date, funtional direct URL for si-en products datasheet
> so they were skipped.
> 
> Signed-off-by: Lucca Fachinetti <luccafachinetti@gmail.com>
> Co-developed-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> ---
>  .../devicetree/bindings/leds/issi,is31fl3236.yaml  | 114 +++++++++++++++++++++
>  .../devicetree/bindings/leds/leds-is31fl32xx.txt   |  52 ----------
>  2 files changed, 114 insertions(+), 52 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/issi,is31fl3236.example.dtb: led-controller@3c (issi,is31fl3236): 'led@1', 'led@2', 'led@3' do not match any of the regexes: '^led@[1-9a-f][0-9a-f]$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/leds/issi,is31fl3236.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250717-leds-is31fl3236a-v4-1-72ef946bfbc8@thegoodpenguin.co.uk

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


