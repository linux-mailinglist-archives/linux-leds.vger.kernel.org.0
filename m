Return-Path: <linux-leds+bounces-3718-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A55A04992
	for <lists+linux-leds@lfdr.de>; Tue,  7 Jan 2025 19:50:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2276167267
	for <lists+linux-leds@lfdr.de>; Tue,  7 Jan 2025 18:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 882D31F37C8;
	Tue,  7 Jan 2025 18:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q6Krgpwg"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4986018B494;
	Tue,  7 Jan 2025 18:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736275809; cv=none; b=r4/CCc1LEJf0QcBhrTxvkOAA0xmUcf6hLR7gjW53tBAcm/lyHJuFJFUEYzX0ea2LTwMDcTQrtbOiNi3mSQcuMef1+Nr/HNKnHTqpOYiVKZa2CTW2S2uYM1/7sUDA8rbspD3gcUuuFrLEzyl+sOr9hXByXonHQcRWUlIe8QSQeLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736275809; c=relaxed/simple;
	bh=R7h9GEYR513I4cetZrKKFp1yV5Y/JaxYvNz8GrawkZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQRot0aAEk5e+WF1VQfIQ6pb/W9m8T8z39RWK9YLTahUg6C7hvnujPw+sfLFLCW0e+s3iV2fk46E/mLNmRL7E/kY6f/w7ADhtM9We+y5bwnsd8B219r8ExVIxXSVf8R1n91eAGz9PtvfGqlg2h4LVTBg9Ujxx5tUmgSqK2nR45A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q6Krgpwg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9A5DC4CED6;
	Tue,  7 Jan 2025 18:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736275808;
	bh=R7h9GEYR513I4cetZrKKFp1yV5Y/JaxYvNz8GrawkZ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q6KrgpwgEObOet5sHQpXHBcq1R0nuSenvrAh3HzBm/YsStZBAAoDv8mkjAO5rNfxb
	 bM0egb2qcVdNVR5ypN62MtJZYpQXWySCxK/qZrFBu1WyysjeOWAZyns6FiHXEA2PZ9
	 5U1XVtmw58JBQ+UMnvP2SQbHNOKK1Xog1bJdPTQz7J4ILQm0xTCEAABOztwBLETLOQ
	 fO43lnDd+28Jpp6IL/bpxZTFOiaRg8GYHiEb3FuZSFAPD/2Vpk58KubR/iHSmGtnT2
	 N1fDPL1aOiBJ4+mm3J9w/joXF20cLeo6Xy8NGSIyvE7b2BIfdengxUv5FK2qAwyiGE
	 Gefs7CqzZTaLQ==
Date: Tue, 7 Jan 2025 12:50:07 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev,
	Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] dt-bindings: leds: Convert leds-tlc591xx.txt to
 yaml format
Message-ID: <173627580718.1304322.7908676202048945270.robh@kernel.org>
References: <20250107161628.121685-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107161628.121685-1-Frank.Li@nxp.com>


On Tue, 07 Jan 2025 11:16:26 -0500, Frank Li wrote:
> Convert binding doc leds-tlc591xx.txt to yaml format to fix below DTB_CHECK
> warning.
> 
> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb:
>   /soc@0/bus@30800000/i2c@30a30000/tlc59108@40: failed to match any schema with compatible: ['ti,tlc59108']
> 
> Additional change:
> - ref to common.yaml for child nodes.
> - limit child's reg to 0 - 7 for ti,tlc59108.
> - fix typo 'linux,default_trigger' in example.
> - change child node name's prefix to led-.
> - change nodename to led-controller.
> - fix properties order in example.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v1 to v2
> - using "^led@[0-9a-f]$"
> - remove minimum: 0
> ---
>  .../bindings/leds/leds-tlc591xx.txt           | 40 ---------
>  .../devicetree/bindings/leds/ti,tlc59116.yaml | 90 +++++++++++++++++++
>  2 files changed, 90 insertions(+), 40 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/leds/leds-tlc591xx.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/ti,tlc59116.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


