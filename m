Return-Path: <linux-leds+bounces-2309-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9752C93BE2E
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jul 2024 10:50:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54051284253
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jul 2024 08:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31936196C7C;
	Thu, 25 Jul 2024 08:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sB3obELb"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0261F196438;
	Thu, 25 Jul 2024 08:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721897448; cv=none; b=sbJDDekcGRP2oOJ83JqGPdVQKf5lxGD2+Rl3Pb7mgS8ebb3aNjnv5xalvUN+HwijildWQVCulFPeQsMfGNWlkO6Omm4EXETgm7y5U8oOc6sinSJBqWrSRLYSdUzXKIY1hh7zBsWVv4ZOhsvcdZ4JoYzP39fsmZrN4c9cBxggxhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721897448; c=relaxed/simple;
	bh=OMp3CeWOcFvJAbm8g0YrxAISAwsJbKz6fXeARcHiXeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J90mMM10J5uV0Az93emFhh+QwghHxBiFLssdyh1hXNTPneCSCwloqvIVTpsfUq6S7tm7NfqYquoqjYJZp1lq6MNWI4EYhrUyZpE0HQWnNU7CRAnibHhfuc8aLaB6sfjjE0zs+UXl5hbck/HiAuMeWK8ZU43ISCUWxEXwhPrq0JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sB3obELb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64714C116B1;
	Thu, 25 Jul 2024 08:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721897447;
	bh=OMp3CeWOcFvJAbm8g0YrxAISAwsJbKz6fXeARcHiXeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sB3obELbDzy14mAk6Q5dSOmz8rx6pSmfinJySv7QDQAeTkNvsHeqRpTXcZTKomCmG
	 5cOqLG8xAKun5rZW63YRB/WkrzuU/vY+eSvwJDKJEpdJ7GFPBFH6KIxQ4DSFwBhaXd
	 ktVYB0vaIOWXVaZh93ngKRbQewFrpJknDHCA846w5HndeOpEZF6AiZXUQb4WbJJVNU
	 Oa2TxJwSKV7f89xPB7z7JgIX7x63/910S+EckNqVH1jcGoJmDwYMNVzy1WTMA86JH3
	 eGSGcnfk+16SXaQkigGDRUeGrXhKVBZ3+44m7srZ9rC+nS9Ng2ft8xXC9y8MngVEXE
	 0/TVSH1M66rew==
Date: Thu, 25 Jul 2024 09:50:42 +0100
From: Lee Jones <lee@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	linux-leds@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
	netdev@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: leds: Document "netdev" trigger
Message-ID: <20240725085042.GC501857@google.com>
References: <20240708114653.18566-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240708114653.18566-1-marex@denx.de>

Cc: Andrew and netdev

On Mon, 08 Jul 2024, Marek Vasut wrote:

> Document the "netdev" trigger which is used to control LEDs by
> network device activity. This is an existing trigger used in
> existing DTs, document it so validation of those DTs would pass.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-leds@vger.kernel.org
> ---
> V2: Expand the commit message slightly
> ---
>  Documentation/devicetree/bindings/leds/common.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
> index 8a3c2398b10ce..bf9a101e4d420 100644
> --- a/Documentation/devicetree/bindings/leds/common.yaml
> +++ b/Documentation/devicetree/bindings/leds/common.yaml
> @@ -113,6 +113,8 @@ properties:
>              # LED indicates NAND memory activity (deprecated),
>              # in new implementations use "mtd"
>            - nand-disk
> +            # LED indicates network activity
> +          - netdev

netdev is the description of the network development ML/repo, right?

Seems like an odd name for an OS agnostic property?

>              # No trigger assigned to the LED. This is the default mode
>              # if trigger is absent
>            - none
> -- 
> 2.43.0
> 

-- 
Lee Jones [李琼斯]

