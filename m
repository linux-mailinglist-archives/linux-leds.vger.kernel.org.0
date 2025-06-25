Return-Path: <linux-leds+bounces-4879-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DDBAE7D63
	for <lists+linux-leds@lfdr.de>; Wed, 25 Jun 2025 11:38:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 046CA3BB8A1
	for <lists+linux-leds@lfdr.de>; Wed, 25 Jun 2025 09:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EA61289345;
	Wed, 25 Jun 2025 09:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cUgftBev"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062E2286422;
	Wed, 25 Jun 2025 09:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843495; cv=none; b=n+/slSiicw38druGjaUvcpHpJ6a0MDmH1s/k/EFKaJB+H1GnrXb8UBpRjPDkj0bXdyEbXDT1QAtfX+pAvgmIBK0b/W8JffYlGzRplaQZkzIzT2EuhpX+Cybf2LwKfuTcZDxBxchlTRVm/l6dt1VznWzbqPpAcb6ZzA5DxdGcHa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843495; c=relaxed/simple;
	bh=XB4Vjbis1gDytu/c6ciISPtww83E8Dsjaaz+sceWoPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U2AeL5RtvS4wo7W61vudx05KzCYlas0HDstxJJGZslLlXhOu2rIe9i3njG+6cHVk66Y+yX4Na/WbG1ZkNbUIJz3HnptjG2q08bbPGulAglJezNeZGNJxl9yUz7jB7f7yiPFWNhfOTishYFISpu/TiCzDWrr6aCghNAojoB5bzmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cUgftBev; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 275EAC4CEEA;
	Wed, 25 Jun 2025 09:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750843494;
	bh=XB4Vjbis1gDytu/c6ciISPtww83E8Dsjaaz+sceWoPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cUgftBevMgi0M4hnmTpfkqHg8UFOPPT13VH+EoHSTOMcLWlKRD2sJaRCrigDnwX2M
	 +7aBQX9Q64BPKMuPWPGwssBBFwv/9NC7r+5StDIoLr/eIq/X4IAbOo21wVqaEfOOEq
	 ZdNzvbgU5ZQXkQQ+kGZvgkxuknK/wWyxmpdkvECmcQPtEcLuav+KKm27nJQV2tURgP
	 62+VOL+cAsR/ZSaULSrT8FiSdN1AuSse63cKkXvSC9xrOoCc6hL2Z+rOje57Ytf4DM
	 j6PzJGH6CODz7LQr7b6HcBJo4Tv9wJlJtLoBHFVend54ZpoufzDW/a2Sk7Elf3Pu2R
	 m+NTtmFhavRNA==
Date: Wed, 25 Jun 2025 10:24:50 +0100
From: Lee Jones <lee@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Hans de Goede <hansg@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: trigger: ledtrig-cpu:: enforce NR_CPUS limit in
 Kconfig
Message-ID: <20250625092450.GT795775@google.com>
References: <20250620110820.3364008-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250620110820.3364008-1-arnd@kernel.org>

On Fri, 20 Jun 2025, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> This driver fails build testing with larger values of CONFIG_NR_CPUS:
> 
> drivers/leds/trigger/ledtrig-cpu.c: In function ‘ledtrig_cpu_init’:
> include/linux/compiler_types.h:571:45: error: call to ‘__compiletime_assert_726’ declared with attribute error: BUILD_BUG_ON failed: CONFIG_NR_CPUS > 9999
> drivers/leds/trigger/ledtrig-cpu.c:137:9: note: in expansion of macro ‘BUILD_BUG_ON’
>   137 |         BUILD_BUG_ON(CONFIG_NR_CPUS > 9999);
> 
> Enforce this limit in Kconfig instead to avoid the build failure.

I have so many questions!

- This number seems arbitrary - what is the limiting factor?
  - Character size for printing?
- What platform did you test this on to blow through that number?
- What if we really do want 10000+ CPUs?
  - And what will that LED array look like to support them all?
- If we're enforcing here, is the BUILD_BUG_ON() now superfluous?

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/leds/trigger/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
> index c11282a74b5a..e07bd17cfe35 100644
> --- a/drivers/leds/trigger/Kconfig
> +++ b/drivers/leds/trigger/Kconfig
> @@ -65,6 +65,7 @@ config LEDS_TRIGGER_BACKLIGHT
>  config LEDS_TRIGGER_CPU
>  	bool "LED CPU Trigger"
>  	depends on !PREEMPT_RT
> +	depends on NR_CPUS <= 9999
>  	help
>  	  This allows LEDs to be controlled by active CPUs. This shows
>  	  the active CPUs across an array of LEDs so you can see which
> -- 
> 2.39.5
> 

-- 
Lee Jones [李琼斯]

