Return-Path: <linux-leds+bounces-370-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90944811882
	for <lists+linux-leds@lfdr.de>; Wed, 13 Dec 2023 17:00:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28C911F20F13
	for <lists+linux-leds@lfdr.de>; Wed, 13 Dec 2023 16:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D5A85374;
	Wed, 13 Dec 2023 16:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="peo/LKRZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5622E85358
	for <linux-leds@vger.kernel.org>; Wed, 13 Dec 2023 16:00:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00225C433C8;
	Wed, 13 Dec 2023 16:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702483204;
	bh=pbkegfu2dBZkDSd/RwHKVhWJqC8nKtCUMEQIF77YPBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=peo/LKRZ4369vA8pMdI6CsvI0Lf8y45a3RZ/d/HXNmarTD5OUNa7ywLuffO9aAR2k
	 1MBsACMdW8iep8Xw6HsaQ9rGZUJrm4Bux6LU6XO0N3QfEl7Z3E69k+vybIcNDz8C+g
	 DUy3rTemzdgnLS+2JHZcIvOzBarriH2Ii057htV77q3oR10Gtu7YwLt9obm9x3acBZ
	 7dcs1GG3k5FlRmPHoUD6aQHiU0W0NstlVexVVIOztU2kRhxTL3fENPyAjMzOtzw9u9
	 E1UdFn6qwCBFQfsgG5heCi+RyPUP5SNv9f5UI3jqqp8fgOOmE47lnN+ePFnimSVT2P
	 xPrkIfNSaIw6A==
Date: Wed, 13 Dec 2023 16:00:01 +0000
From: Lee Jones <lee@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: Re: [PATCH] leds: trigger: panic: don't register panic notifier if
 creating the trigger failed
Message-ID: <20231213160001.GP111411@google.com>
References: <c8aa079f-acf7-4cb8-b198-d16fcc5778c3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c8aa079f-acf7-4cb8-b198-d16fcc5778c3@gmail.com>

On Sat, 09 Dec 2023, Heiner Kallweit wrote:

> It doesn't make sense to register the panic notifier if creating the
> panic trigger failed.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/leds/trigger/ledtrig-panic.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/trigger/ledtrig-panic.c b/drivers/leds/trigger/ledtrig-panic.c
> index 64abf2e91..72297a845 100644
> --- a/drivers/leds/trigger/ledtrig-panic.c
> +++ b/drivers/leds/trigger/ledtrig-panic.c
> @@ -64,10 +64,13 @@ static long led_panic_blink(int state)
>  
>  static int __init ledtrig_panic_init(void)
>  {
> +	led_trigger_register_simple("panic", &trigger);
> +	if (!trigger)
> +		return 0;

It doesn't seem correct to return 0 on a known failure.

> +
>  	atomic_notifier_chain_register(&panic_notifier_list,
>  				       &led_trigger_panic_nb);
>  
> -	led_trigger_register_simple("panic", &trigger);
>  	panic_blink = led_panic_blink;
>  	return 0;
>  }
> -- 
> 2.43.0
> 

-- 
Lee Jones [李琼斯]

