Return-Path: <linux-leds+bounces-3582-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 141C19EE0EF
	for <lists+linux-leds@lfdr.de>; Thu, 12 Dec 2024 09:13:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5CDD28265E
	for <lists+linux-leds@lfdr.de>; Thu, 12 Dec 2024 08:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3211820B807;
	Thu, 12 Dec 2024 08:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X403YC3n"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98C41FECD6;
	Thu, 12 Dec 2024 08:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733991211; cv=none; b=pZh5Pl6xc3bAcSHF+n72za6sOIsgJtl1AlGXCtEu/cNQNRk5tGV/GiE1R4+oxIpl3Z4yK31/+avBbKaV5KlDx+UwV45tZhMSrvevcWWinSxVOIMLq4gzCV8Fg0/0dDhcbuo0//9zPkG/bqyGvDkTREypdUlGW4uWzlaokXP7Qok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733991211; c=relaxed/simple;
	bh=yFRZ+IH3VruDCKluh2Mfy3YvjHuvC7u/oBOqXdHG/UQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c0EZ0B2z+G374Ruu9F8LDjESLLDnyYBTC8GYoo0fSX1DuUcH9PWR8rCCwnwSeQ2bx+D4u8qr4nWv1TrUU4WdtqAIe50s3wR6qnmVVpnhXwtmjKnvNEwpOp6nEATdlL6+Bap6BsZ7PNshx9eSsPToK+4sbFkBkFBJBzB4QoM30k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X403YC3n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0DBBC4CECE;
	Thu, 12 Dec 2024 08:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733991210;
	bh=yFRZ+IH3VruDCKluh2Mfy3YvjHuvC7u/oBOqXdHG/UQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X403YC3nzX85sUU0gMsuEEhNCgIEXOUpGQE5pbSXbWlnTW9NCHbM8Q3f9cGjpt+hA
	 6Y0s/H8FcFTkbkCLs3YHflvhtK8mzxgctedejqkte9rAG9l195yutRCvrB07H/1szj
	 MzwgVw8v+V34GvVlDRYINKQRhxlICRxQ/LPaCE19SlwBah4IFu/Dvp3ceFu4tVsTYk
	 IsyjI5WujSg7PLnlEPJVoZDu33oE6xjyVdqhXbFdKzpb8PS4LZmhktymYDJPtgF/3a
	 DFSFEWTPpsPCAH2wrAFpSFXRgFSjQeTuVIUunj7PaQ4qY1R/9VNZPoRkx0yWHb67Fc
	 X86sGlmel0fiA==
Date: Thu, 12 Dec 2024 09:13:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/3] dt-bindings: leds: backlight: apple,dwi-bl: Add
 Apple DWI backlight
Message-ID: <6fazyksxkcbhugivwgozuyjdig37vnshbwtdmzjcbrqywgszvd@sm27uhqgsma4>
References: <20241211113512.19009-1-towinchenmi@gmail.com>
 <20241211113512.19009-2-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241211113512.19009-2-towinchenmi@gmail.com>

On Wed, Dec 11, 2024 at 07:34:37PM +0800, Nick Chan wrote:
> Add backlight controllers attached via Apple DWI 2-wire interface.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  .../bindings/leds/backlight/apple,dwi-bl.yaml | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


