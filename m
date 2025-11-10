Return-Path: <linux-leds+bounces-6066-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D308BC47014
	for <lists+linux-leds@lfdr.de>; Mon, 10 Nov 2025 14:48:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4F14188FEB2
	for <lists+linux-leds@lfdr.de>; Mon, 10 Nov 2025 13:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5859422D792;
	Mon, 10 Nov 2025 13:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YeqBQVIi"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267B122652D;
	Mon, 10 Nov 2025 13:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762782497; cv=none; b=SZoqkm7odcPP10Yq3ThTlsp72A7MfC28AExOs+lbVCmqwQOCTzBZKsFhk/26+vqzxG5AMcvsxqMuWNyPzIWSPvaJMFhmzhpqgjY2VzMSsDoAcC2OeKKtoEjOa/aSbPLbD14bamL0KanZlXcCdeL9e1KRtyoMksw2cVfOdF1rKqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762782497; c=relaxed/simple;
	bh=c4ibANFzZi0AKft9rX0nhMv9appXuYAGUW3N5OZWpEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XvYXqXTzww3PMQ6BgIX3ctsKA0h/eZcfBhwZcLjvLAj4gUYx49O/M2vlrmt3yaTJXFC0nBtBDKGrQGtLSjWpU4PlfBln3+3Q/A3c/asaA2DgEdi94rEYFiFSpSCYDdS0hkib1zLJZGIlAIQ02N2IxQU+94hRfDiM5+61qs+Hbz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YeqBQVIi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78BFAC113D0;
	Mon, 10 Nov 2025 13:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762782496;
	bh=c4ibANFzZi0AKft9rX0nhMv9appXuYAGUW3N5OZWpEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YeqBQVIi2BbRrIY0GKloL18yr4OcPXU/EGUNPRcpaDUkCRs7wKVo+ZtXwKJ1wASFh
	 Tmxkm9TQrtZR9iXPwnWpdpQn4h/IvK7W37CgjWEkL35/ioUi5OOJy1WfEya4BwdCX1
	 AN5nmpgtprr8f5eS9dtOD9eo3Y/eGNwglxrbxh++GOBGzv0urLqX7HF0E+nVtgP43y
	 lvXmtoXFftyoovVo+YC49sbWmkPdSQ2OTRtCgjh4CApdNXCPRYGfSmf+GKJv1rGC23
	 PafwZfR1aCq3XSDPT250cO4+4jj1TgNA5YTWLS62jSHPirmJPDgwYUIAZS7Ly9pGue
	 plHzAj+FPC7DQ==
Date: Mon, 10 Nov 2025 13:50:25 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Junjie Cao <caojunjie650@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org, Pengyu Luo <mitltlatltl@gmail.com>
Subject: Re: [PATCH v3 2/2] backlight: aw99706: Add support for Awinic
 AW99706 backlight
Message-ID: <aRHtofMfaB1TI-LX@aspen.lan>
References: <20251109032240.3422503-1-caojunjie650@gmail.com>
 <20251109032240.3422503-3-caojunjie650@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251109032240.3422503-3-caojunjie650@gmail.com>

On Sun, Nov 09, 2025 at 11:22:40AM +0800, Junjie Cao wrote:
> Add support for Awinic AW99706 backlight, which can be found in
> tablet and notebook backlight, one case is the Lenovo Legion Y700
> Gen4. This driver refers to the official datasheets and android
> driver, they can be found in [1].
>
> [1] https://www.awinic.com/en/productDetail/AW99706QNR
>
> Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
> Tested-by: Pengyu Luo <mitltlatltl@gmail.com>
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.

