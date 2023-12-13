Return-Path: <linux-leds+bounces-363-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1928117AE
	for <lists+linux-leds@lfdr.de>; Wed, 13 Dec 2023 16:42:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B7EB1F21ACF
	for <lists+linux-leds@lfdr.de>; Wed, 13 Dec 2023 15:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2474A35EF6;
	Wed, 13 Dec 2023 15:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VfzY7vP8"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0838C3173D
	for <linux-leds@vger.kernel.org>; Wed, 13 Dec 2023 15:38:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF8BAC433CA;
	Wed, 13 Dec 2023 15:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702481922;
	bh=0Rhgoliy2s+rYmj4ksO8ITkA/9uEsKk7Ibt8CtnnnkE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VfzY7vP897C4GeCqXd/zG4c+zaM6BIQLxx2wsL7KEiu1PihSuKKTgVpvvLddlHPdi
	 AZNYpuiCWrOhH9jYWYMyuKZPVjT3vB7hgmqX7ZFfLZ10Ey4+UTa2u5blqEwoDaEkr+
	 AoxaPMM3Qv+dQYxoiXx78eM76StKLCVgcVdiLbr0Z5uCxUgk48wb1Ia5j3dEQsZdpz
	 ipLdWu7hSN5kNIuyVz5oS3bRmDLCIOBhzOSnRCf5sXosAtpV1V75bQqmFeS+38dyNe
	 JTuzAfuaeu3HbadTbGBYeo/56tRUvKsFkIUsX0oj9myeBrG5innNr5tRY2uc/0S20b
	 aqRVT1YOPJfhw==
Date: Wed, 13 Dec 2023 15:38:38 +0000
From: Lee Jones <lee@kernel.org>
To: Jean Delvare <jdelvare@suse.de>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] leds: rgb: Drop obsolete dependency on COMPILE_TEST
Message-ID: <20231213153838.GM111411@google.com>
References: <20231202214353.7c02f23c@endymion.delvare>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231202214353.7c02f23c@endymion.delvare>

On Sat, 02 Dec 2023, Jean Delvare wrote:

> Since commit 0166dc11be91 ("of: make CONFIG_OF user selectable"), it
> is possible to test-build any driver which depends on OF on any
> architecture by explicitly selecting OF. Therefore depending on
> COMPILE_TEST as an alternative is no longer needed.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Lee Jones <lee@kernel.org>
> ---
>  drivers/leds/rgb/Kconfig |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

It's not clear to me what this patch improves.

Going to choose to keep the status quo on this one.

> --- linux-6.6.orig/drivers/leds/rgb/Kconfig
> +++ linux-6.6/drivers/leds/rgb/Kconfig
> @@ -4,7 +4,7 @@ if LEDS_CLASS_MULTICOLOR
>  
>  config LEDS_GROUP_MULTICOLOR
>  	tristate "LEDs group multi-color support"
> -	depends on OF || COMPILE_TEST
> +	depends on OF
>  	help
>  	  This option enables support for monochrome LEDs that are grouped
>  	  into multicolor LEDs which is useful in the case where LEDs of
> 
> 
> -- 
> Jean Delvare
> SUSE L3 Support

-- 
Lee Jones [李琼斯]

