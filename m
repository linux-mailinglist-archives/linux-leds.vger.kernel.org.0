Return-Path: <linux-leds+bounces-5018-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AD0AFE267
	for <lists+linux-leds@lfdr.de>; Wed,  9 Jul 2025 10:22:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 351657BA3A1
	for <lists+linux-leds@lfdr.de>; Wed,  9 Jul 2025 08:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B083B23BCF3;
	Wed,  9 Jul 2025 08:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sxmgDdfC"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8476C223DD1;
	Wed,  9 Jul 2025 08:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752049195; cv=none; b=hFg7GiN5dGEksLyGFLMTZCcWozkcAMXryWNOIOU3h4jGEPqLHTJQ6+iqzQqxg+g0xYvTKF7NscVp2PbqIRp4GpRQBUzCViTmYpOoxu+7je8X1pUy6Sb9ShEq+d43sgsf9N68rtwOv17OTJUffwe7Wrtj67qrc4BXa1TcOvUOncw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752049195; c=relaxed/simple;
	bh=BcvrMfYZtnEUkz7cacL+9zuwYHrjh3Y1ilcma9tcCvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tKYEIL+xWs0dwAagPoHAzt11fxZcQpASU2yFbIZQP944C6XC6P6PWIYxHhQvA5ujZHnBCTLz7+lqlcfAkwPUyrsYH4HfDhmbO2Zg6zs3E9U8HLs4ZMHjrGVlHHDn70LENMAslB8vwiO+Be5Mz3hFoze4s/EepuGJ1zkr2+ko+IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sxmgDdfC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B85C8C4CEEF;
	Wed,  9 Jul 2025 08:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752049195;
	bh=BcvrMfYZtnEUkz7cacL+9zuwYHrjh3Y1ilcma9tcCvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sxmgDdfCUypYhl/cQS2tebecCGpki5R3ZqQBeYcqmjmszibWnzLrpKrm9ApzCknTy
	 JUi3nW22/gtDPaXwfz31J+y+pJKblHs/rLdAvuhYyaZAKH73Jup432d8LBA4PUghGF
	 utx4zVdiqKwD5XIgcbhtln7I3QsLP0S1EyISrUv4Zn2wt+UM/VwdL+3hQ4D8dRDCGb
	 zFtGrfyqbj76Cl7/cxdSuZaq5UJxMveUI7CBGXyYEf/ME1QUcs2jHvn+XYDizrdhao
	 HkdTqNwOIpGM+HrSJItN7DRpHMA2zpRHqaueVIkqEXTjWw7lP9iHLzcLd8mRDhrUhR
	 3SnDwr3IOymuQ==
Date: Wed, 9 Jul 2025 10:19:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/3] dt-bindings: leds: issi,is31fl3236: add
 issi,22kHz-pwm property
Message-ID: <20250709-beagle-of-algebraic-enterprise-e9bec1@krzk-bin>
References: <20250708-leds-is31fl3236a-v3-0-d68979b042dd@thegoodpenguin.co.uk>
 <20250708-leds-is31fl3236a-v3-3-d68979b042dd@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250708-leds-is31fl3236a-v3-3-d68979b042dd@thegoodpenguin.co.uk>

On Tue, Jul 08, 2025 at 03:59:47PM +0100, Pawel Zalewski wrote:
> Add an additional and optional control property for setting
> the output PWM frequency to 22kHz. The default is 3kHz and
> this option puts the operational frequency outside of the
> audible range.
> 
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> ---
>  Documentation/devicetree/bindings/leds/issi,is31fl3236.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/issi,is31fl3236.yaml b/Documentation/devicetree/bindings/leds/issi,is31fl3236.yaml
> index d0f9add5af01ac06c4bb87b0cd0faec71d0ef37c..5bce0fc48f84c7ae804e6522e312c51ed2d77bc5 100644
> --- a/Documentation/devicetree/bindings/leds/issi,is31fl3236.yaml
> +++ b/Documentation/devicetree/bindings/leds/issi,is31fl3236.yaml
> @@ -42,6 +42,12 @@ properties:
>    "#size-cells":
>      const: 0
>  
> +  issi,22kHz-pwm:
> +    type: boolean
> +    description:
> +      When present, the chip's PWM will operate at ~22kHz as opposed
> +      to ~3kHz to move the operating frequency out of the audible range.
> +

According to your driver this is not applicable to every device, so you
need allOf:if:then: block at the end, before additionalProperties,
restricting it per variant:

.....
  then:
    properties:
      issi,22kHz-pwm: false

If that's not true, then commit msg should explain that - from the
hardware perspective.

Best regards,
Krzysztof


