Return-Path: <linux-leds+bounces-3928-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCD6A30E9E
	for <lists+linux-leds@lfdr.de>; Tue, 11 Feb 2025 15:43:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D84BB166ED9
	for <lists+linux-leds@lfdr.de>; Tue, 11 Feb 2025 14:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0DE82505D3;
	Tue, 11 Feb 2025 14:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YLmmjNJG"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966C9243396;
	Tue, 11 Feb 2025 14:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739284985; cv=none; b=NP0vAMz6nppe5+lnqDwR4BrsZEYRVnrHCl18dSAXPzJxWCXPxOE91z/fpecHv4eG4Z0QoEfk0qGBB5H5VgNpiSfgPiV9rpT0RzEErEjHEWLYXrq7ZzY9c8ri466QEIBCFCBBiezZ1YYYcFsva+U1YOYaERm3xhpGL84gmHHON/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739284985; c=relaxed/simple;
	bh=voK0gPzw+wXISlMnQBaqyxmaIdyN+OgNztg0FBND6l4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A+HKQF5TFPYSaWKJppMRMKR5055P+jeov33TeZHCeXFgMrmSOJFTDdkn52OdHtxbnI460jTV+aRWFmGZhXc2x04J5buzvUvuslo+UBBsetNYKDADKn/kAQay51nN4nlGVUQF4PYfaFQwxRnfY0p3O3eXN6YJWQ7Z8OgSAc5g7vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YLmmjNJG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BF4AC4CEDD;
	Tue, 11 Feb 2025 14:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739284985;
	bh=voK0gPzw+wXISlMnQBaqyxmaIdyN+OgNztg0FBND6l4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YLmmjNJGAcSLPAyZ0KQ6kprjDncYe39q8wtFEVHf5HpI4k5G4yrWG6ykaTZTsKcUK
	 5T3S3Yax/EU4cdOuRrEG+py0EmMZErVfexXKIj8iXZmHWFiaA8A3lQAt24x/to+G7N
	 JsZCFwCeOiqHDxFnBfFNugi0OBE6naFN7SfywFJhrcegbFjp959EpNxkvNHj27NOVU
	 4APfnAFqN3QEswb9Yl/NM62+ofWsTAk2bRuIi6VabseNwvSrtPd1LKoSbSQJ6BsAJ0
	 Iymr8Gkxu1bCzXpOugO9pgl/yck58qlkFdlkG+utg5wWFMg5WSk3l7Wh8Yg4cRLayv
	 yYHo3mQN4tAIg==
Date: Tue, 11 Feb 2025 14:43:00 +0000
From: Lee Jones <lee@kernel.org>
To: j.ne@posteo.net
Cc: Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: leds: Allow differently named multicolor
 leds
Message-ID: <20250211144300.GW1868108@google.com>
References: <20250209-multi-led-v1-1-5aebccbd2db7@posteo.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250209-multi-led-v1-1-5aebccbd2db7@posteo.net>

On Sun, 09 Feb 2025, J. Neuschäfer via B4 Relay wrote:

> From: "J. Neuschäfer" <j.ne@posteo.net>
> 
> In some cases, a board may have multiple multi-leds, which can't be
> distinguished by unit address. In such cases it should be possible to
> name them differently, for example multi-led-a and multi-led-b.
> This patch adds another node name pattern to leds-class-multicolor.yaml
> to allow such names.

Which H/W needs this?  Is it upstream?  Where is the doc / usage?

> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
>  Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
> index bb40bb9e036ee00e06d21e2321ecd5a7d471c408..c22af25b6430be71300c0e37f696cd61112ea190 100644
> --- a/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
> +++ b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
> @@ -21,7 +21,9 @@ description: |
>  
>  properties:
>    $nodename:
> -    pattern: "^multi-led(@[0-9a-f])?$"
> +    oneOf:
> +      - pattern: "^multi-led(@[0-9a-f])?$"
> +      - pattern: "^multi-led-.*$"
>  
>    color:
>      description: |
> 
> ---
> base-commit: 645b5c24cf8590eea322a4fd79c811817046a2e6
> change-id: 20250209-multi-led-9991e205befd
> 
> Best regards,
> -- 
> J. Neuschäfer <j.ne@posteo.net>
> 
> 

-- 
Lee Jones [李琼斯]

