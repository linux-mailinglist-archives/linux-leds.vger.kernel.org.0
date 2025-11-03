Return-Path: <linux-leds+bounces-5969-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B04C2BA59
	for <lists+linux-leds@lfdr.de>; Mon, 03 Nov 2025 13:24:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 74DAC349B0B
	for <lists+linux-leds@lfdr.de>; Mon,  3 Nov 2025 12:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5001230DD12;
	Mon,  3 Nov 2025 12:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h5TUZXfL"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F8030DD07;
	Mon,  3 Nov 2025 12:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762172623; cv=none; b=gppEkMox7ipjBI0dJ9GZiHVsLqLAZTZn1h46CKw16wxZYWvXk8wRmjICConRq34aZQdMDTzwGkDvXXR3dcoBuEq3zJ28VBopVaSCLvxJiSzybjkcSqDrIN8NsfmZaBuyMB8UJslVAzWCexaLkFiXZpmus9hurthjxRp67oqsEkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762172623; c=relaxed/simple;
	bh=EpC/d8RctC6D2NqwJF4B8XkTUMtzK+hUR+NvmNGudxM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=HZV6F2p1JfIquQDc7vm85hEukfkBqxPxJrLbjIbq6gpjyM/hzZ09+afV/5k/mLr25XBd6e9BqwVlvSKV7b2fZYlFMq4Xo0WjC6pjVA+0u8pktnwx4WD9sZFGI5uHxLj/S+hpw4Eq3GLdfnwJEOg1QYGMSj0Utl9jVjuVaZSAEtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h5TUZXfL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 714EFC4CEE7;
	Mon,  3 Nov 2025 12:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762172622;
	bh=EpC/d8RctC6D2NqwJF4B8XkTUMtzK+hUR+NvmNGudxM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=h5TUZXfLSIYFJ+C2cLV9ax0DJ161K5smtwnP3xVGkkdPTXt40U284gb0Z/uV23oSF
	 elCBcizGdQdFT13oahVuNhzFbdCjQfPxXIENiKiq5Nen29yLa6+qoy6dbvCY8nGdw0
	 B/Wmuf8HxrgRReePKt492QshgpvpYibWOY1JFHSahs84eRJOKAmLAOrdp66d7DUvQd
	 ++bIkcue+qPCUlSWNpZ2V+TstCOtylg+TX1nOBTK0kAIjkHC27j14q8dfMf/d4+PIy
	 QG9gFqW5onW2zICCz9yP/hCLXCx7mXDGN+vT2NkYb3LU1xawhoRVf9QnfcDqD73ige
	 o7JeGFN/HglMg==
Date: Mon, 03 Nov 2025 06:23:40 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Pengyu Luo <mitltlatltl@gmail.com>, 
 Daniel Thompson <danielt@kernel.org>, linux-leds@vger.kernel.org, 
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 linux-fbdev@vger.kernel.org
To: Junjie Cao <caojunjie650@gmail.com>
In-Reply-To: <20251103110648.878325-2-caojunjie650@gmail.com>
References: <20251103110648.878325-1-caojunjie650@gmail.com>
 <20251103110648.878325-2-caojunjie650@gmail.com>
Message-Id: <176217262093.2953282.2008834134717044680.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: backlight: Add Awinic
 AW99706 backlight


On Mon, 03 Nov 2025 19:06:47 +0800, Junjie Cao wrote:
> From: Pengyu Luo <mitltlatltl@gmail.com>
> 
> Add Awinic AW99706 backlight binding documentation.
> 
> Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
> ---
> Changes in v2:
> - use proper units for properties (Krzysztof)
> - drop non-fixed properties (Krzysztof)
> - add properties(max-brightness, default-brightness) (Krzysztof)
> - Link to v1: https://lore.kernel.org/linux-leds/20251026123923.1531727-2-caojunjie650@gmail.com
> 
>  .../leds/backlight/awinic,aw99706.yaml        | 100 ++++++++++++++++++
>  1 file changed, 100 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml:39:111: [warning] line too long (113 > 110 characters) (line-length)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251103110648.878325-2-caojunjie650@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


