Return-Path: <linux-leds+bounces-2516-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B6E95B7C7
	for <lists+linux-leds@lfdr.de>; Thu, 22 Aug 2024 15:58:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B42A1F24AAD
	for <lists+linux-leds@lfdr.de>; Thu, 22 Aug 2024 13:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25A131CBE9A;
	Thu, 22 Aug 2024 13:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ipZpBq3t"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06861CB136;
	Thu, 22 Aug 2024 13:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724334975; cv=none; b=WCu7E1hZG07Oi5vzLCdIQdIHUhdmT1kTsFtigJr6vBM6dl4y1xODliTmHWChxD5JWj2iQQ6MMXk50MPjgUC7UDhayOnmWJds/qCYrJYUf97riXjOWsiWk9jKUv6xujicQXjU7HpJgAATtix8WMRhSaWExbvjBScSOVFvHC3fgwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724334975; c=relaxed/simple;
	bh=83y5mAvMFwb/52T/dC15P2ISdACxMzr45hpeGSISWD8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MkHjyEvfhtcZgA8JJiuJD9l+muc5E3Tw+Xc839zNAwmQW8rvc4EZKmWN3gOOFv0skgnd0G9K63XnDgeLGcv641lZwAp3hREVON+V4yy+DD09scseTqEf925xo69klCEh8xi3mvKup9EF2rv1wVwZmLw1gaixM1PtcirjR3TGdhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ipZpBq3t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61420C32782;
	Thu, 22 Aug 2024 13:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724334974;
	bh=83y5mAvMFwb/52T/dC15P2ISdACxMzr45hpeGSISWD8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ipZpBq3tm2GQv9RGU3hlSvWehe61/Q77a7ysRbHQN5spD04G3ghAj1boBChAgppr7
	 JvfbzIje+j7tPsQyZ0SUGuPww2IjGFp2MSlhw5PMtYdhY5KrOmDfj3R0+YKBs+d1NC
	 1EnuvPbEfU1dmlJFkAxRP+QP4vXpltAcUQ2HXEY7cWcq0zqBRaUcZxRKVog8wcNOVo
	 saeo1bs4dQMuJ3pdI/Kg5VigfYuKoPDK0P5USfy1K+ELmrrG+4uLCblE2K0mBdezb9
	 powIMiXoDHV+TBtG4LcgEMyhIzRFP9J+tquRJV8i5ytMdDfCTXJzED9oKmcWttDUNd
	 rn4cu2TND8P+A==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dan Murphy <dmurphy@ti.com>, 
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
In-Reply-To: <20240821222001.591111-1-Frank.Li@nxp.com>
References: <20240821222001.591111-1-Frank.Li@nxp.com>
Subject: Re: (subset) [PATCH v3 1/1] dt-bindings: leds: convert
 leds-lm3692x to yaml format
Message-Id: <172433497215.1336217.1502532437864116817.b4-ty@kernel.org>
Date: Thu, 22 Aug 2024 14:56:12 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Wed, 21 Aug 2024 18:20:00 -0400, Frank Li wrote:
> Convert binding doc leds-lm3592x to yaml format.
> Additional change:
> - Add ref to common.yaml for child node.
> - Add i2c node at example.
> 
> Fix below warning:
> arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dtb: /soc@0/bus@30800000/i2c@30a40000/backlight@36:
> 	failed to match any schema with compatible: ['ti,lm36922']
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: leds: convert leds-lm3692x to yaml format
      commit: e5ae4083d32d9ba196c7452814bed5e5aa0731ec

--
Lee Jones [李琼斯]


