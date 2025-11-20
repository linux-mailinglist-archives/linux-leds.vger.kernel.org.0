Return-Path: <linux-leds+bounces-6243-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A51CC7380F
	for <lists+linux-leds@lfdr.de>; Thu, 20 Nov 2025 11:42:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A935F3439D7
	for <lists+linux-leds@lfdr.de>; Thu, 20 Nov 2025 10:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 614C4272E45;
	Thu, 20 Nov 2025 10:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ElnYylfU"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38908757EA;
	Thu, 20 Nov 2025 10:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763635349; cv=none; b=M3eKqSiwOqZH73YgpXbn5MDdhNptlQd9djuIa/hg3CZ3nnyLB1tdHHXzQPDwEP4Q445+8Vfm3j8civdz9HBv5FZVp5PDomYSmSpd7svixZ7/unsGrOf9RcpbsV9dVHMkheAssmo9KiGxcYQBwd+3Desok8iol3W7G0ceh9OWC+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763635349; c=relaxed/simple;
	bh=6Xq8ia8Lq6KOMeslHV9RF4HxCjdUoN7PVLieO/tqFF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cuQmTBZNSjw3MEuNBw5g9579gQ8cTM0+0Aznw/ypjQJXPqfzBOgiRckfuWzw7vwflOBk7a0WfG0eUi1g7sLV146Lch8sHUS5kDliKDx3RehqUKapzmYvq4I/leXJn5Y0JZz2sEkmh/u24ej1pd0RHW9H2dzL+cKl8sveIknAZrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ElnYylfU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FC9DC4CEF1;
	Thu, 20 Nov 2025 10:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763635348;
	bh=6Xq8ia8Lq6KOMeslHV9RF4HxCjdUoN7PVLieO/tqFF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ElnYylfUAh2XXbfFCqVtP7b0wD9+p+yPz0oIAZFiAM15QN2lPON1Vs7bW2AJxRJ2t
	 cEu54W90Sy0nwry0gvMA2qrbRdaAghN4bdlWHsDfSizdz2M5wzy0dZbaMN5LZbc9z8
	 4L8f07hkjt64jW7cvqV0zT4X2jq3F8pDK5ACQ4Cn5JEI69S/leROYWth09OyKz/EAA
	 v8wVrkqRgg/fzGCAC8r07A0ac4HP/6GVu6rpyjrQKiyx/GxqkFV4Uq/CwnaEj1naxU
	 fd3uvzJEZ2dEx8jfzbIHymMIt/zZhi/BDyUosVsl5BZGxE3rVqrHLnX1zQOHGRssyI
	 ZmcI93acXtA9Q==
Date: Thu, 20 Nov 2025 10:42:24 +0000
From: Lee Jones <lee@kernel.org>
To: Daniel Mack <daniel.mack@holoplot.com>
Cc: linux-leds@vger.kernel.org, pavel@kernel.org, robh@kernel.org,
	devicetree@vger.kernel.org, Daniel Mack <daniel@zonque.org>
Subject: Re: [PATCH v2 0/3] leds: is31f132xx: add support for is31fl3293
Message-ID: <20251120104224.GA1949330@google.com>
References: <20251114094640.4096054-1-daniel.mack@holoplot.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251114094640.4096054-1-daniel.mack@holoplot.com>

On Fri, 14 Nov 2025, Daniel Mack wrote:

> From: Daniel Mack <daniel@zonque.org>
> 
> This is v2 of the series to support the is31fl3293 with the is31f132xx
> driver.

Please place the changelog in the patch itself, under the "---" markers.

> It is now split into 3 parts and also addresses the removal of forward
> declarations.

I still see the forward declarations.

> Comments on styling isses in v1 were addressed.
> 
> Daniel Mack (3):
>   dt-bindings: leds: add issi,is31fl3293 to leds-is31fl32xx
>   leds: is31f132xx: add support for is31fl3293
>   leds: is31f132xx: re-order code to remove forward declarations
> 
>  .../bindings/leds/leds-is31fl32xx.txt         |   1 +
>  drivers/leds/leds-is31fl32xx.c                | 234 +++++++++++++-----
>  2 files changed, 177 insertions(+), 58 deletions(-)
> 
> -- 
> 2.51.1
> 

-- 
Lee Jones [李琼斯]

