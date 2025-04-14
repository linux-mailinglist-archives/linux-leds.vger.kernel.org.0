Return-Path: <linux-leds+bounces-4480-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 741D2A88721
	for <lists+linux-leds@lfdr.de>; Mon, 14 Apr 2025 17:29:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 454437A973E
	for <lists+linux-leds@lfdr.de>; Mon, 14 Apr 2025 15:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F9D72749F1;
	Mon, 14 Apr 2025 15:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TLJ5YZa4"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3134C7C;
	Mon, 14 Apr 2025 15:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744644448; cv=none; b=qpP4cDufuxFmcVm+C9Ctj1pNyj9HCXIprDYqp+ZW4bbutm0CsLveqV9iSKrQ1SKDO1RzeHFV3VbkpL82Nmcyu9dSX/v1d8XvTHDrAf3hNIE7cP6vLv6O0AnQ6IYPFgqE2204R/Paw1p0MqgnFcG9r3Tm5m7XdQ6u0JdtuF9lTYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744644448; c=relaxed/simple;
	bh=xOz4bqQ06a6dRshKQPZ0CbVIQt48i1yKdpWjSoQ9OEE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=GvaSGohHdRRkjIiqArB0411/YTb2SY7NSY90RcZaAqSW8sqx84uqq+10PmEH1i+FikGPVuk080r0QgpIN2MTW6xZImC6GdmkrkkyX2+o5F+8iP8B5UmOYxD5Ao1KlaevcXYXB24a9th8/95okaKTKoyY1zz8ndBh/WnVl65fVXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TLJ5YZa4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FED9C4CEE2;
	Mon, 14 Apr 2025 15:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744644447;
	bh=xOz4bqQ06a6dRshKQPZ0CbVIQt48i1yKdpWjSoQ9OEE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=TLJ5YZa4gSz7hyRClUzRPtCjVQc/VW1NSezb3F8PkpZfBndSsLNJ5LCRDR/PJ2kaB
	 lvK6Sg6MUJXjaYmzWcVFxuhnrizqfJinu7LvbeZhUyUQiMG31SNVhS9grritk1uy77
	 0Sr3AzSYcoDUlTZY619o7soHWwLknjeSbCyfOnq0k12LRgQFLRNJXvE6T3gGYMht61
	 9OxDiVkklROcLXd1WS7a30Z7rUZe5RwKuePInTyzmzwY0HRL9aK+WBvq/qfocdjEVQ
	 MrkQgjyUmkwh6eQbkXooPujG/mUmuasvsaFIxK+zD0v8AzToc4dAQexTAHp+CK7z9H
	 UYL9xc7HqvAQA==
Date: Mon, 14 Apr 2025 10:27:25 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org, 
 pavel@kernel.org, linux-doc@vger.kernel.org, linux-leds@vger.kernel.org, 
 knezic@helmholz.com, corbet@lwn.net, linux-kernel@vger.kernel.org, 
 krzk+dt@kernel.org
To: Ante Knezic <ante.knezic@helmholz.de>
In-Reply-To: <35c7f697070b3939727f1115d3a279e280f72cd6.1744636666.git.knezic@helmholz.com>
References: <cover.1744636666.git.knezic@helmholz.com>
 <35c7f697070b3939727f1115d3a279e280f72cd6.1744636666.git.knezic@helmholz.com>
Message-Id: <174464444574.455759.7081664205185002557.robh@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: leds: add binding for WL-ICLED


On Mon, 14 Apr 2025 15:28:50 +0200, Ante Knezic wrote:
> From: Ante Knezic <knezic@helmholz.com>
> 
> WL-ICLED is a RGB LED with integrated IC from Wurth Elektronik.
> Individual color brightness can be controlled via SPI protocol.
> 
> Signed-off-by: Ante Knezic <knezic@helmholz.com>
> ---
>  .../bindings/leds/leds-wl-icled.yaml          | 88 +++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-wl-icled.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/leds-wl-icled.example.dtb: icled@1 (we,131x000): 'cs-gpios', 'reg' do not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/leds/leds-wl-icled.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/35c7f697070b3939727f1115d3a279e280f72cd6.1744636666.git.knezic@helmholz.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


