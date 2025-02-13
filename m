Return-Path: <linux-leds+bounces-3963-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 335B2A33B43
	for <lists+linux-leds@lfdr.de>; Thu, 13 Feb 2025 10:31:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAA9D188749A
	for <lists+linux-leds@lfdr.de>; Thu, 13 Feb 2025 09:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D388C2080C8;
	Thu, 13 Feb 2025 09:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s6Rnozo8"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BF01F7092;
	Thu, 13 Feb 2025 09:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739439105; cv=none; b=QD55lcM4tcS27DMPdVGh0wvUqAKt35TIJShgmCyAS4ryC8EhiTcv0xEvH27ODCpN75+5Jn3ZdrYppdn3xTMVfnD8UnG4E61y7iKmd2WYP2educoqzBK1fbLPVQ6Ar0ulLIORr51zMzXQHo2gHiUPOvLf0yg+2PxLyVDDrJ1lSFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739439105; c=relaxed/simple;
	bh=/e356o/HvSSDb1+tgBGgSqwPIx/ZNk3f7zE+cDhfcgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=diZBh2pxkHSLtVKR1L2yDe/1qGbFB8dV/CAOv2j+vQFyC0mdKnJk/pMXj1+NhIxcjwrP/7TfdBxJUYbMGjaeqJMdhgAmcVIQAu/l0oQdQa7WMqSvwmE1TvDu+KJK9tJikg6+WHZL8mZglunWNuj0P2x6XpbKjmw2mdgODZGJ+EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s6Rnozo8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 901D3C4CED1;
	Thu, 13 Feb 2025 09:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739439104;
	bh=/e356o/HvSSDb1+tgBGgSqwPIx/ZNk3f7zE+cDhfcgU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s6Rnozo83/oUATnjn23TFIMzrEOKzYNS+z5kepA+Q+jLg+qcrtqWKKJjuTUVVomB+
	 A13fSQ0+BYTMff6aHyIo9Ju9URTyipFhDX/PspqOJLQRwcjxd9RpawBHY1jza9erL3
	 xxJXPCNWbeb0ye39tTiV7/neBZdhqjNKGQ7BMu2dQCHa9t6BUYw8+dLu1KuA7utdzR
	 WcTzTl/S0cNwsd5aSAFzIMA1/SllrsYJdhkeozHzuksOK2ociR3lZUgCxFnZgxOa8j
	 hFpKcdrkY/kyFoiZ13ZZBtdc/JD4AQdWQ6zBhKG3vzd+4xwI2kBL1qlSREDmFEFzCr
	 taenSc+uBJLag==
Date: Thu, 13 Feb 2025 10:31:41 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tony O'Brien <tony.obrien@alliedtelesis.co.nz>
Cc: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ben Hoelker <ben.hoelker@alliedtelesis.co.nz>, 
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH] dt-bindings:leds: Add function define for POE
Message-ID: <20250213-successful-pronghorn-of-dignity-83facb@krzk-bin>
References: <20250213005841.4143929-1-tony.obrien@alliedtelesis.co.nz>
 <20250213005841.4143929-2-tony.obrien@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250213005841.4143929-2-tony.obrien@alliedtelesis.co.nz>

On Thu, Feb 13, 2025 at 01:58:41PM +1300, Tony O'Brien wrote:
> Add a define so network devices with a PoE PSE feature can provide
> status indications of connected PoE PDs.
> 
> Reviewed-by: Ben Hoelker <ben.hoelker@alliedtelesis.co.nz>
> Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Where did these two reviews happen?

> Signed-off-by: Tony O'Brien <tony.obrien@alliedtelesis.co.nz>
> ---
>  include/dt-bindings/leds/common.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
> index 4f017bea0123..3a8958b81c87 100644
> --- a/include/dt-bindings/leds/common.h
> +++ b/include/dt-bindings/leds/common.h
> @@ -94,6 +94,7 @@
>  #define LED_FUNCTION_MOBILE "mobile"
>  #define LED_FUNCTION_MTD "mtd"
>  #define LED_FUNCTION_PANIC "panic"
> +#define LED_FUNCTION_POE "poe"

Where is any user of this?

Best regards,
Krzysztof


