Return-Path: <linux-leds+bounces-5824-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7B4BF0DB7
	for <lists+linux-leds@lfdr.de>; Mon, 20 Oct 2025 13:35:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 201E43A95AD
	for <lists+linux-leds@lfdr.de>; Mon, 20 Oct 2025 11:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 709AA2F7AC8;
	Mon, 20 Oct 2025 11:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RnN0FXLQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411721D63D8;
	Mon, 20 Oct 2025 11:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760960117; cv=none; b=EjCzrfVbOXcTwMh3lOBH0CjgjjtwAXLRo5npC1vn4CYWWZW3ZTxEaLBWkqciHgQ+hsIxi2kv54AXf6ILJn2fuHlGWalXm0aaKKwpOvVn4RSpduamXzcopZoS7FBO280GxwrUpAWXnbxTPouXBp5vvRzPrpa6adkTWqgPkvvup68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760960117; c=relaxed/simple;
	bh=BZQ/yiKuYI1cpgDUQi79oMoVDAwuNWBEABObpOg5voU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=E/0677rD/M7gVbgCXzd1H7vP2vgsSCIPXOPghcdNkGEzD9+lsO89mI5I1Hk8AAueuTCdKkLp+JKLFQd5ELAOVJ+v9pgodGee9ra8XbQ7+nvMhtsxxlfTZuVy6N6LSXi0upz++83PTNlJ4yQ7h1mtFCZ6VNH/VZost8E75BBYolo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RnN0FXLQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DEF1C116B1;
	Mon, 20 Oct 2025 11:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760960116;
	bh=BZQ/yiKuYI1cpgDUQi79oMoVDAwuNWBEABObpOg5voU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=RnN0FXLQUwQ7GMTJzIfhbQ83Q7TiRYxpfSrTHdvqGRVmZz2A8AWJTwM8hZn+5H+t2
	 3dSgfeK7zC+0yQFV5RZqWTGHQP473yVFEBR7mscI5wBJDQFjKzBC75KtRdJ6LcoSlc
	 FoR1RKPjWXpEDri5AJv4OktC1qvkH31H5ifbk+UKNGx7zOAKpn3gcPdx1KRHqv4/yr
	 ENmbmgUnhu4ZUXwcYs5hmlmAlV9jwy/nrMbNtznfqx1rCHWpcUKN57qECA7x/bNVmR
	 CAvA3y0b0jIM37/GZ6iD/ueUaMuY2bfaiFDjDL2SylwhaM0yHP0PEDWjsmxs4H2xOY
	 Tcseosc2q4Yxg==
Date: Mon, 20 Oct 2025 06:35:14 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Jonathan Brophy <professor_jonny@hotmail.com>, 
 Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Radoslav Tsvetkov <rtsvetkov@gradotech.eu>, lee Jones <lee@kernel.org>
To: Jonathan Brophy <professorjonny98@gmail.com>
In-Reply-To: <20251019092331.49531-3-professorjonny98@gmail.com>
References: <20251019092331.49531-1-professorjonny98@gmail.com>
 <20251019092331.49531-3-professorjonny98@gmail.com>
Message-Id: <176096011281.22748.15975544575193365055.robh@kernel.org>
Subject: Re: [PATCH v3 2/4] dt-bindings: leds: Add virtualcolor group dt
 bindings documentation.


On Sun, 19 Oct 2025 22:23:25 +1300, Jonathan Brophy wrote:
> From: Jonathan Brophy <professor_jonny@hotmail.com>
> 
> Add device tree binding documentation for the virtual LED group driver
> that implements virtual LED groups by aggregating multiple monochromatic
> LEDs
> 
> Bindings for the virtual driver are not describing hardware LEDs they
> describe virtual devices made from groups of hardware LEDs created from an array
> of LED phandles.
> 
> Normally the device tree is used to describe hardware not virtual hardware
> but it is particularly useful in situations where you require an LED to be a
> specific color by mixing primary colors, such as multi element multi color LEDs
> to be operated from a device tree binding.
> 
> It also becomes useful with multiple LEDs operating the same indicator such as
> ring of light indicators where the LEDs are driven From different GPIO outputs
> unifying the control that can give basic indication during system startup,
> shutdown upgrade etc...
> 
> co-developed-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
> Signed-off-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
> Signed-off-by: Jonathan Brophy <professor_jonny@hotmail.com>
> ---
>  .../leds/leds-group-virtualcolor.yaml         | 110 ++++++++++++++++++
>  1 file changed, 110 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.example.dtb: pwm-led-controller (pwm-leds): led-1: 'max-brightness' is a required property
	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.example.dtb: pwm-led-controller (pwm-leds): led-2: 'max-brightness' is a required property
	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.example.dtb: pwm-led-controller (pwm-leds): led-3: 'max-brightness' is a required property
	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.example.dtb: pwm-led-controller (pwm-leds): led-4: 'max-brightness' is a required property
	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251019092331.49531-3-professorjonny98@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


