Return-Path: <linux-leds+bounces-5516-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A26CB59633
	for <lists+linux-leds@lfdr.de>; Tue, 16 Sep 2025 14:29:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7E191883EAF
	for <lists+linux-leds@lfdr.de>; Tue, 16 Sep 2025 12:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11E8C307AC6;
	Tue, 16 Sep 2025 12:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="arr8eIEG"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1BF2C1591;
	Tue, 16 Sep 2025 12:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758025739; cv=none; b=siHtcQHzOSIeXFYogQi7Vw0iH5SNgHCX5g+P0wlXUdlWNsCqnxR+EcDGa9ySHqF9a+6XG9Wpws/nnqXY5FMGuMcQQaJ0jMz8NGy2RWsc1s7sH1TCdEO2wauXpv5LCpBPoHV9BA8FmvSVaeaqtpvhVr/+VJ2dd5AxfUEXB4GSWZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758025739; c=relaxed/simple;
	bh=ufbpKFGMaPkQFTeuXMfQuM5xPh9Pyrq3kfj35C9mwaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tEKdyUirlQu0BNmKBQf9hITX2THyQc3UlYcNoq8BI1M1uwRFc/leZNcvmlRUvk3PIvyqoATd+g/YF6+OzfAmt8sKJGLzqlTttwzNB3SidkvuK3cU3j2aN2RY4Pk31SpoaLSZKBf+YtaMDaYDqeEB/rNzUKG8p9CVKbIH+Hf56Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=arr8eIEG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A45BC4CEEB;
	Tue, 16 Sep 2025 12:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758025738;
	bh=ufbpKFGMaPkQFTeuXMfQuM5xPh9Pyrq3kfj35C9mwaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=arr8eIEGWBmy0530jOL7/rJYFrqihIngrPOATRcP+4zTOTu9510+s0GCfToHHcuLG
	 1NcMzlSvH6HlZIDQiv4kRK5LV0XLHeOJxYQYVyf1GMdY4KXXQfdQrpIg8kf9iQ/AfZ
	 r//fniNFsZ55idmg+K8So9uzXrndpsksZ/rEhSeRF/JPhlDbCv6nVHk2CdzMCjsGOy
	 rIv9GMOJjEKMbFA5d8xuza1E8mP2RXMihkSuihVFnxH5CnH7TQHDF5jpAK1IGCX5lt
	 QSsEQMzKCV11z3AW90Z5gGjzX7KekyVC/l2wtDFLa5oowcTZIJAKnWp4wPLZ2kbl4h
	 O2LX1TJfm+nig==
Date: Tue, 16 Sep 2025 13:28:53 +0100
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
Subject: Re: [PATCH 2/5] leds: rgb: Add Virtual Color LED Group driver to Make
Message-ID: <20250916122853.GC3585920@google.com>
References: <20250916110217.45894-1-professorjonny98@gmail.com>
 <20250916110217.45894-2-professorjonny98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250916110217.45894-2-professorjonny98@gmail.com>

On Tue, 16 Sep 2025, Jonathan Brophy wrote:

> From: Jonathan Brophy <professor_jonny@hotmail.com>
> 
> This commit adds the Virtual Color driver to led/rgb Make and Kconfig.
> 
> Co-developed-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
> Signed-off-by: Jonathan Brophy <professor_jonny@hotmail.com>
> ---
>  drivers/leds/rgb/Kconfig  | 17 +++++++++++++++++
>  drivers/leds/rgb/Makefile |  1 +

This should be squashed into the patch that introduces the driver.

>  2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/leds/rgb/Kconfig b/drivers/leds/rgb/Kconfig
> index 222d943d8..70a80fd46 100644
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
> +
> +	  Multiple LEDs can be grouped together and controlled as a single
> +	  virtual LED with priority levels and blinking support. This is
> +	  useful for systems that need to manage multiple LED indicators
> +	  with different priority levels.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called leds-group-virtualcolor.
> +
>  endif # LEDS_CLASS_MULTICOLOR
> diff --git a/drivers/leds/rgb/Makefile b/drivers/leds/rgb/Makefile
> index a501fd27f..693fd300b 100644
> --- a/drivers/leds/rgb/Makefile
> +++ b/drivers/leds/rgb/Makefile
> @@ -6,3 +6,4 @@ obj-$(CONFIG_LEDS_NCP5623)		+= leds-ncp5623.o
>  obj-$(CONFIG_LEDS_PWM_MULTICOLOR)	+= leds-pwm-multicolor.o
>  obj-$(CONFIG_LEDS_QCOM_LPG)		+= leds-qcom-lpg.o
>  obj-$(CONFIG_LEDS_MT6370_RGB)		+= leds-mt6370-rgb.o
> +obj-$(CONFIG_LEDS_GROUP_VIRTUALCOLOR)	+= leds-group-virtualcolor.o
> -- 
> 2.43.0
> 

-- 
Lee Jones [李琼斯]

