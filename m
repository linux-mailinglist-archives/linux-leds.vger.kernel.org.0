Return-Path: <linux-leds+bounces-4271-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FD5A60F98
	for <lists+linux-leds@lfdr.de>; Fri, 14 Mar 2025 12:08:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26C7717C4F0
	for <lists+linux-leds@lfdr.de>; Fri, 14 Mar 2025 11:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 148E41F3B87;
	Fri, 14 Mar 2025 11:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EMDHSDQR"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50A51A5B82
	for <linux-leds@vger.kernel.org>; Fri, 14 Mar 2025 11:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741950537; cv=none; b=tKGpchEruy1ZBQBuZzZy5DDNQ3GYEeFibsaHDDH20N0uWf6Q55LYeylIRXpJp05Jh7XmXwpvMmRAjX5RLuYdtxz5ULS23KoccUTjSCyd9fsScOsllzGX3tMVEZc/I4fwalpQVNq5CC1VRrbk8l2ahv7K4YMJ4JVAY7CH+PuVGgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741950537; c=relaxed/simple;
	bh=t73VC5Tzn33K6Fvso8J0fv7uQWh7R9ahu+l594isnx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hOzpi7Bp3Qhl1SlWDl0Etc2yA/BLEO4avOGznNUuzGjmwtf6O5FMgmK9uRxxSo1hp+Ob8BiJ/C9p+hBhJ3JQZDocz9QtamWuGOcJZLPSaO6sLM20dg4BY+ZINOLniX3XbR5I2xX+Ou5JmxVnKCoz8VXHpEXA2ZrH14+xuE+nHII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EMDHSDQR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C03C2C4CEE3;
	Fri, 14 Mar 2025 11:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741950536;
	bh=t73VC5Tzn33K6Fvso8J0fv7uQWh7R9ahu+l594isnx4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EMDHSDQRxT6/DaXh6GgYDphuVtfvCpeU/BEzf/8npJHV1kSs4DAmJ5fgt8epcxuFz
	 CNGHmQIHz0pyEHoenPWH/k8sQXelLU8S6Ia0yFC5hqrXGZEL9gGQfo6sOeM8W2Yy11
	 lD67gFwkmCkUjMXkVqd82GKZwukyLEw/2S0yoCq8lyxEWxmJyD6iH534Jk8bFjkewZ
	 RJmQjrpBzAvqjmMXJdwvUXRKvB14RiHn7kFTC7JKKJvjArMJ82jLmmO9wFu/XzzEH5
	 5mSDpZpZUY4mIVeHFtBFk1ptKCt9/hagShmJ1DDJGWIssCmdNcb7KKDvSYsEk4HzBy
	 q2k4TvOj6qO1w==
Date: Fri, 14 Mar 2025 11:08:53 +0000
From: Lee Jones <lee@kernel.org>
To: Craig McQueen <craig@mcqueen.au>
Cc: linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: uleds documentation fixes
Message-ID: <20250314110853.GF3890718@google.com>
References: <20250311042642.373782-1-craig@mcqueen.au>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250311042642.373782-1-craig@mcqueen.au>

On Tue, 11 Mar 2025, Craig McQueen wrote:

> * Add max_brightness field to struct for setup.
> * Reads are a signed int value, not a single unsigned byte value.

SoB

You must remember to use `-s` when committing patches.

> ---
>  Documentation/leds/uleds.rst | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/leds/uleds.rst b/Documentation/leds/uleds.rst
> index 83221098009c..4077745dae00 100644
> --- a/Documentation/leds/uleds.rst
> +++ b/Documentation/leds/uleds.rst
> @@ -17,16 +17,16 @@ structure to it (found in kernel public header file linux/uleds.h)::
>  
>      struct uleds_user_dev {
>  	char name[LED_MAX_NAME_SIZE];
> +	int max_brightness;
>      };
>  
>  A new LED class device will be created with the name given. The name can be
>  any valid sysfs device node name, but consider using the LED class naming
>  convention of "devicename:color:function".
>  
> -The current brightness is found by reading a single byte from the character
> -device. Values are unsigned: 0 to 255. Reading will block until the brightness
> -changes. The device node can also be polled to notify when the brightness value
> -changes.
> +The current brightness is found by reading an int value from the character
> +device. Reading will block until the brightness changes. The device node can
> +also be polled to notify when the brightness value changes.
>  
>  The LED class device will be removed when the open file handle to /dev/uleds
>  is closed.
> -- 
> 2.48.1
> 
> 

-- 
Lee Jones [李琼斯]

