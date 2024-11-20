Return-Path: <linux-leds+bounces-3420-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D48C9D34DF
	for <lists+linux-leds@lfdr.de>; Wed, 20 Nov 2024 08:56:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF9071F20986
	for <lists+linux-leds@lfdr.de>; Wed, 20 Nov 2024 07:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D91117A586;
	Wed, 20 Nov 2024 07:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eH2seDIJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE8D15B551;
	Wed, 20 Nov 2024 07:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732089339; cv=none; b=cTAk8Kk2ibitNIPhS0jGIWgoyniAZgxfD8yPplJctLi6xwLKYxTlzXwrDa58mDPncCgUEFQ48EtFHwnGkRZ/2/kDRpGwiJ5ASYUiaPSejB4LDdC5b4PAeS0dfBfWmThYnq4x8mEpWHAfx8O1CilvRe+NGfw9oGq2sNequmU0Sok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732089339; c=relaxed/simple;
	bh=raeV6DEnj9l1hDSOdgLKalbTNUVTi99NZdmvLIgjCeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O4T1oEtZKKis7U3HZgBwxikP0hJOmNGKs1Qb83YnEO4x6m/9Uor1LdPiBh7sBspEBALPRP6NCgGa6EAyfhMwDmjfZRGolkrayGVGmN0RIrSyF9nTAXwIYuw8ywLoPWEoEuRVtx9P0CPoEt70U0zGywbb9BNjHR1ft7HNIeRwnJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eH2seDIJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF763C4CECD;
	Wed, 20 Nov 2024 07:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732089337;
	bh=raeV6DEnj9l1hDSOdgLKalbTNUVTi99NZdmvLIgjCeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eH2seDIJ3qYZXqqY1veyusE4m/aCrTRY5GZH6NBW2rpEywusid0IJ39Xwp0PFplOg
	 T40QngD3t/uBs/PCdLfpti8Jg12Wkue3oPD8Ug+AY4XszaekITbQV+QnRr7qSW1F/7
	 OAH3ZcENGcTBhPG4XvwJtLRKgAwvFLDzWUo6dROu0t6AztTVAvJdQaE29aBhEu7E31
	 BjGDvcstcA8ph9Kj6xQIbFCzg/PjQdrTBzk5RtzgSdj9QrE1ItIoITTRIZEeiQQK7C
	 1eM6JE0rVfiJNuOioYPKjHBU/+hS/18BgzXjvcxdjAVTaDooOZMbmPzq6J+S4c2DPp
	 CqXCYmX7qdMFA==
Date: Wed, 20 Nov 2024 08:55:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v8 2/3] dt-bindings: leds: Add LED1202 LED Controller
Message-ID: <po4rxi6spypwg5rd7fsubn3rohvgeach7uynverd6nuxsppquf@5kszzlvk6ics>
References: <20241118151246.7471-1-vicentiu.galanopulo@remote-tech.co.uk>
 <20241118151246.7471-3-vicentiu.galanopulo@remote-tech.co.uk>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241118151246.7471-3-vicentiu.galanopulo@remote-tech.co.uk>

On Mon, Nov 18, 2024 at 03:12:42PM +0000, Vicentiu Galanopulo wrote:
> The LED1202 is a 12-channel low quiescent current LED driver with:
>   * Supply range from 2.6 V to 5 V
>   * 20 mA current capability per channel
>   * 1.8 V compatible I2C control interface
>   * 8-bit analog dimming individual control
>   * 12-bit local PWM resolution
>   * 8 programmable patterns
> 
> If the led node is present in the controller then the channel is
> set to active.
> 
> Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


