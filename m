Return-Path: <linux-leds+bounces-5135-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E3EB11F56
	for <lists+linux-leds@lfdr.de>; Fri, 25 Jul 2025 15:27:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 949B6547056
	for <lists+linux-leds@lfdr.de>; Fri, 25 Jul 2025 13:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D81892ED84D;
	Fri, 25 Jul 2025 13:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rxztm1Zg"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D0877111;
	Fri, 25 Jul 2025 13:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753450070; cv=none; b=dd0L9izse7V8nVClVBftEnjeQlXvazJAPY/Y4fg99aiz/5v1b+ayKRROJIIEFCvhG2cERU1ZTAPfR4M3LEHpxrI/jJHLgnWGWc7ZtVa6rKksoqYUTcEJhwKDPebgF5S3t1iwoTL0wTbVPosKHM5+/yd1ZluQ93cQtM7NSkEwcPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753450070; c=relaxed/simple;
	bh=lXb0UAkdLRBZEl2w236QgUTKNdJI4nqMaBIkSJhUt1A=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=J/+sBV9bmtsU+mntYsGJqXD7W37UcSoBQa1Rl80M5N27aya5H4AP/NygjRJURxcAdggs2I3H+RuHfGRFf/xG/zh9+SC3290KhYPIahDIsTJUn3cKidzgtEHdMZZaf+bZmvVt4PdEYEYJbqew7fycYYG/G1fsEENTi12Mtycs0fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rxztm1Zg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD9A8C4CEE7;
	Fri, 25 Jul 2025 13:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753450070;
	bh=lXb0UAkdLRBZEl2w236QgUTKNdJI4nqMaBIkSJhUt1A=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Rxztm1Zg2BICuHOgdxuDU8E9XunHZYswcsJQky0leSQJM08JMEmbEaovz3Zcw9p0j
	 5mfj1jIkSKLGMNg0L82YL1dxB/BtBYatXGCCvpH9at9O9fLl5j0kgG/WEIN7y6y1XH
	 PTaYC43Cvv9GXvkxGo/uhMuJOgV0VQMpsB+GZm7FsnnIiAWqBzF1GNxzntz/+MFiBH
	 IC8tBuHIgCdKuRipxJPpKnUjaE3itoHmfUAGscGFSUgpQDcfhF2DqhV+MTz6zYF1WS
	 oV/qTCl+tLpQguthUMBDg3Mir5PfyXvTK/APP5UVVkWYPb5I9jf6Xuo6ue9JyApvYQ
	 TjPbM4i2uvlfQ==
Date: Fri, 25 Jul 2025 08:27:49 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Daniel Thompson <danielt@kernel.org>, Helge Deller <deller@gmx.de>, 
 linux-fbdev@vger.kernel.org, Lee Jones <lee@kernel.org>, 
 Fabio Estevam <festevam@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org, 
 linux-leds@vger.kernel.org, Pavel Machek <pavel@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>
To: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <20250725-max25014-v1-1-0e8cce92078e@gocontroll.com>
References: <20250725-max25014-v1-0-0e8cce92078e@gocontroll.com>
 <20250725-max25014-v1-1-0e8cce92078e@gocontroll.com>
Message-Id: <175345006903.1002291.4212198267952446360.robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: backlight: Add max25014 bindings


On Fri, 25 Jul 2025 13:09:23 +0200, Maud Spierings wrote:
> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> with intgrated boost controller.
> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>  .../bindings/leds/backlight/maxim,max25014.yaml    | 78 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 83 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.example.dtb: backlight@6f (maxim,max25014): Unevaluated properties are not allowed ('bl-name' was unexpected)
	from schema $id: http://devicetree.org/schemas/leds/backlight/maxim,max25014.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250725-max25014-v1-1-0e8cce92078e@gocontroll.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


