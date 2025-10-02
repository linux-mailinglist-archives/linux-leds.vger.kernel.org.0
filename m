Return-Path: <linux-leds+bounces-5630-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A42FDBB25CC
	for <lists+linux-leds@lfdr.de>; Thu, 02 Oct 2025 04:27:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66D2C1C63F5
	for <lists+linux-leds@lfdr.de>; Thu,  2 Oct 2025 02:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26B1823C51D;
	Thu,  2 Oct 2025 02:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oh4I297j"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1A023C4F2;
	Thu,  2 Oct 2025 02:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759372022; cv=none; b=jPW0PGEUnAxrtzbcJdXFuloFayT9AluChgs45Vi8hvWB/sgI4G70kIH3+4cbrZzLFTZLF1s05jN9pzXMrsna34Bk71dAepzEY51n2+KbWa7VUtdVRfVbV5H07ggwAFav0gECsEkGbR9xVeak2BUO7+NDWNExoD0Ga2BSf/dAwhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759372022; c=relaxed/simple;
	bh=hiXfnUBe9kv9pqZRhSXkc2LZ2ZlocUVknt8LsSLmaZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ByubbfCFpoJ49haagl+dHHKfkt3e5zJGa//zU1T3BLXkgiOk9DgtqpfT3tGXtnvTJE5LUwZrU9teMg+SwfSiVXJxm8o3yYywsqkSj8hrwIX2wLJrO53o25CVcz6yW5nQvyO2CgLKXoCg0/kxvGfkVzj9ZeXh8zWVFPKTs3s0iLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oh4I297j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 000D8C4CEF1;
	Thu,  2 Oct 2025 02:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759372020;
	bh=hiXfnUBe9kv9pqZRhSXkc2LZ2ZlocUVknt8LsSLmaZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oh4I297jKSN+u/ckhEuBAB19+sTnVL7nKRJYoXIgN/s01lUPvmKjJP1wxQhV1PlxG
	 uCcMxztxdMczbTGoH8c9uOE17ontcBqMXIf3ZJ+W4hXGRWmd6oymgWJ4y/6qhXDfQ6
	 Y7WZf731Ft7ChwhWy+/EIgfHfecm1dpe2MZMYtF0klKQQwqaYCGMIsC0V1u50beivY
	 Ztm+AHo+W1GFf3AosNlKXBQ4/W1YoxMoyNwnv1eGZF/Z8AIkrYBgqH+CL84szVQIbI
	 oC73Yqdp6k2gUwD/KJGNFM2+hIfo2kgG9Skl+kb7kekvDmIgqpeEGd/ZXhkK+ZGJxr
	 N9ylS15BFIOXQ==
Date: Wed, 1 Oct 2025 21:26:57 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?Jean-Fran=E7ois?= Lessard <jefflessard3@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, Andy Shevchenko <andy@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/7] dt-bindings: leds: add default-brightness
 property to common.yaml
Message-ID: <175937201703.2926074.2653012255418871854.robh@kernel.org>
References: <20250926141913.25919-1-jefflessard3@gmail.com>
 <20250926141913.25919-3-jefflessard3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250926141913.25919-3-jefflessard3@gmail.com>


On Fri, 26 Sep 2025 10:19:03 -0400, Jean-François Lessard wrote:
> Add default-brightness property to leds/common.yaml to establish a single
> canonical definition for LED brightness initialization.
> 
> The property is currently defined locally in leds/leds-pwm.yaml and is
> needed by auxdisplay/titanmec,tm16xx.yaml. Properties should be defined
> in only one location to avoid type inconsistencies across bindings.
> 
> Signed-off-by: Jean-François Lessard <jefflessard3@gmail.com>
> ---
>  Documentation/devicetree/bindings/leds/common.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


