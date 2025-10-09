Return-Path: <linux-leds+bounces-5706-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 83596BC9BC4
	for <lists+linux-leds@lfdr.de>; Thu, 09 Oct 2025 17:19:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 454F54FADA2
	for <lists+linux-leds@lfdr.de>; Thu,  9 Oct 2025 15:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D77E91D6193;
	Thu,  9 Oct 2025 15:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gQErjSEM"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D6D4C81;
	Thu,  9 Oct 2025 15:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760023132; cv=none; b=XDUS0OdKWwMZrsr7sRLKfyUqJ7N6lIh3LnuIYlXVoJQvRRSK2K3h4YhutHZkiylOAcUKRZ7rzXAdLKMkTybTLCEK97ln2VHQamikg1eUxLk4/KeWtTZtKKNwDDrCpH51CQeDGxC5xDzOjjs745jT59vd/d7w8RYOf99Gk/efMfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760023132; c=relaxed/simple;
	bh=XmR7XBqCE0+i25fixLFUf7Je1bRD9oi8BfUzP9MDxAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s4oVCaNRhyFeZdPYikoaZ7tjcuLwKq0OVZzHvsJD+rGdcRJrolProBn2Uu0qIQrD0TyDEXWlDHSXjsPLMRL0CU+0BldC1cXX+K7wubF1P7V6isAeAOs8dEQ3/hSYob3KYbA2zyEHK6riIga+DrJB3gqVdWUJFVfAGEkUfOMLZjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gQErjSEM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41D2EC4CEF7;
	Thu,  9 Oct 2025 15:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760023132;
	bh=XmR7XBqCE0+i25fixLFUf7Je1bRD9oi8BfUzP9MDxAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gQErjSEMS044JLGn477UL84bswtUNVseVA0W9fE/TG/hWKWT9tZCt0dvVQfXIYMkA
	 It7OhFWp+jFGGPdviVsBZFknnouog7qCKDWihtfjJASyrvPb2s2Q9jCTT9U8wx6otL
	 G2r9JR0FCdNIQO6pbJ94yPq9CKTNvazWVCecjRvA9Lh/J23UrrFFu1hM6l2U1ogT4d
	 9nDIPAUz46xonGll3xGs8oC+gCKcL2mSl6LMlCTExN7IDbuWfrfyZGuOt+9O8vWv9q
	 uCUlsyhhJ/bEUiOpC+u3PCwCKzY8/OncuVs4ujWY8jpKx1oJYwoms9Pr4nOUFLzCTV
	 AARu7jFr8fOKA==
Date: Thu, 9 Oct 2025 16:18:47 +0100
From: Lee Jones <lee@kernel.org>
To: Jonathan Brophy <professorjonny98@gmail.com>
Cc: Pavel Machek <pavel@kernel.org>,
	Jonathan Brophy <professor_jonny@hotmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH 1/4] leds: Add Virtual Color LED Group driver
Message-ID: <20251009151847.GC2890766@google.com>
References: <20251009084339.1586319-1-professorjonny98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251009084339.1586319-1-professorjonny98@gmail.com>

On Thu, 09 Oct 2025, Jonathan Brophy wrote:

> From: Jonathan Brophy <professor_jonny@hotmail.com>
> 
> This commit introduces a new driver that implements virtual LED groups
> by aggregating multiple monochromatic LEDs. The driver provides
> priority-based control to manage concurrent LED activation requests,
> ensuring that only the highest-priority LED group's state is active at
> any given time.
> 
> This driver is useful for systems that require coordinated control over
> multiple LEDs, such as RGB indicators or status LEDs that reflect
> complex system states.
> 
> Co-developed-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
> Signed-off-by: Jonathan Brophy <professor_jonny@hotmail.com>
> ---
>  drivers/leds/rgb/Kconfig                   |  17 +
>  drivers/leds/rgb/Makefile                  |   1 +
>  drivers/leds/rgb/leds-group-virtualcolor.c | 440 +++++++++++++++++++++
>  3 files changed, 458 insertions(+)
>  create mode 100644 drivers/leds/rgb/leds-group-virtualcolor.c
> 
> diff --git a/drivers/leds/rgb/Kconfig b/drivers/leds/rgb/Kconfig
> index 222d943d826a..70a80fd46b9c 100644
> --- a/drivers/leds/rgb/Kconfig
> +++ b/drivers/leds/rgb/Kconfig
> @@ -75,4 +75,21 @@ config LEDS_MT6370_RGB
>  	  This driver can also be built as a module. If so, the module
>  	  will be called "leds-mt6370-rgb".
>  
> +config LEDS_GROUP_VIRTUALCOLOR
> +	tristate "Virtual LED Group Driver with Priority Control"
> +	depends on OF || COMPILE_TEST
> +	help
> +	  This option enables support for virtual LED groups that aggregate
> +	  multiple monochromatic LEDs with priority-based control. It allows
> +	  managing concurrent LED activation requests by ensuring only the
> +	  highest-priority LED state is active at any given time.

Grep for:

  "This driver groups several monochromatic LED devices in a single multicolor LED device."

Does this scratch your itch?  Is this something worth building on?

> +
> +	  Multiple LEDs can be grouped together and controlled as a single
> +	  virtual LED with priority levels and blinking support. This is
> +	  useful for systems that need to manage multiple LED indicators
> +	  with different priority levels.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called leds-group-virtualcolor.

-- 
Lee Jones [李琼斯]

